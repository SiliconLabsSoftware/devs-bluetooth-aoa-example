import paho.mqtt.client as mqtt

class Mqtt:
  def __init__(self, broker_address: str):
    print(f'Connecting to MQTT broker at {broker_address}')
    self._client = mqtt.Client(mqtt.CallbackAPIVersion.VERSION2)
    self._client.connect(broker_address)
    self._client.loop_start()

  def publish(self, topic: str, message: str):
    print(f'MQTT Publish!\n Topic: {topic}\n Message: {message}')
    msg_info = self._client.publish(topic, message, qos=1)
    msg_info.wait_for_publish()
