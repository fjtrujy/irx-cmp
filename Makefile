# _____     ___ ____     ___ ____
#  ____|   |    ____|   |        | |____|
# |     ___|   |____ ___|    ____| |    \    PS2DEV Open Source Project.
#-----------------------------------------------------------------------
# Copyright 2001-2022, ps2dev - http://www.ps2dev.org
# Licenced under Academic Free License version 2.0
# Review ps2sdk README & LICENSE files for further details.

IOP_BIN = dummy.irx

IOP_OBJS = main.o
# IOP_CFLAGS += -fdata-sections -ffunction-sections
# IOP_LDFLAGS += -Wl,--gc-sections

ifeq ($(DEBUG), 1)
  IOP_CFLAGS += -DDEBUG -O0 -g
else 
  IOP_CFLAGS += -Os
  IOP_LDFLAGS += -s
endif

all: $(IOP_BIN)

clean:
	rm -rf $(IOP_OBJS) $(IOP_BIN)

# Include makefiles
include $(PS2SDK)/samples/Makefile.pref
include $(PS2SDK)/samples/Makefile.iopglobal