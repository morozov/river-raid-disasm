> $4000 @start
> $4000
> $4000 COLOR_INHERIT EQU $00
> $4000 COLOR_BLACK   EQU $00
> $4000 COLOR_BLUE    EQU $01
> $4000 COLOR_RED     EQU $02
> $4000 COLOR_MAGENTA EQU $03
> $4000 COLOR_GREEN   EQU $04
> $4000 COLOR_CYAN    EQU $05
> $4000 COLOR_YELLOW  EQU $06
> $4000 COLOR_WHITE   EQU $07
> $4000
> $4000 INPUT_INTERFACE_KEYBOARD EQU $00
> $4000 INPUT_INTERFACE_SINCLAIR EQU $01
> $4000 INPUT_INTERFACE_KEMPSTON EQU $02
> $4000 INPUT_INTERFACE_CURSOR   EQU $03
> $4000
> $4000 DEMO_MODE_OFF EQU $00
> $4000 DEMO_MODE_ON  EQU $01
> $4000
> $4000 GAME_MODE_BIT_TWO_PLAYERS EQU 0
> $4000
> $4000 PLAYER_1 EQU $01
> $4000 PLAYER_2 EQU $02
> $4000
> $4000 SPEED_STOP   EQU $01
> $4000 SPEED_SLOW   EQU $01
> $4000 SPEED_NORMAL EQU $02
> $4000 SPEED_FAST   EQU $04
> $4000
> $4000 CONTROLS_BIT_FIRE            EQU 0
> $4000 CONTROLS_BIT_SPEED_DECREASED EQU 1
> $4000 CONTROLS_BIT_SPEED_ALTERED   EQU 2
> $4000 CONTROLS_BIT_LOW_FUEL        EQU 3
> $4000 CONTROLS_BIT_BONUS_LIFE      EQU 4
> $4000 CONTROLS_BIT_EXPLODING       EQU 5
> $4000
> $4000 TANK_SHELL_STATE_UNITIALIZED   EQU $00
> $4000 TANK_SHELL_MASK_SPEED          EQU $07
> $4000 TANK_SHELL_BIT_EXPLODING       EQU 5
> $4000 TANK_SHELL_BIT_FLYING          EQU 7
> $4000 TANK_SHELL_TRAJECTORY_MAX_STEP EQU $08
> $4000
> $4000 HELICOPTER_MISSILE_STEP EQU $08
> $4000
> $4000 HELICOPTER_ANIMATION_METRONOME_MASK  EQU $01
> $4000 HELICOPTER_ANIMATION_METRONOME_VALUE EQU $00
> $4000
> $4000 BALLOON_ANIMATION_METRONOME_MASK  EQU $01
> $4000 BALLOON_ANIMATION_METRONOME_VALUE EQU $01
> $4000
> $4000 FIGHTER_POSITION_LEFT_INIT   EQU $E8
> $4000 FIGHTER_POSITION_LEFT_LIMIT  EQU $00
> $4000 FIGHTER_POSITION_RIGHT_INIT  EQU $04
> $4000 FIGHTER_POSITION_RIGHT_LIMIT EQU $E8
> $4000
> $4000 POINTS_SHIP           EQU $03
> $4000 POINTS_HELICOPTER_REG EQU $06
> $4000 POINTS_BALLOON        EQU $06
> $4000 POINTS_FUEL           EQU $08
> $4000 POINTS_FIGHTER        EQU $10
> $4000 POINTS_HELICOPTER_ADV EQU $15
> $4000 POINTS_TANK           EQU $25
> $4000 POINTS_BRIDGE         EQU $50
> $4000
> $4000 OBJECT_HELICOPTER_REG EQU $01
> $4000 OBJECT_SHIP           EQU $02
> $4000 OBJECT_HELICOPTER_ADV EQU $03
> $4000 OBJECT_TANK           EQU $04
> $4000 OBJECT_FIGHTER        EQU $05
> $4000 OBJECT_BALLOON        EQU $06
> $4000 OBJECT_FUEL           EQU $07
> $4000
> $4000 SLOT_BIT_ROCK         EQU $03
> $4000 SLOT_BIT_TANK_ON_BANK EQU $05
> $4000 SLOT_BIT_ORIENTATION  EQU $06
> $4000 SLOT_MASK_OBJECT_TYPE EQU $07
> $4000
> $4000 SIZE_LEVEL_SLOTS      EQU $0100
> $4000
> $4000 SET_MARKER_EMPTY_SLOT EQU $00
> $4000 SET_MARKER_END_OF_SET EQU $FF
> $4000
> $4000 SPRITE_PLANE_WIDTH_TILES   EQU $02
> $4000 SPRITE_PLANE_HEIGHT_PIXELS EQU $08
> $4000 SPRITE_PLANE_FRAME_SIZE    EQU SPRITE_PLANE_WIDTH_TILES * SPRITE_PLANE_HEIGHT_PIXELS
> $4000 SPRITE_PLANE_ATTRIBUTES    EQU COLOR_BLUE<<3|COLOR_YELLOW
> $4000
> $4000 SPRITE_3BY1_ENEMY_WIDTH_TILES   EQU $03
> $4000 SPRITE_3BY1_ENEMY_HEIGHT_PIXELS EQU $08
> $4000 SPRITE_3BY1_ENEMY_FRAME_SIZE    EQU SPRITE_3BY1_ENEMY_WIDTH_TILES * SPRITE_3BY1_ENEMY_HEIGHT_PIXELS
> $4000 SPRITE_3BY1_ENEMY_ATTRIBUTES    EQU COLOR_BLUE<<3|COLOR_YELLOW
> $4000
> $4000 SPRITE_SHIP_ATTRIBUTES         EQU COLOR_BLUE<<3|COLOR_CYAN
> $4000 SPRITE_TANK_ATTRIBUTES         EQU COLOR_INHERIT
> $4000 SPRITE_TANK_ON_BANK_ATTRIBUTES EQU COLOR_GREEN
> $4000 SPRITE_FIGHTER_ATTRIBUTES      EQU COLOR_INHERIT
> $4000
> $4000 SPRITE_ROTOR_WIDTH_TILES   EQU $02
> $4000 SPRITE_ROTOR_HEIGHT_PIXELS EQU $02
> $4000 SPRITE_ROTOR_FRAME_SIZE    EQU SPRITE_ROTOR_WIDTH_TILES * SPRITE_ROTOR_HEIGHT_PIXELS
> $4000 SPRITE_ROTOR_ATTRIBUTES    EQU COLOR_BLUE<<3|COLOR_YELLOW
> $4000
> $4000 SPRITE_BALLOON_WIDTH_TILES   EQU $02
> $4000 SPRITE_BALLOON_HEIGHT_PIXELS EQU $10
> $4000 SPRITE_BALLOON_FRAME_SIZE    EQU SPRITE_BALLOON_WIDTH_TILES * SPRITE_BALLOON_HEIGHT_PIXELS
> $4000 SPRITE_BALLOON_ATTRIBUTES    EQU COLOR_BLUE<<3|COLOR_YELLOW
> $4000
> $4000 ; There is only one frame, so it's size is irrelevant.
> $4000 SPRITE_FUEL_STATION_WIDTH_TILES   EQU $02
> $4000 SPRITE_FUEL_STATION_HEIGHT_PIXELS EQU $19
> $4000 SPRITE_FUEL_STATION_FRAME_SIZE    EQU $0000
> $4000 SPRITE_FUEL_STATION_ATTRIBUTES    EQU COLOR_BLUE<<3|COLOR_MAGENTA
> $4000
> $4000 SPRITE_ROCK_WIDTH_TILES   EQU $03
> $4000 SPRITE_ROCK_HEIGHT_PIXELS EQU $10
> $4000 SPRITE_ROCK_FRAME_SIZE    EQU SPRITE_ROCK_WIDTH_TILES * SPRITE_ROCK_HEIGHT_PIXELS
> $4000 SPRITE_ROCK_ATTRIBUTES    EQU COLOR_RED<<3|COLOR_GREEN
> $4000
> $4000 SPRITE_MISSILE_WIDTH_TILES      EQU $01
> $4000 SPRITE_MISSILE_HEIGHT_PIXELS    EQU $08
> $4000 SPRITE_MISSILE_FRAME_SIZE_BYTES EQU SPRITE_MISSILE_WIDTH_TILES * SPRITE_MISSILE_HEIGHT_PIXELS
> $4000 SPRITE_MISSILE_ATTRIBUTES       EQU COLOR_BLUE<<3|COLOR_GREEN
> $4000
> $4000 SPRITE_HELICOPTER_MISSILE_WIDTH_TILES EQU $01
> $4000 SPRITE_HELICOPTER_MISSILE_ATTRIBUTES  EQU COLOR_INHERIT
> $4000
> $4000 ; Shell sprite is a truncated missile sprite, so the frame size should be calculated
> $4000 ; based on the original height.
> $4000 SPRITE_SHELL_WIDTH_TILES      EQU $01
> $4000 SPRITE_SHELL_HEIGHT_PIXELS    EQU $01
> $4000 SPRITE_SHELL_FRAME_SIZE_BYTES EQU SPRITE_SHELL_WIDTH_TILES * SPRITE_MISSILE_HEIGHT_PIXELS
> $4000 SPRITE_SHELL_ATTRIBUTES       EQU $00
> $4000
> $4000 SPRITE_SHELL_EXPLOSION_WIDTH_TILES      EQU $02
> $4000 SPRITE_SHELL_EXPLOSION_HEIGHT_PIXELS    EQU $10
> $4000 SPRITE_SHELL_EXPLOSION_FRAME_SIZE_BYTES EQU $0000
> $4000 SPRITE_SHELL_EXPLOSION_ATTRIBUTES       EQU $0C
> $4000
> $4000 PLANE_COORDINATE_Y     EQU $80
> $4000
> $4000 FUEL_CHECK_INTERVAL    EQU $03
> $4000 FUEL_INTAKE_AMOUNT     EQU $04
> $4000 FUEL_LEVEL_EMPTY       EQU $00
> $4000 FUEL_LEVEL_LOW         EQU $C0
> $4000 FUEL_LEVEL_ALMOST_FULL EQU $FC
> $4000 FUEL_LEVEL_FULL        EQU $FF
> $4000
> $4000 METRONOME_INTERVAL_CONSUME_FUEL EQU $01
> $4000 METRONOME_INTERVAL_ANIMATE_FUEL EQU $04
> $4000 METRONOME_INTERVAL_1            EQU $01
> $4000
> $4000 INTERACTION_MODE_00   EQU $00
> $4000 INTERACTION_MODE_01   EQU $01
> $4000 INTERACTION_MODE_02   EQU $02
> $4000 INTERACTION_MODE_FUEL EQU $06
> $4000
> $4000 OTHER_MODE_00             EQU $00
> $4000 OTHER_MODE_FUEL           EQU $01
> $4000 OTHER_MODE_HIT            EQU $02
> $4000 OTHER_MODE_XOR            EQU $03
> $4000 OTHER_MODE_HELICOPTER_ADV EQU $04
> $4000
> $4000 TODO_L5EF2_00 EQU $00
> $4000 TODO_L5EF2_01 EQU $01
> $4000
> $4000 VIEWPORT_HEIGHT EQU $88
> $4000
> $4000 ; STRUCTURES
> $4000 ; ----------
> $4000 ;
> $4000 ; OBJECT_DEFINITION ::
> $4000 ;
> $4000 ; Bits 0..2 represent an interactive object type.
> $4000 ; OBJECT_DEFINITION_MASK_INTERACTIVE_TYPE = $07,
> $4000 ;
> $4000 ; Bits 0..1 represent a rock type type.
> $4000 ; OBJECT_DEFINITION_MASK_ROCK_TYPE        = $03,
> $4000 ;
> $4000 ; Bit 3 defines whether the slot contains an interactive object (reset)
> $4000 ; or a rock (set).
> $4000 ; OBJECT_DEFINITION_BIT_ROCK              = 3,
> $4000 ;
> $4000 ; Bit 4 is unused.
> $4000 ;
> $4000 ; Bit 5 defines a tank location: bridge (unset) or river bank (set).
> $4000 ; OBJECT_DEFINITION_BIT_TANK_LOCATION     = 5,
> $4000 ;
> $4000 ; Bit 6 defines object orientation: left (unset) or right (set).
> $4000 ; OBJECT_DEFINITION_BIT_TANK_ORIENTATION  = 6,
> $4000 ;
> $4000 ; Bit 7 is unused.
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
@ $5C78 label=int_counter
g $5C78 Interrupt counter
u $5C79
@ $5CD2 label=start
c $5CD2 The entry point invoked from the BASIC loader
@ $5CD8 nowarn
@ $5CE3 nowarn
c $5D10
@ $5D20 isub=CP DEMO_MODE_ON
c $5D2B
@ $5D35 label=restart
c $5D35 Restart the game
@ $5D3F label=starting_bridges
b $5D3F Array of possible starting bridge values.
R $5D3F Index of list element is specified by the second and third bits of the #R$923A.
R $5D3F The values correspond to the dialog rendered as #R$792A.
@ $5D43 label=L5D43
g $5D43
@ $5D44 label=init_state
c $5D44
  $5D44,5 Initialize #R$5F72. Why isn't it $80?
