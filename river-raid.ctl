> $4000 @start
> $4000 ; CONSTANTS
> $4000 ;
> $4000 ; These are here for information only and are not used by any of the assembly
> $4000 ; directives.
> $4000 ;
> $4000 ; CONTROLS_BIT_FIRE            = 0
> $4000 ; CONTROLS_BIT_SPEED_DECREASED = 1
> $4000 ; CONTROLS_BIT_SPEED_ALTERED   = 2
> $4000 ; CONTROLS_BIT_LOW_FUEL        = 3
> $4000 ; CONTROLS_BIT_4               = 4
> $4000 ; CONTROLS_BIT_EXPLODING       = 5
> $4000 ;
> $4000 ; POINTS_SHIP           = 3
> $4000 ; POINTS_REG_HELICOPTER = 6
> $4000 ; POINTS_BALLOON       = 6
> $4000 ; POINTS_FUEL           = 8
> $4000 ; POINTS_FIGHTER        = 10
> $4000 ; POINTS_10             = 10
> $4000 ; POINTS_15             = 15
> $4000 ; POINTS_25             = 25
> $4000 ; POINTS_BRIDGE         = 50
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
b $4000 Screen pixels.
D $4000 #UDGTABLE { #SCR(loading) } TABLE#
@ $5800 label=screen_attributes
b $5800 Screen attributes.
b $5B00
t $5B12
b $5B20
@ $5C78 label=int_counter
b $5C78 Interrupt counter
b $5C79
@ $5CD2 label=start
c $5CD2 The entry point invoked from the BASIC loader
@ $5CD8 nowarn
@ $5CE3 nowarn
c $5D10
  $5D1D,5 Check if we switched to the demo mode
@ $5D35 label=restart
c $5D35 Restart the game
@ $5D3F label=starting_bridges
b $5D3F Array of possible starting bridge values.
R $5D3F Index of list element is specified by the second and third bits of the #R$923A.
R $5D3F The values correspond to the dialog rendered as #R$792A.
@ $5D43 label=L5D43
B $5D43,1
@ $5D44 label=init_state
c $5D44
  $5D44,5 Initialize #R$5F72. Why isn't it $80?
c $5D9F
@ $5DA6 label=play
C $5DB4,2 PAPER 1; INK 4
@ $5DBF isub=LD BC,status_line_2 - status_line_1
@ $5DD0 isub=LD BC,status_line_3 - status_line_2
@ $5E32 isub=LD BC,state_score_player_2 - state_score_player_1
@ $5E40 isub=LD BC,end_status_line_4 - status_line_4
@ $5EEE label=L5EEE
b $5EEE
@ $5EEF label=L5EEF
b $5EEF
@ $5EF0 label=state_bridge_mod
g $5EF0
@ $5EF1 label=state_input_readings
g $5EF1 Contains the current readings of the input port (Sinclair, Kempston, Cursor, etc.).
@ $5EF2 label=L5EF2
b $5EF2
@ $5EF3 label=L5EF3
w $5EF3
@ $5EF5 label=state_interaction_mode_5EF5
g $5EF5
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
@ $5F00 label=viewport_1
b $5F00
  $5F00,46,3
@ $5F2E label=viewport_2
b $5F2E
  $5F2E,49,3
@ $5F5F label=L5F5F
b $5F5F
@ $5F60 label=viewport_1_ptr
w $5F60 Pointer to a slot from viewport #1
@ $5F62 label=viewport_2_ptr
w $5F62 Pointer to a slot from viewport #2
@ $5F64 label=state_speed
g $5F64 Current speed
@ $5F65 label=L5F65
b $5F65
@ $5F66 label=state_fuel
g $5F66 Fuel level
@ $5F67 label=state_control_type
g $5F67 Control type ($00 - Keyboard, $01 - Sinclair, $02 - Kempston, Other - Cursor)
@ $5F68 label=state_interaction_mode_5F68
g $5F68
R $5F68 $00 - TODO
R $5F68 $01 - TODO
R $5F68 $02 - TODO
R $5F68 $06 - fueling
@ $5F69 label=L5F69
b $5F69
@ $5F6A label=state_bridge_player_1
b $5F6A Current bridge of player 1
@ $5F6B label=state_bridge_player_2
b $5F6B Current bridge of player 2
@ $5F6C label=L5F6C
b $5F6C
@ $5F6D label=L5F6D
b $5F6D
w $5F6E
w $5F70
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
@ $6136 label=L6136
c $6136
@ $615E label=L615E
c $615E
  $61B3,2 POINTS_FIGHTER
