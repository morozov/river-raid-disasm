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
@ $5D35 label=restart
c $5D35 Restart the game
b $5D3F
c $5D44
c $5D9F
c $5DA6
C $5DB4,2 PAPER 1; INK 4
@ $5DBF isub=LD BC,status_line_2 - status_line_1
@ $5DD0 isub=LD BC,status_line_3 - status_line_2
@ $5E40 isub=LD BC,end_status_line_4 - status_line_4
@ $5EEE label=L5EEE
b $5EEE
@ $5EEF label=L5EEF
b $5EEF
@ $5EF0 label=L5EF0
b $5EF0
@ $5EF1 label=state_input_readings
g $5EF1 Contains the current readings of the input port (Sinclair, Kempston, Cursor, etc.).
@ $5EF2 label=L5EF2
b $5EF2
@ $5EF3 label=L5EF3
w $5EF3
@ $5EF5 label=L5EF5
b $5EF5
@ $5EF6 label=L5EF6
b $5EF6
@ $5EF7 label=L5EF7
w $5EF7
@ $5EF9 label=L5EF9
b $5EF9
@ $5EFA label=L5EFA
b $5EFA
@ $5EFB label=L5EFB
b $5EFB
@ $5EFC label=L5EFC
b $5EFC
@ $5EFD label=L5EFD
b $5EFD
u $5EFE
@ $5F00 label=L5F00
t $5F00
@ $5F5F label=L5F5F
b $5F5F
@ $5F60 label=L5F60
w $5F60
@ $5F62 label=L5F62
w $5F62
@ $5F64 label=state_speed
g $5F64 Current speed
@ $5F65 label=L5F65
b $5F65
@ $5F66 label=L5F66
b $5F66
@ $5F67 label=state_control_type
g $5F67 Control type ($00 - Keyboard, $01 - Sinclair, $02 - Kempston, Other - Cursor)
@ $5F68 label=L5F68
b $5F68
@ $5F69 label=L5F69
b $5F69
@ $5F6A label=L5F6A
w $5F6A
@ $5F6C label=L5F6C
b $5F6C
@ $5F6D label=L5F6D
b $5F6D
@ $5F72 label=state_x
g $5F72 Current X coordinate
@ $5F73 label=L5F73
g $5F73
@ $5F75 label=L5F75
b $5F75
@ $5F76 label=L5F76
b $5F76
@ $5F77 label=L5F77
b $5F77
@ $5F78 label=L5F78
w $5F78
@ $5F7A label=L5F7A
b $5F7A
@ $5F7B label=L5F7B
w $5F7B
@ $5F7D label=L5F7D
b $5F7D
@ $5F7E label=L5F7E
w $5F7E
u $5F80
@ $5F81 label=L5F81
b $5F81
u $5F82
@ $5F83 label=sp_5F83
w $5F83
@ $5F85 label=L5F85
w $5F85
@ $5F87 label=L5F87
w $5F87
@ $5F89 label=L5F89
w $5F89
@ $5F8B label=L5F8B
w $5F8B
@ $5F8D label=L5F8D
w $5F8D
@ $5F8F label=L5F8F
w $5F8F
@ $5F91 label=main_loop
c $5F91 Main loop
C $5F91,9 Scan Enter
@ $5FDA label=scan_cursor
@ $600A label=scan_kempston
@ $6039 label=scan_sinclair
@ $6068 label=scan_keyboard
C $6068 Scan "O" (LEFT)
C $6071 Scan "P" (RIGHT)
C $607A Scan "2" (UP)
C $6083 Scan "W" (DOWN)
C $608C Scan lower row right (FIRE)
C $6097 Scan lower row left (FIRE)
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
@ $65F3 label=handle_right
c $65F3
@ $6642 label=handle_left
c $6642
c $6682
c $66CC
c $66D0
c $66EE
c $6704
@ $670A label=handle_up
@ $6717 label=handle_down
@ $6724 label=handle_fire
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
@ $6BB0 label=L6BB0
g $6BB0
c $6BB1
@ $6BBF label=handle_enter
c $6BBF Handle the Enter key pressed
C $6BBF Scan Caps Shift
C $6BC8 Scan Symbol Shift
@ $6BD2 label=select_controls
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
C $6D23,2 PAPER 1; INK 4
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
@ $7800 label=L7800
b $7800
@ $7801 label=L7801
b $7801
@ $7802 label=L7802
b $7802
@ $7804 label=clear_and_setup
c $7804
C $7808,2 PAPER 0; INK 7
@ $7810 label=sp_7810
b $7810
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
C $7AF4,2 PAPER 0; INK 7
  $7AF9,3 Print game mode dialog
