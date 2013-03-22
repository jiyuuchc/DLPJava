%module State

%include "dlp.swg"

%inline %{

  static int GetUARTfault() {
     Byte state_out;
     g_err = DLP_Status_GetUARTfault(&state_out);
     return (int) state_out;
  }
  static int GetFlashProgrammingMode() {
     Byte state_out;
     g_err = DLP_Status_GetFlashProgrammingMode(&state_out);
     return (int) state_out;
  }
  static int GetDADcommStatus() {
     Byte state_out;
     g_err = DLP_Status_GetDADcommStatus(&state_out);
     return (int) state_out;
  }   
  static int GetDMDcommStatus() {
     Byte state_out;
     g_err = DLP_Status_GetDMDcommStatus(&state_out);
     return (int) state_out;
  }   
  static int GetLEDcommStatus() {
     Byte state_out;
     g_err = DLP_Status_GetLEDcommStatus(&state_out);
     return (int) state_out;
  }   
  static int GetSeqDataBPP() {
     Byte state_out;
     g_err = DLP_Status_GetSeqDataBPP(&state_out);
     return (int) state_out;
  }   
  static int GetBISTdone() {
     Byte state_out;
     g_err = DLP_Status_GetBISTdone(&state_out);
     return (int) state_out;
  }  
  static int GetBISTfail() {
     Byte state_out;
     g_err = DLP_Status_GetBISTfail(&state_out);
     return (int) state_out;
  }
  static int GetOverallLEDlampLitState() {
     Byte state_out;
     g_err = DLP_Status_GetOverallLEDlampLitState(&state_out);
     return (int) state_out;
  }
  static int GetOverallLEDdriverTempTimeoutState() {
     Byte state_out;
     g_err = DLP_Status_GetOverallLEDdriverTempTimeoutState(&state_out);
     return (int) state_out;
  }
  static Double GetSeqDataFrameRate() {
     Double state_out;
     g_err = DLP_Status_GetSeqDataFrameRate(&state_out);
     return state_out;
  }
  static Double GetSeqDataExposure() {
     Double state_out;
     g_err = DLP_Status_GetSeqDataExposure(&state_out);
     return state_out;
  }
  static int GetSeqDataNumPatterns() {
     UInt16 numPatterns;
     g_err = DLP_Status_GetSeqDataNumPatterns(&numPatterns);
     return (int) numPatterns;  
  }
  static int CommunicationStatus() {
     return (int) DLP_Status_CommunicationStatus();
  }
  static int GetLEDdriverTempTimeoutState(LED_t LED) {
     Byte state_out;
     g_err = DLP_Status_GetLEDdriverTempTimeoutState(LED, &state_out);
     return (int) state_out;
  }  
  static SEQDATA_t GetSeqDataMode() {
     SEQDATA_t mode;
     g_err = DLP_Status_GetSeqDataMode(&mode);
     return mode;
  }
  static int GetLEDdriverLitState(LED_t LED){
     Byte state_out;
     g_err = DLP_Status_GetLEDdriverLitState(LED, &state_out);
     return (int) state_out;
  }
  static char* GetFlashSeqCompilerVersionString() {
     static char ver[250];
     g_err = DLP_Status_GetFlashSeqCompilerVersionString(ver, 250);
     return ver;
  }
  static char* GetMCUversionString() {
     static char ver[250];
     g_err = DLP_Status_GetMCUversionString(ver, 250);
     return ver;
  }
  static char* GetDlpControllerVersionString() {
     static char ver[250];
     g_err = DLP_Status_GetDlpControllerVersionString(ver, 250);
     return ver;
  }
  static int GetDMDparkState() {
     Byte state_out;
     g_err = DLP_Status_GetDMDparkState(& state_out);
     return (int) state_out;
  }
  static int GetDMDhardwareParkState() {
     Byte state_out;
     g_err = DLP_Status_GetDMDhardwareParkState(& state_out);
     return (int) state_out;
  }  
  static int GetDMDsoftwareParkState() {
     Byte state_out;
     g_err = DLP_Status_GetDMDsoftwareParkState(& state_out);
     return (int) state_out;
  }  
  static int GetSeqRunState() {
     Byte state_out;
     g_err = DLP_Status_GetSeqRunState(& state_out);
     return (int) state_out;
  } 
  static int GetEEPROMfault() {
     Byte state_out;
     g_err = DLP_Status_GetEEPROMfault(& state_out);
     return (int) state_out;
  }   
  static int GetDADfault() {
     Byte state_out;
     g_err = DLP_Status_GetDADfault(& state_out);
     return (int) state_out;
  }   
  static int GetLEDdriverFault() {
     Byte state_out;
     g_err = DLP_Status_GetLEDdriverFault(& state_out);
     return (int) state_out;
  }   

%}
