GAME=river-raid

ASM=$(GAME).asm
BIN=$(GAME).bin
CTL=$(GAME).ctl
PRISTINE_Z80=$(GAME).pristine.z80
FIXED_Z80=$(GAME).fixed.z80
SKOOL=$(GAME).skool
T2S=$(GAME).t2s
Z80=$(GAME).z80

ORG=16384
PC=23762
SP=65344

.PHONY: all
all: $(ASM) $(Z80) $(FIXED_Z80)

$(Z80): $(BIN) $(FIXED_Z80)
	bin2sna.py --border 0 --org $(ORG) --start $(PC) --stack $(SP) $(BIN)
	diff -u $(FIXED_Z80) $(Z80)

$(BIN): $(ASM)
	pasmo $(ASM) $(BIN)

$(ASM): $(SKOOL)
	skool2asm.py --create-labels -f 1 $< > $@

$(FIXED_Z80): $(SKOOL)
	skool2bin.py --ofix $< - | bin2sna.py --border 0 --org $(ORG) --start $(PC) --stack $(SP) - $@

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
