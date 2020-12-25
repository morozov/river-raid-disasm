GAME=river-raid

ASM=$(GAME).asm
CTL=$(GAME).ctl
PRISTINE_Z80=$(GAME).pristine.z80
SKOOL=$(GAME).skool
T2S=$(GAME).t2s
Z80=$(GAME).z80

PC=23762
SP=65344

.PHONY: all
all: $(ASM) $(Z80)

$(ASM): $(SKOOL)
	skool2asm.py --create-labels $< > $@

$(Z80): $(SKOOL)
	skool2bin.py $< - | bin2sna.py --border 0 --org 16384 --start $(PC) --stack $(SP) - $@
	diff -u $(PRISTINE_Z80) $(Z80)

$(SKOOL): $(PRISTINE_Z80) $(CTL)
	sna2skool.py --hex $(PRISTINE_Z80) --ctl $(CTL) > $@

$(PRISTINE_Z80): $(T2S)
	tap2sna.py -f @$(T2S) \
		--reg pc=$(PC) \
		--reg sp=$(SP) \
		https://zxaaa.net/DENIED/River%20Raid%20%281984%29%28Activision%29.tzx \
		$(PRISTINE_Z80)

clean:
	rm -f \
		*.asm \
		*.skool \
		*.z80
