%module FlashProgram

%include "dlp.swg"

%apply (Byte DATA[], UInt32 LENGTH) {(Byte pBuf[], UInt32 bytesInBuf)};
%inline %{

  static void ReadParallelFlashToFile(String ofilename, UInt32 flash_byte_offset, UInt32 nBytesToRead) {
     g_err = DLP_FlashProgram_ReadParallelFlashToFile(ofilename, flash_byte_offset, nBytesToRead);
  }
  
  static void EraseParallelFlash(UInt32 nSkipBytesInFlash, UInt32 nBytesToErase) {
     g_err = DLP_FlashProgram_EraseParallelFlash(nSkipBytesInFlash, nBytesToErase);
  }
  
/*
  static UInt16 ProgramParallelFlash(UInt32 skipBytesInFlash, Byte pBuf[], UInt32 bytesInBuf, ProgressCallback cb, Byte verifyFlag) {
     UInt16 crc = 0;
     g_err = DLP_FlashProgram_ProgramParallelFlash(skipBytesInFlash, pBuf, bytesInBuf, cb, verifyFlag, &crc);
     return crc;
  }

  static UInt16 ProgramSerialFlash(UInt32 skipBytesInFlash, Byte pBuf[], UInt32 bytesInBuf, ProgressCallback cb, Byte verifyFlag) {
     UInt16 crc = 0;
     g_err = DLP_FlashProgram_ProgramSerialFlash(skipBytesInFlash, pBuf, bytesInBuf, cb, verifyFlag, &crc);
     return crc;
  }
*/

%}
  