%module FlashCompile

%include "dlp.swg"

%inline %{

   static int GetCompileMode() {
      return DLP_FlashCompile_GetCompileMode();
   }
   static void SetCompileMode(Boolean enableBit) {
      g_err = DLP_FlashCompile_SetCompileMode(enableBit);
   }
   
/*
   static void SetCommPacketCallback(CommPacketCallback commPacketCallback) {
      g_err = DLP_FlashCompile_SetCommPacketCallback(commPacketCallback);
   }
*/

   static void FlushCommPacketBuffer() {
      g_err = DLP_FlashCompile_FlushCommPacketBuffer();
   }
%}

