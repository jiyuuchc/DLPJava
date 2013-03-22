%module LED

%include "dlp.swg"

%inline %{

  static void LEDdriverEnable(Byte enable) {
     g_err = DLP_LED_LEDdriverEnable(enable);
  }
  static int GetLEDdriverTimeout() {
     Byte timeOut;
     g_err = DLP_LED_GetLEDdriverTimeout(& timeOut);
     return timeOut;
  }
  static void SetLEDintensity(LED_t led, Double intensityPercent) {
     g_err = DLP_LED_SetLEDintensity(led, intensityPercent);
  }
  static void SetLEDEnable(LED_t led, Byte enableBit) {
     g_err = DLP_LED_SetLEDEnable(led, enableBit);
  }
  static Double GetLEDintensity(LED_t led) {
     Double intensityPerCent;
     g_err = DLP_LED_GetLEDintensity(led, &intensityPerCent);
     return intensityPerCent;
  }
  
%}
