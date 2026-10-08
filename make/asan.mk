OPT ?= -O1 -g
SANFLAGS := -fsanitize=address,undefined -fno-omit-frame-pointer
CFLAGS += $(SANFLAGS)
LDFLAGS += $(SANFLAGS)
