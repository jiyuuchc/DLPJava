%module Trigger

%include "dlp.swg"

%inline %{
  
  static void SetExternalTriggerEdge(Byte edge) {
     g_err = DLP_Trigger_SetExternalTriggerEdge(edge);
  }
    
%}