@ $5D52 isub=LD (HL),SET_MARKER_END_OF_SET
@ $5D9F label=decrease_lives_player_2
c $5D9F Decrease player 2 lives
@ $5DA6 label=play
c $5DA6
C $5DB4,2 PAPER 1; INK 4
@ $5DBF isub=LD BC,status_line_2 - status_line_1
@ $5DD0 isub=LD BC,status_line_3 - status_line_2
@ $5DF1 isub=LD A,FUEL_LEVEL_FULL
@ $5E0B isub=LD (HL),SET_MARKER_END_OF_SET
@ $5E32 isub=LD BC,state_score_player_2 - state_score_player_1
@ $5E40 isub=LD BC,L805F - status_line_4
@ $5E76 isub=LD A,SPEED_FAST
@ $5E98 isub=LD A,SPEED_FAST
@ $5EB3 isub=CP PLAYER_2
@ $5ECD isub=CP INPUT_INTERFACE_KEMPSTON
@ $5EEE label=L5EEE
g $5EEE
@ $5EEF label=state_metronome
g $5EEF
@ $5EF0 label=state_bridge_index
g $5EF0 Current player's current bridge modulo 48 (the total number of bridges).
@ $5EF1 label=state_input_readings
g $5EF1 Contains the current readings of the input port (Sinclair, Kempston, Cursor, etc.).
@ $5EF2 label=L5EF2
g $5EF2
@ $5EF3 label=state_plane_missile_coordinates
g $5EF3
@ $5EF4 label=state_plane_missile_x
g $5EF4
@ $5EF5 label=state_other_mode
g $5EF5
@ $5EF6 label=L5EF6
g $5EF6
@ $5EF7 label=L5EF7
g $5EF7
W $5EF7
@ $5EF9 label=L5EF9
g $5EF9
@ $5EFA label=state_island_profile_idx
g $5EFA The value sourced from the first byte of an island definition in #R$C600 and used as a #R$8063 array index.
@ $5EFB label=state_island_byte_2
g $5EFB
@ $5EFC label=state_island_byte_3
g $5EFC
@ $5EFD label=state_island_line_idx
g $5EFD
u $5EFE
@ $5F00 label=viewport_objects
B $5F00,46,3
g $5F00
@ $5F2E label=exploding_fragments
B $5F2E,49,3
g $5F2E
@ $5F5F label=L5F5F
g $5F5F
@ $5F60 label=viewport_ptr
g $5F60 Pointer to a slot from #R$5F00
W $5F60
@ $5F62 label=exploding_fragments_ptr
g $5F62 Pointer to a slot from #R$5F2E
W $5F62
@ $5F64 label=state_speed
g $5F64 Current speed
@ $5F65 label=L5F65
g $5F65
@ $5F66 label=state_fuel
g $5F66 Fuel level
@ $5F67 label=state_input_interface
g $5F67 Control type ($00 - Keyboard, $01 - Sinclair, $02 - Kempston, Other - Cursor)
@ $5F68 label=state_interaction_mode_5F68
g $5F68
@ $5F69 label=L5F69
g $5F69
@ $5F6A label=state_bridge_player_1
g $5F6A Current bridge of player 1
@ $5F6B label=state_bridge_player_2
g $5F6B Current bridge of player 2
@ $5F6C label=L5F6C
g $5F6C
@ $5F6D label=L5F6D
g $5F6D
g $5F6E
g $5F6F
@ $5F70 label=state_y
g $5F70 Current Y coordinate
@ $5F72 label=state_x
g $5F72 Current X coordinate
@ $5F73 label=helicopter_missile_coordinates_ptr
g $5F73 Pointer to the helicopter missile coordinates.
@ $5F75 label=helicopter_missile_state
g $5F75 Helicopter missile state.
@ $5F76 label=state_level_fragment_number
g $5F76 Index of the current element of current level terrain array
@ $5F77 label=state_terrain_profile_number
b $5F77 The first byte of the current #R$9500 element, defines the index of the terrain sprite (see #R$8063).
@ $5F78 label=state_terrain_element_23
g $5F78
@ $5F7A label=state_terrain_extras
g $5F7A
@ $5F7B label=screen_ptr
g $5F7B
W $5F7B
@ $5F7D label=state_terrain_position
g $5F7D Inner array index in the terrain definition.
@ $5F7E label=ptr_scroller
g $5F7E Pointer to the text to be displayed in the scroller.
W $5F7E
u $5F80
@ $5F81 label=L5F81
g $5F81
u $5F82
@ $5F83 label=sp_5F83
g $5F83
W $5F83
@ $5F85 label=tmp_HL
g $5F85
W $5F85
@ $5F87 label=tmp_DE
g $5F87
W $5F87
@ $5F89 label=tmp_BC
g $5F89
W $5F89
@ $5F8B label=L5F8B
g $5F8B
W $5F8B
@ $5F8D label=L5F8D
g $5F8D
W $5F8D
@ $5F8F label=state_plane_missile_coordinates_backup
g $5F8F
W $5F8F
@ $5F91 label=main_loop
c $5F91 Main loop
C $5F91,9 Scan Enter
@ $5FCB isub=CP INPUT_INTERFACE_KEMPSTON
@ $5FD0 isub=CP INPUT_INTERFACE_SINCLAIR
@ $5FD5 isub=CP INPUT_INTERFACE_KEYBOARD
@ $5FDA label=scan_cursor
@ $600A label=scan_kempston
c $600A
@ $6039 label=scan_sinclair
c $6039
@ $6068 label=scan_keyboard
c $6068
C $6068 Scan "O" (LEFT)
C $6071 Scan "P" (RIGHT)
C $607A Scan "2" (UP)
C $6083 Scan "W" (DOWN)
C $608C Scan lower row right (FIRE)
C $6097 Scan lower row left (FIRE)
c $60A5
@ $60A8 isub=CP INTERACTION_MODE_00
@ $60AD isub=LD A,OTHER_MODE_00
c $6124
@ $6136 label=L6136
c $6136
@ $6145 isub=CP OTHER_MODE_00
@ $614A isub=CP OTHER_MODE_FUEL
@ $614F isub=CP OTHER_MODE_HIT
@ $6154 isub=CP OTHER_MODE_XOR
@ $6159 isub=CP OTHER_MODE_HELICOPTER_ADV
@ $615E label=handle_other_mode_xor
c $615E
@ $61A3 isub=LD (HL),SET_MARKER_EMPTY_SLOT
@ $61B3 isub=LD A,POINTS_FIGHTER
@ $61BB label=interact_with_something
c $61BB
@ $61D3 isub=LD A,POINTS_BRIDGE
@ $621F keep
@ $623A isub=CP PLAYER_2
@ $623F label=next_bridge_player_1
@ $6249 label=next_bridge_player_2
c $6249
u $6253
@ $6256 label=fuel
@ $6256 isub=LD A,INTERACTION_MODE_FUEL
c $6256
@ $6268 label=hit_terrain
c $6268 Fighter hits terrain
@ $6274 isub=CP SET_MARKER_EMPTY_SLOT
@ $6279 isub=CP SET_MARKER_END_OF_SET
c $62CE
c $62D4
c $62D7
@ $62DA label=advance_object
c $62DA Increase vertical coordinate of the object by the value of #R$5F64.
R $62DA I:B Current coordinate
R $62DA O:B New coordinate
@ $62E0 label=retract_object
c $62E0 Decrease vertical coordinate of the object by the value of #R$5F64.
R $62E0 I:B Current coordinate
R $62E0 O:B New coordinate
@ $62E8 label=interact_with_something2
c $62E8 Interact with something
@ $62F4 isub=CP SET_MARKER_EMPTY_SLOT
@ $62F9 isub=CP SET_MARKER_END_OF_SET
@ $6301 isub=CP INTERACTION_MODE_FUEL
@ $6324 isub=AND SLOT_MASK_OBJECT_TYPE
@ $6326 isub=CP OBJECT_BALLOON
@ $632B isub=CP OBJECT_FUEL
@ $6361 isub=AND SLOT_MASK_OBJECT_TYPE
@ $6363 isub=CP OBJECT_SHIP
@ $6380 isub=CP INTERACTION_MODE_FUEL
@ $639B isub=CP OBJECT_HELICOPTER_REG
@ $63A0 isub=CP OBJECT_SHIP
@ $63A5 isub=CP OBJECT_HELICOPTER_ADV
@ $63AA isub=CP OBJECT_FIGHTER
@ $63AF isub=CP OBJECT_BALLOON
@ $63B4 isub=CP OBJECT_FUEL
@ $63FC isub=LD A,INTERACTION_MODE_00
c $63FC
@ $6401 isub=LD A,OTHER_MODE_00
@ $6414 label=hit_helicopter_reg
@ $6414 isub=LD A,POINTS_HELICOPTER_REG
c $6414
@ $6423 label=hit_ship
@ $6423 isub=LD A,POINTS_SHIP
c $6423
@ $6444 label=hit_helicopter_adv
@ $6444 isub=LD A,POINTS_HELICOPTER_ADV
c $6444 Hit advanced helicopter
@ $6453 label=hit_fighter
@ $6453 isub=LD A,POINTS_FIGHTER
c $6453 Hit fighter
@ $6462 label=hit_balloon
@ $6462 isub=LD A,POINTS_BALLOON
c $6462
@ $6478 label=interact_with_fuel
c $6478
@ $647B isub=CP INTERACTION_MODE_FUEL
@ $6480 isub=LD A,POINTS_FUEL
c $649E
c $64A1
u $64B4
@ $64BC label=print_bridge
c $64BC
@ $64BF isub=CP PLAYER_2
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
@ $6553 isub=CP PLAYER_2
@ $6563 isub=BIT GAME_MODE_BIT_TWO_PLAYERS,A
c $656F
@ $6572 isub=BIT GAME_MODE_BIT_TWO_PLAYERS,A
@ $6577 label=game_over
c $6577 Game Over
c $6587
@ $658A isub=BIT GAME_MODE_BIT_TWO_PLAYERS,A
@ $65A1 ofix=LD DE,$8052
@ $65A4 ofix=LD BC,$0008
c $65AB
c $65BB
c $65CB
c $65DE
@ $65F3 label=handle_right
c $65F3
@ $6602 isub=LD B,PLANE_COORDINATE_Y
@ $6604 isub=LD A,OTHER_MODE_FUEL
@ $6613 isub=LD BC,SPRITE_PLANE_FRAME_SIZE
@ $661C isub=LD E,SPRITE_PLANE_ATTRIBUTES
@ $6621 isub=CP PLAYER_2
  $6621,5 Player 2 and ship use the same attributes