C $7B1A,2 PAPER 0; INK 7
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
@ $82F5 label=L82F5
b $82F5
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
@ $85B3 label=sprite_enemies_left
b $85B3 Array [5] arrays of enemy headed left sprites (each element is 3×1 tiles × 4 frames = 96 bytes).
N $85B3 #UDGTABLE { #UDGARRAY3,14,4,3;$85B3-$85B6-1-16(*helicopter-reg-left-f1) | #UDGARRAY3,14,4,3;$85CB-$85CF-1-16(*helicopter-reg-left-f2) | #UDGARRAY3,14,4,3;$85E3-$85E6-1-16(*helicopter-reg-left-f3) | #UDGARRAY3,14,4,3;$85FB-$85FE-1-16(*helicopter-reg-left-f4) } TABLE#
N $85B3 Array [4] of regular helicopter headed left sprites (3×1 tiles, 24 bytes).
  $85B3,24,3 Frame 1
  $85CB,24,3 Frame 2
  $85E3,24,3 Frame 3
  $85FB,24,3 Frame 4
N $8613 #UDGTABLE { #UDGARRAY3,13,4,3;$8613-$8616-1-16(*ship-left-f1) | #UDGARRAY3,13,4,3;$862B-$862E-1-16(*ship-left-f2) | #UDGARRAY3,13,4,3;$8643-$8646-1-16(*ship-left-f3) | #UDGARRAY3,13,4,3;$865B-$865E-1-16(*ship-left-f4) } TABLE#
N $8613 Array [4] of ship headed left sprites (each element is 3×1 tiles = 24 bytes).
  $8613,24,3 Frame 1
  $862B,24,3 Frame 2
  $8643,24,3 Frame 3
  $865B,24,3 Frame 4
N $8673 #UDGTABLE { #UDGARRAY3,14,4,3;$8673-$8676-1-16(*helicopter-adv-left-f1) | #UDGARRAY3,14,4,3;$868B-$868F-1-16(*helicopter-adv-left-f2) | #UDGARRAY3,14,4,3;$86A3-$86A6-1-16(*helicopter-adv-left-f3) | #UDGARRAY3,14,4,3;$86BB-$86BE-1-16(*helicopter-adv-left-f4) } TABLE#
N $8673 Array [4] of advanced helicopter headed left sprites (each element is 3×1 tiles = 24 bytes).
  $8673,24,3 Frame 1
  $868B,24,3 Frame 2
  $86A3,24,3 Frame 3
  $86BB,24,3 Frame 4
N $86D3 #UDGTABLE { #UDGARRAY3,60,4,3;$86D3-$86D6-1-16(*tank-left-f1) | #UDGARRAY3,60,4,3;$86EB-$86EE-1-16(*tank-left-f2) | #UDGARRAY3,60,4,3;$8703-$8706-1-16(*tank-left-f3) | #UDGARRAY3,60,4,3;$871B-$871E-1-16(*tank-left-f4) } TABLE#
N $86D3 Array [4] of tank headed left sprites (each element is 3×1 tiles = 24 bytes).
  $86D3,24,3 Frame 1
  $86EB,24,3 Frame 2
  $8703,24,3 Frame 3
  $871B,24,3 Frame 4
