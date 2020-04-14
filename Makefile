CC := arm-linux-gnueabihf-gcc
AS := arm-linux-gnueabihf-gcc
AR := arm-linux-gnueabihf-ar

CFLAGS := -Wall -O2 -mthumb -march=armv7
ASFLAGS := -Wall -O2 -mthumb -march=armv7

OBJS := divsi3.o divmoddi4.o fixdfdi.o fixunsdfdi.o floatdidf.o floatundidf.o udivsi3.o udivmodsi4.o
OBJS += arm/aeabi_idivmod.o arm/aeabi_ldivmod.o arm/aeabi_uidivmod.o arm/aeabi_uldivmod.o arm/divmodsi4.o
OUTPUT := libaeabi32.a
INSTALL_DIR := /usr/lib

all : staticlib

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.S
	$(AS) $(ASFLAGS) -c $< -o $@

staticlib: $(OBJS)
	$(AR) r $(OUTPUT) $(OBJS)

install:
	install -m 644 $(OUTPUT) $(INSTALL_DIR)

clean:
	rm -f $(OBJS) $(OUTPUT)