@ $61BB label=interact_with_something
c $61BB
  $61D3,2 POINTS_BRIDGE
@ $621F keep
@ $623F label=next_bridge_player_1
@ $6249 label=next_bridge_player_2
b $6253
@ $6256 label=fuel
c $6256
@ $6268 label=hit_terrain
c $6268 Fighter hits terrain
c $62D4
c $62D7
@ $62DA label=advance
c $62DA Increase #REGb by the value of #R$5F64
c $62E0
@ $62E8 label=interact_with_something2
c $62E8 Interact with something
@ $6414 label=hit_helicopter_reg
c $6414
  $6414,2 POINTS_REG_HELICOPTER
@ $6423 label=hit_ship
c $6423
  $6423,2 POINTS_SHIP
  $6444,2 POINTS_15
  $6453,2 POINTS_10
@ $6462 label=hit_balloon
c $6462
  $6462,2 POINTS_BALLOON
@ $6478 label=interact_with_fuel
c $6478
  $6480,2 POINTS_FUEL
b $64B4
@ $64BC label=print_bridge
c $64BC
@ $64CD isub=LD BC,status_line_4 - status_line_3
@ $64E5 label=print_bridge_player_2
c $64E5 Print current bridge for player 2
@ $64EE isub=LD BC,status_line_4 - status_line_3
@ $64F1 label=print_bridge_no_player_2
c $64F1 Print current bridge number for player 2
@ $6506 label=print_space
c $6506 Print space
@ $650A label=handle_no_fuel
c $650A Handle the no fuel situation
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
  $6712,2 Set CONTROLS_BIT_SPEED_ALTERED
  $6714,2 Reset CONTROLS_BIT_SPEED_DECREASED
@ $6717 label=handle_down
  $671F,2 Set CONTROLS_BIT_SPEED_ALTERED
  $6721,2 Set CONTROLS_BIT_SPEED_DECREASED
@ $6724 label=handle_fire
  $6739,2 Set CONTROLS_BIT_FIRE
s $673C
c $673D
c $678E
  $6791,2 Reset CONTROLS_BIT_FIRE
c $6794
  $67E1,2 Reset CONTROLS_BIT_SPEED_DECREASED
c $6831
c $6836
c $683B
c $68B7
@ $68C5 nowarn
c $68C5
@ $68E9 label=init_current_bridge
@ $68EE label=init_current_bridge_loop
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
@ $6BB0 label=state_controls
g $6BB0 Bitmask of the CONTROLS_BIT_* bits containing the current controls and other information.
@ $6BB1 label=pause
c $6BB1 Keep the game paused
  $6BB7,5 Loop until anything else than H is pressed
@ $6BBF label=handle_enter
c $6BBF Handle the Enter key pressed
C $6BBF Scan Caps Shift
C $6BC8 Scan Symbol Shift
@ $6BD2 label=select_controls
@ $6BDB label=int_handler
c $6BDB Non-maskable interrupt handler
  $6BE4,6 Check if H was pressed
@ $6BED label=handle_controls
c $6BED
  $6BED,5 Check if H was pressed
  $6C13,2 Distill the state down to CONTROLS_BIT_SPEED_DECREASED and CONTROLS_BIT_SPEED_ALTERED.
  $6C15,5 Check if only CONTROLS_BIT_SPEED_DECREASED is set.
  $6C1A,5 Check if only CONTROLS_BIT_SPEED_ALTERED is set.
  $6C1F,5 Check if both bits are set.
