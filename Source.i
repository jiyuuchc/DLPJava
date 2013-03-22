%module Source

%include "dlp.swg"

%inline %{
  
  static void SetDataSource(DATA_t source) {
     g_err = DLP_Source_SetDataSource(source);
  }
  
%}