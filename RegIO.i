%module RegIO

%include "dlp.swg"

%apply (UInt16 DATA[], UInt16 LENGTH) {(UInt16 imageOrder[], UInt16 nArrElements)};
%inline %{
 
  static void InitFromParallelFlashOffset(UInt32 offset, Byte reset) {
     g_err = DLP_RegIO_InitFromParallelFlashOffset(offset, reset);
  }

  static void ReadLUT(String LUTname) {
     g_err = DLP_RegIO_ReadLUT(LUTname);
  }

  static void BeginLUTdata(String name) {
     g_err = DLP_RegIO_BeginLUTdata(name);
  }

  static void EndLUTdata(String name) {
     g_err = DLP_RegIO_EndLUTdata(name);
  }

  static void WriteImageOrderLut(Byte bitsPerPixel, UInt16 imageOrder[], UInt16 nArrElements) {
     g_err = DLP_RegIO_WriteImageOrderLut(bitsPerPixel, imageOrder, nArrElements);
  }

%}