@ $6626 isub=LD D,SPRITE_PLANE_HEIGHT_PIXELS
@ $6628 isub=LD A,SPRITE_PLANE_WIDTH_TILES
@ $6642 label=handle_left
c $6642
@ $6651 isub=LD B,PLANE_COORDINATE_Y
@ $6653 isub=LD A,OTHER_MODE_FUEL
@ $6662 isub=LD BC,SPRITE_PLANE_FRAME_SIZE
@ $666B isub=LD E,SPRITE_PLANE_ATTRIBUTES
@ $6670 isub=CP PLAYER_2
  $6670,5 Player 2 and ship use the same attributes
@ $6675 isub=LD D,SPRITE_PLANE_HEIGHT_PIXELS
@ $6677 isub=LD A,SPRITE_PLANE_WIDTH_TILES
c $6682
@ $6685 isub=CP INTERACTION_MODE_00
@ $6694 isub=LD A,OTHER_MODE_FUEL
@ $66A4 isub=LD BC,SPRITE_PLANE_FRAME_SIZE
@ $66AD isub=LD E,SPRITE_PLANE_ATTRIBUTES
@ $66B2 isub=CP PLAYER_2
  $66B2,5 Player 2 and ship use the same attributes
@ $66B7 isub=LD D,SPRITE_PLANE_HEIGHT_PIXELS
@ $66C4 isub=LD A,SPRITE_PLANE_WIDTH_TILES
@ $66CC label=ld_sprite_plane_banked
c $66CC
@ $66D0 label=advance
c $66D0 Increase #R$5F70 by the value of #R$5F64, set #R$5F64 to the default value and do something with the #R$6BB0 bits.
@ $66E1 isub=LD A,SPEED_NORMAL
c $66EE
@ $66F8 isub=AND VIEWPORT_HEIGHT
@ $66FA isub=CP VIEWPORT_HEIGHT
c $6704
@ $670A isub=LD A,SPEED_FAST
@ $670A label=handle_up
c $670A
@ $6712 isub=SET CONTROLS_BIT_SPEED_ALTERED,(HL)
@ $6714 isub=RES CONTROLS_BIT_SPEED_DECREASED,(HL)
@ $6717 isub=LD A,SPEED_SLOW
@ $6717 label=handle_down
c $6717
@ $671F isub=SET CONTROLS_BIT_SPEED_ALTERED,(HL)
@ $6721 isub=SET CONTROLS_BIT_SPEED_DECREASED,(HL)
@ $6724 label=handle_fire
c $6724
  $6739,2 Set CONTROLS_BIT_FIRE
s $673C
@ $673D label=animate_plane_missile
c $673D
@ $677A isub=LD A,OTHER_MODE_HIT
@ $677F isub=LD DE,SPRITE_MISSILE_HEIGHT_PIXELS<<8|SPRITE_MISSILE_ATTRIBUTES
@ $6785 isub=LD BC,SPRITE_MISSILE_FRAME_SIZE_BYTES
@ $6788 isub=LD A,SPRITE_MISSILE_WIDTH_TILES
c $678E
  $6791,2 Reset CONTROLS_BIT_FIRE
c $6794
@ $679E isub=CP INTERACTION_MODE_FUEL
@ $67A3 isub=LD A,OTHER_MODE_00
  $67E1,2 Reset CONTROLS_BIT_SPEED_DECREASED
c $6831
c $6836
c $683B
c $68A1
c $68B7
@ $68C5 nowarn
c $68C5
@ $68E9 label=init_current_bridge
c $68E9
@ $68EE label=init_current_bridge_loop
@ $6900 isub=CP PLAYER_2
c $6927
s $693B
@ $693C label=handle_terrain_element_1_eq_3
c $693C
@ $6947 label=handle_terrain_element_1_eq_2
c $6947
@ $694D label=increase_bridge_index
c $694D Increase bridge index and handle overflow by resetting to the first bridge.
R $694D O:A Always set to 0
  $694D,7 Reset Y-position
  $6954,7 Increase bridge index
  $695B,2 Check for overflow
@ $6963 label=next_bridge_index_overflow
c $6963
  $6963,5 Reset bridge index
@ $696B label=handle_island
c $696B
R $696B I:A The six highest bits of the fourth byte of the terrain element.
@ $6978 label=locate_island_element
@ $697A ofix=JR NZ,$6978
@ $6990 label=render_island_line
c $6990
  $6990,7 Next island line.
  $6994
