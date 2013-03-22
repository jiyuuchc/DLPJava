CFLAGS =	-c -O2 -g -Wall -fmessage-length=0 -I"$(JAVA_INCLUDE)" -I"$(JAVA_INCLUDE)/win32" -I.
#INCLUDES = -I"$(JAVA_INCLUDE)" -I"$(JAVA_INCLUDE)/win32" -I.

MODULE =	DLPJava

OBJDIR = build
JAVAOBJDIR = edu/uchc/$(MODULE)

SWIG = 	swig
SWIGOPT =	-java -package edu.uchc.DLPJava -outdir $(JAVAOBJDIR)

#INTERFACE = PortabilityLayer.i LED.i
INTERFACE = PortabilityLayer.i state.i FlashProgram.i FlashCompile.i Misc.i Display.i LED.i \
			Img.i RegIO.i Sync.i Source.i TestPatternGenerator.i Trigger.i
WRAPPER =	$(addprefix $(OBJDIR)/, $(INTERFACE:%.i=%_wrap.c))
OBJS =		$(addprefix $(OBJDIR)/, $(INTERFACE:%.i=%_wrap.o))
TARGET =	$(MODULE).dll

LIBS = PortabilityLayer.dll

$(OBJDIR):
	mkdir -p $@

$(JAVAOBJDIR):
	mkdir -p $(JAVAOBJDIR)
	
.SECONDARY:

$(OBJDIR)/%_wrap.c: %.i dlp.swg
	$(SWIG) $(SWIGOPT) -o $@ $< 

$(OBJDIR)/%.o: $(OBJDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJDIR) $(JAVAOBJDIR) $(OBJS)
	$(CC) -shared -Wl,--kill-at -o $(TARGET) $(LIBS) $(OBJS)

jar: DLPJava-sources.jar

DLPJava-sources.jar:
#	javac $(JAVAOBJDIR)/*.java
	jar cvf DLPJava-sources.jar edu

clean:
	rm -f *.c *.o $(TARGET) $(JAVAOBJDIR)/* $(OBJDIR)/*

all: $(TARGET) jar
