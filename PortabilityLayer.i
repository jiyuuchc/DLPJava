%module DLPJava

%include "dlp.swg"

%{
static JavaVM *g_jvm = (JavaVM *) 0;
static jobject g_OutputCallback = (jobject) 0;

void __cdecl output_callback_func(const char * s) 
{
  jclass cls;
  jmethodID methodID;
  JNIEnv * jenv;
  jstring str;
  
  (*g_jvm)->AttachCurrentThread(g_jvm, (void**)&jenv, 0);
  (*jenv)->ExceptionClear(jenv);
  str = (*jenv)->NewStringUTF(jenv, s);
  cls = (*jenv)->GetObjectClass(jenv, g_OutputCallback);
  methodID = (*jenv)->GetMethodID(jenv, cls, "OnOutput", "(Ljava/lang/String;)V");
  (*jenv)->CallVoidMethod(jenv, g_OutputCallback, methodID, str);
}
%}


////////////////////////////////

%typemap(jni) IntPtr "jobjectArray"
%typemap(jtype) IntPtr "byte [][]"
%typemap(jstype) IntPtr "byte [][]"
%typemap(javaout) IntPtr {return $jnicall;}
%typemap(out) IntPtr %{
   int i;
   jclass bytearray_cls;
   jbyteArray bytearray = NULL;

   for (i = 0; i < (int) arg2; i ++ ) {
      bytearray = (*jenv)->NewByteArray(jenv, *arg3);
      (*jenv)->SetByteArrayRegion(jenv, bytearray, 0, *arg3, (jbyte*) $1[i]);
      if (i == 0) {
         bytearray_cls = (*jenv)->GetObjectClass(jenv, bytearray);
         $result = (*jenv)->NewObjectArray(jenv, (jsize) arg2, bytearray_cls, NULL);
      }
      (*jenv)->SetObjectArrayElement(jenv, $result, i, bytearray);
   }
   g_err = destroyBitPlanes($1, arg2);
%}
%typemap(in, numinputs=0) UInt32* Output (UInt32 temp) {$1 = &temp;}  

IntPtr GetAllBitPlanes(String name, UInt32 bpp, UInt32* Output);

////////////////////////////////////

%apply void {Status};

%exception {
   g_err = STAT_OK;
   $action
   g_err = result;
   if (g_err != STAT_OK) {
      SWIG_exception(SWIG_IOError, "DLP");
   }
}

%define CALLBACK_TYPEMAPS(CALLBACKTYPE, CFUNC, METHODNAME, METHODTYPE, CACHEVARIABLE)
%typemap(jni) CALLBACKTYPE "jobject"
%typemap(jtype) CALLBACKTYPE "Object"
%typemap(jstype) CALLBACKTYPE "DLPJava.CALLBACKTYPE"
%typemap(javain) CALLBACKTYPE "$javainput"
%typemap(in) CALLBACKTYPE {
  $1 = NULL;
  if ($input != NULL) {
     jclass objclass;
     jmethodID id;
     objclass = (*jenv)->GetObjectClass(jenv, $input);
     id = (*jenv)->GetMethodID(jenv, objclass, "METHODNAME", "METHODTYPE");
     if ( id == 0 ) {
        SWIG_exception(SWIG_ValueError, "Invalid callback func.");
        return $null;
     }
     if (CACHEVARIABLE != NULL) {
        (*jenv)->DeleteGlobalRef(jenv, CACHEVARIABLE);
     }
     CACHEVARIABLE = (*jenv)->NewGlobalRef(jenv, $input);
     $1 = CFUNC;
     (*jenv)->GetJavaVM(jenv, &g_jvm);
  }
}
%enddef

CALLBACK_TYPEMAPS(OutputCallback, output_callback_func, OnOutput, (Ljava/lang/String;)V, g_OutputCallback)

Status InitPortabilityLayer(Byte logLevel, Byte detail, OutputCallback callback);


///////////////////////////////////////////////

Status WriteSYNC(Byte syncNumber, Byte enableBit, UInt32 delayUsec, UInt32 pulseWidth, Byte polarity);
Status RunBatchFile(String name, Boolean stopOnError);
Status RunBatchCommand(String command);
Status WriteExternalImage(String name, UInt16 imageIndex);
Status ChangeLogLevel(Byte logLevel);


//////////////////////////////



%pragma(java) jniclasscode=%{
  static {
     System.loadLibrary("DLPJava");
  }
%}

%pragma(java) modulecode=%{
  public interface OutputCallback {
     void OnOutput(String s);
  }
%}