@ $6C24 label=int_return
c $6C24 Return from the non-maskable interrupt handler
b $6C2B
@ $6C30 label=state_bit4_counter
g $6C30 Bit4 frame counter
@ $6C31 label=do_bit4
c $6C31 Do something about bit4
@ $6C52 label=bit4_finish
c $6C52 Finish doing something about bit4
  $6C5A,2 Reset CONTROLS_BIT_4
c $6C5D
@ $6C7A label=explosion_counter
g $6C7A Explosion frame counter
@ $6C7B label=explosion_render
c $6C7B Render explosion
@ $6CAD label=explosion_render_finish
c $6CAD Finish rendering explosion
  $6CB5,2 Reset CONTROLS_BIT_EXPLODING
c $6CB8
c $6CD6
@ $6CF4 label=do_low_fuel
c $6CF4 Render the low fuel signal
@ $6D17 label=demo
c $6D17
C $6D23,2 PAPER 1; INK 4
@ $6D2E isub=LD BC,status_line_2 - status_line_1
@ $6D48 isub=LD BC,end_status_line_4 - status_line_4
@ $6DEB label=init_starting_bridge
c $6DEB
c $6DEB Initializes the starting bridge based on the value of #R$923A using #R$5D3F for the lookup.
  $6DEE,2 Shift the game mode right discarding the bit corresponding to the number of players and leaving the ones corresponding to the starting bridge.
  $6DF0,3 Point to the beginning of the list
  $6DF3,4 Advance to the element corresponding to the game mode.
  $6DF7,1 Get the starting bridge number
c $6DFF
c $6E40
@ $6E86 label=register_low_fuel
c $6E86 Register low fuel level
  $6E89,2 Set CONTROLS_BIT_LOW_FUEL
@ $6E8C label=register_sufficient_fuel
c $6E8C Register sufficient fuel level
  $6E8F,2 Reset CONTROLS_BIT_LOW_FUEL
c $6E92
@ $6E9C label=explode_fragment
c $6E9C Explode a single fragment
R $6E9C I:BC Pointer to the fragment to explode.
  $6E9F,2 Set CONTROLS_BIT_EXPLODING
  $6EA1,2 Reset CONTROLS_BIT_FIRE
c $6EC8
c $6F63
c $6F67
c $6F6B
c $6F6F
c $6F73
c $6F7A
c $6F80
@ $6FE6 label=ld_enemy_sprites_right
c $6FE6 Load array of arrays of enemy headed right sprites.
R $6FE6 O:HL Pointer to the array of arrays of sprites.
c $6FEA
c $6FF6
c $7038
c $703B
c $703E
c $7046
@ $7048 nowarn
@ $704D nowarn
@ $7051 label=render_fuel
c $7051 Render fuel station
R $7051 I:E X position
@ $706C label=render_balloon
c $706C Render balloon
R $706C I:E X position
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
@ $7383 label=L7383
b $7383
@ $7384 label=L7384
b $7384
@ $7385 label=L7385
w $7385
c $7387
c $738E
c $7393
c $73D8
c $73DD
c $7415
c $7441
c $74EE
  $7520,2 POINTS_25
  $7529,2 Set CONTROLS_BIT_4
  $752B,2 Set CONTROLS_BIT_EXPLODING
c $754C
c $758A
c $75A2
@ $75BA label=ld_enemy_sprites
c $75BA Load array of enemy sprites.
R $75BA I:D The four lowest bits is the enemy type, the 6th bit is direction (reset is right, set is left).
R $75BA I:HL Pointer to the array of sprites
@ $75CB label=ld_enemy_sprites_loop
c $75D0
@ $7627 label=init_current_object_ptr
c $7627 Point #R$5F60 to the head of #R$5F00.
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
@ $7800 label=tmp_control_type
b $7800 Control type chosen from the dialog before the validation
@ $7801 label=state_demo_mode
b $7801 Demo mode flag ($00 - No, $01 - Yes)
@ $7802 label=controls_timer
w $7802 Stores the number of remaining iterations before the control choice dialog switches to demo mode
@ $7804 label=clear_and_setup
c $7804
C $7808,2 PAPER 0; INK 7
@ $7810 label=setup_sp
w $7810 Temporary stack pointer used by the control choice dialog
@ $7812 label=msg_keyboard_config
t $7812 Keyboard configuration;
  $7812,2 INK RED
  $7814,3 AT 0,8
  $7824,2 INK MAGENTA
  $7826,3 AT 2,8
  $7836,2 INK YELLOW
  $7839,2 AT 4,8
  $7848,2 INK GREEN
  $784A,3 AT 6,8
  $785A,2 INK CYAN
  $785C,3 AT 8,8
  $786F,3 AT 9,8
  $7880,2 INK WHITE