@ $69A0 label=L6990_locate_sprite
  $69A0,4 Point #REGhl to the element of #R$8063 with the index defined by #R$5EFA.
  $69A4,9 Point #REGhl to the profile line with the index defined by #R$5F7D.
c $6A3F
c $6A45
c $6A4A
@ $6A4F label=render_terrain_row
c $6A4F
  $6A54,3 Point #REGhl to the #R$9500 array.
  $6A57,3 Level terrain array size (64 elements × 4 bytes each)
@ $6A60 label=locate_level_terrain
  $6A60,4 Point #REGhl to the element of #R$9500 with the index defined by #R$5EF0.
  $6A64,9 Next fragment
  $6A6D,5 If it's the last fragment, advance to the next level
  $6A72,3 Terrain fragment size (4 bytes)
@ $6A79 label=locate_level_terrain_fragment
  $6A79,4 Point #REGhl to the fragment of the current #R$9500 element with the index defined by #R$5F76.
@ $6AA3 label=render_terrain_fragment
@ $6AAF label=locate_terrain_fragment
  $6AAF,4 Point #REGhl to the element of #R$8063 with the index defined by #R$5F77.
  $6AB3,7 Next line
  $6ABA,5 If it's the last line, advance to the next fragment.
  $6ABF,6 Point #REGhl to byte of the current terrain fragment defined by #R$5F7D.
  $6AC5,4 Load the value of the current terrain row offset into #REGb. The value loaded into #REGc is unused.
  $6AC9,1 Load the value of the current terrain profile byte into #REGa.
  $6ACA,5 Jump to handling a special terrain fragment.
  $6ACF,1 Now #REGa contains the coordinate of the left terrain edge.
  $6AD3,2 For some reason, subtract 16 from the coordinate of the left terrain edge.
  $6AD5,1 Store the result in #REGd to reuse it in multiple operations with #REGa.
  $6ADA,3 Point #REGhl to #R$89F2.
  $6ADD,1 Restore the coordinate of the left terrain edge into #REGa.
  $6ADE,2 Use only the lowest three bits of the coordinate.
  $6AE0,5 Shift the remaining bits right and left effectively discarding the lowest bit and store the result into #REGc. Why not just make AND 6 instead of AND 7 above?
  $6AE5,1 Restore the coordinate of the left terrain edge into #REGa.
  $6AE6,1 Point #REGhl to the element of #R$89F2 defined by #REGc.
  $6AE7,1 Temporarily store the pointer in #REGde.
  $6AE8,1 Copy the coordinate of the left terrain edge into #REGc.
  $6AE9,3 Point #REGhl screen address of the beginning of the terrain line being currently rendered.
  $6AEE,6 Calculate the number of full tiles corresponding to the coordinate of the left terrain edge.
  $6AF4,1 Calculate the address where the terrain edge needs to be rendered.
  $6AF5,1 Now #REGhl points to the element of #R$89F2 to be rendered, and #REGde contains the address of the screen where it needs to be rendered.
  $6AF6,3 Why on earth is the edge represented by two bytes?
  $6AF9,2 Copy the bytes. The 0th element of #R$89F2 contains a 10px sprite, the 1th one contains a 12px sprite and so on. So effectively by extracting 16 from the edge coordinate earlier and adding 10 later we are rendering the terrain edge of the size 6px less than defined. Why?
  $6AFB,2 Restore #REGde back to the screen address of beginning of the edge.
  $6AFD,1 Copy the coordinate of the left terrain edge into #REGb.
  $6AFE,6 Again, calculate the number of full tiles corresponding to the coordinate of the left edge.
@ $6B06 label=fill_terrain_left_loop
@ $6B4B label=fill_terrain_right_loop
@ $6B58 label=state_terrain_element_4_eq_1
c $6B58 A=2C-D
R $6B58 I:C TODO: what is the meaning of this parameter?
R $6B58 I:D Left terrain coordinate.
R $6B58 O:A Right terrain coordinate.
@ $6B5E label=state_terrain_element_4_eq_2
c $6B5E A=C+D
R $6B5E I:C River width.
R $6B5E I:D Left terrain coordinate.
R $6B5E O:A Right terrain coordinate.
@ $6B63 label=ld_fragment_canal_adjacent_to_river
c $6B63 Load the sprite and the attributes of the line of the half of the canal adjacent to the river.
@ $6B6B label=ld_fragment_canal_adjacent_to_road
c $6B6B Load the sprite and the attributes of the line of the half of the canal adjacent to the road.
@ $6B73 label=ld_fragment_road
c $6B73 Load the sprite and the attributes of the line of the road and bridge.
@ $6B7B label=handle_special_terrain_fragment
c $6B7B Handle special terrain fragments (pre and post-bridge canal and the road with the bridge) which have different color attributes than the rest of the terrain fragments.
@ $6B8F label=handle_special_terrain_fragment_continue
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
c $6BD2
@ $6BDB label=int_handler
c $6BDB Non-maskable interrupt handler
  $6BE4,6 Check if H was pressed
@ $6BED label=handle_controls
c $6BED
  $6BED,5 Check if H was pressed
@ $6BF8 isub=BIT CONTROLS_BIT_FIRE,(HL)
@ $6BFD isub=BIT CONTROLS_BIT_BONUS_LIFE,(HL)
@ $6C05 isub=BIT CONTROLS_BIT_EXPLODING,(HL)
@ $6C0D isub=BIT CONTROLS_BIT_LOW_FUEL,(HL)
  $6C13,2 Distill the state down to CONTROLS_BIT_SPEED_DECREASED and CONTROLS_BIT_SPEED_ALTERED.
  $6C15,5 Check if only CONTROLS_BIT_SPEED_DECREASED is set.
  $6C1A,5 Check if only CONTROLS_BIT_SPEED_ALTERED is set.
  $6C1F,5 Check if both bits are set.
@ $6C24 label=int_return
c $6C24 Return from the non-maskable interrupt handler
u $6C2B
@ $6C30 label=state_bit4_counter
g $6C30 Bit4 frame counter
@ $6C31 label=do_bonus_life
c $6C31 Do something about bit4
@ $6C52 label=bit4_finish
c $6C52 Finish doing something about bit4
  $6C5A,2 Reset CONTROLS_BIT_BONUS_LIFE
c $6C5D
@ $6C7A label=explosion_counter
g $6C7A Explosion frame counter
@ $6C7B label=beep_explosion
c $6C7B Render explosion
@ $6CAD label=explosion_render_finish
c $6CAD Finish rendering explosion
@ $6CB5 isub=RES CONTROLS_BIT_EXPLODING,(HL)
c $6CB8
c $6CD6
@ $6CF4 label=do_low_fuel
c $6CF4 Render the low fuel signal
@ $6D17 label=demo
c $6D17
C $6D23,2 PAPER 1; INK 4
@ $6D2E isub=LD BC,status_line_2 - status_line_1
@ $6D48 isub=LD BC,L805F - status_line_4
c $6DDD
@ $6DEB label=init_starting_bridge
c $6DEB
c $6DEB
c $6DEB Initializes the starting bridge based on the value of #R$923A using #R$5D3F for the lookup.
  $6DEE,2 Shift the game mode right discarding the bit corresponding to the number of players and leaving the ones corresponding to the starting bridge.
  $6DF0,3 Point to the beginning of the list
  $6DF3,4 Advance to the element corresponding to the game mode.
  $6DF7,1 Get the starting bridge number
@ $6DFF label=consume_fuel
c $6DFF
@ $6E02 isub=AND METRONOME_INTERVAL_CONSUME_FUEL
@ $6E0E isub=AND FUEL_CHECK_INTERVAL
@ $6E16 isub=CP FUEL_LEVEL_EMPTY
@ $6E1B isub=AND FUEL_LEVEL_LOW
@ $6E40 label=add_fuel
c $6E40
@ $6E49 isub=AND FUEL_LEVEL_ALMOST_FULL
@ $6E4B isub=CP FUEL_LEVEL_ALMOST_FULL
@ $6E5C isub=ADD A,FUEL_INTAKE_AMOUNT
@ $6E61 isub=AND FUEL_LEVEL_LOW
@ $6E86 label=register_low_fuel
c $6E86 Register low fuel level
  $6E89,2 Set CONTROLS_BIT_LOW_FUEL
@ $6E8C label=register_sufficient_fuel
c $6E8C Register sufficient fuel level
  $6E8F,2 Reset CONTROLS_BIT_LOW_FUEL
@ $6E92 label=signal_fuel_level_excessive
c $6E92
@ $6E9C label=explode_fragment
c $6E9C Explode a single fragment
R $6E9C I:BC Pointer to the fragment to explode.
@ $6E9F isub=SET CONTROLS_BIT_EXPLODING,(HL)
  $6EA1,2 Reset CONTROLS_BIT_FIRE
