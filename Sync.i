%module Sync

%include "dlp.swg"

%inline %{
  
  static void SetEnable(Byte syncNumber, Byte enableBit) {
     g_err = DLP_Sync_SetEnable(syncNumber, enableBit); 
  }
  
  static void Configure(Byte syncNumber, Byte polarity, UInt32 delay, UInt32 width) {
     g_err = DLP_Sync_Configure(syncNumber, polarity, delay, width);
  }
  
%}