N $8733 #UDGTABLE { #UDGARRAY3,12,4,3;$8733-$8736-1-16(*fighter-left-f1) | #UDGARRAY3,12,4,3;$874B-$874E-1-16(*fighter-left-f2) | #UDGARRAY3,12,4,3;$8763-$8766-1-16(*fighter-left-f3) | #UDGARRAY3,12,4,3;$877B-$877E-1-16(*fighter-left-f4) } TABLE#
N $8733 Array [4] of fighter headed left sprites (each element is 3×1 tiles = 24 bytes).
  $8733,24,3 Frame 1
  $874B,24,3 Frame 2
  $8763,24,3 Frame 3
  $877B,24,3 Frame 4
@ $8793 label=sprite_enemies_right
b $8793 Array [5] arrays of enemy headed right sprites (each element is 3×1 tiles × 4 frames = 96 bytes).
N $8793 #UDGTABLE { #UDGARRAY3,14,4,3;$8793-$8796-1-16(*helicopter-reg-right-f1) | #UDGARRAY3,14,4,3;$87AB-$87AE-1-16(*helicopter-reg-right-f2) | #UDGARRAY3,14,4,3;$87C3-$87C6-1-16(*helicopter-reg-right-f3) | #UDGARRAY3,14,4,3;$87DB-$87DE-1-16(*helicopter-reg-right-f4) | #UDGARRAY*helicopter-reg-right-f1,50;helicopter-reg-right-f2;helicopter-reg-right-f3;helicopter-reg-right-f4;helicopter-reg-left-f4;helicopter-reg-left-f3;helicopter-reg-left-f2;helicopter-reg-left-f1(helicopter-reg) } TABLE#
N $8793 Array [4] of regular helicopter headed right sprites (each element is 3×1 tiles = 24 bytes).
N $8793 #UDGTABLE { #UDGARRAY3,13,4,3;$87F3-$87F6-1-16(*ship-right-f1) | #UDGARRAY3,13,4,3;$880B-$880E-1-16(*ship-right-f2) | #UDGARRAY3,13,4,3;$8823-$8826-1-16(*ship-right-f3) | #UDGARRAY3,13,4,3;$883B-$883E-1-16(*ship-right-f4) | #UDGARRAY*ship-right-f1,50;ship-right-f2;ship-right-f3;ship-right-f4;ship-left-f4;ship-left-f3;ship-left-f2;ship-left-f1(ship) } TABLE#
N $8793 #UDGTABLE { #UDGARRAY3,14,4,3;$8853-$8856-1-16(*helicopter-adv-right-f1) | #UDGARRAY3,14,4,3;$886B-$886E-1-16(*helicopter-adv-right-f2) | #UDGARRAY3,14,4,3;$8883-$8886-1-16(*helicopter-adv-right-f3) | #UDGARRAY3,14,4,3;$889B-$889E-1-16(*helicopter-adv-right-f4) | #UDGARRAY*helicopter-adv-right-f1,50;helicopter-adv-right-f2;helicopter-adv-right-f3;helicopter-adv-right-f4;helicopter-adv-left-f4;helicopter-adv-left-f3;helicopter-adv-left-f2;helicopter-adv-left-f1(helicopter-adv) } TABLE#
N $8793 #UDGTABLE { #UDGARRAY3,60,4,3;$88B3-$88B6-1-16(*tank-right-f1) | #UDGARRAY3,60,4,3;$88CB-$88CE-1-16(*tank-right-f2) | #UDGARRAY3,60,4,3;$88E3-$88E6-1-16(*tank-right-f3) | #UDGARRAY3,60,4,3;$88FB-$88FE-1-16(*tank-right-f4) | #UDGARRAY*tank-right-f1,50;tank-right-f2;tank-right-f3;tank-right-f4;tank-left-f4;tank-left-f3;tank-left-f2;tank-left-f1(tank) } TABLE#
  $8793,24,3 Frame 1
  $87AB,24,3 Frame 2
  $87C3,24,3 Frame 3
  $87DB,24,3 Frame 4
N $87F3 Array [4] of ship headed right sprites (each element is 3×1 tiles = 24 bytes).
  $87F3,24,3 Frame 1
  $880B,24,3 Frame 2
  $8823,24,3 Frame 3
  $883B,24,3 Frame 4
