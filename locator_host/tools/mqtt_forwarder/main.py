import argparse
from mqtt import Mqtt
from rtt_viewer import RttViewer

parser = argparse.ArgumentParser(description='Reads RTT debug strings from a JLink device and forwards it to an MQTT broker.')
parser.add_argument('--mqttBrokerAddress', type=str, default = 'localhost', help='Address of the MQTT broker (hostname or IP).')
parser.add_argument('--jlinkDir', type=str, default = 'C:/Program Files/SEGGER/JLink', help='Directory path of the SEGGER JLink.')
parser.add_argument('--device', type=str, default = 'EFR32MG24BXXXF1536', help='Silabs MCU device part number.')
parser.add_argument('--interface', type=str, default = 'SWD', help='Debug interface to use. Can be SWD or JTAG.')
parser.add_argument('--speed', type=int, default = 10000, help='Debug interface speed in kHz.')
parser.add_argument('--serialNo', type=str, default = '', help='Serial number of the JLink device to connect to.')
args = parser.parse_args()

mqttClient = Mqtt(broker_address=args.mqttBrokerAddress)
rttClient = RttViewer(jlink_directory_path = args.jlinkDir,
                      device_pn = args.device,
                      interface = args.interface,
                      speed = args.speed,
                      serial_no = args.serialNo)

string_buffer = ''
NEEDLE_TOPIC_START = 'Topic: '
NEEDLE_MESSAGE_START = '{'
NEEDLE_MESSAGE_END = '}'
while True:
  string_buffer += rttClient.read_line()
  if NEEDLE_MESSAGE_END in string_buffer:
    topic_idx = string_buffer.rfind(NEEDLE_TOPIC_START)
    message_idx = string_buffer.rfind(NEEDLE_MESSAGE_START)
    if(topic_idx != -1 and message_idx != -1):
      topic = string_buffer[topic_idx + len(NEEDLE_TOPIC_START):message_idx].strip()
      message = string_buffer[message_idx:].strip()
      mqttClient.publish(topic, message)
    string_buffer = ''