@ $7882 label=msg_instructions
  $7882,3 AT 11,7
  $7895,3 AT 13,6
  $78AB,3 AT 15,4
  $78C6,3 AT 16,3
  $78E3,3 AT 17,9
  $78F1,3 AT 19,0
  $7914,3 AT 20,5
@ $792A label=msg_game_mode
T $792A,2 INK WHITE
T $792C,2 PAPER BLACK
T $792E,3 AT 2,3
T $794B,3 AT 3,10
T $7959,3 AT 6,6
T $7974,3 AT 7,6
T $798E,3 AT 9,9
T $79A2,3 AT 10,9
T $79B6,3 AT 12,9
T $79CA,3 AT 13,7
T $79DE,3 AT 15,9
T $79F2,3 AT 16,9
T $7A06,3 AT 18,9
T $7A1A,3 AT 19,9
@ $7A2E label=msg_control_types
T $7A2E,2 INK WHITE
T $7A30,2 PAPER BLACK
T $7A32,3 AT 3,3
T $7A4F,3 AT 4,10
T $7A5D,3 AT 8,6
T $7A73,3 AT 10,6
T $7A8B,3 AT 12,6
T $7AA3,3 AT 14,6
@ $7AB9 label=setup
c $7AB9 Initial game setup
C $7AB9,9 Print control types dialog
R $7AB9 Initializes #R$7800, #R$7801 and #R$923A.
R $7AB9 Sets the stack pointer to #R$7810 and returns using that stack.
C $7AC2,6 Initialize timer
@ $7ACD label=controls_input
c $7ACD Wait until the user chooses a valid control type or switch to the demo mode on timeout.
  $7ACD,7 Decrease timer
  $7AD4,5 Check if the time is up
  $7ADC,4 Scan keyboard
  $7AE0,2 Subtract $31 from the pressed key ASCII code, effectively mapping the "1" key to 0, "2" to 1, etc.
  $7AE5,4 Validate the pressed key by making sure that none of the bits older than the first two are set, effectively allowing values 0 through 3.
  $7AE9,2 Repeat if a valid key was not pressed.
@ $7AED label=game_mode_print
  $7AED,7 The purpose of this block is really unclear
  $7AF4,2 PAPER 0; INK 7
  $7AF9,9 Print game mode dialog
@ $7B07 label=game_mode_input
c $7B07 Wait until the user chooses a valid game mode.
  $7B0A,4 Scan keyboard
  $7B0E,2 Subtract $31 from the pressed key ASCII code, effectively mapping the "1" key to 0, "2" to 1, etc.
  $7B13,4 Validate the pressed key by making sure that none of the bits older than the first three are set, effectively allowing values 0 through 7.
  $7B17,3 Repeat if a valid key was not pressed.
  $7B1A,2 PAPER 0; INK 7
  $7B27,9 Print keyboard configuration
@ $7B30 label=instructions_print
@ $7B3E label=instructions_input
  $7B41,4 Scan keyboard
  $7B48,5 Loop until Enter is pressed
  $7B4D,5 Switch to the non-demo mode
