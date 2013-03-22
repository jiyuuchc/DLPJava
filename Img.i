%module Img

%include "dlp.swg"

%apply (Byte DATA[], UInt32 LENGTH) {(Byte pBuf[], UInt32 tot_bytes)};
%inline %{

  static void UploadBitplanePatternUsbFromExtMem(String filePath, UInt16 bitPlaneIndex) {
     g_err = DLP_Img_UploadBitplanePatternUsbFromExtMem(filePath, bitPlaneIndex);
  }

  static void DownloadBitplanePatternToExtMem(Byte pBuf[], UInt32 tot_bytes, UInt16 bpnum0b) {
     g_err = DLP_Img_DownloadBitplanePatternToExtMem(pBuf, tot_bytes, bpnum0b);
  }


  static void DownloadBitplanePatternFromFlashToExtMem(UInt32 flashOffset, UInt32 totalBytes, UInt16 bitPlane) {
     g_err = DLP_Img_DownloadBitplanePatternFromFlashToExtMem(flashOffset, totalBytes, bitPlane);
  }
  
%}