@ $6EAB label=add_object_to_set
c $6EAB Adds object bytes to the set in thefollowing order: C, B, D.
R $6EAB I:B Mostly $00
R $6EAB I:C Object X-position
R $6EAB I:D Object definition
R $6EAB I:HL Pointer to #R$5F00
@ $6EAC isub=CP SET_MARKER_EMPTY_SLOT
@ $6EB1 isub=CP SET_MARKER_END_OF_SET
@ $6EBC label=write_object_to_set
c $6EBC
c $6EBC
R $6EBC I:A Current value at the address
R $6EBC I:B Mostly $00
R $6EBC I:C Object X-position
R $6EBC I:D Object definition
R $6EBC I:HL Pointer to the element of #R$5F00
@ $6EC1 isub=CP SET_MARKER_END_OF_SET
@ $6EC5 isub=LD (HL),SET_MARKER_END_OF_SET
@ $6EC8 label=render_explosions
c $6EC8
@ $6ED5 isub=CP SET_MARKER_EMPTY_SLOT
@ $6EDA isub=CP SET_MARKER_END_OF_SET
@ $6EF4 isub=AND VIEWPORT_HEIGHT
@ $6EF6 isub=CP VIEWPORT_HEIGHT
@ $6F30 isub=LD A,OTHER_MODE_00
@ $6F63 label=ld_sprite_explosion_f1
c $6F63 Load frame 1 of the explosion sprite.
R $6F63 O:DE Pointer to the sprite.
@ $6F67 label=ld_sprite_explosion_f2
c $6F67 Load frame 2 of the explosion sprite.
R $6F67 O:DE Pointer to the sprite.
@ $6F6B label=ld_sprite_explosion_f3
c $6F6B Load frame 3 of the explosion sprite.
R $6F6B O:DE Pointer to the sprite.
@ $6F6F label=ld_sprite_explosion_erasure
c $6F6F Load explosion erasure sprite.
R $6F6F O:DE Pointer to the sprite.
@ $6F73 label=init_exploding_fragments_ptr
c $6F73
c $6F7A
@ $6F80 isub=LD A,OTHER_MODE_00
@ $6F80 label=next_row
c $6F80 This routine gets called when the screen scrolls by another fragment
@ $6F88 isub=LD DE,SIZE_LEVEL_SLOTS
@ $6F91 label=locate_level
  $6F91,4 Have #REGhl point to the level defined by #REGa
@ $6FAB isub=BIT SLOT_BIT_ROCK,D
@ $6FB1 isub=AND SLOT_MASK_OBJECT_TYPE
@ $6FB3 isub=CP OBJECT_FUEL
@ $6FBB label=render_rock
c $6FBB Render rock
R $6FBB I:D Some info (probably, sprite array index)
R $6FBB I:E Some info (probably, position)
@ $6FBC isub=AND SLOT_MASK_OBJECT_TYPE
@ $6FC2 isub=LD BC,SPRITE_ROCK_FRAME_SIZE
@ $6FC8 label=locate_rock_element
@ $6FDD isub=LD A,SPRITE_ROCK_WIDTH_TILES
@ $6FDF isub=LD DE,SPRITE_ROCK_HEIGHT_PIXELS<<8|SPRITE_ROCK_ATTRIBUTES
@ $6FE6 label=ld_enemy_sprites_right
c $6FE6 Load array of arrays of enemy headed right sprites.
R $6FE6 O:HL Pointer to the array of arrays of sprites.
c $6FEA
@ $6FF6 label=render_enemy
@ $6FF6 isub=CP OBJECT_BALLOON
c $6FF6 Render enemy
R $6FF6 I:A Object type
R $6FF6 I:D Object definition
R $6FF6 I:E Object X-position
@ $6FFB isub=CP OBJECT_FIGHTER
@ $7000 isub=CP OBJECT_TANK
@ $7016 isub=LD BC,SPRITE_3BY1_ENEMY_FRAME_SIZE
@ $7019 isub=LD E,SPRITE_3BY1_ENEMY_ATTRIBUTES
@ $701C isub=AND SLOT_MASK_OBJECT_TYPE
@ $701E isub=CP OBJECT_SHIP
@ $7023 isub=CP OBJECT_FIGHTER
@ $7028 isub=CP OBJECT_TANK
@ $702D isub=LD A,SPRITE_3BY1_ENEMY_WIDTH_TILES
@ $702F isub=LD D,SPRITE_3BY1_ENEMY_HEIGHT_PIXELS
@ $7038 isub=LD E,SPRITE_SHIP_ATTRIBUTES
@ $7038 label=ld_attributes_ship
c $7038 Load ship screen attributes.
R $7038 O:E Attributes
@ $703B isub=LD E,SPRITE_FIGHTER_ATTRIBUTES
@ $703B label=ld_attributes_fighter
c $703B Load fighter screen attributes.
R $703B O:E Attributes
@ $703E isub=LD E,SPRITE_TANK_ATTRIBUTES
@ $703E label=ld_attributes_tank
c $703E Load tank screen attributes.
R $703E O:E Attributes
@ $7040 isub=BIT SLOT_BIT_TANK_ON_BANK,D
@ $7043 isub=LD E,SPRITE_TANK_ON_BANK_ATTRIBUTES
@ $7046 label=blending_mode_xor_nop
c $7046
@ $7048 nowarn
  $7048,3 Put "XOR B" into #R$8C3C
@ $704D nowarn
  $704D,3 Put "NOP" into #R$8C1B
@ $7051 label=render_fuel
c $7051 Render fuel station
R $7051 I:E X position
@ $7060 isub=LD BC,SPRITE_FUEL_STATION_FRAME_SIZE
@ $7063 isub=LD A,SPRITE_FUEL_STATION_WIDTH_TILES
@ $7065 isub=LD DE,SPRITE_FUEL_STATION_HEIGHT_PIXELS<<8|SPRITE_FUEL_STATION_ATTRIBUTES
@ $706C label=render_balloon
c $706C Render balloon
R $706C I:E X position
@ $7072 isub=LD A,OTHER_MODE_00
@ $7082 isub=LD BC,SPRITE_BALLOON_FRAME_SIZE
@ $7085 isub=LD A,SPRITE_BALLOON_WIDTH_TILES
@ $7087 isub=LD DE,SPRITE_BALLOON_HEIGHT_PIXELS<<8|SPRITE_BALLOON_ATTRIBUTES
@ $708E label=operate_viewport_objects
@ $708E isub=LD A,OTHER_MODE_00
c $708E
@ $70A0 isub=CP SET_MARKER_EMPTY_SLOT
@ $70A5 isub=CP SET_MARKER_END_OF_SET
@ $70B1 isub=AND VIEWPORT_HEIGHT
@ $70B3 isub=CP VIEWPORT_HEIGHT
@ $70B9 isub=AND SLOT_MASK_OBJECT_TYPE
@ $70BB isub=CP OBJECT_HELICOPTER_ADV
@ $70C9 isub=CP INTERACTION_MODE_01
@ $70E9 isub=AND SLOT_MASK_OBJECT_TYPE
@ $70EB isub=CP OBJECT_FIGHTER
@ $70F0 isub=CP OBJECT_BALLOON
@ $70F5 isub=CP OBJECT_FUEL
@ $70FA isub=CP OBJECT_TANK
@ $7104 label=operate_ship_or_helicopter
c $7104 Ship or helicopter operation routine.
N $7104 Animates the helicopter rotor on each other metronome tick. Advances the object by 2 pixels on each metrinome tick until it approaches the bank closer than 16 pixels, then inverts the object orientation.
@ $7107 isub=AND HELICOPTER_ANIMATION_METRONOME_MASK
@ $7109 isub=CP HELICOPTER_ANIMATION_METRONOME_VALUE
@ $710E isub=BIT SLOT_BIT_ORIENTATION,D
@ $7113 label=ship_or_helicopter_left_advance
c $7113
@ $7128 label=operate_ship_or_helicopter_continue
@ $713E isub=LD BC,SPRITE_3BY1_ENEMY_FRAME_SIZE
@ $7141 isub=LD E,SPRITE_3BY1_ENEMY_ATTRIBUTES
@ $7144 isub=AND SLOT_MASK_OBJECT_TYPE
@ $7146 isub=CP OBJECT_SHIP
@ $714B isub=LD A,SPRITE_3BY1_ENEMY_WIDTH_TILES
@ $714D isub=LD D,SPRITE_3BY1_ENEMY_HEIGHT_PIXELS
@ $7155 isub=LD C,FIGHTER_POSITION_LEFT_INIT
@ $7155 label=fighter_left_reset
c $7155
@ $7158 label=operate_fighter
c $7158 Fighter operation routine.
N $7158 Advances the fighter by 4 pixels on each metronome tick and renders it using the XOR blending mode. When a fighter reaches the screen margin, resets its position.
@ $715C isub=BIT SLOT_BIT_ORIENTATION,D
@ $7161 label=fighter_left_advance
@ $7166 isub=CP FIGHTER_POSITION_LEFT_LIMIT
@ $716B label=operate_fighter_continue
@ $717B isub=LD BC,SPRITE_3BY1_ENEMY_FRAME_SIZE
@ $7181 isub=LD A,OTHER_MODE_XOR
@ $7186 isub=LD DE,SPRITE_3BY1_ENEMY_HEIGHT_PIXELS<<8|SPRITE_FIGHTER_ATTRIBUTES
@ $7192 label=fighter_right_advance
c $7192
@ $7197 isub=CP FIGHTER_POSITION_RIGHT_LIMIT
@ $719F isub=LD C,FIGHTER_POSITION_RIGHT_INIT
@ $719F label=fighter_right_reset
c $719F
c $71A2
@ $71A5 isub=AND METRONOME_INTERVAL_1
@ $71A7 isub=CP METRONOME_INTERVAL_1
@ $71FE isub=ADD A,SPRITE_SHELL_EXPLOSION_ATTRIBUTES
@ $7201 isub=LD BC,SPRITE_SHELL_EXPLOSION_FRAME_SIZE_BYTES
@ $7204 isub=LD D,SPRITE_SHELL_EXPLOSION_HEIGHT_PIXELS
@ $7206 isub=LD A,SPRITE_SHELL_EXPLOSION_WIDTH_TILES
@ $720E label=finish_tank_shell_explosion
c $720E
@ $721C isub=RES TANK_SHELL_BIT_EXPLODING,A
c $7224
@ $7225 isub=CP OBJECT_BALLOON
@ $722D isub=AND BALLOON_ANIMATION_METRONOME_MASK
@ $722F isub=CP BALLOON_ANIMATION_METRONOME_VALUE
@ $7235 isub=AND SLOT_MASK_OBJECT_TYPE
@ $7237 isub=CP OBJECT_HELICOPTER_REG
@ $723C isub=CP OBJECT_HELICOPTER_ADV
@ $7248 label=ld_sprite_helicopter_rotor_right
c $7248
R $7248 O:HL Pointer to the sprite
@ $724C label=animate_object
c $724C
@ $724D isub=AND SLOT_MASK_OBJECT_TYPE
@ $724F isub=CP OBJECT_HELICOPTER_REG
@ $7254 isub=CP OBJECT_HELICOPTER_ADV
@ $7259 label=animate_helicopter
c $7259
@ $7265 isub=BIT SLOT_BIT_ORIENTATION,D
@ $727D isub=LD DE,SPRITE_ROTOR_HEIGHT_PIXELS<<8|SPRITE_ROTOR_ATTRIBUTES
@ $7280 isub=LD BC,SPRITE_ROTOR_FRAME_SIZE
@ $7283 isub=LD A,SPRITE_ROTOR_WIDTH_TILES
c $728B
@ $7290 isub=LD A,TODO_L5EF2_01
@ $7290 label=ld_L5EF2_1
c $7290
@ $7296 label=operate_tank
c $7296
R $7296 I:D OBJECT_DEFINITION
@ $7299 isub=AND METRONOME_INTERVAL_1
@ $729B isub=CP METRONOME_INTERVAL_1
@ $72A6 isub=BIT SLOT_BIT_TANK_ON_BANK,D
@ $72D2 isub=LD BC,SPRITE_3BY1_ENEMY_FRAME_SIZE
@ $72D8 isub=LD A,SPRITE_3BY1_ENEMY_WIDTH_TILES
@ $72DA isub=LD DE,SPRITE_3BY1_ENEMY_HEIGHT_PIXELS<<8|SPRITE_TANK_ATTRIBUTES
@ $72E6 label=blenging_mode_xor_xor
c $72E6
@ $72E8 nowarn
  $72E8,3 Put "XOR B" into #R$8C1B
