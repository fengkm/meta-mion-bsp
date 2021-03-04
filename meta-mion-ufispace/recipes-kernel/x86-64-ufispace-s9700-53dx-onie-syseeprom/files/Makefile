obj-m += x86-64-ufispace-s9700-53dx-onie-syseeprom.o
x86-64-ufispace-s9700-53dx-onie-syseeprom-objs := x86-64-ufispace-s9700-53dx-vpd.o x86-64-ufispace-s9700-53dx-onie-tlvinfo.o

SRC := $(shell pwd)

all:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)

modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

clean:
	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
