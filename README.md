# River Raid Disassembly

This project reverse engineers [River Raid](http://www.worldofspectrum.org/infoseekid.cgi?id=0004154), a classic game for [ZX Spectrum](http://en.wikipedia.org/wiki/ZX_Spectrum) 48K published by [Activision](https://en.wikipedia.org/wiki/Activision), from the original tape image using [SkoolKit](http://skoolkit.ca/).

<p align="center">
    <img src="https://raw.githubusercontent.com/morozov/river-raid-disasm/master/png/screen.png" width="512" height="384" alt="River Raid">
</p>

## Building the Disassembly

1. Install [SkoolKit](http://skoolkit.ca/docs/skoolkit/usage.html). At least Skoolkit 8.4 is required.
2. Install [Pasmo](http://pasmo.speccy.org/). It is used to compile the disassembly and make sure that it produces exactly the same snapshot as the one made from the game image.
3. Build the disassembly:
   ```
   $ make
   tap2sna.py -f @river-raid.t2s \
   	--reg pc=23762 \
   	--reg sp=65344 \
   	https://zxaaa.net/DENIED/River%20Raid%20%281984%29%28Activision%29.tzx \
   	river-raid.pristine.z80
   Downloading https://zxaaa.net/DENIED/River%20Raid%20%281984%29%28Activision%29.tzx
   Writing river-raid.pristine.z80
   sna2skool.py --hex river-raid.pristine.z80 --ctl river-raid.ctl > river-raid.skool
   Using control file: river-raid.ctl
   skool2asm.py --create-labels -f 1 river-raid.skool > river-raid.asm
   skool2bin.py --ofix river-raid.skool - | bin2sna.py --border 0 --org 16384 --start 23762 --stack 65344 - river-raid.fixed.z80
   Parsed river-raid.skool (0.96s)
   Wrote ASM to stdout (0.24s)
   pasmo river-raid.asm river-raid.bin
   Wrote stdout: start=16384, end=63488, size=47104
   bin2sna.py --border 0 --org 16384 --start 23762 --stack 65344 river-raid.bin
   diff -u river-raid.fixed.z80 river-raid.z80
   ```

The resulting `river-raid.z80` will contain the game image with all the fixes applied (mostly sprites and few assembly instructions). The [`river-raid.asm`](river-raid.asm) file will contain the disassembly.
