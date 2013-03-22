%module Display

%include "dlp.swg"

%inline %{
  static void DisplayStop() {
     g_err = DLP_Display_DisplayStop();
  }
  static void ParkDMD() {
     g_err = DLP_Display_ParkDMD();
  }
  static void UnparkDMD() {
     g_err = DLP_Display_UnparkDMD();
  }
  static void SetDegammaEnable(Byte enableBit) {
     g_err = DLP_Display_SetDegammaEnable(enableBit);
  }
  static void HorizontalFlip(Byte enableBit) {
     g_err = DLP_Display_HorizontalFlip(enableBit);
  }
  static void VerticalFlip(Byte enableBit) {
     g_err = DLP_Display_VerticalFlip(enableBit);
  }
  static void DisplayPatternManualStep() {
     g_err = DLP_Display_DisplayPatternManualStep();
  }
  static void DisplayPatternManualForceFirstPattern() {
     g_err = DLP_Display_DisplayPatternManualForceFirstPattern();  
  }
  static void DisplayPatternAutoStepRepeatForMultiplePasses() {
     g_err = DLP_Display_DisplayPatternAutoStepRepeatForMultiplePasses();
  }
  static void DisplayPatternAutoStepForSinglePass() {
     g_err = DLP_Display_DisplayPatternAutoStepForSinglePass();
  }
  
%}
