import os
import subprocess

class RttViewer:
  COMMAND_FILE_NAME = 'jlink_command.jlink'

  def __init__(self, jlink_directory_path: str, device_pn: str, interface: str = 'SWD', speed: int = 10000, serial_no: str = ''):
    with open(self.COMMAND_FILE_NAME, 'w') as f:
      f.write(f'Device {device_pn}\nSelectInterface {interface}\nSpeed {speed}\nconnect\n')
    usb_serial = f'USB {serial_no}' if serial_no else ''
    self._jlink_proc = subprocess.Popen(f'{jlink_directory_path}/JLink {usb_serial} -CommandFile {self.COMMAND_FILE_NAME}', stdout=subprocess.PIPE)
    self._rtt_client_proc = subprocess.Popen(f'{jlink_directory_path}/JLinkRTTClient', stdout=subprocess.PIPE)

  def __del__(self):
    print('Cleaning up!')
    if hasattr(self, '_jlink_proc'):
      self._jlink_proc.kill()
    if hasattr(self, '_rtt_client_proc'):
      self._rtt_client_proc.kill()
    if os.path.exists(self.COMMAND_FILE_NAME):
      os.remove(self.COMMAND_FILE_NAME)

  def read(self) -> str:
    return self._rtt_client_proc.stdout.read().decode('utf-8').strip()

  def read_line(self) -> str:
    return self._rtt_client_proc.stdout.readline().decode('utf-8').strip()
