%{
#include "PortabilityLayer.h"
static Status g_err;
%}

%include "typemaps.i"

typedef char			Char;
typedef double			Double;
typedef signed char		Int8;
typedef signed short	Int16;
typedef signed int		Int32;
typedef unsigned char	UInt8;
typedef unsigned short	UInt16;
typedef unsigned int	UInt32;
typedef const char*		String;
typedef UInt8			Byte;
typedef void			Void;
typedef int				Boolean;
typedef Byte**			IntPtr;
typedef char*			StringBuilder;

%include <exception.i>

%exception {
   g_err = STAT_OK;
   $action
   if (g_err != STAT_OK) {
      SWIG_exception(SWIG_RuntimeError, "DLP");
   }
}

%include <enums.swg>

%javaconst(1);

/*
%typemap(javain) enum SWIGTYPE "$javainput.ordinal()"
%typemap(javaout) enum SWIGTYPE {return $javaclassname.class.getEnumConstants()[$jnicall];}
%typemap(javabody) enum SWIGTYPE ""
*/

// define data/length pairs
%define DATA_LENGTH_PAIR_TYPEMAP(CDATATYPE, CLENGTHTYPE, JAVATYPE, CAPJAVATYPE)
%typemap(in) (CDATATYPE DATA[], CLENGTHTYPE LENGTH) {
  $2 = (CLENGTHTYPE) (*jenv)->GetArrayLength(jenv, $input);
  $1 = (CDATATYPE *) (*jenv)->Get##CAPJAVATYPE##ArrayElements(jenv, $input, 0);
}
%typemap(freearg) (CDATATYPE DATA[], CLENGTHTYPE LENGTH) {
  (*jenv)->Release##CAPJAVATYPE##ArrayElements(jenv, $input, (j##JAVATYPE *) $1, 0);
}
%typemap(jni) (CDATATYPE DATA[], CLENGTHTYPE LENGTH) %{j##JAVATYPE##Array%}
%typemap(jtype) (CDATATYPE DATA[], CLENGTHTYPE LENGTH) "JAVATYPE []"
%typemap(jstype) (CDATATYPE DATA[], CLENGTHTYPE LENGTH) "JAVATYPE []"
%typemap(javain) (CDATATYPE DATA[], CLENGTHTYPE LENGTH) "$javainput"
%enddef

DATA_LENGTH_PAIR_TYPEMAP(Byte, UInt32, byte, Byte)
DATA_LENGTH_PAIR_TYPEMAP(UInt16, UInt16, short, Short)

/*
typedef enum {
	STAT_OK,
	STAT_ERROR,
} Status;
*/

typedef enum {
	DMD_XGA,
} DMD_t;

typedef enum {
	LED_R,
	LED_G,
	LED_B,
	LED_IR,
	NUM_LEDS,
} LED_t;

typedef enum {
	SDM_SL,
	SDM_SL_RT,
	SDM_VIDEO,
	SDM_MIXED,
	SDM_OBJ,
} SEQDATA_t;

typedef enum {
	DVI,
	EXP,
	TPG,
	SL_AUTO,
	SL_EXT3P3,
	SL_EXT1P8,
	SL_SW,
} DATA_t;

typedef enum {
	SOLID,
	HORIZ_RAMP,
	VERT_RAMP,
	HORIZ_LINES,
	DIAG_LINES,
	VERT_LINES,
	HORIZ_STRIPES,
	VERT_STRIPES,
	GRID,
	CHECKERBOARD,
	NUM_PATTERNS,
} TPG_t;

typedef enum {
	TPG_BLACK,
	TPG_RED,
	TPG_GREEN,
	TPG_BLUE,
	TPG_YELLOW,
	TPG_CYAN,
	TPG_MAGENTA,
	TPG_WHITE,
} TPG_Col_t;
