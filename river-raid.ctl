@ $4000 start
@ $4000 org
@ $4000 equ=KEYBOARD=$02BF
@ $4000 equ=BEEPER=$03B5
@ $4000 equ=CHAN_OPEN=$1601
@ $4000 equ=OUT_NUM_1=$1A1B
@ $4000 equ=PR_STRING=$203C
@ $4000 equ=LAST_K=$5C08
@ $4000 equ=UDG=$5C7B
@ $4000 label=screen_pixels
b $4000 Screen pixels.
@ $5800 label=screen_attributes
b $5800 Screen attributes.
b $5B00
t $5B12
b $5B20
@ $5C78 label=L5C78
@ $5CD2 label=start
c $5CD2 The entry point invoked from the BASIC loader
@ $5CD8 nowarn
@ $5CE3 nowarn
c $5D10
b $5D35
c $5D44
c $5D9F
c $5DA6
@ $5DBF isub=LD BC,status_line_2 - status_line_1
@ $5DD0 isub=LD BC,status_line_3 - status_line_2
@ $5E40 isub=LD BC,end_status_line_4 - status_line_4
b $5EEE
t $5F00
b $5F5F
c $5F91
c $60A5
c $6124
c $6136
@ $621F keep
b $6253
c $6256
c $6268
c $62D4
c $62D7
c $62DA
c $62E0
c $62E8
b $64B4
c $64BC
@ $64CD isub=LD BC,status_line_4 - status_line_3
@ $64EE isub=LD BC,status_line_4 - status_line_3
c $6506
c $650A
c $6587
c $65AB
c $65BB
c $65CB
c $65F3
c $6642
c $6682
c $66CC
c $66D0
c $66EE
c $6704
c $670A
c $6717
c $6724
s $673C
c $673D
c $678E
c $6794
c $6831
c $6836
c $683B
c $68B7
@ $68C5 nowarn
c $68C5
c $68E9
c $6927
s $693B
c $693C
c $6947
c $694D
c $696B
c $6990
c $6A4A
c $6A4F
c $6B63
c $6B6B
c $6B73
c $6B7B
b $6BB0
t $6BC6
b $6BC9
c $6BDB
b $6C2B
c $6C31
c $6C5D
b $6C7A
c $6C7B
c $6CB8
c $6CD6
c $6CF4
c $6D17
@ $6D2E isub=LD BC,status_line_2 - status_line_1
@ $6D48 isub=LD BC,end_status_line_4 - status_line_4
c $6DEB
c $6DFF
c $6E40
c $6E86
c $6E8C
c $6E92
c $6E9C
c $6EC8
c $6F63
c $6F67
c $6F6B
c $6F6F
c $6F73
c $6F7A
c $6F80
c $6FE6
c $6FEA
c $6FF6
c $7038
c $703B
c $703E
c $7046
@ $7048 nowarn
@ $704D nowarn
c $7051
c $706C
c $708E
c $7155
c $7158
c $719F
c $71A2
c $7224
c $7248
c $724C
c $728B
c $7290
c $7296
c $72E6
@ $72E8 nowarn
@ $72EB nowarn
c $72EF
@ $72F1 nowarn
@ $72F4 nowarn
c $72F8
c $72FD
c $7302
c $7358
c $735E
c $7380
s $7383
c $7387
c $738E
c $7393
c $73D8
c $73DD
c $7415
c $7441
c $74EE
c $754C
c $758A
c $75A2
c $75BA
c $75D0
c $7627
c $762E
c $7649
c $76DA
b $7727
t $7742
b $7747
t $7753
b $775F
t $7770
b $7773
t $7784
b $7787
c $7800 Main code file
b $7812 Keyboard configuration; INK 2
b $7814 AT 0,8
t $7817
b $7824
t $7829
b $7836
t $783B
b $7848
t $784D
b $785A
t $785F
b $786F
t $7872
b $7880 Game controls
t $7885
b $7895
t $7898
b $78AB
t $78AE
b $78C6
t $78C9
b $78E3
t $78E6
b $78F1
t $78F4
b $7914
t $7917
b $792A
t $7931
b $794B
t $794E
b $7959
t $795C
b $7974
t $7977
b $798E
t $7991
b $79A2
t $79A5
b $79B6
t $79B9
b $79CA
t $79CD
b $79DE
t $79E1
b $79F2
t $79F5
b $7A06
t $7A09
b $7A1A
t $7A1D
b $7A2E
t $7A35
b $7A4F
t $7A52
b $7A5D
t $7A60
b $7A73
t $7A76
b $7A8B
t $7A8E
b $7AA3
t $7AA6
c $7AB9 Print control choice dialog
  $7AF9,3 Print game mode dialog
  $7B27,3 Print keyboard configuration
  $7B27,3 Print game controls
b $7B57
@ $8000 label=status_line_1
T $8000 PAPER 0
T $8002 INK 7
T $8004 AT 19,2
T $8007
B $8011 One half UDG
T $8012
T $8016 AT 20,8
B $8019 Fuel gauge scale UDG
T $8022 AT 21,8
T $8025 INK 3
B $8027 Fuel gauge reading UDG
T $802F INK 6
@ $8031 label=status_line_2
T $8031 AT 1,2
T $8034 INK 6
T $8036
T $8040 INK 7
T $8042 AT 1,18
T $8045
@ $804F label=status_line_3
T $804F AT 19,18
T $8052
@ $805A label=status_line_4
T $805A AT 20,4
T $805D INK 7
@ $805F label=end_status_line_4
b $805F
t $811F
b $8127
t $8153
b $818D
t $818E
b $81A8
t $81A9
b $81AF
t $81B6
b $81E4
t $81E8
b $825C
t $8277
b $827B
t $827E
b $8281
t $8290
b $8295
t $8298
b $829D
t $8371
b $837F
t $8383
b $839F
t $83A3
b $83B1
@ $83F1 label=L83F1
@ $8431 label=L8431
t $8439
b $843F
t $8459
b $8461
@ $8471 label=L8471
b $8471
@ $8481 label=L8481
b $8481
@ $8491 label=L8491
b $8491
@ $84A1 label=L84A1
t $8568
b $8579
t $857C
b $858C
t $858F
b $8599
t $859C
b $85A6
t $85A9
b $85B3
@ $8793 label=L8793
b $8793
@ $89F2 label=L89F2
b $89F2
@ $89FA label=L89FA
b $89FA
c $8A02
c $8A1B
c $8A33
@ $8A39 nowarn
c $8A4E
b $8A86
@ $8AC8 label=L8AC8
t $8AEA
b $8AED
t $8B12
s $8B1A
c $8B1E
c $8B70
c $8C0B
@ $8C1B label=L8C1B
c $8C1B
@ $8C3C label=L8C3C
c $8C3C
b $8C4A
t $90BC
c $90E0
c $9109
c $9122
c $91C1
c $91E8
s $923A
c $923E
s $9283
c $928D
@ $92F1 nowarn
@ $934F nowarn
b $93A1
c $940A
c $9423
b $9430
@ $9500 label=L9500
@ $C600 label=LC600
@ $C800 label=LC800
t $D13B
b $D13E
t $D337
b $D33A
t $D923
b $D926
t $DBE9
b $DBEC
t $DEC5
b $DEC8
t $E190
b $E196
t $E238
b $E23B
t $E26C
b $E270
t $E3FD
b $E400
t $E7BE
b $E7C2
t $ECA9
b $ECAC
t $EF6D
b $EF70
t $F26E
b $F273
t $F6A2
b $F6A5
t $F6AC
b $F6B0
i $F800