@ $72EB nowarn
  $72EB,3 Put "XOR B" into #R$8C3C
@ $72EF label=blenging_mode_or_or
c $72EF
@ $72F1 nowarn
  $72F1,3 Put "OR B" into #R$8C1B
@ $72F4 nowarn
  $72F4,3 Put "OR B" into #R$8C3C
@ $72F8 label=invert_tank_offset_delta
c $72F8 Decreases the value of XYZ stored in #REGc by $20. Called if the tank is oriented left in order to compensate for the previous operation of adding $10.
R $72F8 I:C Previous value of XYZ.
R $72F8 O:C New value of XYZ.
c $72FD
@ $7302 label=operate_tank_on_bank
c $7302
R $7302 I:D OBJECT_DEFINITION
@ $730A isub=BIT SLOT_BIT_ORIENTATION,D
@ $731D isub=BIT TANK_SHELL_BIT_FLYING,A
@ $7322 isub=BIT TANK_SHELL_BIT_EXPLODING,A
@ $7327 isub=CP TANK_SHELL_STATE_UNITIALIZED
@ $732C isub=RES TANK_SHELL_BIT_EXPLODING,A
@ $732E isub=SET TANK_SHELL_BIT_FLYING,A
@ $7337 isub=BIT SLOT_BIT_ORIENTATION,D
@ $7343 label=init_tank_shell_state
c $7343 Initialize tank shell state.
R $7343 I:D OBJECT_DEFINITION
R $7343 O:A Shell state with the speed and orientation bits initialized.
  $7348,4 Copy the orientation bit from the object definition to the shell state.
@ $7349 isub=AND 1<<SLOT_BIT_ORIENTATION
  $734C,5 Derive the speed from the interrupt counter (sort of a PRNG).
  $7353,1 Make sure the speed is never zero.
c $7358
c $735E
@ $7361 isub=CP TODO_L5EF2_01
c $7380
@ $7383 label=tank_shell_state
g $7383
@ $7384 label=tank_shell_trajectory_step
g $7384
@ $7385 label=tank_shell_coordinates
g $7385
W $7385
@ $7387 label=invert_shell_coordinate_delta
c $7387
@ $738E label=invert_helicopter_missle_offset
c $738E Invert the previously calculated helicopter missile offset for right-oriented objects.
@ $738F isub=ADD A,HELICOPTER_MISSILE_STEP*2
@ $7393 label=operate_helicopter_missile
c $7393 Operates helicopter missile.
@ $73A3 isub=SUB HELICOPTER_MISSILE_STEP
@ $73A7 isub=AND VIEWPORT_HEIGHT
@ $73A9 isub=CP VIEWPORT_HEIGHT
@ $73B1 isub=BIT SLOT_BIT_ORIENTATION,A
@ $73BE isub=LD A,OTHER_MODE_HELICOPTER_ADV
@ $73C3 isub=LD A,SPRITE_HELICOPTER_MISSILE_WIDTH_TILES
@ $73C5 isub=LD E,SPRITE_HELICOPTER_MISSILE_ATTRIBUTES
@ $73D0 label=remove_helicopter_missile
c $73D0 Removes helicopter missile.
c $73D8
@ $73DD label=render_helicopter_missile
c $73DD
@ $73E0 isub=CP INTERACTION_MODE_01
@ $7415 label=handle_other_mode_helicopter_missile
c $7415
@ $7441 label=operate_tank_shell
c $7441
@ $7444 isub=BIT TANK_SHELL_BIT_FLYING,A
@ $7452 isub=CP TANK_SHELL_TRAJECTORY_MAX_STEP
@ $746F isub=AND TANK_SHELL_MASK_SPEED
@ $7476 isub=BIT SLOT_BIT_ORIENTATION,D
@ $7484 isub=LD A,OTHER_MODE_00
@ $748A isub=AND VIEWPORT_HEIGHT
@ $748C isub=CP VIEWPORT_HEIGHT
@ $7494 isub=LD DE,SPRITE_SHELL_HEIGHT_PIXELS<<8|SPRITE_SHELL_ATTRIBUTES
@ $7497 isub=LD A,SPRITE_SHELL_WIDTH_TILES
@ $7499 isub=LD BC,SPRITE_SHELL_FRAME_SIZE_BYTES
c $74A0
@ $74C6 label=render_tank_shell_explosion
c $74C6
@ $74D1 isub=RES TANK_SHELL_BIT_FLYING,A
@ $74D3 isub=SET TANK_SHELL_BIT_EXPLODING,A
@ $74E4 label=remove_tank_shell
c $74E4
c $74EE
@ $7520 isub=LD A,POINTS_TANK
  $7529,2 Set CONTROLS_BIT_BONUS_LIFE
@ $752B isub=SET CONTROLS_BIT_EXPLODING,(HL)
c $7546
@ $754C label=operate_fuel
c $754C
@ $7565 isub=AND VIEWPORT_HEIGHT
@ $7567 isub=CP VIEWPORT_HEIGHT
@ $7577 isub=LD BC,SPRITE_FUEL_STATION_FRAME_SIZE
@ $757D isub=AND METRONOME_INTERVAL_ANIMATE_FUEL
@ $757F isub=ADD A,SPRITE_FUEL_STATION_ATTRIBUTES
@ $7582 isub=LD A,SPRITE_FUEL_STATION_WIDTH_TILES
c $758A
@ $75A2 label=ship_or_helicopter_right_advance
c $75A2
@ $75BA label=ld_enemy_sprites
c $75BA Load array of enemy sprites.
R $75BA I:D OBJECT_DEFINITION
R $75BA I:HL Pointer to the array of sprites
  $75BD,3 Enemy sprite array size (3×1 tiles × 8 bytes/tile × 4 frames)
@ $75C0 isub=BIT SLOT_BIT_ORIENTATION,D
@ $75CB label=ld_enemy_sprites_loop
@ $75D0 label=handle_object_proximity
c $75D0 Handles the situation when a ship or a helicopter is in close proximity to another object.
D $75D0 If it approaches a river bank or a fuel station, it will invert its orientation. But if it's the the player, it won't.
R $75D0 I:BC Object coordinates
  $75D4,4 Return if the object is located in the top half of the screen. Otherwise, the other object may be the player and should be ignored.
@ $75EC isub=LD BC,SPRITE_3BY1_ENEMY_FRAME_SIZE
  $7604,4 Invert object orientation