@ $7B57 label=switch_to_demo_mode
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
@ $825D label=udg_data
b $825D
D $825D #UDGTABLE { #FONT$825D,13 } TABLE#
b $82C5
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
@ $8A02 label=do_fire
c $8A02 Invoked from the interrupt handler when FIRE is pressed
c $8A1B
@ $8A33 label=init_udg
c $8A33
R $8A33 Sets BORDER to BLACK, sets screen attributes to WHITE-on-BLACK and copies #R$825D to the UDG area.
@ $8A39 nowarn
@ $8A3C label=init_udg_loop
c $8A4E
@ $8A86 label=sprite_fuel
b $8A86 Fuel sprite
N $8A86 #UDGTABLE { #UDGARRAY2,11,4,2;$8A86-$8AB8-1-16{0,0,64,100}(sprite-fuel) } TABLE#
b $8AB8
@ $8AC8 label=L8AC8
t $8AEA
b $8AED
@ $8B08 label=L8B08
w $8B08 Pointer to #R$6136
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
@ $90BC label=state_score_player_1
t $90BC
@ $90C2 label=state_score_player_2
t $90C2
t $90C8
t $90CE
@ $90E0 label=add_points
c $90E0 Add score points for a hit target
R $90E0 I:A Number of points to add divided by 10.
c $9109
  $9119,2 Set CONTROLS_BIT_4
@ $9122 label=update_score
c $9122
R $9122 I:A (can be 1, 2 or 4)
@ $913B label=inc_player_1_score_digit
c $913B Increase a digit in the player 1's score.
R $913B I:C Offset of the digit to increase.
R $913B O:D Offset of the digit to increase.
  $9145,2 Check for digit overflow (the value got beyond the 0-9 ASCII range).
@ $914B label=print_player_1_score_digit
  $914B,6 INK YELLOW
  $9151,6 PAPER BLACK
  $9157,6 AT 1,...
@ $9169 label=inc_player_2_score_digit
c $9169 Increase a digit in the player 2's score.
R $9169 I:C Offset of the digit to increase.
R $9169 O:D Offset of the digit to increase.
  $9173,2 Check for digit overflow (the value got beyond the 0-9 ASCII range).
@ $9179 label=print_player_2_score_digit
  $9179,6 INK CYAN
  $917F,6 AT 1,...
@ $9191 label=carry_player_1_score_digit
c $9191 Carry
R $9191 I:D Offset of the digit to carry.
R $9191 I:HL Pointer to the digit.
  $9191,2 Write "0" to the overflown digit.
  $9193,2 Check if #REGd is equal to 0 in a very weird way: set #REGa to 6.
  $9195,1 Subtract #REGd from it.
  $9196,1 Increase #REGa by one.
  $9197,2 Check if we got 7 (which is only possible if #REGd is 0).
@ $91A9 label=carry_player_2_score_digit
c $91A9 Carry
@ $91C1 label=print_score_player_2
c $91C1
  $91C1,6 INK CYAN
@ $91C7 isub=LD BC,L90C8 - state_score_player_2
  $91C7,9 Print score.
  $91D0,3 "0"
  $91D3,9 AT 1,18
  $91DC,6 "P2"
c $91E8
@ $9204 isub=LD BC,L90CC - L90C8
@ $923A label=state_game_mode
b $923A The game mode storing the number of players in the first bit and the starting bridge in the next two.
  $923A,1
@ $923B label=state_lives_player_1
g $923B Number of player 1 lives.
@ $923C label=state_lives_player_2
g $923C Number of player 2 lives.
@ $923D label=state_player
b $923D Current player
@ $923E label=print_lives
c $923E Print lives.
  $9246,6 INK YELLOW
@ $924F label=print_lives_continue
c $924F Continue printing lives after the value has been loaded into #REGa.
R $924F I:A Number of lives.
  $9250,9 AT 20,18
@ $925F label=print_lives_loop
  $925F,3 Print the ✈ UDG symbol
@ $9264 label=print_lives_padding
c $9264 Print six spaces
@ $9277 label=print_lives_player_2
c $9277 The player 2 branch of the #R$923E routine.
R $9277 O:A Number of lives.
  $9277,6 INK CYAN
@ $9283 label=ptr_state_controls
w $9283 Pointer to #R$6BB0
s $9285
c $928D
@ $92F1 nowarn
@ $934F nowarn
@ $93EC isub=LD BC,state_score_player_2 - state_score_player_1
@ $9404 isub=LD BC,state_score_player_2 - state_score_player_1
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