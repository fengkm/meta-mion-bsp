obj-m += x86-64-ufispace-s9701-78dc-onie-syseeprom.o
x86-64-ufispace-s9701-78dc-onie-syseeprom-objs := x86-64-ufispace-s9701-78dc-vpd.o x86-64-ufispace-s9701-78dc-onie-tlvinfo.o

SRC := $(shell pwd)

all:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)

modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

clean:
	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