@ $7605 isub=XOR 1<<SLOT_BIT_ORIENTATION
@ $7613 isub=AND SLOT_MASK_OBJECT_TYPE
@ $7615 isub=CP OBJECT_SHIP
@ $761A isub=LD D,SPRITE_3BY1_ENEMY_HEIGHT_PIXELS
@ $761C isub=LD A,SPRITE_3BY1_ENEMY_WIDTH_TILES
@ $761E isub=LD BC,SPRITE_3BY1_ENEMY_FRAME_SIZE
@ $7627 label=init_viewport_ptr
c $7627 Point #R$5F60 to the head of #R$5F00.
@ $762E label=remove_object_from_viewport
c $762E
@ $762F isub=LD (HL),SET_MARKER_EMPTY_SLOT
@ $7632 isub=AND SLOT_MASK_OBJECT_TYPE
@ $7634 isub=CP OBJECT_TANK
@ $7639 isub=LD A,TODO_L5EF2_00
@ $763E isub=BIT SLOT_BIT_TANK_ON_BANK,D
@ $7649 label=operate_baloon
c $7649
@ $769D isub=LD A,SPRITE_BALLOON_WIDTH_TILES
@ $769F isub=LD BC,SPRITE_BALLOON_FRAME_SIZE
@ $76A2 isub=LD E,SPRITE_BALLOON_ATTRIBUTES
@ $76A4 isub=LD D,SPRITE_BALLOON_HEIGHT_PIXELS
@ $76AC label=jp_operate_viewport_objects
c $76AC A useless procedure that unconcditionally jumps to #R$708E.
c $76AF
c $76DA
u $7727
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
c $7B57
u $7B61
@ $8000 label=status_line_1
t $8000
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
t $8031
T $8031 AT 1,2
T $8034 INK 6
T $8036
T $8040 INK 7
T $8042 AT 1,18
T $8045
@ $804F label=status_line_3
t $804F
T $804F AT 19,18
@ $8052 label=status_line_3_text
t $8052
T $8052
@ $805A label=status_line_4
t $805A
T $805A AT 20,4
T $805D INK 7
u $805F
@ $8063 label=data_terrain_profiles
b $8063 Array [15] of terrain element definitions (16 bytes each).
N $8063 Each byte of the element defines the relative terrain width
  $8063,16 Terrain 1
  $8073,16 Terrain 2 (special, pre-bridge)
  $8083,16 Terrain 3 (special, bridge)
  $8093,16 Terrain 4 (special, post-bridge)
  $80A3,16 Terrain 5
  $80B3,16 Terrain 6
  $80C3,16 Terrain 7
  $80D3,16 Terrain 8
  $80E3,16 Terrain 9
  $80F3,16 Terrain 10
  $8103,16 Terrain 11
  $8113,16 Terrain 12 (river narrows)
  $8123,16 Terrain 13 (river widens)
  $8133,16 Terrain 14
  $8143,16 Terrain 15
@ $8153 label=msg_game_over
t $8153 Game Over message.
@ $8182 label=msg_credits
t $8182
  $818D,1 Trademark UDG symbol
  $81A8,1 Copyright symbol
  $81AF,7 Activision logo UDG symbols
B $81E4
T $81E8
B $825C
@ $825D label=udg_data
b $825D
D $825D #UDGTABLE { #FONT$825D,13 } TABLE#
@ $82C5 label=all_ff
b $82C5
@ $82F5 label=sprite_erasure
b $82F5
@ $8331 label=sprite_terrain_pre_post_bridge
b $8331
@ $8351 label=sprite_road_and_bridge_pixels
b $8351
@ $8371 label=sprite_road_attributes
b $8371
u $8391
@ $83B1 label=sprite_plane
b $83B1
N $83B1 #UDGTABLE { #UDGARRAY2,14,4,2;$83B1-$83B2-1-16(*plane-f1) | #UDGARRAY2,14,4,2;$83C1-$83C2-1-16(*plane-f2) | #UDGARRAY2,14,4,2;$83D1-$83D2-1-16(*plane-f3) | #UDGARRAY2,14,4,2;$83E1-$83E2-1-16(*plane-f4) } TABLE#
N $83B1 #UDGTABLE { #UDGARRAY2,14,4,2;$83B1-$83B2-1-16(*plane-f1) | #UDGARRAY2,14,4,2;$83C1-$83C2-1-16(*plane-f2) | #UDGARRAY2,14,4,2;$83D1-$83D2-1-16(*plane-f3) | #UDGARRAY2,14,4,2;$83E1-$83E2-1-16(*plane-f4) } TABLE#
  $83B1,16,2 Frame 1
@ $83BB ofix=DEFB $92,$00
  $83C1,16,2 Frame 2
@ $83CB ofix=DEFB $24,$80
  $83D1,16,2 Frame 3
  $83E1,16,2 Frame 4
@ $83F1 label=sprite_plane_banked
b $83F1
N $83F1 #UDGTABLE { #UDGARRAY2,14,4,2;$83F1-$83F2-1-16(*plane-banked-f1) | #UDGARRAY2,14,4,2;$8401-$8402-1-16(*plane-banked-f2) | #UDGARRAY2,14,4,2;$8411-$8412-1-16(*plane-banked-f3) | #UDGARRAY2,14,4,2;$8421-$8422-1-16(*plane-banked-f4) | #UDGARRAY*plane-f1,50;plane-banked-f1;plane-banked-f2;plane-banked-f3;plane-banked-f4;plane-f4;plane-banked-f4;plane-banked-f3;plane-banked-f2;plane-banked-f1(plane) } TABLE#
  $83F1,16,2 Frame 1
  $8401,16,2 Frame 2
  $8411,16,2 Frame 3
  $8421,16,2 Frame 4
@ $8431 label=sprite_missile
b $8431
  $8431,8,1 Frame 1
  $8439,8,1 Frame 2
  $8441,8,1 Frame 3
  $8449,8,1 Frame 4
@ $8451 label=L8451
b $8451
@ $8471 label=sprite_explosion_f1
b $8471
N $8471 #UDGTABLE { #UDGARRAY2,14,4,2;$8471-$8472-1-16(*explosion-f1) } TABLE#
  $8471,16,2
@ $8481 label=sprite_explosion_f2
b $8481
N $8481 #UDGTABLE { #UDGARRAY2,14,4,2;$8481-$8482-1-16(*explosion-f2) } TABLE#
  $8481,16,2
@ $8491 label=sprite_explosion_f3
b $8491
N $8491 #UDGTABLE { #UDGARRAY2,14,4,2;$8491-$8492-1-16(*explosion-f3) | #UDGARRAY*explosion-f1,50;explosion-f2;explosion-f3;explosion-f2(explosion) } TABLE#
  $8491,16,2
@ $84A1 label=sprite_rock
b $84A1 Array [4] of rock sprites (3×2 tiles, 48 bytes).
N $84A1 #UDGTABLE { #UDGARRAY3,34,4,3;$84A1-$84D0-1-24(rock-1) } TABLE#
  $84A1,48,3 Rock 1
N $84D1 #UDGTABLE { #UDGARRAY3,34,4,3;$84D1-$8500-1-24(rock-2) } TABLE#
  $84D1,48,3 Rock 2
N $8501 #UDGTABLE { #UDGARRAY3,34,4,3;$8501-$8530-1-24(rock-3) } TABLE#
  $8501,48,3 Rock 3
N $8531 #UDGTABLE { #UDGARRAY3,34,4,3;$8531-$8560-1-24(rock-4) } TABLE#
  $8531,48,3 Rock 4
t $8561
B $8563
B $8565
T $8568
B $8579
T $857C
B $858C
T $858F
B $8599
T $859C
B $85A6
T $85A9
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
@ $8736 ofix=DEFB $00,$40,$00
@ $8739 ofix=DEFB $70,$C0,$00
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
@ $8916 ofix=DEFB $80,$00,$00
@ $8919 ofix=DEFB $C3,$80,$00
@ $891F ofix=DEFB $4F,$C0,$00
  $892B,24,3 Frame 2
@ $893A ofix=DEFB $0F,$00,$00
  $8943,24,3 Frame 3
  $895B,21,3 Frame 4
@ $8972 label=sprite_balloon
b $8972 Array [4] of balloon sprites (2×2 tiles, 32 bytes).
N $8972 #UDGTABLE { #UDGARRAY2,14,4,2;$8972-$898A-1-16(*balloon-f1) | #UDGARRAY2,14,4,2;$8992-$89AA-1-16(*balloon-f2) | #UDGARRAY2,14,4,2;$89B2-$89CA-1-16(*balloon-f3) | #UDGARRAY2,14,4,2;$89D2-$89EA-1-16(*balloon-f4) | #UDGARRAY*balloon-f1,50;balloon-f2;balloon-f3;balloon-f4;balloon-f3;balloon-f2(balloon) } TABLE#
  $8972,32,2 Frame 1
  $8992,32,2 Frame 2
  $89B2,32,2 Frame 3
  $89D2,32,2 Frame 4
@ $89F2 label=terrain_edge_left
b $89F2
  $89F2,2,2 10 pixels
  $89F4,2,2 12 pixels
  $89F6,2,2 14 pixels
  $89F8,2,2 16 pixels
@ $89FA label=terrain_edge_right
b $89FA
  $89FA,2,2 16 pixels
  $89FC,2,2 14 pixels
  $89FE,2,2 12 pixels
  $8A00,2,2 10 pixels
