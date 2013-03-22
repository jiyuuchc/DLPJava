%module TestPatternGenerator

%include "dlp.swg"

%inline %{
  
  static void SetTestPattern(DMD_t DMD, TPG_t testPattern, TPG_Col_t color, UInt16 patternFreq) {
     g_err = DLP_TPG_SetTestPattern(DMD, testPattern, color, patternFreq);
  }

%}
  