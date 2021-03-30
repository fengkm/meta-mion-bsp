obj-m += x86-64-ufispace-s9600-48x-onie-syseeprom.o
x86-64-ufispace-s9600-48x-onie-syseeprom-objs := x86-64-ufispace-s9600-48x-vpd.o x86-64-ufispace-s9600-48x-onie-tlvinfo.o

SRC := $(shell pwd)

all:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)

modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

clean:
	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