@ $8A02 label=do_fire
c $8A02 Invoked from the interrupt handler when FIRE is pressed
c $8A1B
@ $8A33 label=init_udg
c $8A33
R $8A33 Sets BORDER to BLACK, sets screen attributes to WHITE-on-BLACK and copies #R$825D to the UDG area.
@ $8A39 nowarn
@ $8A3C label=init_udg_loop
@ $8A4E label=calculate_pixel_address
c $8A4E
R $8A4E I:B Vertical coordinate of the object in pixels.
R $8A4E I:C Horizontal coordinate of the object in pixels.
R $8A4E O:B Horizontal coordinate of the object in pixels relative to its tile.
R $8A4E O:HL Screen address corresponding to the coordinates.
C $8A54,6 Load the number of the third of the screen corresponding to the vertical coordinate of the object into #REGa.
C $8A5A,5 Load the starting address of the third of the screen into #REGhl.
C $8A5F,4 Leave only the 6 lowest bits in #REGb which define the coordinate of the object relative to its third of the screen.
C $8A63,2 Unset the 3 lowest bits, so now #REGa contains the coordinate of starting tile relative to its third of the screen.
C $8A66,6 Multiply the value of #REGa by 4 and put into #REGde which makes the offset of the starting tile address from its third of the screen.
C $8A6C,2 Now #REGhl contains the screen address of the tile.
C $8A6E,4 Leave only the 3 lowest bits in #REGb which define the coordinate of the object relative to it tile.
@ $8A86 label=sprite_fuel
b $8A86 Fuel sprite
N $8A86 #UDGTABLE { #UDGARRAY2,11,4,2;$8A86-$8AB8-1-16{0,0,64,100}(sprite-fuel) } TABLE#
@ $8AB8 label=sprite_helicopter_rotor_left
b $8AB8
@ $8AC8 label=sprite_helicopter_rotor_right
b $8AC8
u $8AD8
@ $8B08 label=L6136_ptr
g $8B08 Pointer to #R$6136
W $8B08
@ $8B0A label=previous_object_coordinates
g $8B0A
W $8B0A
@ $8B0C label=object_coordinates
g $8B0C Highest byte is the vertical coordinate, lowest byte is the horizontal.
W $8B0C
@ $8B0E label=render_sprite_ptr
g $8B0E
W $8B0E
@ $8B10 label=L8B10
g $8B10
W $8B10
@ $8B12 label=L8B12
g $8B12
W $8B12
@ $8B14 label=L8B14
g $8B14
W $8B14
@ $8B16 label=L8B16
g $8B16
W $8B16
u $8B18
@ $8B1A label=render_object_width
g $8B1A
s $8B1B
@ $8B1E label=render_sprite
c $8B1E
R $8B1E I:A  Sprite width in tiles
R $8B1E I:BC Sprite frame size
R $8B1E I:D  Frame number
R $8B1E I:E  Screen attributes
R $8B1E I:HL Pointer to the sprite array
@ $8B3C label=render_object
c $8B3C
R $8B3C I:A  Sprite width in tiles
R $8B3C I:BC Sprite size in bytes
R $8B3C I:D  Frame number and some other info
R $8B3C I:E  Screen attributes
R $8B3C I:HL Pointer to the sprite array
c $8B70
c $8B94
c $8BA3
c $8BC6
c $8C0B
@ $8C1B label=L8C1B
c $8C1B
@ $8C3B label=handle_other_mode_00
@ $8C3C label=L8C3C
c $8C3C
@ $8C45 label=jp_L6136
c $8C45
u $8C4A
@ $8FFC label=sprite_tank_shell_explosion
b $8FFC
  $8FFC,32,2 Frame 1
  $901C,32,2 Frame 2
  $903C,32,2 Frame 3
  $905C,32,2 Frame 4
  $907C,32,2 Frame 5
  $909C,32,2 Frame 6
@ $90BC label=state_score_player_1
t $90BC
t $90BE
t $90C0
@ $90C2 label=state_score_player_2
t $90C2
t $90C4
t $90C6
t $90C8
t $90CE
@ $90E0 label=add_points
c $90E0 Add score points for a hit target
R $90E0 I:A Number of points to add divided by 10.
@ $9109 label=add_life
c $9109 Add a life to the current player
  $9119,2 Set CONTROLS_BIT_BONUS_LIFE
  $9119,2 Set CONTROLS_BIT_BONUS_LIFE
@ $9122 label=update_score
c $9122
R $9122 I:A (can be 1, 2 or 4)
@ $9136 isub=CP PLAYER_2
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
@ $91F9 isub=BIT GAME_MODE_BIT_TWO_PLAYERS,A
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
@ $9241 isub=CP PLAYER_2
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
g $9283 Pointer to #R$6BB0
W $9283 Pointer to #R$6BB0
g $9285
W $9285
g $9287
W $9287
g $9289
W $9289
g $928B
W $928B
c $928D
R $928D I:A Sprite width in tiles
R $928D I:E Screen attributes
@ $92F1 nowarn
@ $934F nowarn
@ $935D label=handle_zero_attributes
c $9367
c $936B
c $936F
c $9388
c $93A1
c $93B8
c $93BB
c $93BE
@ $93C1 isub=BIT GAME_MODE_BIT_TWO_PLAYERS,A
@ $93EC isub=LD BC,state_score_player_2 - state_score_player_1
c $93F2
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
@ $9423 label=ld_lives
c $9423 Load current player lives
R $9423 O:HL Pointer to the current player lives
@ $9429 isub=CP PLAYER_2
u $9430
@ $9500 label=level_terrains
b $9500 Array [48] of level terrain data (256 bytes each).
N $9500 Array [64] of terrain rows (4 bytes each):
N $9500 Byte 1 is the terrain type (see #R$8063).
  $9500,256,4 Bridge 1
  $9600,256,4 Bridge 2
  $9700,256,4 Bridge 3
  $9800,256,4 Bridge 4
  $9900,256,4 Bridge 5
  $9A00,256,4 Bridge 6
  $9B00,256,4 Bridge 7
  $9C00,256,4 Bridge 8
  $9D00,256,4 Bridge 9
  $9E00,256,4 Bridge 10
  $9F00,256,4 Bridge 11
  $A000,256,4 Bridge 12
  $A100,256,4 Bridge 13
  $A200,256,4 Bridge 14
  $A300,256,4 Bridge 15
  $A400,256,4 Bridge 16
  $A500,256,4 Bridge 17
  $A600,256,4 Bridge 18
  $A700,256,4 Bridge 19
  $A800,256,4 Bridge 20
  $A900,256,4 Bridge 21
  $AA00,256,4 Bridge 22
  $AB00,256,4 Bridge 23
  $AC00,256,4 Bridge 24
  $AD00,256,4 Bridge 25
  $AE00,256,4 Bridge 26
  $AF00,256,4 Bridge 27
  $B000,256,4 Bridge 28
  $B100,256,4 Bridge 29
  $B200,256,4 Bridge 30
  $B300,256,4 Bridge 31
  $B400,256,4 Bridge 32
  $B500,256,4 Bridge 33
  $B600,256,4 Bridge 34
  $B700,256,4 Bridge 35
  $B800,256,4 Bridge 36
  $B900,256,4 Bridge 37
  $BA00,256,4 Bridge 38
  $BB00,256,4 Bridge 39
  $BC00,256,4 Bridge 40
  $BD00,256,4 Bridge 41
  $BE00,256,4 Bridge 42
  $BF00,256,4 Bridge 43
  $C000,256,4 Bridge 44
  $C100,256,4 Bridge 45
  $C200,256,4 Bridge 46
  $C300,256,4 Bridge 47
  $C400,256,4 Bridge 48
@ $C600 label=data_islands
b $C600 Array [?] island data (3 bytes each).
  $C600,108,3
@ $C800 label=level_objects
b $C800 Byte 1: lowest 3 bits - object type (OBJECT_*), bit 3 - rock (then the 2 lowest bits are the rock number); Byte 2 - position.
  $C800,256,2 Level 1
  $C900,256,2 Level 2
  $CA00,256,2 Level 3
  $CB00,256,2 Level 4
  $CC00,256,2 Level 5
  $CD00,256,2 Level 6
  $CE00,256,2 Level 7
  $CF00,256,2 Level 8
  $D000,256,2 Level 9
  $D100,256,2 Level 10
  $D200,256,2 Level 11
  $D300,256,2 Level 12
  $D400,256,2 Level 13
  $D500,256,2 Level 14
  $D600,256,2 Level 15
  $D700,256,2 Level 16
  $D800,256,2 Level 17
  $D900,256,2 Level 18
  $DA00,256,2 Level 19
  $DB00,256,2 Level 20
  $DC00,256,2 Level 21
  $DD00,256,2 Level 22
  $DE00,256,2 Level 23
  $DF00,256,2 Level 24
  $E000,256,2 Level 25
  $E100,256,2 Level 26
  $E200,256,2 Level 27
  $E300,256,2 Level 28
  $E400,256,2 Level 29
  $E500,256,2 Level 30
  $E600,256,2 Level 31
  $E700,256,2 Level 32
  $E800,256,2 Level 33
  $E900,256,2 Level 34
  $EA00,256,2 Level 35
  $EB00,256,2 Level 36
  $EC00,256,2 Level 37
  $ED00,256,2 Level 38
  $EE00,256,2 Level 39
  $EF00,256,2 Level 40
  $F000,256,2 Level 41
  $F100,256,2 Level 42
  $F200,256,2 Level 43
  $F300,256,2 Level 44
  $F400,256,2 Level 45
  $F500,256,2 Level 46
  $F600,256,2 Level 47
  $F700,256,2 Level 48
i $F800
