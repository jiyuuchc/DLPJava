%module Misc

%include "dlp.swg"

%inline %{

  static int GetUSBDeviceNumber() {
     Byte devnum0b_out;
     g_err = DLP_Misc_GetUSBDeviceNumber(&devnum0b_out);
     return (int) devnum0b_out;
  }
  static void ProgramEDID(DMD_t DMD, Byte offset, Byte numBytes, String fileName) {
     g_err = DLP_Misc_ProgramEDID(DMD, offset, numBytes, fileName);
  }
  static int GetTotalNumberOfUSBDevicesConnected() {
     Byte ndev_out;
     g_err = DLP_Misc_GetTotalNumberOfUSBDevicesConnected(&ndev_out);
     return (int) ndev_out;
  }
  static void SetUSBDeviceNumber(Byte devNum0b) {
     g_err = DLP_Misc_SetUSBDeviceNumber(devNum0b);
  }
  static char* GetVersionString() {
     static char ver[250];
     g_err = DLP_Misc_GetVersionString(ver, 250);
     return ver;
  }
  static void EnableCommunication() {
     g_err = DLP_Misc_EnableCommunication();
  }
  static void DisableCommunication(String ofileName) {
     g_err = DLP_Misc_DisableCommunication(ofileName);
  }
  static void FlushOutputFileToDisk() {
     g_err = DLP_Misc_DisableCommunication_FlushOutputFileToDisk();
  }
%}
