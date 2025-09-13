target = simpladc.pap simpldig.pap diagnostic.pap

default: all

all: $(target)

%.pap: %.a65 palifdrv.a65
	vasm6502_oldstyle $< -o $@ -L $(basename $<).lst -Fpap -esc

clean:
	@rm -f *.lst *.img *.com *.bin *.obj *.hex *.pap

.PHONY: clean debug test
.PRECIOUS: %.hex %.bin %.pap