N $8853 Array [4] of advanced helicopter headed right sprites (each element is 3×1 tiles = 24 bytes).
  $8853,24,3 Frame 1
  $886B,24,3 Frame 2
  $8883,24,3 Frame 3
  $889B,24,3 Frame 4
N $88B3 Array [4] of tank headed right sprites (each element is 3×1 tiles = 24 bytes).
  $88B3,24,3 Frame 1
  $88CB,24,3 Frame 2
  $88E3,24,3 Frame 3
  $88FB,24,3 Frame 4
N $8913 #UDGTABLE { #UDGARRAY3,12,4,3;$8913-$8916-1-16(*fighter-right-f1) | #UDGARRAY3,12,4,3;$892B-$892E-1-16(*fighter-right-f2) | #UDGARRAY3,12,4,3;$8943-$8946-1-16(*fighter-right-f3) | #UDGARRAY3,12,4,3;$895B-$895E-1-16(*fighter-right-f4) | #UDGARRAY*fighter-right-f1,50;fighter-right-f2;fighter-right-f3;fighter-right-f4;fighter-left-f4;fighter-left-f3;fighter-left-f2;fighter-left-f1(fighter) } TABLE#
N $8913 Array [4] of fighter headed right sprites (each element is 3×1 tiles = 24 bytes).
  $8913,24,3 Frame 1
  $892B,24,3 Frame 2
  $8943,24,3 Frame 3
  $895B,21,3 Frame 4
@ $8972 label=sprite_balloon
b $8972 Array [4] of balloon sprites (2×2 tiles, 32 bytes).
N $8972 #UDGTABLE { #UDGARRAY2,14,4,2;$8972-$898A-1-16(*balloon-f1) | #UDGARRAY2,14,4,2;$8992-$89AA-1-16(*balloon-f2) | #UDGARRAY2,14,4,2;$89B2-$89CA-1-16(*balloon-f3) | #UDGARRAY2,14,4,2;$89D2-$89EA-1-16(*balloon-f4) | #UDGARRAY*balloon-f1,50;balloon-f2;balloon-f3;balloon-f4;balloon-f3;balloon-f2(balloon) } TABLE#
  $8972,32,2 Frame 1
  $8992,32,2 Frame 2
  $89B2,32,2 Frame 3
  $89D2,32,2 Frame 4
@ $89F2 label=L89F2
b $89F2
@ $89FA label=L89FA
b $89FA
c $8A02
c $8A1B
c $8A33
@ $8A39 nowarn
c $8A4E
@ $8A86 label=sprite_fuel
b $8A86 Fuel sprite
N $8A86 #UDGTABLE { #UDGARRAY2,11,4,2;$8A86-$8AB8-1-16{0,0,64,100}(sprite-fuel) } TABLE#
b $8AB8
@ $8AC8 label=L8AC8
t $8AEA
b $8AED
@ $8B0A label=L8B0A
w $8B0A
@ $8B0C label=L8B0C
w $8B0C
@ $8B0E label=L8B0E
w $8B0E
@ $8B10 label=L8B10
w $8B10
@ $8B12 label=L8B12
w $8B12
@ $8B14 label=L8B14
w $8B14
@ $8B16 label=L8B16
w $8B16
t $8B18
@ $8B1A label=L8B1A
b $8B1A
s $8B1B
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
@ $940A label=clear_screen
c $940A Clear the screen by setting all pixel bytes to $00 and all attributes to the value set in #REGd.
R $940A I:D Attribute value.
C $940D,2 Clear the $18 of 256-byte blocks (6144 bytes) of pixels
@ $940F label=clear_scr_block
C $940F,2 256-byte counter
@ $9411 label=clear_scr_byte
C $9414,2 ...loop until the counter is zero
C $9417,2 Process next block
C $9419,2 Set the $03 of 256-byte blocks (768 bytes) of attribute
@ $941B label=clear_scr_attr
C $941D,2 ...loop until the counter is zero
C $9420,2 Process next block
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