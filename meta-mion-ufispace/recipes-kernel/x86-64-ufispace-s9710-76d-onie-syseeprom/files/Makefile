obj-m += x86-64-ufispace-s9710-76d-onie-syseeprom.o
x86-64-ufispace-s9710-76d-onie-syseeprom-objs := x86-64-ufispace-s9710-76d-vpd.o x86-64-ufispace-s9710-76d-onie-tlvinfo.o

SRC := $(shell pwd)

all:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)

modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

clean:
	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
