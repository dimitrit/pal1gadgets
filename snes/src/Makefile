target = buttons.pap

default: all

all: $(target)

%.pap: %.a65
	vasm6502_oldstyle -dotdir $< -o $@ -L $(basename $<).lst -Fpap -quiet -esc

clean:
	@rm -f *.lst *.img *.com *.bin *.obj *.hex *.pap

.PHONY: clean debug test
.PRECIOUS: %.hex %.bin %.pap
