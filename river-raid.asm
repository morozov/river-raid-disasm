; CONSTANTS
;
; These are here for information only and are not used by any of the assembly
; directives.
;
; CONTROLS_BIT_FIRE            = 0
; CONTROLS_BIT_SPEED_DECREASED = 1
; CONTROLS_BIT_SPEED_ALTERED   = 2
; CONTROLS_BIT_LOW_FUEL        = 3
; CONTROLS_BIT_BONUS_LIFE      = 4
; CONTROLS_BIT_EXPLODING       = 5
;
; POINTS_SHIP           = 3
; POINTS_REG_HELICOPTER = 6
; POINTS_BALLOON       = 6
; POINTS_FUEL           = 8
; POINTS_FIGHTER        = 10
; POINTS_ADV_HELICOPTER = 15
; POINTS_TANK           = 25
; POINTS_BRIDGE         = 50
;
; OBJECT_HELICOPTER_REG = 1
; OBJECT_SHIP           = 2
; OBJECT_HELICOPTER_ADV = 3
; OBJECT_TANK           = 4
; OBJECT_FIGHTER        = 5
; OBJECT_BALLOON        = 6
; OBJECT_FUEL           = 7

KEYBOARD EQU $02BF
BEEPER EQU $03B5
CHAN_OPEN EQU $1601
OUT_NUM_1 EQU $1A1B
PR_STRING EQU $203C
LAST_K EQU $5C08
UDG EQU $5C7B

  ORG $4000

; Screen pixels.
screen_pixels:
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $AA,$AA,$AA,$AA,$AA,$AA,$A8,$1F
  DEFB $FF,$FF,$00,$00,$00,$00,$00,$0F
  DEFB $FF,$80,$00,$00,$00,$00,$00,$00
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $00,$00,$00,$00,$00,$00,$00,$03
  DEFB $FF,$C0,$00,$07,$01,$F0,$3E,$01
  DEFB $FC,$03,$E0,$78,$00,$00,$78,$1F
  DEFB $E0,$00,$0F,$F0,$0F,$F8,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$03,$E0
  DEFB $7C,$1F,$FF,$FF,$01,$F0,$3F,$E0
  DEFB $20,$3F,$E0,$70,$00,$0F,$F8,$1E
  DEFB $07,$FF,$C0,$70,$00,$78,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FC,$00,$00
  DEFB $1E,$07,$FF,$FF,$01,$F0,$3F,$FE
  DEFB $03,$FF,$E0,$7F,$FF,$F0,$38,$1F
  DEFB $03,$FF,$80,$F0,$3F,$00,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$BD
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $55,$55,$55,$55,$55,$55,$54,$0F
  DEFB $FF,$FF,$FF,$FF,$01,$FF,$E0,$07
  DEFB $FF,$00,$3F,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $00,$00,$00,$00,$00,$00,$00,$03
  DEFB $FF,$80,$00,$0F,$01,$F0,$3E,$01
  DEFB $FC,$03,$E0,$70,$00,$00,$78,$1F
  DEFB $C0,$00,$07,$F0,$07,$F8,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$03,$E0
  DEFB $7C,$1F,$FF,$FF,$01,$F0,$3F,$E0
  DEFB $20,$3F,$E0,$70,$00,$01,$F8,$1E
  DEFB $0F,$FF,$E0,$70,$20,$38,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$F8,$00,$00
  DEFB $0F,$03,$FF,$BF,$01,$F0,$3F,$FE
  DEFB $03,$FF,$E0,$7F,$FF,$E0,$78,$1F
  DEFB $01,$FF,$00,$F0,$3F,$00,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$46
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F
  DEFB $FF,$FF,$E0,$00,$00,$00,$00,$3F
  DEFB $FF,$E0,$00,$00,$00,$00,$00,$07
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $AA,$AA,$AA,$AA,$AA,$AA,$A8,$0F
  DEFB $FF,$FF,$FF,$FF,$01,$FF,$F0,$07
  DEFB $FF,$00,$7F,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $00,$00,$00,$00,$00,$00,$00,$81
  DEFB $FF,$00,$FE,$1F,$01,$F0,$3F,$00
  DEFB $F8,$07,$E0,$70,$00,$00,$78,$1F
  DEFB $C0,$00,$03,$F0,$07,$F8,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$03,$E0
  DEFB $7C,$1F,$FF,$FF,$01,$F0,$3F,$F0
  DEFB $00,$7F,$E0,$78,$00,$00,$F8,$1E
  DEFB $0F,$FF,$E0,$70,$30,$18,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$F8,$1F,$FC
  DEFB $0F,$00,$FE,$1F,$01,$F0,$3F,$FF
  DEFB $07,$FF,$E0,$7F,$FF,$80,$78,$1F
  DEFB $80,$7C,$01,$F0,$3F,$80,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$5A
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FE,$3F
  DEFB $FF,$FF,$C0,$00,$00,$00,$00,$1F
  DEFB $FF,$C0,$00,$00,$00,$00,$00,$07
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $55,$55,$55,$55,$55,$55,$50,$0F
  DEFB $FF,$FF,$FF,$FF,$01,$FF,$F0,$07
  DEFB $FF,$00,$7F,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $00,$00,$00,$00,$00,$00,$00,$81
  DEFB $FE,$03,$FF,$BF,$01,$F0,$3F,$00
  DEFB $F8,$07,$E0,$70,$1F,$FF,$F8,$1F
  DEFB $80,$00,$01,$F0,$03,$F8,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FE,$07,$F0
  DEFB $3C,$1F,$FF,$FF,$01,$F0,$3F,$F0
  DEFB $00,$7F,$E0,$7C,$00,$00,$78,$1E
  DEFB $0F,$FF,$E0,$70,$30,$18,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$F8,$1F,$FC
  DEFB $0F,$80,$00,$0F,$01,$F0,$3F,$FF
  DEFB $07,$FF,$E0,$70,$00,$00,$78,$1F
  DEFB $80,$00,$03,$F0,$3F,$C0,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$46
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FE,$3F
  DEFB $FF,$FF,$C0,$00,$00,$00,$00,$1F
  DEFB $FF,$C0,$00,$00,$00,$00,$00,$03
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $AA,$AA,$AA,$AA,$AA,$AA,$A0,$07
  DEFB $FF,$FF,$FF,$FF,$01,$FF,$F8,$03
  DEFB $FE,$00,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $00,$00,$00,$00,$00,$00,$01,$C1
  DEFB $FE,$07,$FF,$FF,$01,$F0,$3F,$80
  DEFB $F8,$0F,$E0,$60,$3F,$FF,$F8,$1F
  DEFB $80,$7C,$01,$F0,$01,$F8,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FE,$07,$F0
  DEFB $3C,$1F,$FF,$FF,$01,$F0,$3F,$F8
  DEFB $00,$FF,$E0,$7F,$80,$00,$78,$1E
  DEFB $0F,$FF,$E0,$70,$38,$08,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$F0,$3F,$FE
  DEFB $07,$C0,$00,$07,$01,$F0,$3F,$FF
  DEFB $8F,$FF,$E0,$70,$00,$00,$F8,$1F
  DEFB $C0,$00,$07,$F0,$3F,$C0,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$5A
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FE,$3F
  DEFB $FF,$FF,$80,$00,$00,$00,$00,$1F
  DEFB $FF,$C0,$00,$00,$00,$00,$00,$03
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $55,$55,$55,$55,$55,$55,$50,$07
  DEFB $FF,$FF,$80,$FF,$01,$FF,$F8,$03
  DEFB $FE,$00,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $00,$00,$00,$00,$00,$00,$01,$C0
  DEFB $FC,$0F,$FF,$FF,$01,$F0,$3F,$80
  DEFB $70,$0F,$E0,$60,$7F,$FF,$F8,$1F
  DEFB $01,$FF,$00,$F0,$01,$F8,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FE,$00,$00
  DEFB $3C,$1F,$FF,$FF,$01,$F0,$3F,$F8
  DEFB $00,$FF,$E0,$7F,$FF,$E0,$78,$1E
  DEFB $0F,$FF,$E0,$70,$3C,$00,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$F0,$3F,$FE
  DEFB $07,$E0,$00,$1F,$01,$F0,$3F,$FF
  DEFB $8F,$FF,$E0,$70,$00,$01,$F8,$1F
  DEFB $E0,$00,$1F,$F0,$3F,$E0,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$5A
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FC,$1F
  DEFB $FF,$FF,$80,$00,$00,$00,$00,$0F
  DEFB $FF,$80,$00,$00,$00,$00,$00,$01
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $AA,$AA,$AA,$AA,$AA,$AA,$A0,$07
  DEFB $FF,$FC,$00,$3F,$01,$F0,$3C,$03
  DEFB $FE,$01,$E0,$7F,$80,$00,$78,$1F
  DEFB $FF,$00,$FF,$F0,$1F,$F8,$1F,$FF
  DEFB $00,$00,$00,$00,$00,$00,$01,$C0
  DEFB $FC,$0F,$FF,$FF,$01,$F0,$3F,$C0
  DEFB $70,$1F,$E0,$60,$3F,$FF,$F8,$1F
  DEFB $03,$FF,$80,$F0,$00,$F8,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FC,$00,$00
  DEFB $1C,$0F,$FF,$FF,$01,$F0,$3F,$FC
  DEFB $01,$FF,$E0,$7F,$FF,$F0,$38,$1E
  DEFB $07,$FF,$C0,$70,$3C,$00,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$F0,$3F,$FE
  DEFB $07,$F8,$00,$7F,$01,$F0,$3F,$FF
  DEFB $DF,$FF,$E0,$70,$00,$03,$F8,$1F
  DEFB $FC,$00,$3F,$F0,$3F,$F0,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$BD
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FC,$1F
  DEFB $FF,$FF,$00,$00,$00,$00,$00,$0F
  DEFB $FF,$80,$00,$00,$00,$00,$00,$01
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $55,$55,$55,$55,$55,$55,$40,$03
  DEFB $FF,$F0,$00,$1F,$01,$F0,$3C,$01
  DEFB $FC,$01,$E0,$7C,$00,$00,$78,$1F
  DEFB $F8,$00,$3F,$F0,$1F,$F8,$1F,$FF
  DEFB $00,$00,$00,$00,$00,$00,$01,$C0
  DEFB $FC,$1F,$FF,$FF,$01,$F0,$3F,$C0
  DEFB $70,$1F,$E0,$70,$1F,$FF,$F8,$1E
  DEFB $07,$FF,$C0,$70,$00,$78,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FC,$00,$00
  DEFB $1E,$0F,$FF,$FF,$01,$F0,$3F,$FC
  DEFB $01,$FF,$E0,$7F,$FF,$F8,$38,$1E
  DEFB $07,$FF,$C0,$70,$3E,$00,$1F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$E0,$7F,$FF
  DEFB $03,$FF,$01,$FF,$01,$F0,$3F,$FF
  DEFB $DF,$FF,$E0,$70,$00,$0F,$F8,$1F
  DEFB $FF,$00,$FF,$F0,$3F,$F0,$1F,$C3
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$C3
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $F7,$DE,$FE,$FF,$F8,$00,$3F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE
  DEFB $FF,$DD,$FF,$E7,$EF,$BF,$F7,$EF
  DEFB $C3,$E1,$F8,$3F,$83,$F8,$3F,$83
  DEFB $FF,$FC,$3E,$1F,$FC,$3E,$1F,$F0
  DEFB $07,$FC,$1F,$83,$FE,$1F,$FF,$F4
  DEFB $3F,$F7,$DF,$F7,$7F,$7F,$FB,$DF
  DEFB $C3,$E1,$F8,$3F,$F0,$41,$FF,$83
  DEFB $FF,$FC,$3E,$1F,$FC,$3E,$1F,$C1
  DEFB $C1,$FC,$1F,$83,$FC,$1F,$FF,$FF
  DEFB $C6,$9F,$FE,$3B,$ED,$FF,$FB,$DF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $3E,$3F,$3E,$7F,$FA,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $DF,$F7,$ED,$6F,$5E,$FB,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $F7,$FF,$FF,$EF,$BF,$F1,$BB,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $EF,$ED,$FF,$00,$07,$FF,$FF,$FF
  DEFB $80,$01,$F0,$1E,$03,$F8,$0F,$00
  DEFB $00,$78,$00,$1F,$F8,$00,$1F,$FE
  DEFB $3F,$F8,$0F,$00,$1F,$FF,$FF,$FD
  DEFB $FD,$DE,$FF,$F4,$F7,$7F,$FB,$EF
  DEFB $C3,$C1,$F8,$3F,$83,$F8,$3F,$83
  DEFB $FF,$FC,$3C,$1F,$FC,$3C,$1F,$F0
  DEFB $87,$FC,$1F,$83,$FE,$0F,$FF,$EB
  DEFB $C7,$FF,$DF,$F6,$FF,$7F,$FB,$DF
  DEFB $C3,$E1,$F8,$3F,$F0,$41,$FF,$83
  DEFB $FF,$FC,$3E,$1F,$FC,$3E,$1F,$83
  DEFB $E0,$FC,$1F,$83,$F8,$3F,$FF,$FF
  DEFB $C9,$E7,$FF,$BB,$DE,$FF,$FF,$DF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $C7,$CE,$F9,$FF,$E5,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $DF,$F7,$ED,$5E,$ED,$7D,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FB,$FF,$FF,$F7,$DF,$F4,$7D,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$E1
  DEFB $DF,$EB,$FF,$BF,$FF,$FF,$FF,$FF
  DEFB $80,$01,$F0,$1E,$03,$F8,$0F,$00
  DEFB $00,$78,$00,$1F,$F8,$00,$1F,$FC
  DEFB $3F,$F8,$0F,$00,$03,$FF,$FF,$FB
  DEFB $FD,$DF,$7F,$F5,$77,$7F,$FB,$EF
  DEFB $C0,$03,$F8,$3F,$C1,$F0,$7F,$80
  DEFB $0F,$FC,$00,$3F,$FC,$00,$3F,$F1
  DEFB $C7,$FC,$1F,$83,$FF,$0F,$FF,$D7
  DEFB $F8,$FF,$FF,$EE,$FF,$7F,$FB,$DF
  DEFB $C3,$E1,$F8,$3F,$F0,$41,$FF,$83
  DEFB $FC,$7C,$3E,$1F,$FC,$3E,$1F,$83
  DEFB $E0,$FC,$1F,$83,$F0,$3F,$FF,$FF
  DEFB $D6,$79,$FF,$7B,$DE,$FF,$FF,$DF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $F3,$F1,$C3,$FF,$DE,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $DF,$F7,$EA,$BD,$F3,$FE,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FD,$FF,$FF,$F9,$EF,$F3,$3E,$EF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$9D,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$DE
  DEFB $DF,$EB,$FF,$BF,$FF,$F8,$FF,$FD
  DEFB $80,$01,$F0,$1E,$03,$F8,$0F,$00
  DEFB $00,$78,$00,$1F,$F8,$00,$1F,$FC
  DEFB $1F,$F8,$0F,$00,$00,$FF,$FF,$FB
  DEFB $FD,$DF,$7F,$FD,$B7,$7F,$FB,$DF
  DEFB $C0,$01,$F8,$3F,$C1,$F0,$7F,$80
  DEFB $0F,$FC,$00,$1F,$FC,$00,$1F,$E1
  DEFB $C3,$FC,$1F,$83,$FF,$0F,$FF,$AF
  DEFB $FF,$1F,$FF,$EE,$FF,$FF,$FB,$DF
  DEFB $C3,$E1,$F8,$3F,$F8,$03,$FF,$80
  DEFB $00,$7C,$3E,$1F,$FC,$3E,$1F,$83
  DEFB $E0,$FC,$1F,$83,$C0,$7F,$15,$FF
  DEFB $AF,$9E,$7F,$74,$9E,$FF,$FF,$DF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FC,$DE,$3D,$FF,$BF,$7F,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $DF,$FB,$D9,$FB,$FD,$FF,$7F,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FE,$FF,$FF,$FE,$F7,$F5,$DF,$57
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$61,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$BF
  DEFB $3F,$E7,$FF,$BF,$FF,$E7,$1F,$FB
  DEFB $C3,$C1,$F8,$3F,$07,$FC,$1F,$00
  DEFB $00,$7C,$3C,$1F,$FC,$3C,$1F,$FC
  DEFB $1F,$FC,$1F,$00,$00,$7F,$FF,$FF
  DEFB $FD,$DF,$BF,$FB,$B7,$7F,$FB,$DF
  DEFB $C0,$01,$F8,$3F,$C1,$F0,$7F,$80
  DEFB $0F,$FC,$00,$1F,$FC,$00,$1F,$E3
  DEFB $E3,$FC,$1F,$83,$FF,$0F,$FF,$53
  DEFB $FF,$E3,$FF,$DD,$FF,$FF,$FB,$DF
  DEFB $81,$C0,$F0,$1F,$F8,$03,$FF,$00
  DEFB $00,$78,$1C,$0F,$F8,$1C,$0F,$03
  DEFB $E0,$78,$0F,$00,$00,$FF,$B1,$FF
  DEFB $5F,$E7,$9E,$96,$5D,$7F,$FF,$DF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$3F,$46,$FE,$7F,$BF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $DF,$FC,$C5,$F3,$FE,$7F,$BF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FE,$FF,$FF,$FF,$7B,$EB,$E7,$AF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FE,$FD,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F
  DEFB $BF,$F7,$FF,$BE,$3F,$DF,$EF,$F7
  DEFB $C3,$E1,$F8,$3F,$07,$FC,$1F,$83
  DEFB $FC,$7C,$3E,$1F,$FC,$3E,$1F,$F8
  DEFB $0F,$FC,$1F,$83,$E0,$3F,$FF,$FE
  DEFB $BF,$EF,$DF,$FB,$B7,$7F,$FB,$DF
  DEFB $C3,$E1,$F8,$3F,$E0,$E0,$FF,$80
  DEFB $0F,$FC,$3E,$1F,$FC,$3E,$1F,$E3
  DEFB $E3,$FC,$1F,$83,$FF,$0F,$FF,$BC
  DEFB $FF,$FC,$7F,$DD,$FF,$FF,$FB,$DF
  DEFB $81,$C0,$F0,$1F,$F8,$03,$FF,$00
  DEFB $00,$78,$1C,$0F,$F8,$1C,$0F,$01
  DEFB $C0,$78,$0F,$00,$03,$FF,$B5,$FF
  DEFB $3F,$F9,$BE,$71,$E3,$7F,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $DF,$C2,$FB,$7D,$FF,$DF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $EF,$FF,$3E,$E5,$FF,$BF,$DF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FE,$FF,$FF,$FF,$9D,$D7,$FB,$5F
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FE,$FD,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $7F,$FB,$FF,$DD,$DF,$BF,$F7,$F7
  DEFB $C3,$E1,$F8,$3F,$07,$FC,$1F,$83
  DEFB $FF,$FC,$3E,$1F,$FC,$3E,$1F,$F8
  DEFB $0F,$FC,$1F,$83,$F8,$3F,$FF,$FD
  DEFB $7F,$EF,$DF,$FB,$77,$7F,$FB,$DF
  DEFB $C3,$E1,$F8,$3F,$E0,$E0,$FF,$83
  DEFB $FF,$FC,$3E,$1F,$FC,$3E,$1F,$C0
  DEFB $01,$FC,$1F,$83,$FE,$0F,$FF,$FF
  DEFB $3F,$FF,$8F,$DD,$FF,$FF,$FB,$DF
  DEFB $81,$C0,$F0,$1F,$FC,$07,$FF,$00
  DEFB $00,$78,$1C,$0F,$F8,$1C,$0F,$01
  DEFB $C0,$78,$0F,$00,$1F,$FF,$B5,$FE
  DEFB $8F,$FE,$7E,$E7,$FF,$7F,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $DF,$FC,$3D,$7B,$FF,$EF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $EF,$FF,$FF,$4E,$FF,$CF,$EF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FE,$FF,$FF,$FF,$EE,$EF,$FC,$BF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $F8,$3E,$FE,$FF,$FF,$FF,$C0,$01
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE
  DEFB $FF,$BB,$FF,$E3,$EF,$BF,$F7,$EF
  DEFB $C3,$E1,$F8,$3F,$83,$F8,$3F,$83
  DEFB $FF,$FC,$3E,$1F,$FC,$3E,$1F,$F8
  DEFB $0F,$FC,$1F,$83,$FC,$1F,$FF,$FA
  DEFB $FF,$EF,$DF,$F7,$77,$7F,$FB,$DF
  DEFB $C3,$E1,$F8,$3F,$E0,$E0,$FF,$83
  DEFB $FF,$FC,$3E,$1F,$FC,$3E,$1F,$C0
  DEFB $81,$FC,$1F,$83,$FE,$1F,$FF,$FF
  DEFB $DF,$7F,$F1,$BD,$F3,$FF,$FB,$DF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FC
  DEFB $F1,$FF,$9D,$9F,$FF,$7F,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $DF,$F9,$DD,$77,$BF,$F7,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $EF,$FF,$FF,$9F,$7F,$F7,$F7,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FE,$FF,$FF,$FF,$F5,$FF,$FD,$7F
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FA,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$F5,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $3C,$3C,$7C,$82,$7C,$3E,$3C,$42
  DEFB $FE,$00,$00,$3C,$3C,$FE,$3E,$42
  DEFB $3E,$3C,$3E,$3C,$42,$00,$18,$3C
  DEFB $3C,$3C,$00,$18,$3C,$3C,$08,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$87
  DEFB $81,$C3,$C1,$C3,$BD,$81,$87,$FF
  DEFB $83,$7D,$FF,$FF,$83,$C3,$83,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $00,$3C,$3C,$7C,$3C,$40,$00,$00
  DEFB $3C,$42,$3C,$42,$00,$00,$00,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$00,$00,$00,$00,$00,$3C
  DEFB $78,$3C,$7C,$FE,$7E,$78,$00,$7C
  DEFB $82,$00,$00,$00,$7C,$3C,$7C,$00
  DEFB $00,$00,$00,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$3C,$3C,$7E,$FE,$42
  DEFB $3C,$7C,$7E,$00,$3C,$3C,$42,$42
  DEFB $7E,$7C,$3C,$3E,$3C,$42,$3C,$00
  DEFB $40,$FE,$78,$00,$00,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $42,$42,$42,$44,$42,$08,$42,$42
  DEFB $10,$00,$00,$42,$42,$10,$08,$42
  DEFB $08,$40,$08,$42,$62,$00,$28,$42
  DEFB $42,$42,$02,$28,$42,$42,$18,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$BB
  DEFB $BF,$BF,$F7,$BD,$9D,$BF,$BB,$FF
  DEFB $BD,$BB,$FF,$FD,$BD,$BD,$BD,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $00,$42,$42,$42,$42,$40,$00,$00
  DEFB $40,$42,$42,$42,$00,$00,$00,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$00,$00,$00,$00,$00,$42
  DEFB $44,$42,$42,$10,$40,$44,$00,$42
  DEFB $44,$00,$02,$00,$42,$42,$42,$00
  DEFB $00,$00,$00,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$40,$42,$40,$10,$42
  DEFB $42,$42,$40,$00,$42,$42,$62,$42
  DEFB $40,$42,$40,$08,$42,$62,$40,$00
  DEFB $40,$10,$44,$00,$00,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $40,$42,$42,$28,$42,$08,$40,$7E
  DEFB $10,$10,$00,$42,$40,$10,$08,$42
  DEFB $08,$3C,$08,$42,$52,$00,$08,$42
  DEFB $3C,$02,$04,$08,$42,$3C,$28,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$BD
  DEFB $83,$C3,$F7,$BF,$AD,$83,$BD,$FF
  DEFB $83,$D7,$FF,$FB,$BD,$BD,$BD,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $00,$40,$42,$42,$42,$40,$00,$00
  DEFB $3C,$7E,$42,$42,$00,$00,$00,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$00,$00,$00,$00,$00,$42
  DEFB $42,$42,$42,$10,$7C,$42,$00,$7C
  DEFB $28,$00,$04,$00,$42,$42,$42,$00
  DEFB $00,$00,$00,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$3C,$42,$7C,$10,$42
  DEFB $42,$42,$7C,$00,$40,$42,$52,$42
  DEFB $7C,$42,$3C,$08,$42,$52,$3C,$00
  DEFB $40,$10,$42,$00,$00,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $40,$42,$7C,$10,$7C,$08,$4E,$42
  DEFB $10,$00,$00,$7E,$40,$10,$08,$42
  DEFB $08,$02,$08,$42,$4A,$00,$08,$3E
  DEFB $42,$3C,$08,$08,$3E,$42,$48,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$BD
  DEFB $BF,$FD,$F7,$B1,$B5,$BF,$BD,$FF
  DEFB $BD,$EF,$FF,$F7,$83,$81,$83,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $00,$40,$7E,$7C,$42,$40,$00,$00
  DEFB $02,$42,$7E,$42,$00,$00,$00,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$00,$00,$00,$00,$00,$7E
  DEFB $42,$7E,$7C,$10,$40,$42,$00,$42
  DEFB $10,$00,$08,$00,$7C,$7E,$7C,$00
  DEFB $00,$00,$00,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$02,$42,$40,$10,$42
  DEFB $7E,$7C,$40,$00,$40,$42,$4A,$42
  DEFB $40,$7C,$02,$08,$42,$4A,$02,$00
  DEFB $40,$10,$42,$00,$00,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $42,$42,$40,$10,$44,$08,$42,$42
  DEFB $10,$00,$00,$42,$42,$10,$08,$24
  DEFB $08,$42,$08,$42,$46,$00,$08,$02
  DEFB $42,$40,$10,$08,$02,$42,$7E,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$BB
  DEFB $BF,$BD,$F7,$BD,$B9,$BF,$BB,$FF
  DEFB $BD,$EF,$FF,$EF,$BF,$BD,$BB,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $00,$42,$42,$44,$42,$40,$00,$00
  DEFB $42,$42,$42,$5A,$00,$00,$00,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$00,$00,$00,$00,$00,$42
  DEFB $44,$42,$40,$10,$40,$44,$00,$42
  DEFB $10,$00,$10,$00,$40,$42,$44,$00
  DEFB $00,$00,$00,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$42,$42,$40,$10,$5A
  DEFB $42,$44,$40,$00,$42,$42,$46,$24
  DEFB $40,$44,$42,$08,$42,$46,$42,$00
  DEFB $40,$10,$44,$00,$00,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $3C,$3C,$40,$10,$42,$3E,$3C,$42
  DEFB $10,$10,$00,$42,$3C,$10,$3E,$18
  DEFB $3E,$3C,$3E,$3C,$42,$00,$3E,$3C
  DEFB $3C,$7E,$20,$3E,$3C,$3C,$08,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$87
  DEFB $81,$C3,$C1,$C3,$BD,$81,$87,$FF
  DEFB $83,$EF,$FF,$DF,$BF,$BD,$BD,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $00,$3C,$42,$42,$3C,$7E,$00,$00
  DEFB $3C,$42,$42,$24,$00,$00,$00,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$00,$00,$00,$00,$00,$42
  DEFB $78,$42,$40,$10,$7E,$78,$00,$7C
  DEFB $10,$00,$20,$00,$40,$42,$42,$00
  DEFB $00,$00,$00,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$3C,$3C,$40,$10,$24
  DEFB $42,$42,$7E,$00,$3C,$3C,$42,$18
  DEFB $7E,$42,$3C,$3E,$3C,$42,$3C,$00
  DEFB $7E,$10,$78,$00,$00,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$FF,$FF,$FF

; Screen attributes.
screen_attributes:
  DEFB $38,$38,$38,$38,$38,$38,$38,$70
  DEFB $70,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $72,$72,$72,$72,$72,$72,$72,$70
  DEFB $70,$70,$70,$70,$70,$70,$70,$70
  DEFB $70,$70,$70,$70,$70,$70,$70,$70
  DEFB $70,$70,$70,$70,$70,$70,$70,$78
  DEFB $72,$72,$72,$72,$72,$72,$72,$70
  DEFB $70,$70,$70,$70,$70,$70,$70,$70
  DEFB $70,$70,$70,$70,$70,$70,$70,$70
  DEFB $70,$70,$70,$70,$70,$70,$70,$78
  DEFB $72,$72,$72,$72,$72,$72,$70,$70
  DEFB $70,$70,$70,$70,$70,$70,$70,$70
  DEFB $70,$70,$70,$70,$70,$70,$70,$70
  DEFB $70,$70,$70,$70,$70,$70,$70,$78
  DEFB $74,$74,$74,$74,$74,$74,$70,$70
  DEFB $70,$70,$70,$70,$70,$70,$70,$70
  DEFB $70,$70,$70,$70,$70,$70,$70,$70
  DEFB $70,$70,$70,$70,$70,$70,$70,$78
  DEFB $71,$71,$71,$71,$71,$71,$70,$70
  DEFB $70,$70,$70,$70,$70,$70,$70,$70
  DEFB $70,$70,$70,$70,$70,$70,$70,$70
  DEFB $70,$70,$70,$70,$70,$70,$70,$78
  DEFB $38,$38,$38,$38,$38,$38,$70,$70
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$70,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$78
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $50,$50,$50,$50,$50,$50,$50,$50
  DEFB $50,$50,$50,$50,$50,$50,$50,$50
  DEFB $50,$50,$50,$50,$50,$50,$50,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $50,$50,$50,$50,$50,$50,$50,$50
  DEFB $50,$50,$50,$50,$50,$50,$50,$50
  DEFB $50,$50,$50,$50,$50,$50,$50,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $50,$50,$50,$50,$50,$50,$50,$50
  DEFB $50,$50,$50,$50,$50,$50,$50,$50
  DEFB $50,$50,$50,$50,$50,$50,$78,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$50,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $07,$07,$07,$07,$07,$07,$07,$07
  DEFB $07,$07,$07,$07,$07,$07,$07,$07
  DEFB $07,$07,$07,$07,$07,$07,$07,$07
  DEFB $07,$07,$07,$07,$07,$07,$07,$07
  DEFB $07,$07,$07,$07,$07,$07,$07,$07
  DEFB $07,$07,$07,$07,$07,$07,$07,$07
  DEFB $07,$07,$07,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$38,$38,$38,$38,$00
  DEFB $38,$38,$38,$38,$38,$38,$38,$38
  DEFB $07,$07,$07,$07,$07,$07,$07,$07
  DEFB $07,$07,$07,$07,$07,$07,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $38,$38,$07,$07,$07,$07,$07,$07
  DEFB $07,$07,$07,$07,$07,$07,$07,$07
  DEFB $07,$07,$07,$07,$07,$07,$07,$07
  DEFB $07,$07,$07,$38,$38,$38,$38,$38
  DEFB $38,$38,$38,$07,$07,$07,$07,$07
  DEFB $07,$07,$07,$07,$07,$07,$07,$07
  DEFB $07,$07,$07,$07,$07,$07,$07,$07
  DEFB $07,$07,$07,$07,$07,$38,$38,$38

; Data block at 5B00
L5B00:
  DEFB $1F,$40,$1F,$41,$1F,$42,$1F,$43
  DEFB $1F,$44,$1F,$45,$1F,$46,$1F,$47
  DEFB $3F,$40,$3F,$41,$3F,$42,$3F,$43
  DEFB $3F,$44,$3F,$45,$3F,$46,$3F,$47
  DEFB $5F,$40,$5F,$41,$5F,$42,$5F,$43
  DEFB $5F,$44,$5F,$45,$5F,$46,$5F,$47
  DEFB $7F,$40,$7F,$41,$7F,$42,$7F,$43
  DEFB $7F,$44,$7F,$45,$7F,$46,$7F,$47
  DEFB $9F,$40,$9F,$41,$9F,$42,$9F,$43
  DEFB $9F,$44,$9F,$45,$9F,$46,$9F,$47
  DEFB $BF,$40,$BF,$41,$BF,$42,$BF,$43
  DEFB $BF,$44,$BF,$45,$BF,$46,$BF,$47
  DEFB $DF,$40,$DF,$41,$DF,$42,$DF,$43
  DEFB $DF,$44,$DF,$45,$DF,$46,$DF,$47
  DEFB $FF,$40,$FF,$41,$FF,$42,$FF,$43
  DEFB $FF,$44,$FF,$45,$FF,$46,$FF,$47
  DEFB $C3,$90,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $FF,$00,$23,$0D,$FF,$00,$23,$22
  DEFB $0D,$23,$05,$00,$00,$00,$16,$00
  DEFB $01,$00,$06,$00,$0B,$00,$01,$00
  DEFB $01,$00,$06,$00,$10,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$3C
  DEFB $40,$00,$FF,$CD,$00,$54,$FF,$00
  DEFB $00,$00,$05,$00,$FF,$05,$00,$01
  DEFB $07,$00,$00,$8E,$77,$B8,$5C,$B6
  DEFB $5C,$BB,$5C,$CB,$5C,$4E,$77,$CA
  DEFB $5C,$8F,$77,$92,$77,$4D,$77,$A5
  DEFB $77,$94,$77,$94,$77,$94,$77,$2D
  DEFB $92,$5C,$00,$02,$00,$00,$00,$00
  DEFB $00,$00,$6E,$DC,$9D,$1A,$00,$00

; Interrupt counter
int_counter:
  DEFB $3D

; Data block at 5C79
L5C79:
  DEFB $00,$00,$58,$FF,$00,$00,$21,$00
  DEFB $5B,$21,$17,$00,$40,$E0,$50,$21
  DEFB $18,$21,$17,$03,$00,$00,$00,$00
  DEFB $00,$00,$00,$01,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$57,$FF,$FF,$FF,$F4,$09,$A8
  DEFB $10,$4B,$F4,$09,$C4,$15,$53,$81
  DEFB $0F,$C4,$15,$52,$F4,$09,$C4,$15
  DEFB $50,$80,$00,$01,$5C,$1A,$EA,$0D
  DEFB $80

; The entry point invoked from the BASIC loader
start:
  LD HL,state_controls
  LD (ptr_state_controls),HL
  LD HL,L6136
  LD (L8B08),HL
  LD A,$C3
  LD ($FEFE),A
  LD HL,int_handler
  LD ($FEFF),HL
  LD HL,$FC00
  LD B,$00
start_0:
  LD (HL),$FE
  INC HL
  DJNZ start_0
  LD (HL),$FE
  LD A,$FC
  LD I,A
  LD (sp_5F83),SP
  IM 2
  EI
  LD HL,msg_credits
  LD (ptr_scroller),HL
; This entry point is used by the routines at handle_enter and demo.
start_1:
  LD A,$3F
  LD I,A
  IM 1
  EI
  CALL clear_and_setup

; Routine at 5D10
L5D10:
  LD A,$FC
  LD I,A
  IM 2
  EI
  LD A,(tmp_control_type)
  LD (state_control_type),A
  LD A,(state_demo_mode)  ; Check if we switched to the demo mode
  CP $01                  ;
  JP Z,L5D10_0
  CALL init_state
  JP play
; This entry point is used by the routine at game_over.
L5D10_0:
  LD SP,(sp_5F83)
  CALL init_state
  JP demo

; Restart the game
;
; Used by the routine at handle_enter.
restart:
  LD SP,(sp_5F83)
  CALL init_state
  JP play

; Array of possible starting bridge values.
;
; Index of list element is specified by the second and third bits of the
;       state_game_mode.
; The values correspond to the dialog rendered as msg_game_mode.
starting_bridges:
  DEFB $01,$05,$14,$1E
L5D43:
  DEFB $00

; Routine at 5D44
;
; Used by the routines at L5D10 and restart.
init_state:
  LD A,$78                ; Initialize state_x. Why isn't it $80?
  LD (state_x),A          ;
  CALL init_starting_bridge
  LD HL,viewport_1
  LD (viewport_1_ptr),HL
  LD (HL),$FF
  LD A,$1F
  LD (L5F5F),A
  LD A,$00
  OUT ($FE),A
  LD (L5EF2),A
  LD (state_controls),A
  LD BC,$4C83
  LD (state_terrain_element_23),BC
  LD A,$02
  LD (state_terrain_element_1),A
  LD (state_interaction_mode_5F68),A
  LD (state_speed),A
  LD (L5F6D),A
  LD HL,$3030
  LD (state_score_player_1),HL
  LD ($90BE),HL
  LD ($90C0),HL
  LD (state_score_player_2),HL
  LD ($90C4),HL
  LD ($90C6),HL
  LD A,$01
  LD (state_terrain_element_index),A
  LD (state_terrain_sprite_element_ptr),A
  LD HL,$0404
  LD (state_lives_player_1),HL
  LD (state_player),A
  RET

; Decrease player 2 lives
decrease_lives_player_2:
  LD HL,state_lives_player_2
  DEC (HL)
  JP decrease_lives_player_2_1
; This entry point is used by the routines at L5D10, restart, handle_no_fuel
; and demo.
play:
  LD A,$10
  LD (L5EFD),A
  LD A,$1F
  LD (L5F5F),A
  LD SP,(sp_5F83)
  LD D,$0C                ; PAPER 1; INK 4
  CALL clear_screen
  CALL init_udg
  LD DE,status_line_1
  LD BC,status_line_2 - status_line_1
  CALL PR_STRING
  LD A,$01
  LD (L5EEF),A
  CALL CHAN_OPEN
  LD DE,status_line_2
  LD BC,status_line_3 - status_line_2
  CALL PR_STRING
  LD A,$02
  CALL CHAN_OPEN
  CALL print_bridge
  LD A,$04
  LD (L5EEE),A
  LD A,$00
  LD (L5F6C),A
  LD ($5F6F),A
  LD (state_terrain_sprite_element_ptr),A
  LD (L5F69),A
  LD A,$FF
  LD (state_fuel),A
  LD BC,$0010
  LD (state_y),BC
  CALL init_current_bridge
  LD A,$78
  LD (state_x),A
  LD HL,viewport_1
  LD (viewport_1_ptr),HL
  LD (HL),$FF
  LD HL,viewport_2
  LD (viewport_2_ptr),HL
  LD (HL),$FF
  LD BC,$0000
  CALL print_lives
  LD A,$01
  CALL CHAN_OPEN
  LD A,$16
  RST $10
  LD A,$01
  RST $10
  LD A,$05
  RST $10
  LD A,$10
  RST $10
  LD A,$06
  RST $10
  LD DE,state_score_player_1
  LD BC,state_score_player_2 - state_score_player_1
  CALL PR_STRING
  LD A,$02
  CALL CHAN_OPEN
  LD DE,status_line_4
  LD BC,end_status_line_4 - status_line_4
  CALL PR_STRING
  LD A,(state_game_mode)
  ADD A,$31
  RST $10
  LD A,$01
  CALL CHAN_OPEN
  LD A,$FF
  LD (state_terrain_sprite_element_ptr),A
  LD A,$02
  LD (state_terrain_element_1),A
  CALL CHAN_OPEN
  LD A,$01
  LD (state_terrain_element_index),A
  LD (state_interaction_mode_5F68),A
  LD (L5F6D),A
  LD A,$68
  LD (LAST_K),A
  LD A,$00
  LD (state_controls),A
  LD (L5EF2),A
  LD A,$04
  LD (state_speed),A
  LD BC,$4C83
  LD (state_terrain_element_23),BC
  CALL L91E8
  CALL init_current_bridge
  LD B,$28
decrease_lives_player_2_0:
  PUSH BC
  LD HL,L5EEF
  INC (HL)
  CALL L60A5
  CALL L708E
  CALL advance
  LD A,$04
  LD (state_speed),A
  POP BC
  DJNZ decrease_lives_player_2_0
  LD A,$00
  LD (state_controls),A
  LD (state_interaction_mode_5F68),A
  CALL L6682
  LD A,$0D
  LD (LAST_K),A
  LD A,(state_player)
  CP $02
  JP Z,decrease_lives_player_2
  LD HL,state_lives_player_1
  DEC (HL)
decrease_lives_player_2_1:
  CALL print_lives
decrease_lives_player_2_2:
  CALL KEYBOARD
  EI
  LD A,(LAST_K)
  CP $0D
  JR NZ,decrease_lives_player_2_3
  LD A,(state_control_type)
  CP $02
  JP NZ,decrease_lives_player_2_2
  LD A,$FE
  IN A,($1F)
  CP $00
  JP Z,decrease_lives_player_2_2
decrease_lives_player_2_3:
  LD A,$00
  LD (L5F6D),A
  LD (L5F6E),A
  LD A,$02
  LD (state_speed),A
  LD (L5EEF),A
  JP main_loop

; Data block at 5EEE
L5EEE:
  DEFB $00

; Data block at 5EEF
L5EEF:
  DEFB $00

; Game status buffer entry at 5EF0
state_bridge_mod:
  DEFB $00

; Contains the current readings of the input port (Sinclair, Kempston, Cursor,
; etc.).
state_input_readings:
  DEFB $00

; Data block at 5EF2
L5EF2:
  DEFB $00

; Data block at 5EF3
L5EF3:
  DEFW $0000

; Game status buffer entry at 5EF5
state_interaction_mode_5EF5:
  DEFB $00

; Data block at 5EF6
L5EF6:
  DEFB $00

; Data block at 5EF7
L5EF7:
  DEFW $0000

; Data block at 5EF9
L5EF9:
  DEFB $00

; Data block at 5EFA
L5EFA:
  DEFB $00

; Data block at 5EFB
L5EFB:
  DEFB $00

; Data block at 5EFC
L5EFC:
  DEFB $00

; Data block at 5EFD
L5EFD:
  DEFB $10

; Unused
L5EFE:
  DEFB $FF,$FF

; Data block at 5F00
viewport_1:
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20

; Data block at 5F2E
viewport_2:
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20,$20,$20
  DEFB $20

; Data block at 5F5F
L5F5F:
  DEFB $04

; Pointer to a slot from viewport #1
viewport_1_ptr:
  DEFW $0000

; Pointer to a slot from viewport #2
viewport_2_ptr:
  DEFW $0000

; Current speed
state_speed:
  DEFB $02

; Data block at 5F65
L5F65:
  DEFB $00

; Fuel level
state_fuel:
  DEFB $00

; Control type ($00 - Keyboard, $01 - Sinclair, $02 - Kempston, Other - Cursor)
state_control_type:
  DEFB $00

; Game status buffer entry at 5F68
;
; $00 - TODO
; $01 - TODO
; $02 - TODO
; $06 - fueling
state_interaction_mode_5F68:
  DEFB $00

; Data block at 5F69
L5F69:
  DEFB $00

; Current bridge of player 1
state_bridge_player_1:
  DEFB $01

; Current bridge of player 2
state_bridge_player_2:
  DEFB $01

; Data block at 5F6C
L5F6C:
  DEFB $00

; Data block at 5F6D
L5F6D:
  DEFB $00

; Data block at 5F6E
L5F6E:
  DEFW $0000

; Current Y coordinate
state_y:
  DEFB $00,$00

; Current X coordinate
state_x:
  DEFB $00

; Game status buffer entry at 5F73
L5F73:
  DEFB $00,$00

; Data block at 5F75
L5F75:
  DEFB $00

; Index of the current element of current level terrain array
state_terrain_element_index:
  DEFB $00

; Data block at 5F77
state_terrain_element_1:
  DEFB $00

; Data block at 5F78
state_terrain_element_23:
  DEFW $0000

; Data block at 5F7A
state_terrain_element_4:
  DEFB $00

; Data block at 5F7B
L5F7B:
  DEFW $0000

; Data block at 5F7D
state_terrain_sprite_element_ptr:
  DEFB $01

; Pointer to the text to be displayed in the scroller.
ptr_scroller:
  DEFW $0000

; Unused
L5F80:
  DEFB $00

; Data block at 5F81
L5F81:
  DEFB $00

; Unused
L5F82:
  DEFB $00

; Data block at 5F83
sp_5F83:
  DEFW $0000

; Data block at 5F85
L5F85:
  DEFW $0000

; Data block at 5F87
L5F87:
  DEFW $0000

; Data block at 5F89
L5F89:
  DEFW $0000

; Data block at 5F8B
L5F8B:
  DEFW $0000

; Data block at 5F8D
L5F8D:
  DEFW $0000

; Data block at 5F8F
L5F8F:
  DEFW $0000

; Main loop
;
; Used by the routine at decrease_lives_player_2.
main_loop:
  LD A,$BF                ; Scan Enter
  IN A,($FE)              ;
  BIT 0,A                 ;
  CALL Z,handle_enter     ;
  LD HL,L5EEF
  INC (HL)
  CALL L6EC8
  CALL L60A5
  CALL L708E
  LD A,$01
  LD (L673C),A
  CALL L673D
  LD A,$00
  LD (L673C),A
  CALL L673D
  CALL L7441
  CALL L7393
  CALL advance
  CALL L6DFF
  LD A,$00
  LD (L5F69),A
  LD A,(state_control_type)
  CP $02
  JP Z,scan_kempston
  CP $01
  JP Z,scan_sinclair
  CP $00
  JP Z,scan_keyboard
scan_cursor:
  LD A,$EF
  IN A,($FE)
  LD (state_input_readings),A
  BIT 2,A
  CALL Z,handle_right
  LD A,$F7
  IN A,($FE)
  BIT 4,A
  CALL Z,handle_left
  LD A,(state_input_readings)
  BIT 0,A
  CALL Z,handle_fire
  LD A,(state_input_readings)
  BIT 3,A
  CALL Z,handle_up
  LD A,(state_input_readings)
  BIT 4,A
  CALL Z,handle_down
  JP main_loop
scan_kempston:
  LD A,$FE
  IN A,($1F)
  LD (state_input_readings),A
  BIT 0,A
  CALL NZ,handle_right
  LD A,(state_input_readings)
  BIT 1,A
  CALL NZ,handle_left
  LD A,(state_input_readings)
  BIT 2,A
  CALL NZ,handle_down
  LD A,(state_input_readings)
  BIT 3,A
  CALL NZ,handle_up
  LD A,(state_input_readings)
  BIT 4,A
  CALL NZ,handle_fire
  JP main_loop
scan_sinclair:
  LD A,$EF
  IN A,($FE)
  LD (state_input_readings),A
  BIT 0,A
  CALL Z,handle_fire
  LD A,(state_input_readings)
  BIT 1,A
  CALL Z,handle_up
  LD A,(state_input_readings)
  BIT 2,A
  CALL Z,handle_down
  LD A,(state_input_readings)
  BIT 3,A
  CALL Z,handle_right
  LD A,(state_input_readings)
  BIT 4,A
  CALL Z,handle_left
  JP main_loop
scan_keyboard:
  LD A,$DF                ; Scan "O" (LEFT)
  IN A,($FE)              ;
  BIT 0,A                 ;
  CALL Z,handle_right     ;
  LD A,$DF                ; Scan "P" (RIGHT)
  IN A,($FE)              ;
  BIT 1,A                 ;
  CALL Z,handle_left      ;
  LD A,$F7                ; Scan "2" (UP)
  IN A,($FE)              ;
  BIT 1,A                 ;
  CALL Z,handle_up        ;
  LD A,$FB                ; Scan "W" (DOWN)
  IN A,($FE)              ;
  BIT 1,A                 ;
  CALL Z,handle_down      ;
  LD A,$7F                ; Scan lower row right (FIRE)
  IN A,($FE)              ;
  AND $1F                 ;
  CP $1F                  ;
  CALL NZ,handle_fire     ;
  LD A,$FE                ; Scan lower row left (FIRE)
  IN A,($FE)              ;
  AND $1F                 ;
  CP $1F                  ;
  CALL NZ,handle_fire     ;
  JP main_loop            ;

; Routine at 60A5
;
; Used by the routines at decrease_lives_player_2, main_loop and demo.
L60A5:
  LD A,(state_interaction_mode_5F68)
  CP $00
  JP NZ,L60A5_0
  LD A,$00
  LD (state_interaction_mode_5EF5),A
  LD A,(state_x)
  LD C,A
  LD A,(state_speed)
  LD E,A
  LD A,$08
  SUB E
  LD D,$00
  LD E,A
  SLA E
  LD HL,(L5EF7)
  ADD HL,DE
  LD (L8B0E),HL
  ADD A,$80
  LD B,A
  LD A,(state_speed)
  LD D,A
  LD (L8B0A),BC
  LD (L8B0C),BC
  LD E,$00
  LD BC,$0010
  LD A,$02
  LD HL,L82F5
  CALL render_object
L60A5_0:
  CALL L683B
  LD A,(state_speed)
  LD DE,$0100
  LD HL,screen_pixels
  OR A
  SBC HL,DE
L60A5_1:
  ADD HL,DE
  DEC A
  JR NZ,L60A5_1
  LD (L5F7B),HL
  LD A,(state_speed)
  LD B,A
  LD A,(L5EEE)
  LD C,A
L60A5_2:
  INC C
  LD A,C
  PUSH BC
  AND $07
  CP $00
  CALL Z,L68B7
  CALL render_terrain_sprite
  LD DE,$0100
  LD HL,(L5F7B)
  OR A
  SBC HL,DE
  LD (L5F7B),HL
  POP BC
  DJNZ L60A5_2
  LD A,C
  LD (L5EEE),A
  RET

; Routine at 6124
;
; Used by the routines at L6DFF and L6E40.
L6124:
  LD A,$07
  PUSH DE
  SUB B
  SLA A
  SLA A
  SLA A
  POP DE
  ADD A,D
  LD ($6134),A
  RLC B
  RET

; Routine at 6136
L6136:
  POP HL
  LD (L5F85),HL
  LD (L5F87),DE
  LD (L5F89),BC
  LD A,(state_interaction_mode_5EF5)
  CP $00
  JP Z,L8C1B_1
  CP $01
  JP Z,fuel
  CP $02
  JP Z,interact_with_something
  CP $03
  JP Z,L615E
  CP $04
  JP Z,L7415

; Routine at 615E
;
; Used by the routine at L6136.
L615E:
  LD BC,(L5EF3)
  LD DE,(L8B0C)
  LD A,B
  ADD A,$06
  SUB D
  JP M,interact_with_something2_3
  LD A,D
  ADD A,$06
  SUB B
  JP M,interact_with_something2_3
  LD H,$00
  LD A,E
  ADD A,$0A
  LD L,A
  LD B,$00
  OR A
  SBC HL,BC
  JP M,interact_with_something2_3
  LD H,$00
  LD BC,(L5EF3)
  LD A,C
  INC A
  LD L,A
  LD B,$00
  LD C,E
  OR A
  SBC HL,BC
  JP M,interact_with_something2_3
  POP DE
  POP DE
  POP DE
  LD A,D
  LD (L5EF6),A
  LD HL,(viewport_1_ptr)
  DEC HL
  DEC HL
  LD B,(HL)
  DEC HL
  LD C,(HL)
  LD (HL),$00
  LD D,$00
  CALL explode_fragment
  DEC C
  DEC C
  DEC C
  DEC C
  DEC C
  DEC C
  CALL explode_fragment
  LD A,$10                ; POINTS_FIGHTER
  CALL add_points
  JP L6794

; Routine at 61BB
;
; Used by the routines at L6136 and fuel.
interact_with_something:
  LD BC,(L5EF3)
  LD A,(L5F6E)
  CP $00
  JP Z,interact_with_something2
  LD D,A
  SUB B
  JP M,interact_with_something2
  LD A,D
  SUB $16
  SUB B
  JP P,interact_with_something2
  LD A,$50                ; POINTS_BRIDGE
  CALL add_points
  LD A,$0F
  LD (L5F5F),A
  POP DE
  POP DE
  POP DE
  POP BC
  LD A,D
  LD (L5EF6),A
  LD A,(L5F6E)
  SUB $04
  LD B,A
  LD C,$70
  LD D,$00
  CALL explode_fragment
  LD C,$80
  CALL explode_fragment
  LD A,B
  SUB $08
  LD B,A
  CALL explode_fragment
  LD C,$70
  CALL explode_fragment
  LD A,B
  SUB $08
  LD B,A
  CALL explode_fragment
  LD C,$80
  CALL explode_fragment
  LD A,(L5F6C)
  CP $02
  LD HL,screen_pixels
  CALL Z,L6B7B_1
  LD A,(L5F6C)
  CP $02
  LD HL,$4100
  CALL Z,L6B7B_1
  LD A,$00
  LD (L5F6E),A
  LD A,$01
  LD (L5F6D),A
  LD BC,(L5F8D)
  LD (L5EF3),BC
  LD A,(state_player)
  CP $02
  JP Z,next_bridge_player_2
next_bridge_player_1:
  LD HL,state_bridge_player_1
  INC (HL)
  CALL print_bridge
  JP L6794
next_bridge_player_2:
  LD HL,state_bridge_player_2
  INC (HL)
  CALL print_bridge
  JP L6794

; Data block at 6253
L6253:
  DEFB $3E,$00,$C9

; Routine at 6256
;
; Used by the routine at L6136.
fuel:
  LD A,$06
  LD (state_interaction_mode_5F68),A
  LD B,$80
  LD A,(state_x)
  LD C,A
  LD (L5EF3),BC
  JP interact_with_something

; Fighter hits terrain
;
; Used by the routine at interact_with_something2.
hit_terrain:
  LD HL,(viewport_2_ptr)
  LD C,(HL)
  INC HL
  LD B,(HL)
  INC HL
  INC HL
  LD (viewport_2_ptr),HL
  LD A,C
  CP $00
  JP Z,hit_terrain
  CP $FF
  JP Z,hit_terrain_0
  CALL L62DA
  LD DE,(L5EF3)
  LD A,D
  ADD A,$08
  LD H,$00
  LD L,A
  LD D,$00
  OR A
  LD E,B
  SBC HL,DE
  JP M,hit_terrain
  LD A,B
  ADD A,$08
  LD H,$00
  LD L,A
  LD E,D
  LD D,$00
  OR A
  SBC HL,DE
  JP M,hit_terrain
  LD DE,(L5EF3)
  LD H,$00
  LD A,E
  ADD A,$08
  LD L,A
  LD D,$00
  LD E,C
  OR A
  SBC HL,DE
  JP M,hit_terrain
  LD A,C
  ADD A,$10
  LD DE,(L5EF3)
  LD H,$00
  LD L,A
  OR A
  LD D,$00
  SBC HL,DE
  JP M,hit_terrain
  LD A,$02
  LD (L5F8B),A
  RET
hit_terrain_0:
  LD A,$00
  LD (L5F8B),A
  RET

; Routine at 62D4
;
; Used by the routine at interact_with_something2.
L62D4:
  LD E,$09
  RET

; Routine at 62D7
;
; Used by the routine at interact_with_something2.
L62D7:
  LD E,$11
  RET

; Increase B by the value of state_speed
;
; Used by the routines at hit_terrain, interact_with_something2, L6682, L66EE,
; L673D, L6794, L6FEA, L708E, L7393 and L7441.
L62DA:
  LD A,(state_speed)
  ADD A,B
  LD B,A
  RET

; Routine at 62E0
;
; Used by the routine at interact_with_something2.
L62E0:
  LD A,(state_speed)
  LD H,A
  LD A,B
  SUB H
  LD B,A
  RET

; Interact with something
;
; Used by the routine at interact_with_something.
interact_with_something2:
  LD HL,(viewport_1_ptr)
  LD C,(HL)
  INC HL
  LD B,(HL)
  INC HL
  INC HL
  LD (viewport_1_ptr),HL
  LD A,C
  CP $00
  JP Z,interact_with_something2
  CP $FF
  JP Z,interact_with_something2_0
  LD A,(state_interaction_mode_5F68)
  CP $06
  CALL Z,L62DA
  LD DE,(L5EF3)
  LD A,D
  ADD A,$09
  LD H,$00
  LD L,A
  LD D,$00
  OR A
  LD E,B
  SBC HL,DE
  JP M,interact_with_something2
  LD A,B
  ADD A,$08
  LD D,A
  LD E,$00
  LD HL,(viewport_1_ptr)
  DEC HL
  LD A,(HL)
  AND $07
  CP $06
  CALL Z,L62D4
  CP $07
  CALL Z,L62D7
  LD A,D
  ADD A,E
  LD DE,(L5EF3)
  LD H,$00
  LD L,A
  LD E,D
  LD D,$00
  OR A
  SBC HL,DE
  JP M,interact_with_something2
  LD DE,(L5EF3)
  LD A,E
  ADD A,$08
  LD E,A
  LD H,$00
  LD L,E
  LD D,$00
  LD E,C
  OR A
  SBC HL,DE
  JP M,interact_with_something2
  LD A,C
  ADD A,$0A
  LD D,A
  LD E,$00
  LD HL,(viewport_1_ptr)
  DEC HL
  LD A,(HL)
  AND $07
  CP $02
  CALL Z,L62D4
  LD A,D
  ADD A,E
  LD DE,(L5EF3)
  LD (L5F8B),BC
  LD H,$00
  LD L,A
  OR A
  LD D,$00
  SBC HL,DE
  JP M,interact_with_something2
  LD A,(state_interaction_mode_5F68)
  CP $06
  CALL Z,L62E0
  LD (L5F8B),BC
  LD HL,(viewport_1_ptr)
  DEC HL
  LD A,(HL)
  AND $07
  CP $00
  JP Z,interact_with_something2_1
  DEC HL
  DEC HL
  LD (HL),$00
  LD D,$00
  CP $01
  JP Z,hit_helicopter_reg
  CP $02
  JP Z,hit_ship
  CP $03
  JP Z,hit_helicopter_adv
  CP $05
  JP Z,hit_fighter
  CP $06
  JP Z,hit_balloon
  CP $07
  JP Z,interact_with_fuel
interact_with_something2_0:
  CALL hit_terrain
  LD HL,viewport_1
  LD (viewport_1_ptr),HL
  LD HL,viewport_2
  LD (viewport_2_ptr),HL
  LD A,(L5F8B)
  CP $02
  JP Z,interact_with_something2_2
  LD BC,(L7385)
  LD DE,(L8B0C)
  LD A,B
  CP D
  JP Z,interact_with_something2_2
; This entry point is used by the routines at hit_helicopter_reg, hit_ship,
; hit_helicopter_adv, hit_fighter, hit_balloon and interact_with_fuel.
interact_with_something2_1:
  POP DE
  POP DE
  POP DE
  POP BC
  LD A,D
  LD (L5EF6),A
  LD HL,viewport_2
  LD (viewport_2_ptr),HL
  LD HL,viewport_1
  LD (viewport_1_ptr),HL
  LD BC,(L5F8D)
  LD (L5EF3),BC
  JP L6794
; This entry point is used by the routine at interact_with_fuel.
interact_with_something2_2:
  LD A,$00
  LD (state_interaction_mode_5F68),A
; This entry point is used by the routine at L615E.
interact_with_something2_3:
  LD A,$00
  LD (state_interaction_mode_5EF5),A
  LD HL,(L5F85)
  LD DE,(L5F87)
  LD BC,(L5F89)
  JP L8C1B_1

; Routine at 6414
;
; Used by the routine at interact_with_something2.
hit_helicopter_reg:
  LD A,$06                ; POINTS_REG_HELICOPTER
  CALL add_points
  LD BC,(L5F8B)
  CALL explode_fragment
  JP interact_with_something2_1

; Routine at 6423
;
; Used by the routine at interact_with_something2.
hit_ship:
  LD A,$03                ; POINTS_SHIP
  CALL add_points
  LD BC,(L5F8B)
  CALL explode_fragment
  LD A,C
  ADD A,$08
  LD C,A
  CALL explode_fragment
  LD A,C
  SUB $08
  LD C,A
  LD A,B
  ADD A,$04
  LD B,A
  CALL explode_fragment
  JP interact_with_something2_1

; Hit advanced helicopter
;
; Used by the routine at interact_with_something2.
hit_helicopter_adv:
  LD A,$15                ; POINTS_ADV_HELICOPTER
  CALL add_points
  LD BC,(L5F8B)
  CALL explode_fragment
  JP interact_with_something2_1

; Hit fighter
;
; Used by the routine at interact_with_something2.
hit_fighter:
  LD A,$10                ; POINTS_FIGHTER
  CALL add_points
  LD BC,(L5F8B)
  CALL explode_fragment
  JP interact_with_something2_1

; Routine at 6462
;
; Used by the routine at interact_with_something2.
hit_balloon:
  LD A,$06                ; POINTS_BALLOON
  CALL add_points
  LD BC,(L5F8B)
  CALL explode_fragment
  LD A,B
  ADD A,$08
  LD B,A
  CALL explode_fragment
  JP interact_with_something2_1

; Routine at 6478
;
; Used by the routine at interact_with_something2.
interact_with_fuel:
  LD A,(state_interaction_mode_5F68)
  CP $06
  JP Z,interact_with_fuel_0
  LD A,$08                ; POINTS_FUEL
  CALL add_points
  LD BC,(L5F8B)
  CALL explode_fragment
  LD A,B
  ADD A,$08
  LD B,A
  CALL explode_fragment
  LD A,B
  ADD A,$08
  LD B,A
  CALL explode_fragment
  INC B
  CALL explode_fragment
  JP interact_with_something2_1
interact_with_fuel_0:
  LD (HL),C
  LD HL,viewport_1
  LD (viewport_1_ptr),HL
  LD HL,viewport_2
  LD (viewport_2_ptr),HL
  CALL L6E40
  JP interact_with_something2_2

; Data block at 64B4
L64B4:
  DEFB $D1,$D1,$D1,$D1,$D1,$C3,$0A,$65

; Routine at 64BC
;
; Used by the routines at decrease_lives_player_2, interact_with_something,
; L6587 and demo.
print_bridge:
  LD A,(state_player)
  CP $02
  JP Z,print_bridge_player_2
  LD A,$10
  RST $10
  LD A,$06
  RST $10
  LD DE,status_line_3
  LD BC,status_line_4 - status_line_3
  CALL PR_STRING
  LD A,(state_bridge_player_1)
  SUB $0A
  CALL M,print_space
  LD A,(state_bridge_player_1)
  LD B,$00
  LD C,A
  CALL OUT_NUM_1
  RET

; Print current bridge for player 2
;
; Used by the routine at print_bridge.
print_bridge_player_2:
  LD A,$10
  RST $10
  LD A,$05
  RST $10
  LD DE,status_line_3
  LD BC,status_line_4 - status_line_3

; Print current bridge number for player 2
;
; Used by the routine at L6587.
print_bridge_no_player_2:
  CALL PR_STRING
  LD A,(state_bridge_player_2)
  SUB $0A
  CALL M,print_space
  LD A,(state_bridge_player_2)
  LD B,$00
  LD C,A
  CALL OUT_NUM_1
  RET

; Print space
;
; Used by the routines at print_bridge and print_bridge_no_player_2.
print_space:
  LD A,$20
  RST $10
  RET

; Handle the no fuel situation
;
; Used by the routines at L6794, L6DFF and L7415.
handle_no_fuel:
  LD A,(state_x)
  AND $F8
  LD C,A
  LD B,$7F
  LD A,$00
  LD (state_speed),A
  LD (L5EF3),A
  LD ($5EF4),A
  LD D,$00
  CALL explode_fragment
  LD A,B
  ADD A,$05
  LD B,A
  CALL explode_fragment
  LD A,$10
handle_no_fuel_0:
  PUSH AF
  LD B,$40
handle_no_fuel_1:
  LD D,$00
handle_no_fuel_2:
  DEC D
  JR NZ,handle_no_fuel_2
  DJNZ handle_no_fuel_1
  CALL L6EC8
  POP AF
  DEC A
  JP NZ,handle_no_fuel_0
  LD D,$0C
  LD A,$00
  LD B,$00
handle_no_fuel_3:
  DJNZ handle_no_fuel_3
  DEC A
  JR NZ,handle_no_fuel_3
  DEC D
  JR NZ,handle_no_fuel_3
  LD A,$00
  LD (state_controls),A
  LD A,(state_player)
  CP $02
  JP Z,L65CB
  LD A,(state_lives_player_1)
  CP $00
  JP Z,handle_no_fuel_5
  LD A,(state_game_mode)
  BIT 0,A
  JP NZ,L65BB
; This entry point is used by the routines at L65AB, L65BB and L65CB.
handle_no_fuel_4:
  LD SP,(sp_5F83)
  JP play
handle_no_fuel_5:
  LD A,(state_game_mode)
  BIT 0,A
  JP NZ,L65AB

; Game Over
;
; Used by the routines at L65AB and L65CB.
game_over:
  LD HL,msg_game_over
  LD (ptr_scroller),HL
  CALL L928D_16
  LD SP,(sp_5F83)
  JP L5D10_0

; Routine at 6587
;
; Used by the routine at demo.
L6587:
  LD A,(state_game_mode)
  BIT 0,A
  RET Z
  LD A,$01
  LD (state_player),A
  CALL print_bridge
  LD A,$10
  RST $10
  LD A,$05
  RST $10
  LD A,$16
  RST $10
  LD A,$14
  RST $10
  LD DE,$8051
  LD BC,$0009
  CALL print_bridge_no_player_2
  RET

; Routine at 65AB
;
; Used by the routine at handle_no_fuel.
L65AB:
  LD A,(state_lives_player_2)
  CP $00
  JP Z,game_over
  LD A,$02
  LD (state_player),A
  JP handle_no_fuel_4

; Routine at 65BB
;
; Used by the routine at handle_no_fuel.
L65BB:
  LD A,(state_lives_player_2)
  CP $00
  JP Z,handle_no_fuel_4
  LD A,$02
  LD (state_player),A
  JP handle_no_fuel_4

; Routine at 65CB
;
; Used by the routine at handle_no_fuel.
L65CB:
  LD A,(state_lives_player_2)
  CP $00
  JP Z,L65CB_1
  LD A,(state_lives_player_1)
  CP $00
  JP NZ,L65CB_0
  JP handle_no_fuel_4
L65CB_0:
  LD A,$01
  LD (state_player),A
L65CB_1:
  LD A,(state_lives_player_1)
  CP $00
  JP Z,game_over
  LD A,$01
  LD (state_player),A
  JP handle_no_fuel_4

; Routine at 65F3
;
; Used by the routine at main_loop.
handle_right:
  LD A,(state_x)
  LD HL,(L5EF3)
  LD (L5F8F),HL
  INC A
  INC A
  LD (state_x),A
  LD C,A
  LD B,$80
  LD A,$01
  LD (state_interaction_mode_5EF5),A
  LD (L8B0C),BC
  DEC C
  DEC C
  LD (L8B0A),BC
  LD BC,$0010             ; Sprite size (2×1 tiles × 8 bytes/tile)
  LD HL,(L5EF7)
  LD (L8B0E),HL
  LD E,$0E                ; COLOR_YELLOW_ON_BLUE
  LD A,(state_player)
  CP $02                  ; Load player 2 color
  CALL Z,ld_cyan_on_blue  ;
  LD D,$08
  LD A,$02
  LD HL,sprite_plane_banked
  CALL render_object
; This entry point is used by the routines at handle_left and L6682.
handle_right_0:
  LD HL,(L5F8F)
  LD (L5EF3),HL
  LD HL,(L8B16)
  LD (L5EF7),HL
  LD A,$04
  LD (L5F69),A
  RET

; Routine at 6642
;
; Used by the routine at main_loop.
handle_left:
  LD A,(state_x)
  LD HL,(L5EF3)
  LD (L5F8F),HL
  DEC A
  DEC A
  LD (state_x),A
  LD C,A
  LD B,$80
  LD A,$01
  LD (state_interaction_mode_5EF5),A
  LD (L8B0C),BC
  INC C
  INC C
  LD (L8B0A),BC
  LD BC,$0010             ; Sprite size (2×1 tiles × 8 bytes/tile)
  LD HL,(L5EF7)
  LD (L8B0E),HL
  LD E,$0E                ; COLOR_YELLOW_ON_BLUE
  LD A,(state_player)
  CP $02                  ; Load player 2 color
  CALL Z,ld_cyan_on_blue  ;
  LD D,$08
  LD A,$02
  LD HL,sprite_plane_banked
  CALL render_object
  JP handle_right_0

; Routine at 6682
;
; Used by the routines at decrease_lives_player_2 and L683B.
L6682:
  LD A,(state_interaction_mode_5F68)
  CP $00
  RET NZ
  LD A,(state_x)
  LD HL,(L5EF3)
  LD (L5F8F),HL
  LD C,A
  LD B,$80
  LD A,$01
  LD (state_interaction_mode_5EF5),A
  LD (L8B0C),BC
  CALL L62DA
  LD (L8B0A),BC
  LD BC,$0010             ; Sprite size (2×1 tiles × 8 bytes/tile)
  LD HL,(L5EF7)
  LD (L8B0E),HL
  LD E,$0E                ; COLOR_YELLOW_ON_BLUE
  LD A,(state_player)
  CP $02                  ; Load player 2 color
  CALL Z,ld_cyan_on_blue  ;
  LD D,$08
  LD HL,sprite_plane
  LD A,(L5F69)
  CP $04
  CALL Z,ld_sprite_plane_banked
  LD A,$02
  CALL render_object
  JP handle_right_0

; Routine at 66CC
;
; Used by the routine at L6682.
ld_sprite_plane_banked:
  LD HL,sprite_plane_banked
  RET

; Increase state_y by the value of state_speed, set state_speed to the default
; value and do something with the state_controls bits.
;
; Used by the routines at decrease_lives_player_2, main_loop and demo.
advance:
  LD BC,(state_y)
  LD H,$00
  LD A,(state_speed)
  LD L,A
  ADD HL,BC
  LD (state_y),HL
  CALL L66EE
  LD A,$02
  LD (state_speed),A
  LD HL,state_controls
  RES 2,(HL)
  SET 1,(HL)
  RET

; Routine at 66EE
;
; Used by the routine at advance.
L66EE:
  LD A,(L5F6E)
  CP $00
  RET Z
  LD B,A
  CALL L62DA
  AND $88
  CP $88
  LD A,B
  CALL Z,L6704
  LD (L5F6E),A
  RET

; Routine at 6704
;
; Used by the routine at L66EE.
L6704:
  LD A,$00
  LD (L5F6D),A
  RET
; This entry point is used by the routine at main_loop.
handle_up:
  LD A,$04
  LD (state_speed),A
  LD HL,state_controls
  SET 2,(HL)              ; Set CONTROLS_BIT_SPEED_ALTERED
  RES 1,(HL)              ; Reset CONTROLS_BIT_SPEED_DECREASED
  RET
; This entry point is used by the routine at main_loop.
handle_down:
  LD A,$01
  LD (state_speed),A
  LD HL,state_controls
  SET 2,(HL)              ; Set CONTROLS_BIT_SPEED_ALTERED
  SET 1,(HL)              ; Set CONTROLS_BIT_SPEED_DECREASED
  RET
; This entry point is used by the routine at main_loop.
handle_fire:
  LD A,(L5EF3)
  CP $00
  RET NZ
  LD A,(state_x)
  ADD A,$04
  LD B,$7E
  LD C,A
  LD (L5EF3),BC
  LD HL,state_controls
  SET 0,(HL)              ; Set CONTROLS_BIT_FIRE
  RET

; Unused
L673C:
  DEFS $01

; Routine at 673D
;
; Used by the routine at main_loop.
L673D:
  LD A,(L5EF3)
  CP $00
  RET Z
  LD BC,(L5EF3)
  LD (L5F8D),BC
  LD A,(L673C)
  CP $01
  CALL Z,L62DA
  LD (L8B0A),BC
  LD BC,(L5EF3)
  LD A,(state_x)
  ADD A,$04
  LD C,A
  LD A,B
  SUB $06
  LD B,A
  AND $F8
  CP $00
  JP Z,L6794
  LD (L5EF3),BC
  LD A,$70
  SUB B
  CALL P,L678E
  LD (L8B0C),BC
  LD A,$02
  LD (state_interaction_mode_5EF5),A
  LD DE,$080C
  LD HL,L8431
  LD BC,$0008
  LD A,$01
  CALL L8B1E
  RET

; Routine at 678E
;
; Used by the routine at L673D.
L678E:
  LD HL,state_controls
  RES 0,(HL)              ; Reset CONTROLS_BIT_FIRE
  RET

; Routine at 6794
;
; Used by the routines at L615E, interact_with_something,
; interact_with_something2 and L673D.
L6794:
  LD BC,(L5EF3)
  CALL L72EF
  LD A,(state_interaction_mode_5F68)
  CP $06
  JP Z,handle_no_fuel
  LD A,$00
  LD (state_interaction_mode_5EF5),A
  LD A,$01
  LD HL,L8451
  LD DE,$0008
  LD A,C
  AND $07
  SRL A
  INC A
  OR A
  SBC HL,DE
L6794_0:
  ADD HL,DE
  DEC A
  JR NZ,L6794_0
  LD A,(L673C)
  CP $01
  CALL Z,L62DA
  LD (L8B0E),HL
  LD (L8B0C),BC
  LD (L8B0A),BC
  LD A,$01
  LD BC,$0008
  LD DE,$080C
  LD HL,L82F5
  CALL render_object
  LD HL,state_controls
  RES 1,(HL)              ; Reset CONTROLS_BIT_SPEED_DECREASED
  LD BC,(L5EF3)
  LD HL,$0000
  LD (L5EF3),HL
  LD A,B
  SUB $06
  LD B,A
  CP $06
  RET Z
  LD A,(state_x)
  ADD A,$04
  LD C,A
  LD HL,L8451
  LD DE,$0008
  LD A,C
  AND $07
  SRL A
  INC A
  OR A
  SBC HL,DE
L6794_1:
  ADD HL,DE
  DEC A
  JR NZ,L6794_1
  LD A,(L5EF6)
  LD D,A
  LD A,$08
  SUB D
  CP $00
  RET Z
  LD D,A
  LD E,$0C
  LD A,$01
  LD (L8B0E),HL
  LD HL,L82F5
  LD (L8B0C),BC
  LD (L8B0A),BC
  LD BC,$0000
  CALL render_object
  RET

; Routine at 6831
;
; Used by the routine at L683B.
L6831:
  LD DE,$0800
  ADD HL,DE
  RET

; Routine at 6836
;
; Used by the routine at L683B.
L6836:
  LD DE,$1000
  ADD HL,DE
  RET

; Routine at 683B
;
; Used by the routine at L60A5.
L683B:
  LD A,$8F
L683B_0:
  LD (L5EF9),A
  AND $3F
  LD HL,L5B00
  LD C,A
  SLA C
  LD B,$00
  ADD HL,BC
  LD E,(HL)
  INC HL
  LD D,(HL)
  EX DE,HL
  LD A,(L5EF9)
  BIT 7,A
  CALL NZ,L6836
  BIT 6,A
  CALL NZ,L6831
  PUSH HL
  LD HL,L5B00
  LD A,(state_speed)
  LD B,A
  LD A,(L5EF9)
  SUB B
  AND $3F
  LD B,$00
  LD C,A
  SLA C
  ADD HL,BC
  LD E,(HL)
  INC HL
  LD D,(HL)
  EX DE,HL
  LD A,(state_speed)
  LD D,A
  LD A,(L5EF9)
  SUB D
  BIT 7,A
  CALL NZ,L6836
  BIT 6,A
  CALL NZ,L6831
  POP DE
  LD BC,$0020
  LDDR
  LD A,(L5EF9)
  DEC A
  CP $00
  JP Z,L683B_1
  CP $7F
  CALL Z,L6682
  LD A,(L5EF9)
  DEC A
  JP L683B_0
L683B_1:
  LD HL,screen_pixels
  LD DE,$00E0
  LD A,(state_speed)
L683B_2:
  LD B,$20
L683B_3:
  LD (HL),$00
  INC HL
  DJNZ L683B_3
  ADD HL,DE
  DEC A
  JP NZ,L683B_2
  RET

; Routine at 68B7
;
; Used by the routine at L60A5.
L68B7:
  LD HL,$5A1F
  LD DE,$5A3F
  LD BC,$020C
  LDDR
  LD HL,$5BDF

; Routine at 68C5
L68C5:
  LD DE,$5820
  LD BC,$0020
  LDIR
  LD A,(L5F6C)
  CP $01
  JP Z,L6927
  CP $02
  JP Z,L6927
L68C5_0:
  LD DE,$5BDF
  LD A,$0C
  LD B,$20
L68C5_1:
  LD (DE),A
  INC DE
  DJNZ L68C5_1
  CALL next_row
  RET
; This entry point is used by the routines at decrease_lives_player_2 and demo.
init_current_bridge:
  LD HL,screen_attributes
  LD B,$20
init_current_bridge_loop:
  LD (HL),$00
  INC HL
  DJNZ init_current_bridge_loop
  CALL L7441_2
  LD (L5F73),HL
  LD A,(state_bridge_player_1)
  LD B,A
  LD A,(state_player)
  CP $02
  CALL Z,L6A4A
  LD A,B
  DEC A
  LD DE,$0030
  LD H,$00
  LD L,A
  OR A
  SBC HL,DE
  JP M,L68C5_3
  LD E,$0F
L68C5_2:
  OR A
  SBC HL,DE
  JP P,L68C5_2
  ADD HL,DE
  LD E,$21
L68C5_3:
  ADD HL,DE
  LD A,L
  INC A
  LD (state_bridge_mod),A
  JP L68C5_0

; Routine at 6927
;
; Used by the routine at L68C5.
L6927:
  LD DE,$5BDF
  LD HL,L8371
  LD BC,$0020
  LDIR
  LD A,$00
  LD (L5F6C),A
  CALL next_row
  RET

; Unused
L693B:
  DEFS $01

; Routine at 693C
;
; Used by the routine at render_terrain.
handle_terrain_element_1_eq_3:
  LD A,$01
  LD (L5F6E),A
  LD A,$06
  LD (L5EEE),A
  RET

; Routine at 6947
;
; Used by the routine at render_terrain.
handle_terrain_element_1_eq_2:
  LD A,$00
  LD (L5F6D),A
  RET

; Increase bridge index and handle overflow by resetting to the first bridge.
;
; Used by the routine at render_terrain.
;
; O:A Always set to 0
increase_bridge_index:
  LD DE,$0000             ; Reset Y-position
  LD (state_y),DE         ;
  LD A,(state_bridge_mod) ; Increase bridge index
  INC A                   ;
  LD (state_bridge_mod),A ;
  CP $31                  ; Check for overflow
  JP Z,next_bridge_index_overflow
  LD A,$00
  RET
next_bridge_index_overflow:
  LD A,$01                ; Reset bridge index
  LD (state_bridge_mod),A ;
  LD A,$00
  RET

; Routine at 696B
;
; Used by the routine at render_terrain.
handle_terrain_element_4_not_fc:
  LD HL,LC600
  LD DE,$0003
  SRL A
  SRL A
  OR A
  SBC HL,DE
  ADD HL,DE
  DEC A
  JR NZ,$6977
  LD A,(HL)
  LD (L5EFA),A
  INC HL
  LD A,(HL)
  LD (L5EFB),A
  INC HL
  LD A,(HL)
  LD (L5EFC),A
  LD A,$00
  LD (L5EFD),A
  RET

; Routine at 6990
;
; Used by the routine at render_terrain.
L6990:
  LD HL,L5EFD
  INC (HL)
  LD A,(L5EFA)
  LD HL,sprite_terrain
  LD DE,$0010
  OR A
  SBC HL,DE
L6990_0:
  ADD HL,DE
  DEC A
  JR NZ,L6990_0
  LD A,(state_terrain_sprite_element_ptr)
  AND $0F
  LD D,$00
  LD E,A
  ADD HL,DE
  LD A,(L5EFB)
  ADD A,(HL)
  PUSH AF
  LD B,$00
  ADD A,$80
  LD D,A
  LD HL,L89F2
  LD A,D
  AND $07
  SRL A
  LD C,A
  SLA C
  LD A,D
  ADD HL,BC
  EX DE,HL
  LD C,A
  LD HL,(L5F7B)
  LD B,$00
  SRL C
  SRL C
  SRL C
  ADD HL,BC
  EX DE,HL
  LD BC,$0002
  LDIR
  DEC DE
  DEC DE
  SRL A
  SRL A
  SRL A
  SUB $10
  AND $0F
  LD B,A
  CP $00
  JP Z,L6990_2
  LD A,$FF
L6990_1:
  DEC DE
  LD (DE),A
  DJNZ L6990_1
L6990_2:
  POP AF
  LD B,$00
  LD D,A
  LD C,$3C
  LD A,(L5EFB)
  LD B,A
  LD A,(L5EFC)
  CP $01
  JP Z,L6990_5
  LD A,(L5EFC)
  CP $02
  JP Z,L6990_6
L6990_3:
  LD D,A
  LD HL,L89FA
  LD A,D
  AND $06
  LD C,A
  LD B,$00
  LD A,D
  ADD HL,BC
  EX DE,HL
  LD C,A
  LD HL,(L5F7B)
  SRL C
  SRL C
  SRL C
  ADD HL,BC
  EX DE,HL
  LD BC,$0002
  LDIR
  LD B,A
  SRL B
  SRL B
  SRL B
  LD A,$0F
  SUB B
  LD B,A
  AND $0F
  CP $00
  RET Z
  LD A,$FF
L6990_4:
  LD (DE),A
  INC DE
  DJNZ L6990_4
  RET
L6990_5:
  LD A,C
  SUB D
  ADD A,C
  JP L6990_3
L6990_6:
  LD A,C
  ADD A,D
  JP L6990_3

; Routine at 6A4A
;
; Used by the routine at L68C5.
L6A4A:
  LD A,(state_bridge_player_2)
  LD B,A
  RET

; Routine at 6A4F
render_terrain:
  LD A,$FF
  LD (state_terrain_sprite_element_ptr),A
  LD HL,level_terrains
  LD DE,$0100
  LD A,(state_bridge_mod)
  OR A
  SBC HL,DE
locate_level_terrain:
  ADD HL,DE
  DEC A
  JR NZ,locate_level_terrain
  LD A,(state_terrain_element_index)
  INC A
  AND $3F
  LD (state_terrain_element_index),A
  CP $00
  CALL Z,increase_bridge_index
  LD DE,$0004
  INC A
  OR A
  SBC HL,DE
locate_level_terrain_element:
  ADD HL,DE
  DEC A
  JR NZ,locate_level_terrain_element
  LD A,(HL)
  LD (state_terrain_element_1),A
  CP $03
  CALL Z,handle_terrain_element_1_eq_3
  CP $02
  CALL Z,handle_terrain_element_1_eq_2
  INC HL
  LD C,(HL)
  INC HL
  LD B,(HL)
  INC HL
  LD (state_terrain_element_23),BC
  LD A,(HL)
  PUSH AF
  AND $FC
  CP $00
  CALL NZ,handle_terrain_element_4_not_fc
  POP AF
  AND $03
  LD (state_terrain_element_4),A
; This entry point is used by the routine at L60A5.
render_terrain_sprite:
  LD A,(state_terrain_element_1)
  LD HL,sprite_terrain
  LD DE,$0010
  OR A
  SBC HL,DE
locate_terrain_sprite:
  ADD HL,DE
  DEC A
  JR NZ,locate_terrain_sprite
  LD A,(state_terrain_sprite_element_ptr)
  INC A
  LD (state_terrain_sprite_element_ptr),A
  CP $10
  JP Z,render_terrain
  AND $0F
  LD D,$00
  LD E,A
  ADD HL,DE
  LD BC,(state_terrain_element_23)
  LD A,(HL)
  BIT 7,A
  JP NZ,L6B7B
  ADD A,B
  PUSH AF
  LD B,$00
  SUB $10
  LD D,A
  LD HL,L693B
  INC (HL)
  LD HL,L89F2
  LD A,D
  AND $07
  SRL A
  LD C,A
  SLA C
  LD A,D
  ADD HL,BC
  EX DE,HL
  LD C,A
  LD HL,(L5F7B)
  LD B,$00
  SRL C
  SRL C
  SRL C
  ADD HL,BC
  EX DE,HL
  LD BC,$0002
  LDIR
  DEC DE
  DEC DE
  LD B,A
  SRL B
  SRL B
  SRL B
  LD A,$FF
render_terrain_0:
  DEC DE
  LD (DE),A
  DJNZ render_terrain_0
  POP AF
  LD D,A
  LD BC,(state_terrain_element_23)
  LD A,(state_terrain_element_4)
  CP $01
  JP Z,render_terrain_3
  LD A,(state_terrain_element_4)
  CP $02
  JP Z,render_terrain_4
render_terrain_1:
  LD D,A
  LD B,$00
  LD HL,L89FA
  LD A,D
  AND $06
  LD C,A
  LD A,D
  ADD HL,BC
  EX DE,HL
  LD C,A
  LD HL,(L5F7B)
  SRL C
  SRL C
  SRL C
  ADD HL,BC
  EX DE,HL
  LD BC,$0002
  LDIR
  LD B,A
  SRL B
  SRL B
  SRL B
  LD A,$1E
  SUB B
  LD B,A
  LD A,$FF
render_terrain_2:
  LD (DE),A
  INC DE
  DJNZ render_terrain_2
  LD A,(L5EFD)
  CP $10
  CALL NZ,L6990
  RET
render_terrain_3:
  LD A,C
  SUB D
  ADD A,C
  JP render_terrain_1
render_terrain_4:
  LD A,C
  ADD A,D
  JP render_terrain_1

; Routine at 6B63
;
; Used by the routine at L6B7B.
L6B63:
  LD A,$00
  LD HL,$8331
  JP L6B7B_0

; Routine at 6B6B
;
; Used by the routine at L6B7B.
L6B6B:
  LD A,$02
  LD HL,$8331
  JP L6B7B_0

; Routine at 6B73
;
; Used by the routine at L6B7B.
L6B73:
  LD A,$02
  LD HL,$8351
  JP L6B7B_0

; Routine at 6B7B
;
; Used by the routine at render_terrain.
L6B7B:
  CP $80
  JP Z,L6B63
  CP $E0
  JP Z,L6B6B
  CP $F0
  JP Z,L6B73
  LD A,$01
  LD HL,$8351
; This entry point is used by the routines at L6B63, L6B6B and L6B73.
L6B7B_0:
  LD DE,(L5F7B)
  LD BC,$0020
  LDIR
  LD (L5F6C),A
  LD A,(L5F6D)
  CP $00
  RET Z
  LD HL,(L5F7B)
; This entry point is used by the routine at interact_with_something.
L6B7B_1:
  LD DE,$000E
  LD B,$04
  ADD HL,DE
L6B7B_2:
  LD (HL),$00
  INC HL
  DJNZ L6B7B_2
  RET

; Bitmask of the CONTROLS_BIT_* bits containing the current controls and other
; information.
state_controls:
  DEFB $00

; Keep the game paused
;
; Used by the routine at int_handler.
pause:
  CALL KEYBOARD
  LD A,(LAST_K)
  CP $68                  ; Loop until anything else than H is pressed
  JP Z,pause              ;
  JP handle_controls

; Handle the Enter key pressed
;
; Used by the routines at main_loop and demo.
handle_enter:
  LD A,$FE                ; Scan Caps Shift
  IN A,($FE)              ;
  BIT 0,A                 ;
  JP Z,restart            ;
  LD A,$7F                ; Scan Symbol Shift
  IN A,($FE)              ;
  BIT 1,A                 ;
  JP Z,select_controls    ;
  RET                     ;
select_controls:
  LD HL,msg_credits       ;
  LD (ptr_scroller),HL    ;
  JP start_1              ;

; Non-maskable interrupt handler
int_handler:
  DI
  PUSH HL
  PUSH DE
  PUSH BC
  PUSH AF
  LD HL,int_counter
  INC (HL)
  LD A,$BF                ; Check if H was pressed
  IN A,($FE)              ;
  BIT 4,A                 ;
  JP Z,pause

; Routine at 6BED
;
; Used by the routine at pause.
handle_controls:
  LD A,(LAST_K)           ; Check if H was pressed
  CP $68                  ;
  JP Z,int_return
  LD HL,state_controls
  BIT 0,(HL)
  CALL NZ,do_fire
  BIT 4,(HL)
  CALL NZ,do_bit4
  LD HL,state_controls
  BIT 5,(HL)
  CALL NZ,explosion_render
  LD HL,state_controls
  BIT 3,(HL)
  JP NZ,do_low_fuel
  LD A,(HL)
  AND $06                 ; Distill the state down to
                          ; CONTROLS_BIT_SPEED_DECREASED and
                          ; CONTROLS_BIT_SPEED_ALTERED.
  CP $02                  ; Check if only CONTROLS_BIT_SPEED_DECREASED is set.
  JP Z,L6C5D              ;
  CP $04                  ; Check if only CONTROLS_BIT_SPEED_ALTERED is set.
  JP Z,L6CB8              ;
  CP $06                  ; Check if both bits are set.
  JP Z,L6CD6              ;

; Return from the non-maskable interrupt handler
;
; Used by the routines at handle_controls, L6C5D, L6CB8, L6CD6 and do_low_fuel.
int_return:
  POP AF
  POP BC
  POP DE
  POP HL
  EI
  RETN

; Data block at 6C2B
L6C2B:
  DEFB $ED,$56,$C3,$08,$00

; Bit4 frame counter
state_bit4_counter:
  DEFB $00

; Do something about bit4
;
; Used by the routine at handle_controls.
do_bit4:
  LD A,(state_bit4_counter)
  INC A
  LD (state_bit4_counter),A
  CP $40
  JP Z,bit4_finish
  LD B,A
  LD A,$40
  SUB B
  LD L,$FF
  LD H,A
  SRL H
  SRL H
  SRL H
  LD DE,$0001
  CALL BEEPER
  DI
  RET

; Finish doing something about bit4
;
; Used by the routine at do_bit4.
bit4_finish:
  LD A,$00
  LD (state_bit4_counter),A
  LD HL,state_controls
  RES 4,(HL)              ; Reset CONTROLS_BIT_BONUS_LIFE
  RET

; Routine at 6C5D
;
; Used by the routine at handle_controls.
L6C5D:
  LD A,(HL)
  AND $0F
  LD E,A
  LD C,$08
L6C5D_0:
  LD A,$10
  OUT ($FE),A
  LD D,E
L6C5D_1:
  DEC D
  JR NZ,L6C5D_1
  LD A,$00
  OUT ($FE),A
  LD D,E
L6C5D_2:
  DEC D
  JR NZ,L6C5D_2
  DEC C
  JP NZ,L6C5D_0
  JP int_return

; Explosion frame counter
explosion_counter:
  DEFB $18

; Render explosion
;
; Used by the routine at handle_controls.
explosion_render:
  LD A,(explosion_counter)
  DEC A
  LD (explosion_counter),A
  CP $00
  JP Z,explosion_render_finish
  LD A,(DE)
  AND $07
  SLA A
  SLA A
  SLA A
  ADD A,$10
  LD E,A
  LD C,$04
explosion_render_0:
  LD A,$10
  OUT ($FE),A
  LD D,E
explosion_render_1:
  DEC D
  JR NZ,explosion_render_1
  LD A,$00
  OUT ($FE),A
  LD A,(explosion_counter)
  LD D,A
explosion_render_2:
  DEC D
  JR NZ,explosion_render_2
  DEC C
  JP NZ,explosion_render_0
  RET

; Finish rendering explosion
;
; Used by the routine at explosion_render.
explosion_render_finish:
  LD A,$18
  LD (explosion_counter),A
  LD HL,state_controls
  RES 5,(HL)              ; Reset CONTROLS_BIT_EXPLODING
  RET

; Routine at 6CB8
;
; Used by the routine at handle_controls.
L6CB8:
  LD A,(HL)
  AND $07
  LD E,A
  LD C,$08
L6CB8_0:
  LD A,$10
  OUT ($FE),A
  LD D,E
L6CB8_1:
  DEC D
  JR NZ,L6CB8_1
  LD A,$00
  OUT ($FE),A
  LD D,$04
L6CB8_2:
  DEC D
  JR NZ,L6CB8_2
  DEC C
  JP NZ,L6CB8_0
  JP int_return

; Routine at 6CD6
;
; Used by the routine at handle_controls.
L6CD6:
  LD A,(HL)
  AND $17
  LD E,A
  LD C,$08
L6CD6_0:
  LD A,$10
  OUT ($FE),A
  LD D,E
L6CD6_1:
  DEC D
  JR NZ,L6CD6_1
  LD A,$00
  OUT ($FE),A
  LD D,$0C
L6CD6_2:
  DEC D
  JR NZ,L6CD6_2
  DEC C
  JP NZ,L6CD6_0
  JP int_return

; Render the low fuel signal
;
; Used by the routine at handle_controls.
do_low_fuel:
  LD C,$03
do_low_fuel_0:
  LD A,(L5F65)
  DEC A
  AND $7F
  LD (L5F65),A
  LD E,A
  LD A,$10
  OUT ($FE),A
  LD D,E
do_low_fuel_1:
  DEC D
  JR NZ,do_low_fuel_1
  LD A,$00
  OUT ($FE),A
  LD D,E
do_low_fuel_2:
  DEC D
  JR NZ,do_low_fuel_2
  DEC C
  JP NZ,do_low_fuel_0
  JP int_return

; Routine at 6D17
;
; Used by the routine at L5D10.
demo:
  LD BC,$0010
  LD (state_y),BC
  LD A,$10
  LD (L5EFD),A
  LD D,$0C                ; PAPER 1; INK 4
  CALL clear_screen
  CALL init_udg
  LD DE,status_line_1
  LD BC,status_line_2 - status_line_1
  CALL PR_STRING
  CALL print_bridge
  CALL L6587
  CALL init_starting_bridge
  CALL init_current_bridge
  LD A,$04
  LD (L5EEE),A
  LD DE,status_line_4
  LD BC,end_status_line_4 - status_line_4
  CALL PR_STRING
  LD A,(state_game_mode)
  ADD A,$31
  RST $10
  LD A,$68
  LD (LAST_K),A
  LD A,$00
  LD (state_terrain_sprite_element_ptr),A
  LD A,(state_bridge_mod)
  LD (L5D43),A
demo_0:
  LD A,$BF
  IN A,($FE)
  BIT 0,A
  CALL Z,handle_enter
  LD A,(L5D43)
  LD B,A
  LD A,(state_bridge_mod)
  SUB B
  CP $05
  JP Z,start_1
  CALL L8A1B
  CALL L60A5
  LD HL,L5EEF
  INC (HL)
  CALL L708E
  CALL L7441
  CALL L7393
  CALL advance
  CALL L8A1B
  LD HL,L5F81
  INC (HL)
  CALL KEYBOARD
  EI
  LD A,(LAST_K)
  CP $0D
  JP Z,play
  LD A,(L5F81)
  AND $03
  CP $00
  JP NZ,demo_0
  LD A,$01
  CALL CHAN_OPEN
  LD A,$10
  RST $10
  LD A,$00
  RST $10
  LD A,$11
  RST $10
  LD A,$00
  RST $10
  LD A,$16
  RST $10
  LD A,$01
  RST $10
  LD A,$1F
  RST $10
  LD HL,(ptr_scroller)
  INC HL
  LD (ptr_scroller),HL
  LD A,(HL)
  CP $FF
  JP Z,demo_1
  RST $10
  LD A,$02
  CALL CHAN_OPEN
  JP demo_0
demo_1:
  LD HL,msg_credits
  LD (ptr_scroller),HL
  LD A,$00
  LD (L5F6D),A
  JP demo_0

; Initializes the starting bridge based on the value of state_game_mode using
; starting_bridges for the lookup.
;
; Used by the routines at init_state and demo.
init_starting_bridge:
  LD A,(state_game_mode)
  SRL A                   ; Shift the game mode right discarding the bit
                          ; corresponding to the number of players and leaving
                          ; the ones corresponding to the starting bridge.
  LD HL,starting_bridges  ; Point to the beginning of the list
  LD B,$00                ; Advance to the element corresponding to the game
  LD C,A                  ; mode.
  ADD HL,BC               ;
  LD A,(HL)               ; Get the starting bridge number
  LD (state_bridge_player_1),A
  LD (state_bridge_player_2),A
  RET

; Routine at 6DFF
;
; Used by the routine at main_loop.
L6DFF:
  LD A,(L5EEF)
  AND $01
  CP $00
  RET NZ
  LD A,(state_fuel)
  DEC A
  LD (state_fuel),A
  AND $03
  CP $00
  RET NZ
  LD A,(state_fuel)
  CP $00
  JP Z,handle_no_fuel
  AND $C0
  CP $00
  CALL Z,register_low_fuel
  LD A,(state_fuel)
  LD B,$A8
  SRL A
  SRL A
  ADD A,$40
  LD C,A
  CALL L8A4E
  LD A,$08
  LD D,$86
L6DFF_0:
  PUSH AF
  CALL L6124
  INC H
  POP AF
  DEC A
  JP NZ,L6DFF_0
  RET

; Routine at 6E40
;
; Used by the routine at interact_with_fuel.
L6E40:
  LD A,(L5F69)
  CP $04
  RET Z
  LD A,(state_fuel)
  AND $FC
  CP $FC
  JP Z,L6E92
  LD DE,$0007
  LD HL,$0333
  CALL BEEPER
  LD A,(state_fuel)
  ADD A,$04
  LD (state_fuel),A
  AND $C0
  CP $00
  CALL NZ,register_sufficient_fuel
  LD A,(state_fuel)
  LD B,$A8
  SRL A
  SRL A
  ADD A,$3F
  LD C,A
  CALL L8A4E
  LD A,$08
  LD D,$C6
L6E40_0:
  PUSH AF
  CALL L6124
  INC H
  POP AF
  DEC A
  JP NZ,L6E40_0
  RET

; Register low fuel level
;
; Used by the routine at L6DFF.
register_low_fuel:
  LD HL,state_controls
  SET 3,(HL)              ; Set CONTROLS_BIT_LOW_FUEL
  RET

; Register sufficient fuel level
;
; Used by the routine at L6E40.
register_sufficient_fuel:
  LD HL,state_controls
  RES 3,(HL)              ; Reset CONTROLS_BIT_LOW_FUEL
  RET

; Routine at 6E92
;
; Used by the routine at L6E40.
L6E92:
  LD DE,$0008
  LD HL,$0111
  CALL BEEPER
  RET

; Explode a single fragment
;
; Used by the routines at L615E, interact_with_something, hit_helicopter_reg,
; hit_ship, hit_helicopter_adv, hit_fighter, hit_balloon, interact_with_fuel,
; handle_no_fuel and L74EE.
;
; I:BC Pointer to the fragment to explode.
explode_fragment:
  LD HL,state_controls
  SET 5,(HL)              ; Set CONTROLS_BIT_EXPLODING
  RES 0,(HL)              ; Reset CONTROLS_BIT_FIRE
  LD A,$18
  LD (explosion_counter),A
  LD HL,viewport_2
; This entry point is used by the routines at render_enemy, render_fuel,
; render_balloon and L7441.
explode_fragment_0:
  LD A,(HL)
  CP $00
  JP Z,explode_fragment_1
  CP $FF
  JP Z,explode_fragment_1
  INC HL
  INC HL
  INC HL
  JP explode_fragment_0
explode_fragment_1:
  LD (HL),C
  INC HL
  LD (HL),B
  INC HL
  LD (HL),D
  CP $FF
  RET NZ
  INC HL
  LD (HL),$FF
  RET

; Routine at 6EC8
;
; Used by the routines at main_loop, handle_no_fuel and L6F7A.
L6EC8:
  LD HL,(viewport_2_ptr)
  LD C,(HL)
  INC HL
  LD B,(HL)
  INC HL
  LD D,(HL)
  INC HL
  LD (viewport_2_ptr),HL
  LD A,C
  CP $00
  JP Z,L6EC8
  CP $FF
  JP Z,L6F73
  LD A,(state_speed)
  ADD A,B
  DEC HL
  DEC HL
  LD (HL),A
  LD A,D
  AND $7F
  INC A
  CP $07
  JP Z,L6F7A
  LD A,D
  INC A
  INC HL
  LD (HL),A
  LD A,B
  AND $88
  CP $88
  JP Z,L6EC8
  LD A,B
  AND $90
  CP $90
  JP Z,L6EC8
  LD A,(HL)
  AND $7F
  CP $01
  CALL Z,L6F63
  CP $02
  CALL Z,L6F67
  CP $03
  CALL Z,L6F6B
  CP $04
  CALL Z,L6F67
  CP $05
  CALL Z,L6F63
  CP $06
  CALL Z,L6F6F
  LD A,(HL)
  LD HL,L82C5
  LD (L8B0E),HL
  LD (L8B10),DE
  LD D,A
  LD A,$00
  LD (state_interaction_mode_5EF5),A
  LD A,$02
  LD (render_object_width),A
  LD A,D
  LD DE,$080C
  LD (L8B0A),BC
  LD (L8B0C),BC
  LD BC,$0000
  BIT 7,A
  JP NZ,L6EC8_0
  PUSH DE
  PUSH BC
  PUSH AF
  PUSH HL
  LD A,$02
  CALL L928D
  POP HL
  POP AF
  POP BC
  POP DE
L6EC8_0:
  LD A,$02
  CALL render_object_1
  JP L6EC8

; Routine at 6F63
;
; Used by the routine at L6EC8.
L6F63:
  LD DE,sprite_explosion_f1
  RET

; Routine at 6F67
;
; Used by the routine at L6EC8.
L6F67:
  LD DE,sprite_explosion_f2
  RET

; Routine at 6F6B
;
; Used by the routine at L6EC8.
L6F6B:
  LD DE,sprite_explosion_f3
  RET

; Routine at 6F6F
;
; Used by the routine at L6EC8.
L6F6F:
  LD DE,L82F5
  RET

; Routine at 6F73
;
; Used by the routine at L6EC8.
L6F73:
  LD HL,viewport_2
  LD (viewport_2_ptr),HL
  RET

; Routine at 6F7A
;
; Used by the routine at L6EC8.
L6F7A:
  DEC HL
  LD (HL),$00
  JP L6EC8

; This routine gets called when the screen scrolls by another fragment
;
; Used by the routines at L68C5 and L6927.
next_row:
  LD A,$00
  LD (state_interaction_mode_5EF5),A
  LD HL,levels
  LD DE,$0100
  LD A,(state_bridge_mod)
  OR A
  SBC HL,DE
locate_level:
  ADD HL,DE               ; Have HL point to the level defined by A
  DEC A                   ;
  JR NZ,locate_level      ;
  LD BC,(state_y)
  SRL B
  RR C
  SRL B
  RR C
  RES 0,C
  ADD HL,BC
  LD D,(HL)
  INC HL
  LD E,(HL)
  LD A,E
  CP $00
  RET Z
  BIT 3,D
  JP NZ,render_rock
  LD A,D
  AND $07
  CP $07
  JP Z,render_fuel
  JP render_enemy

; Render rock
;
; Used by the routine at next_row.
;
; I:D Some info (probably, sprite array index)
; I:E Some info (probably, position)
render_rock:
  LD A,D
  AND $07
  OR A
  LD HL,sprite_rock
  LD BC,$0030             ; Sprite size (3×2 tiles × 8 bytes/tile)
  INC A
  SBC HL,BC
render_rock_0:
  ADD HL,BC
  DEC A
  JR NZ,render_rock_0
  LD B,$00
  LD C,E
  LD (L8B0E),HL
  LD HL,L82F5
  LD (L8B0C),BC
  LD (L8B0A),BC
  LD A,$03
  LD DE,$1014
  CALL render_object
  RET

; Load array of arrays of enemy headed right sprites.
;
; Used by the routine at ld_enemy_sprites.
;
; O:HL Pointer to the array of arrays of sprites.
ld_enemy_sprites_right:
  LD HL,sprite_enemies_right
  RET

; Routine at 6FEA
;
; Used by the routines at render_enemy, render_fuel and render_balloon.
L6FEA:
  CALL L62DA
  LD (L8B0C),BC
  LD (L8B0A),BC
  RET

; Render enemy
;
; Used by the routine at next_row.
;
; I:A Enemy type (6-balloon)
; I:D Enemy info and type as well
render_enemy:
  CP $06
  JP Z,render_balloon
  CP $05
  CALL Z,L7046
  CP $04
  CALL Z,L7046
  CALL ld_enemy_sprites
  LD B,$00
  LD C,E
  PUSH HL
  LD HL,viewport_1
  CALL explode_fragment_0
  POP HL
  CALL L6FEA
  LD BC,$0018             ; Sprite size (3×1 tiles × 8 bytes/tile)
  LD E,$0E
  LD A,D
  AND $07
  CP $02                  ; Check if it's an OBJECT_SHIP
  CALL Z,ld_cyan_on_blue  ;
  CP $05
  CALL Z,L703B
  CP $04
  CALL Z,L703E
  LD A,$03
  LD D,$08
  CALL L8B1E
  CALL L72EF
  RET

; Load COLOR_CYAN_ON_BLUE into E
;
; Used by the routines at handle_right, handle_left, L6682, render_enemy, L708E
; and L75D0.
;
; O:E Attribute value
ld_cyan_on_blue:
  LD E,$0D
  RET

; Routine at 703B
;
; Used by the routine at render_enemy.
L703B:
  LD E,$00
  RET

; Routine at 703E
;
; Used by the routine at render_enemy.
L703E:
  LD E,$00
  BIT 5,D
  RET Z
  LD E,$04
  RET

; Routine at 7046
;
; Used by the routine at render_enemy.
L7046:
  LD A,$A8
  LD (L8C3C),A            ; Put "XOR B" into L8C3C
  LD A,$00
  LD (L8C1B),A            ; Put "NOP" into L8C1B
  RET

; Render fuel station
;
; Used by the routine at next_row.
;
; I:E X position
render_fuel:
  LD B,$00
  LD C,E
  LD HL,viewport_1
  CALL explode_fragment_0
  LD HL,sprite_fuel
  CALL L6FEA
  LD BC,$0000
  LD A,$02
  LD DE,$190B
  CALL L8B1E
  RET

; Render balloon
;
; Used by the routine at render_enemy.
;
; I:E X position
render_balloon:
  LD B,$00
  LD C,E
  LD HL,sprite_balloon
  LD A,$00
  LD (state_interaction_mode_5EF5),A
  PUSH HL
  LD HL,viewport_1
  CALL explode_fragment_0
  POP HL
  CALL L6FEA
  LD BC,$0020             ; Sprite size (2×2 tiles × 8 bytes/tile)
  LD A,$02
  LD DE,$100E
  CALL L8B1E
  RET

; Routine at 708E
;
; Used by the routines at decrease_lives_player_2, main_loop, demo, L7158,
; L71A2, L7224, L724C, L7296, L7302, L7358, L74EE, L754C, L75D0, L762E, L7649
; and L76DA.
L708E:
  LD A,$00
  LD (state_interaction_mode_5EF5),A
  LD HL,(viewport_1_ptr)
  LD C,(HL)
  INC HL
  LD B,(HL)
  INC HL
  LD D,(HL)
  INC HL
  LD (viewport_1_ptr),HL
  LD A,C
  CP $00
  JP Z,L708E
  CP $FF
  JP Z,init_current_object_ptr
  CALL L62DA
  DEC HL
  DEC HL
  LD (HL),B
  LD A,B
  AND $88
  CP $88
  JP Z,L762E
  LD A,D
  AND $07
  CP $03
  PUSH DE
  PUSH HL
  PUSH BC
  CALL Z,L73DD
  POP BC
  POP HL
  POP DE
  LD A,(state_interaction_mode_5F68)
  CP $01
  JP Z,L708E
  BIT 7,D
  JP NZ,L708E_0
  LD A,(L5F5F)
  LD E,A
  LD A,(int_counter)
  AND E
  CP $00
  JP NZ,L7224
  SET 7,D
  INC HL
  LD (HL),D
  LD HL,int_counter
  INC (HL)
L708E_0:
  LD A,D
  AND $07
  CP $05
  JP Z,L7158
  CP $06
  JP Z,L7649
  CP $07
  JP Z,L754C
  CP $04
  JP Z,L7296
  CP $00
  JP Z,L71A2
  LD A,(L5EEF)
  AND $01
  CP $00
  JP Z,L724C
  BIT 6,D
  JP Z,L75A2
  PUSH BC
  LD A,C
  SUB $10
  LD C,A
  CALL L8A4E
  LD A,(HL)
  POP BC
  CP $00
  CALL NZ,L75D0
  LD (L8B0A),BC
  DEC C
  DEC C
; This entry point is used by the routines at L7224 and L75A2.
L708E_1:
  LD HL,(viewport_1_ptr)
  DEC HL
  LD D,(HL)
  DEC HL
  LD (HL),B
  DEC HL
  LD (HL),C
  LD (L8B0C),BC
  LD HL,L82C5
  LD (L8B0E),HL
  CALL ld_enemy_sprites
  LD BC,$0018             ; Sprite frame size (3×1 tiles × 8 bytes/tile)
  LD E,$0E                ; COLOR_YELLOW_ON_BLUE
  LD A,D
  AND $07
  CP $02                  ; Check if it's an OBJECT_SHIP
  CALL Z,ld_cyan_on_blue  ;
  LD A,$03
  LD D,$08
  CALL render_object
  JP L708E

; Routine at 7155
;
; Used by the routine at L7158.
L7155:
  LD C,$E8
  RET

; Routine at 7158
;
; Used by the routine at L708E.
L7158:
  LD (L8B0A),BC
  BIT 6,D
  JP Z,L7158_1
  DEC C
  DEC C
  DEC C
  DEC C
  LD A,C
  CP $00
  CALL Z,L7155
L7158_0:
  LD HL,(viewport_1_ptr)
  DEC HL
  LD D,(HL)
  DEC HL
  LD (HL),B
  DEC HL
  LD (HL),C
  LD (L8B0C),BC
  CALL ld_enemy_sprites
  LD BC,$0018             ; Sprite size (3×1 tiles × 8 bytes/tile)
  CALL L72E6
  LD A,$03
  LD (state_interaction_mode_5EF5),A
  LD DE,$0800
  CALL L8B1E
  CALL L72EF
  JP L708E
L7158_1:
  INC C
  INC C
  INC C
  INC C
  LD A,C
  CP $E8
  CALL Z,L719F
  JP L7158_0

; Routine at 719F
;
; Used by the routine at L7158.
L719F:
  LD C,$04
  RET

; Routine at 71A2
;
; Used by the routine at L708E.
L71A2:
  LD A,(L5EEF)
  AND $01
  CP $01
  JP NZ,L708E
  LD (L8B0A),BC
  LD (L8B0C),BC
  LD A,B
  AND $80
  CP $80
  JP Z,L71A2_2
  LD A,D
  SRL A
  SRL A
  SRL A
  AND $07
  INC A
  CP $07
  JP Z,L71A2_2
  SLA A
  SLA A
  SLA A
  LD E,A
  LD A,D
  AND $C7
  OR E
  LD HL,(viewport_1_ptr)
  DEC HL
  LD (HL),A
  LD HL,$8FFC
  SRL A
  SRL A
  SRL A
  AND $07
  LD BC,$0020
  OR A
  SBC HL,BC
L71A2_0:
  ADD HL,BC
  DEC A
  JR NZ,L71A2_0
L71A2_1:
  LD BC,L82C5
  LD (L8B0E),BC
  LD A,(L5EEF)
  AND $06
  SRL A
  ADD A,$0C
  LD E,A
  LD BC,$0000
  LD D,$10
  LD A,$02
  CALL render_object
  JP L708E
L71A2_2:
  LD HL,(viewport_1_ptr)
  DEC HL
  DEC HL
  DEC HL
  LD (HL),$00
  LD HL,L82F5
  LD A,(L7383)
  RES 5,A
  LD (L7383),A
  JP L71A2_1

; Routine at 7224
;
; Used by the routine at L708E.
L7224:
  LD A,D
  CP $06
  JP Z,L7649_1
  LD A,(L5EEF)
  AND $01
  CP $01
  JP Z,L724C
  LD A,D
  AND $07
  CP $01
  JP Z,L7224_0
  CP $03
  JP NZ,L708E
L7224_0:
  LD (L8B0A),BC
  JP L708E_1

; Routine at 7248
;
; Used by the routine at L724C.
L7248:
  LD HL,L8AC8
  RET

; Routine at 724C
;
; Used by the routines at L708E and L7224.
L724C:
  LD A,D
  AND $07
  CP $01
  JP Z,L724C_0
  CP $03
  JP NZ,L708E
L724C_0:
  LD HL,(viewport_1_ptr)
  DEC HL
  LD D,(HL)
  DEC HL
  LD B,(HL)
  DEC HL
  LD C,(HL)
  LD HL,L8AB8
  BIT 6,D
  CALL Z,L7248
  LD (L8B0C),BC
  LD (L8B0A),BC
  PUSH HL
  CALL ld_enemy_sprites
  LD HL,L82C5
  LD (L8B0E),HL
  POP HL
  LD DE,$020E
  LD BC,$0004
  LD A,$02
  CALL render_object
  JP L708E

; Routine at 728B
;
; Used by the routine at L7296.
L728B:
  INC C
  INC C
  INC C
  INC C
  RET

; Routine at 7290
;
; Used by the routine at L7296.
L7290:
  LD A,$01
  LD (L5EF2),A
  RET

; Routine at 7296
;
; Used by the routine at L708E.
L7296:
  LD A,(L5EEF)
  AND $01
  CP $01
  JP Z,L708E
  LD (L8B0A),BC
  PUSH DE
  PUSH BC
  BIT 5,D
  JP NZ,L7302
  POP BC
  POP DE
  LD A,(L5F6D)
  CP $00
  JP NZ,L74EE
; This entry point is used by the routine at L7302.
L7296_0:
  DEC C
  DEC C
  BIT 6,D
  CALL Z,L728B
  LD A,C
  CP $80
  CALL Z,L7290
  LD HL,(viewport_1_ptr)
  DEC HL
  LD D,(HL)
  DEC HL
  LD (HL),B
  DEC HL
  LD (HL),C
  LD (L8B0C),BC
  CALL ld_enemy_sprites
  LD BC,$0018             ; Sprite size (3×1 tiles × 8 bytes/tile)
  CALL L72E6
  LD A,$03
  LD DE,$0800
  CALL L8B1E
  CALL L72EF
  JP L708E

; Routine at 72E6
;
; Used by the routines at L7158 and L7296.
L72E6:
  LD A,$A8
  LD (L8C1B),A            ; Put "XOR B" into L8C1B
  LD (L8C3C),A            ; Put "XOR B" into L8C3C
  RET

; Routine at 72EF
;
; Used by the routines at L6794, render_enemy, L7158 and L7296.
L72EF:
  LD A,$B0
  LD (L8C1B),A            ; Put "OR B" into L8C1B
  LD (L8C3C),A            ; Put "OR B" into L8C3C
  RET

; Routine at 72F8
;
; Used by the routine at L7302.
L72F8:
  LD A,C
  SUB $20
  LD C,A
  RET

; Routine at 72FD
;
; Used by the routine at L7302.
L72FD:
  LD A,C
  ADD A,$28
  LD C,A
  RET

; Routine at 7302
;
; Used by the routine at L7296.
L7302:
  LD BC,(L8B0A)
  LD A,C
  ADD A,$10
  LD C,A
  BIT 6,D
  CALL NZ,L72F8
  CALL L8A4E
  LD A,(HL)
  CP $FF
  POP BC
  POP DE
  JP Z,L7296_0
  LD A,(L7383)
  BIT 7,A
  JP NZ,L708E
  BIT 5,A
  JP NZ,L708E
  CP $00
  JP Z,L7302_1
  RES 5,A
; This entry point is used by the routine at L735E.
L7302_0:
  SET 7,A
  LD (L7383),A
  LD A,C
  SUB $10
  LD C,A
  BIT 6,D
  CALL Z,L72FD
  LD (L7385),BC
  JP L708E
L7302_1:
  BIT 4,D
  JP NZ,L735E
  LD A,D
  AND $40
  LD D,A
  LD A,(int_counter)
  AND $03
  LD E,A
  LD A,D
  INC E
  ADD A,E
  JP L7302_0

; Routine at 7358
;
; Used by the routine at L735E.
L7358:
  CALL L7441_2
  JP L708E

; Routine at 735E
;
; Used by the routine at L7302.
L735E:
  LD A,(L5EF2)
  CP $01
  JP Z,L7358
  PUSH BC
  LD A,C
  BIT 7,A
  CALL Z,L7380
  RES 7,A
  SRL A
  SRL A
  SRL A
  SRL A
  LD B,A
  LD A,D
  AND $40
  ADD A,B
  POP BC
  JP L7302_0

; Routine at 7380
;
; Used by the routine at L735E.
L7380:
  XOR $7F
  RET

; Data block at 7383
L7383:
  DEFB $00

; Data block at 7384
L7384:
  DEFB $00

; Data block at 7385
L7385:
  DEFW $0000

; Routine at 7387
;
; Used by the routine at L7441.
L7387:
  LD A,C
  SUB E
  SUB E
  SUB E
  SUB E
  LD C,A
  RET

; Routine at 738E
;
; Used by the routine at L7393.
L738E:
  LD A,C
  ADD A,$10
  LD C,A
  RET

; Routine at 7393
;
; Used by the routines at main_loop and demo.
L7393:
  LD BC,(L5F73)
  LD A,B
  CP $00
  RET Z
  CALL L62DA
  LD (L8B0A),BC
  LD A,C
  SUB $08
  LD C,A
  LD A,B
  AND $88
  CP $88
  JP Z,L7393_0
  LD A,(L5F75)
  BIT 6,A
  CALL Z,L738E
  LD (L8B0C),BC
  LD (L5F73),BC
  LD A,$04
  LD (state_interaction_mode_5EF5),A
  LD A,$01
  LD E,$00
  LD D,$01
  LD HL,L82C5
  CALL L8B1E
  RET
L7393_0:
  LD BC,$0000
  LD (L5F73),BC
  RET

; Routine at 73D8
;
; Used by the routine at L73DD.
L73D8:
  LD A,C
  ADD A,$08
  LD C,A
  RET

; Routine at 73DD
;
; Used by the routine at L708E.
L73DD:
  LD A,(state_interaction_mode_5F68)
  CP $01
  RET Z
  LD BC,(L5F73)
  LD A,B
  CP $00
  RET NZ
  LD DE,$0001
  LD HL,$2800
  CALL BEEPER
  LD HL,(viewport_1_ptr)
  DEC HL
  LD D,(HL)
  DEC HL
  LD B,(HL)
  DEC HL
  LD C,(HL)
  LD A,C
  AND $F8
  LD C,A
  LD A,D
  AND $40
  LD (L5F75),A
  BIT 6,A
  CALL Z,L73D8
  INC B
  INC B
  INC B
  INC B
  LD (L5F73),BC
  RET

; Routine at 7415
;
; Used by the routine at L6136.
L7415:
  LD BC,(L5F73)
  BIT 7,B
  JP Z,L7415_0
  RES 7,B
  LD A,B
  SUB $08
  JP P,L7415_0
  LD A,(state_x)
  AND $F8
  CP C
  JP Z,handle_no_fuel
  ADD A,$08
  CP C
  JP Z,handle_no_fuel
L7415_0:
  LD BC,$0000
  LD (L5F73),BC
  POP DE
  POP DE
  POP DE
  POP DE
  RET

; Routine at 7441
;
; Used by the routines at main_loop and demo.
L7441:
  LD A,(L7383)
  BIT 7,A
  RET Z
  LD BC,(L7385)
  LD A,(L7384)
  INC A
  LD (L7384),A
  CP $08
  JP Z,L7441_1
  LD DE,$0002
  LD H,A
  LD L,$00
  CALL BEEPER
  LD BC,(L7385)
  CALL L62DA
  LD (L8B0A),BC
  LD A,(L7383)
  LD D,A
  AND $07
  LD E,A
  LD A,C
  ADD A,E
  ADD A,E
  LD C,A
  BIT 6,D
  CALL NZ,L7387
  INC B
  LD (L8B0C),BC
  LD (L7385),BC
  LD A,$00
  LD (state_interaction_mode_5EF5),A
  LD A,B
  AND $88
  CP $88
  JP Z,L7441_0
  LD HL,L8431
  LD DE,$0100
  LD A,$01
  LD BC,$0008
  CALL L8B1E
  RET
L7441_0:
  LD BC,(L8B0A)
  LD HL,L8431
  LD A,C
  AND $06
  SLA A
  SLA A
  LD D,$00
  LD E,A
  ADD HL,DE
  LD (L8B0E),HL
  LD HL,L82F5
  LD DE,$0100
  LD A,$01
  LD BC,$0008
  CALL render_object
  JP L7441_2
L7441_1:
  LD D,$80
  LD HL,$0000
  LD (L7385),HL
  LD A,(L7383)
  RES 7,A
  SET 5,A
  LD (L7383),A
  LD HL,viewport_1
  CALL explode_fragment_0
  LD A,$00
  LD (L7384),A
  RET
; This entry point is used by the routines at L68C5, L7358 and L762E.
L7441_2:
  LD HL,$0000
  LD (L7383),HL
  LD (L7385),HL
  RET

; Routine at 74EE
;
; Used by the routine at L7296.
L74EE:
  LD HL,(viewport_1_ptr)
  DEC HL
  DEC HL
  DEC HL
  LD C,(HL)
  LD H,$00
  LD L,$70
  LD D,$00
  LD A,C
  ADD A,$0A
  LD E,A
  OR A
  SBC HL,DE
  JP P,L74EE_0
  LD H,$00
  LD L,$90
  LD D,$00
  LD E,C
  OR A
  SBC HL,DE
  JP M,L74EE_0
  LD HL,(viewport_1_ptr)
  DEC HL
  DEC HL
  LD B,(HL)
  DEC HL
  LD (HL),$00
  LD D,$80
  CALL explode_fragment
  LD A,$25                ; POINTS_TANK
  CALL add_points
L74EE_0:
  LD HL,(viewport_1_ptr)
  DEC HL
  SET 4,(HL)              ; Set CONTROLS_BIT_BONUS_LIFE
  SET 5,(HL)              ; Set CONTROLS_BIT_EXPLODING
  DEC HL
  DEC HL
  LD A,(state_player)
  CP $01
  JP Z,L74EE_2
  LD A,(state_bridge_player_2)
L74EE_1:
  LD B,A
  LD A,$07
  SUB B
  JP M,L708E
  LD (HL),$00
  JP L708E
L74EE_2:
  LD A,(state_bridge_player_1)
  JP L74EE_1

; Routine at 754C
;
; Used by the routine at L708E.
L754C:
  LD (L8B0A),BC
  LD (L8B0C),BC
  LD D,$19
  LD A,B
  ADD A,$19
  AND $90
  CP $90
  CALL Z,L758A
  LD BC,(L8B0A)
  LD A,B
  AND $88
  CP $88
  JP Z,L708E
  LD A,B
  AND $87
  CP $87
  JP Z,L708E
  LD HL,sprite_fuel
  LD BC,$0000
  LD A,(L5EEF)
  AND $04
  ADD A,$0B
  LD E,A
  LD A,$02
  CALL L8B1E
  JP L708E

; Routine at 758A
;
; Used by the routine at L754C.
L758A:
  LD H,$00
  LD L,B
  LD BC,$0019
  ADD HL,BC
  LD BC,$0090
  OR A
  SBC HL,BC
  LD B,$00
  LD C,L
  LD H,$00
  LD L,D
  OR A
  SBC HL,BC
  LD D,L
  RET

; Routine at 75A2
;
; Used by the routine at L708E.
L75A2:
  PUSH BC
  LD A,C
  ADD A,$20
  LD C,A
  CALL L8A4E
  LD A,(HL)
  POP BC
  CP $00
  CALL NZ,L75D0
  LD (L8B0A),BC
  INC C
  INC C
  JP L708E_1

; Load array of enemy sprites.
;
; Used by the routines at render_enemy, L708E, L7158, L724C, L7296 and L75D0.
;
; I:D The four lowest bits is the enemy type (one of the first five OBJECT_*
;     constants), the 6th bit is direction (reset is right, set is left).
; I:HL Pointer to the array of sprites
ld_enemy_sprites:
  LD HL,sprite_enemies_left
  LD BC,$0060             ; Enemy sprite array size (3×1 tiles × 8 bytes/tile ×
                          ; 4 frames)
  BIT 6,D
  CALL Z,ld_enemy_sprites_right
  LD A,D
  AND $07
  OR A
  SBC HL,BC
ld_enemy_sprites_loop:
  ADD HL,BC
  DEC A
  JR NZ,ld_enemy_sprites_loop
  RET

; Routine at 75D0
;
; Used by the routines at L708E and L75A2.
L75D0:
  LD (L8B0A),BC
  LD A,B
  SUB $80
  RET P
  LD BC,(L8B0A)
  POP HL
  LD HL,(viewport_1_ptr)
  DEC HL
  LD D,(HL)
  CALL ld_enemy_sprites
  LD BC,(L8B0A)
  LD A,C
  AND $07
  LD BC,$0018
  SRL A
  OR A
  INC A
  SBC HL,BC
L75D0_0:
  ADD HL,BC
  DEC A
  JR NZ,L75D0_0
  LD (L8B0E),HL
  LD BC,(L8B0A)
  LD (L8B0C),BC
  LD A,D
  XOR $40
  LD D,A
  LD HL,(viewport_1_ptr)
  DEC HL
  LD (HL),A
  CALL ld_enemy_sprites
  LD E,$0E
  LD A,D
  AND $07
  CP $02
  CALL Z,ld_cyan_on_blue
  LD D,$08
  LD A,$03
  LD BC,$0018
  CALL render_object
  JP L708E

; Point viewport_1_ptr to the head of viewport_1.
;
; Used by the routine at L708E.
init_current_object_ptr:
  LD HL,viewport_1
  LD (viewport_1_ptr),HL
  RET

; Routine at 762E
;
; Used by the routine at L708E.
L762E:
  DEC HL
  LD (HL),$00
  LD A,D
  AND $07
  CP $04
  JP NZ,L708E
  LD A,$00
  LD (L5EF2),A
  BIT 5,D
  JP Z,L708E
  CALL L7441_2
  JP L708E

; Routine at 7649
;
; Used by the routine at L708E.
L7649:
  BIT 7,B
  JP NZ,L7649_1
  LD A,(L5EEF)
  AND $03
  CP $01
  JP NZ,L7649_1
  BIT 6,D
  JP Z,L7649_2
  PUSH BC
  LD A,C
  SUB $10
  LD C,A
  CALL L8A4E
  LD A,(HL)
  POP BC
  CP $00
  CALL NZ,L76DA
  PUSH BC
  LD A,C
  SUB $10
  LD C,A
  LD A,B
  ADD A,$08
  LD B,A
  CALL L8A4E
  LD A,(HL)
  POP BC
  CP $00
  CALL NZ,L76DA
  LD (L8B0A),BC
  DEC C
  DEC C
L7649_0:
  LD HL,(viewport_1_ptr)
  DEC HL
  LD D,(HL)
  DEC HL
  LD (HL),B
  DEC HL
  LD (HL),C
  LD (L8B0C),BC
  LD HL,sprite_balloon
  LD A,(L5EEF)
  AND $03
  ADD A,$0C
  LD E,A
  LD A,$02
  LD BC,$0020
  LD E,$0E
  LD D,$10
  CALL L8B1E
  JP L708E
; This entry point is used by the routine at L7224.
L7649_1:
  JP L708E
L7649_2:
  PUSH BC
  LD A,C
  ADD A,$20
  LD C,A
  CALL L8A4E
  LD A,(HL)
  POP BC
  CP $00
  CALL NZ,L76DA
  PUSH BC
  LD A,C
  ADD A,$18
  LD C,A
  LD A,B
  ADD A,$08
  LD B,A
  CALL L8A4E
  LD A,(HL)
  POP BC
  CP $00
  CALL NZ,L76DA
  LD (L8B0A),BC
  INC C
  INC C
  JP L7649_0

; Routine at 76DA
;
; Used by the routine at L7649.
L76DA:
  LD (L8B0A),BC
  LD A,B
  SUB $80
  RET P
  LD BC,(L8B0A)
  POP HL
  LD HL,(viewport_1_ptr)
  DEC HL
  LD D,(HL)
  LD HL,sprite_balloon
  LD BC,(L8B0A)
  LD A,C
  AND $06
  LD BC,$0020
  SRL A
  INC A
  OR A
  SBC HL,BC
L76DA_0:
  ADD HL,BC
  DEC A
  JR NZ,L76DA_0
  LD (L8B0E),HL
  LD BC,(L8B0A)
  LD (L8B0C),BC
  LD A,D
  XOR $40
  LD HL,(viewport_1_ptr)
  DEC HL
  LD (HL),A
  LD HL,sprite_balloon
  LD DE,$100D
  LD A,$02
  LD BC,$0020
  CALL render_object
  JP L708E

; Data block at 7727
L7727:
  DEFB $C3,$90,$EA,$0D,$00,$05,$1F,$00
  DEFB $F5,$AC,$30,$0E,$00,$00,$00,$00
  DEFB $00,$2C,$30,$0E,$00,$00,$00,$00
  DEFB $00,$3B,$C0

; Message at 7742
L7742:
  DEFM "23762"

; Data block at 7747
L7747:
  DEFB $0E,$00,$00,$D2,$5C,$00,$0D,$9A
  DEFB $05,$2C,$00,$F8

; Message at 7753
L7753:
  DEFM "\"River raid\""

; Data block at 775F
L775F:
  DEFB $CA,$36,$0E,$00,$00,$06,$00,$00
  DEFB $3A,$D7,$35,$0E,$00,$00,$05,$00
  DEFB $00

; Message at 7770
L7770:
  DEFM ",10"

; Data block at 7773
L7773:
  DEFB $0E,$00,$00,$0A,$00,$00,$3A,$D6
  DEFB $22,$22,$0D,$00,$06,$0C,$00,$F9
  DEFB $C0

; Message at 7784
L7784:
  DEFM "6e4"

; Data block at 7787
L7787:
  DEFB $0E,$00,$00,$60,$EA,$00,$0D,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00

; Control type chosen from the dialog before the validation
tmp_control_type:
  DEFB $00

; Demo mode flag ($00 - No, $01 - Yes)
state_demo_mode:
  DEFB $00

; Stores the number of remaining iterations before the control choice dialog
; switches to demo mode
controls_timer:
  DEFW $0000

; Routine at 7804
;
; Used by the routine at start.
clear_and_setup:
  LD (setup_sp),SP
  LD D,$07                ; PAPER 0; INK 7
  CALL clear_screen
  JP setup

; Temporary stack pointer used by the control choice dialog
setup_sp:
  DEFW $0000

; Keyboard configuration;
msg_keyboard_config:
  DEFM $10,$02            ; INK RED
  DEFM $16,$00,$08        ; AT 0,8
  DEFM "LEFT........O"
  DEFM $10,$03            ; INK MAGENTA
  DEFM $16,$02,$08        ; AT 2,8
  DEFM "RIGHT.......P"
  DEFM $10,$06            ; INK YELLOW
  DEFM $16
  DEFM $04,$08            ; AT 4,8
  DEFM "FASTER......2"
  DEFM $10,$04            ; INK GREEN
  DEFM $16,$06,$08        ; AT 6,8
  DEFM "SLOWER......W"
  DEFM $10,$05            ; INK CYAN
  DEFM $16,$08,$08        ; AT 8,8
  DEFM "FIRE......Bottom"
  DEFM $16,$09,$08        ; AT 9,8
  DEFM "           row"
  DEFM $10,$07            ; INK WHITE
msg_instructions:
  DEFM $16,$0B,$07        ; AT 11,7
  DEFM "Press H to pause"
  DEFM $16,$0D,$06        ; AT 13,6
  DEFM "Press ENTER to play"
  DEFM $16,$0F,$04        ; AT 15,4
  DEFM "Press CAPS SHIFT & ENTER"
  DEFM $16,$10,$03        ; AT 16,3
  DEFM "to reset the game you have"
  DEFM $16,$11,$09        ; AT 17,9
  DEFM "just played"
  DEFM $16,$13,$00        ; AT 19,0
  DEFM "Press SYM SHIFT & ENTER to reset"
  DEFM $16,$14,$05        ; AT 20,5
  DEFM "the menu selections"
msg_game_mode:
  DEFM $10,$07            ; INK WHITE
  DEFM $11,$00            ; PAPER BLACK
  DEFM $16,$02,$03        ; AT 2,3
  DEFM "Press corresponding number"
  DEFM $16,$03,$0A        ; AT 3,10
  DEFM "on keyboard"
  DEFM $16,$06,$06        ; AT 6,6
  DEFM " Game    No of  Starting"
  DEFM $16,$07,$06        ; AT 7,6
  DEFM "Number  Players  Bridge"
  DEFM $16,$09,$09        ; AT 9,9
  DEFM "1       1       1"
  DEFM $16,$0A,$09        ; AT 10,9
  DEFM "2       2       1"
  DEFM $16,$0C,$09        ; AT 12,9
  DEFM "3       1       5"
  DEFM $16,$0D,$09        ; AT 13,7
  DEFM "4       2       5"
  DEFM $16,$0F,$09        ; AT 15,9
  DEFM "5       1      20"
  DEFM $16,$10,$09        ; AT 16,9
  DEFM "6       2      20"
  DEFM $16,$12,$09        ; AT 18,9
  DEFM "7       1      30"
  DEFM $16,$13,$09        ; AT 19,9
  DEFM "8       2      30"
msg_control_types:
  DEFM $10,$07            ; INK WHITE
  DEFM $11,$00            ; PAPER BLACK
  DEFM $16,$03,$03        ; AT 3,3
  DEFM "Press corresponding number"
  DEFM $16,$04,$0A        ; AT 4,10
  DEFM "on keyboard"
  DEFM $16,$08,$06        ; AT 8,6
  DEFM "1. KEYBOARD CONTROL"
  DEFM $16,$0A,$06        ; AT 10,6
  DEFM "2. SINCLAIR INTERFACE"
  DEFM $16,$0C,$06        ; AT 12,6
  DEFM "3. KEMPSTON INTERFACE"
  DEFM $16,$0E,$06        ; AT 14,6
  DEFM "4. CURSOR INTERFACE"

; Initial game setup
;
; Used by the routine at clear_and_setup.
;
; Initializes tmp_control_type, state_demo_mode and state_game_mode.
; Sets the stack pointer to setup_sp and returns using that stack.
setup:
  LD DE,msg_control_types ; Print control types dialog
  LD BC,$008B             ;
  CALL PR_STRING          ;
  LD HL,$FFFF             ; Initialize timer
  LD (controls_timer),HL  ;
  LD A,$0D
  LD (LAST_K),A

; Wait until the user chooses a valid control type or switch to the demo mode
; on timeout.
controls_input:
  LD HL,(controls_timer)  ; Decrease timer
  DEC HL                  ;
  LD (controls_timer),HL  ;
  LD A,H                   ; Check if the time is up
  OR L                     ;
  JP Z,switch_to_demo_mode ;
  LD A,(LAST_K)
  CALL KEYBOARD           ; Scan keyboard
  EI                      ;
  SUB $31                 ; Subtract $31 from the pressed key ASCII code,
                          ; effectively mapping the "1" key to 0, "2" to 1,
                          ; etc.
  LD (tmp_control_type),A
  AND $FC                 ; Validate the pressed key by making sure that none
  CP $00                  ; of the bits older than the first two are set,
                          ; effectively allowing values 0 through 3.
  JR NZ,controls_input    ; Repeat if a valid key was not pressed.
  LD A,$FF
game_mode_print:
  LD B,$00                ; The purpose of this block is really unclear
controls_input_0:
  DJNZ controls_input_0   ;
  DEC A                   ;
  JR NZ,game_mode_print   ;
  LD D,$07                ; PAPER 0; INK 7
  CALL clear_screen
  LD DE,msg_game_mode     ; Print game mode dialog
  LD BC,$0104             ;
  CALL PR_STRING          ;
  LD A,$0D
  LD (LAST_K),A

; Wait until the user chooses a valid game mode.
game_mode_input:
  LD A,(LAST_K)
  CALL KEYBOARD           ; Scan keyboard
  EI                      ;
  SUB $31                 ; Subtract $31 from the pressed key ASCII code,
                          ; effectively mapping the "1" key to 0, "2" to 1,
                          ; etc.
  LD (state_game_mode),A
  AND $F8                 ; Validate the pressed key by making sure that none
  CP $00                  ; of the bits older than the first three are set,
                          ; effectively allowing values 0 through 7.
  JP NZ,game_mode_input   ; Repeat if a valid key was not pressed.
  LD D,$07                ; PAPER 0; INK 7
  CALL clear_screen
  LD A,(tmp_control_type)
  CP $00
  JP NZ,instructions_print
  LD DE,msg_keyboard_config ; Print keyboard configuration
  LD BC,$0070               ;
  CALL PR_STRING            ;
instructions_print:
  LD DE,msg_instructions
  LD BC,$00A8
  CALL PR_STRING
  LD A,$20
  LD (LAST_K),A
instructions_input:
  LD A,(LAST_K)
  CALL KEYBOARD           ; Scan keyboard
  EI                      ;
  LD A,(LAST_K)
  CP $0D                   ; Loop until Enter is pressed
  JP NZ,instructions_input ;
  LD A,$00                ; Switch to the non-demo mode
  LD (state_demo_mode),A  ;
  LD SP,(setup_sp)
  RET

; Data block at 7B57
;
; Used by the routine at controls_input.
switch_to_demo_mode:
  DEFB $3E,$01,$32,$01,$78,$ED,$7B,$10
  DEFB $78,$C9,$C3,$90,$EA,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00
status_line_1:
  DEFM $11,$00            ; PAPER 0
  DEFM $10,$07            ; INK 7
  DEFM $16,$13,$02        ; AT 19,2
  DEFM "GAME  E   "
  DEFB $93                ; One half UDG
  DEFM "   F"
  DEFM $16,$14,$08        ; AT 20,8
  DEFB $91,$90,$90,$90,$91,$90,$90,$90 ; Fuel gauge scale UDG
  DEFB $92                             ;
  DEFM $16,$15,$08        ; AT 21,8
  DEFM $10,$03            ; INK 3
  DEFB $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F ; Fuel gauge reading UDG
  DEFM $10,$06            ; INK 6
status_line_2:
  DEFM $16,$01,$02        ; AT 1,2
  DEFM $10,$06            ; INK 6
  DEFM "P1 0000000"
  DEFM $10,$07            ; INK 7
  DEFM $16,$01,$12        ; AT 1,18
  DEFM "HI 0000000"
status_line_3:
  DEFM $16,$13,$12        ; AT 19,18
  DEFM "BRIDGE  "
status_line_4:
  DEFM $16,$14,$04        ; AT 20,4
  DEFM $10,$07            ; INK 7

; Data block at 805F
end_status_line_4:
  DEFB $01,$05,$0A,$0F

; Data block at 8063
sprite_terrain:
  DEFB $02,$04,$04,$06,$08,$08,$0A,$0A
  DEFB $0C,$0A,$0A,$08,$06,$04,$02,$00
  DEFB $80,$80,$80,$80,$80,$80,$80,$80
  DEFB $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
  DEFB $C0,$C0,$C0,$C0,$C0,$C0,$C0,$F0
  DEFB $F0,$C0,$C0,$C0,$C0,$C0,$C0,$C0
  DEFB $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
  DEFB $80,$80,$80,$80,$80,$80,$80,$80
  DEFB $00,$00,$02,$02,$04,$04,$06,$06
  DEFB $08,$08,$06,$06,$04,$04,$06,$06
  DEFB $06,$06,$06,$06,$04,$04,$04,$04
  DEFB $02,$02,$02,$02,$00,$00,$00,$00
  DEFB $00,$00,$02,$02,$04,$04,$06,$06
  DEFB $08,$08,$0A,$0A,$0C,$0C,$0E,$0E
  DEFB $0E,$0E,$0C,$0A,$0A,$08,$08,$06
  DEFB $06,$08,$08,$06,$04,$02,$02,$00
  DEFB $00,$00,$02,$04,$04,$06,$08,$08
  DEFB $0A,$0C,$0E,$0E,$10,$12,$14,$16
  DEFB $16,$16,$14,$12,$10,$10,$0E,$0C
  DEFB $0A,$08,$0A,$0A,$08,$06,$04,$02
  DEFB $02,$02,$04,$04,$06,$06,$04,$04
  DEFB $02,$02,$00,$00,$02,$02,$02,$02
  DEFB $00,$02,$04,$06,$0A,$0C,$10,$12
  DEFB $16,$18,$1C,$1E,$22,$24,$26,$28
  DEFB $28,$26,$24,$22,$1E,$1C,$18,$16
  DEFB $12,$10,$0C,$0A,$06,$04,$02,$00
  DEFB $00,$02,$00,$00,$02,$02,$04,$02
  DEFB $02,$00,$00,$02,$02,$04,$02,$00
  DEFB $00,$02,$04,$02,$02,$04,$04,$02
  DEFB $00,$00,$00,$02,$02,$02,$00,$00

; Game Over message.
msg_game_over:
  DEFM " .....GAME OVER.....                           "

; Credits message.
msg_credits:
  DEFM " RIVER RAID"
  DEFM $94                ; Trademark UDG symbol
  DEFM "      by Carol Shaw       "
  DEFM $7F                ; Copyright symbol
  DEFM " 1983 "
  DEFM $95,$96,$97,$98,$99,$9A,$9B ; Activision logo UDG symbols
  DEFM " Inc. All rights reserved                     "

; Data block at 81E4
L81E4:
  DEFB $FF,$C3,$90,$EA

; Message at 81E8
L81E8:
  DEFM " rights reserved        Press ENTER to play or C to change contro"
  DEFM "l or S to select game                              "

; Data block at 825C
L825C:
  DEFB $FF

; Data block at 825D
udg_data:
  DEFB $00,$00,$00,$80,$80,$AA,$AA,$FF
  DEFB $80,$80,$80,$80,$80,$AA,$AA,$FF
  DEFB $80,$80,$80,$80,$80,$80,$80,$80
  DEFB $40,$C4,$48,$50,$26,$61,$02,$07
  DEFB $F1,$5B,$55,$51,$00,$00,$00,$00
  DEFB $00,$03,$07,$0F,$19,$3F,$61,$C1
  DEFB $00,$3F,$01,$39,$21,$21,$21,$39
  DEFB $00,$FC,$04,$24,$24,$27,$27,$26
  DEFB $00,$1F,$30,$61,$C9,$89,$08,$09
  DEFB $00,$FC,$00,$E4,$04,$E4,$24,$E4
  DEFB $00,$00,$00,$F2,$93,$93,$92,$F2
  DEFB $00,$00,$00,$20,$20,$E0,$60,$20
  DEFB $10,$10,$38,$7C,$D6,$92,$38,$54

; Data block at 82C5
L82C5:
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

; Data block at 82F5
L82F5:
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$00,$00,$00,$00,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  DEFB $FF,$FF,$FF,$FF,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$FF,$FF,$FF,$FF,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00

; Message at 8371
L8371:
  DEFM "<<<<<<<<<<<<<<"

; Data block at 837F
L837F:
  DEFB $0E,$0E,$0E,$0E

; Message at 8383
L8383:
  DEFM "<<<<<<<<<<<<<<??????????????"

; Data block at 839F
L839F:
  DEFB $C0,$C0,$C0,$C0

; Message at 83A3
L83A3:
  DEFM "??????????????"

; Data block at 83B1
;
sprite_plane:
  DEFB $10,$00            ; Frame 1
  DEFB $10,$00            ;
  DEFB $38,$00            ;
  DEFB $7C,$00            ;
  DEFB $D6,$00            ;
  DEFB $82,$00            ;
  DEFB $38,$00            ;
  DEFB $54,$00            ;
  DEFB $04,$00            ; Frame 2
  DEFB $04,$00            ;
  DEFB $0E,$00            ;
  DEFB $1F,$00            ;
  DEFB $35,$80            ;
  DEFB $04,$80            ;
  DEFB $0E,$00            ;
  DEFB $15,$00            ;
  DEFB $01,$00            ; Frame 3
  DEFB $01,$00            ;
  DEFB $03,$80            ;
  DEFB $07,$C0            ;
  DEFB $0D,$60            ;
  DEFB $09,$20            ;
  DEFB $03,$80            ;
  DEFB $05,$40            ;
  DEFB $00,$40            ; Frame 4
  DEFB $00,$40            ;
  DEFB $00,$E0            ;
  DEFB $01,$F0            ;
  DEFB $03,$58            ;
  DEFB $02,$48            ;
  DEFB $00,$E0            ;
  DEFB $01,$50            ;

; Data block at 83F1
;
sprite_plane_banked:
  DEFB $10,$00            ; Frame 1
  DEFB $10,$00            ;
  DEFB $38,$00            ;
  DEFB $7C,$00            ;
  DEFB $54,$00            ;
  DEFB $10,$00            ;
  DEFB $38,$00            ;
  DEFB $28,$00            ;
  DEFB $04,$00            ; Frame 2
  DEFB $04,$00            ;
  DEFB $0E,$00            ;
  DEFB $1F,$00            ;
  DEFB $15,$00            ;
  DEFB $04,$00            ;
  DEFB $0E,$00            ;
  DEFB $0A,$00            ;
  DEFB $01,$00            ; Frame 3
  DEFB $01,$00            ;
  DEFB $03,$80            ;
  DEFB $07,$C0            ;
  DEFB $05,$40            ;
  DEFB $01,$00            ;
  DEFB $03,$80            ;
  DEFB $02,$80            ;
  DEFB $00,$40            ; Frame 4
  DEFB $00,$40            ;
  DEFB $00,$E0            ;
  DEFB $01,$F0            ;
  DEFB $01,$50            ;
  DEFB $00,$40            ;
  DEFB $00,$E0            ;
  DEFB $00,$A0            ;

; Data block at 8431
L8431:
  DEFB $C0,$C0,$C0,$C0,$C0,$C0,$00,$00
  DEFB $30,$30,$30,$30,$30,$30,$00,$00
  DEFB $0C,$0C,$0C,$0C,$0C,$0C,$00,$00
  DEFB $03,$03,$03,$03,$03,$03,$00,$00

; Data block at 8451
L8451:
  DEFB $C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0
  DEFB $30,$30,$30,$30,$30,$30,$30,$30
  DEFB $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C
  DEFB $03,$03,$03,$03,$03,$03,$03,$03

; Data block at 8471
;
sprite_explosion_f1:
  DEFB $02,$40
  DEFB $09,$20
  DEFB $05,$00
  DEFB $20,$50
  DEFB $15,$00
  DEFB $08,$28
  DEFB $02,$40
  DEFB $00,$00

; Data block at 8481
;
sprite_explosion_f2:
  DEFB $22,$20
  DEFB $0D,$04
  DEFB $90,$52
  DEFB $46,$88
  DEFB $A8,$54
  DEFB $04,$40
  DEFB $11,$88
  DEFB $00,$00

; Data block at 8491
;
sprite_explosion_f3:
  DEFB $01,$90
  DEFB $64,$A6
  DEFB $AA,$48
  DEFB $05,$A2
  DEFB $A8,$19
  DEFB $92,$64
  DEFB $49,$12
  DEFB $0A,$48

; Array [4] of rock sprites (3×2 tiles, 48 bytes).
;
sprite_rock:
  DEFB $00,$00,$00        ; Rock 1
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $00,$02,$00        ;
  DEFB $00,$0D,$00        ;
  DEFB $00,$3A,$80        ;
  DEFB $00,$F5,$40        ;
  DEFB $03,$FA,$A0        ;
  DEFB $0F,$F7,$50        ;
  DEFB $3F,$FF,$A8        ;
  DEFB $FF,$FF,$54        ;
  DEFB $00,$02,$00        ; Rock 2
  DEFB $00,$06,$00        ;
  DEFB $03,$06,$00        ;
  DEFB $07,$0E,$00        ;
  DEFB $07,$8F,$00        ;
  DEFB $0F,$8F,$10        ;
  DEFB $0F,$DF,$10        ;
  DEFB $0F,$DF,$18        ;
  DEFB $0F,$0F,$F8        ;
  DEFB $0F,$BF,$B8        ;
  DEFB $1F,$DE,$FC        ;
  DEFB $1F,$7D,$3C        ;
  DEFB $1F,$BE,$FE        ;
  DEFB $3E,$FE,$FE        ;
  DEFB $7F,$7D,$FF        ;
  DEFB $FD,$FD,$FF        ;
  DEFB $00,$00,$00        ; Rock 3
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$20        ;
  DEFB $00,$00,$D0        ;
  DEFB $00,$03,$B0        ;
  DEFB $00,$0F,$58        ;
  DEFB $00,$1F,$A8        ;
  DEFB $01,$BF,$54        ;
  DEFB $03,$DF,$AC        ;
  DEFB $17,$E7,$D6        ;
  DEFB $3B,$F3,$EA        ;
  DEFB $7D,$F9,$F5        ;
  DEFB $FE,$FC,$FB        ;
  DEFB $FF,$7E,$FF        ;
  DEFB $00,$00,$00        ; Rock 4
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $01,$80,$20        ;
  DEFB $01,$E8,$50        ;
  DEFB $03,$F4,$E8        ;
  DEFB $07,$F3,$F4        ;
  DEFB $07,$ED,$F4        ;
  DEFB $0F,$DC,$FA        ;
  DEFB $1E,$BE,$FA        ;
  DEFB $1D,$7F,$7D        ;
  DEFB $3F,$FF,$1D        ;
  DEFB $7F,$FF,$DF        ;
  DEFB $FF,$FF,$EF        ;

; Message at 8561
L8561:
  DEFM $11,$00,$10,$07,$16,$05,$05,"0 CURSOR KEYS & 0"

; Data block at 8579
L8579:
  DEFB $16,$06,$07

; Message at 857C
L857C:
  DEFM "(PROTEK AGF etc)"

; Data block at 858C
L858C:
  DEFB $16,$08,$05

; Message at 858F
L858F:
  DEFM "1 KEMPSTON"

; Data block at 8599
L8599:
  DEFB $16,$0A,$05

; Message at 859C
L859C:
  DEFM "2 SINCLAIR"

; Data block at 85A6
L85A6:
  DEFB $16,$0C,$05

; Message at 85A9
L85A9:
  DEFM "3 KEYBOARD"

; Array [5] arrays of enemy headed left sprites (each element is 3×1 tiles × 4
; frames = 96 bytes).
;
; Array [4] of regular helicopter headed left sprites (3×1 tiles, 24 bytes).
sprite_enemies_left:
  DEFB $F0,$00,$00        ; Frame 1
  DEFB $1E,$00,$00        ;
  DEFB $30,$00,$00        ;
  DEFB $7C,$40,$00        ;
  DEFB $FF,$C0,$00        ;
  DEFB $78,$40,$00        ;
  DEFB $10,$00,$00        ;
  DEFB $7C,$00,$00        ;
  DEFB $3C,$00,$00        ; Frame 2
  DEFB $07,$80,$00        ;
  DEFB $0C,$00,$00        ;
  DEFB $1F,$10,$00        ;
  DEFB $3F,$F0,$00        ;
  DEFB $1E,$10,$00        ;
  DEFB $04,$00,$00        ;
  DEFB $1F,$00,$00        ;
  DEFB $0F,$00,$00        ; Frame 3
  DEFB $01,$E0,$00        ;
  DEFB $03,$00,$00        ;
  DEFB $07,$C4,$00        ;
  DEFB $0F,$FC,$00        ;
  DEFB $07,$84,$00        ;
  DEFB $01,$00,$00        ;
  DEFB $07,$C0,$00        ;
  DEFB $03,$C0,$00        ; Frame 4
  DEFB $00,$78,$00        ;
  DEFB $00,$C0,$00        ;
  DEFB $01,$F1,$00        ;
  DEFB $03,$FF,$00        ;
  DEFB $01,$E1,$00        ;
  DEFB $00,$40,$00        ;
  DEFB $01,$F0,$00        ;
; Array [4] of ship headed left sprites (each element is 3×1 tiles = 24 bytes).
  DEFB $00,$00,$00        ; Frame 1
  DEFB $00,$00,$00        ;
  DEFB $00,$60,$00        ;
  DEFB $00,$F8,$00        ;
  DEFB $07,$FE,$00        ;
  DEFB $FF,$FF,$C0        ;
  DEFB $7F,$FF,$C0        ;
  DEFB $1F,$FF,$80        ;
  DEFB $00,$00,$00        ; Frame 2
  DEFB $00,$00,$00        ;
  DEFB $00,$18,$00        ;
  DEFB $00,$3E,$00        ;
  DEFB $01,$FF,$80        ;
  DEFB $3F,$FF,$F0        ;
  DEFB $1F,$FF,$F0        ;
  DEFB $07,$FF,$E0        ;
  DEFB $00,$00,$00        ; Frame 3
  DEFB $00,$00,$00        ;
  DEFB $00,$06,$00        ;
  DEFB $00,$0F,$80        ;
  DEFB $00,$7F,$E0        ;
  DEFB $0F,$FF,$FC        ;
  DEFB $07,$FF,$FC        ;
  DEFB $01,$FF,$F8        ;
  DEFB $00,$00,$00        ; Frame 4
  DEFB $00,$00,$00        ;
  DEFB $00,$01,$80        ;
  DEFB $00,$03,$E0        ;
  DEFB $00,$1F,$F8        ;
  DEFB $03,$FF,$FF        ;
  DEFB $01,$FF,$FF        ;
  DEFB $00,$7F,$FE        ;
; Array [4] of advanced helicopter headed left sprites (each element is 3×1
; tiles = 24 bytes).
  DEFB $F0,$00,$00        ; Frame 1
  DEFB $1E,$00,$00        ;
  DEFB $30,$00,$00        ;
  DEFB $7C,$40,$00        ;
  DEFB $87,$C0,$00        ;
  DEFB $7C,$40,$00        ;
  DEFB $10,$00,$00        ;
  DEFB $7C,$00,$00        ;
  DEFB $3C,$00,$00        ; Frame 2
  DEFB $07,$80,$00        ;
  DEFB $0C,$00,$00        ;
  DEFB $1F,$10,$00        ;
  DEFB $21,$F0,$00        ;
  DEFB $1F,$10,$00        ;
  DEFB $04,$00,$00        ;
  DEFB $1F,$00,$00        ;
  DEFB $0F,$00,$00        ; Frame 3
  DEFB $01,$E0,$00        ;
  DEFB $03,$00,$00        ;
  DEFB $07,$C4,$00        ;
  DEFB $08,$7C,$00        ;
  DEFB $07,$C4,$00        ;
  DEFB $01,$00,$00        ;
  DEFB $07,$C0,$00        ;
  DEFB $03,$C0,$00        ; Frame 4
  DEFB $00,$78,$00        ;
  DEFB $00,$C0,$00        ;
  DEFB $01,$F1,$00        ;
  DEFB $02,$1F,$00        ;
  DEFB $01,$F1,$00        ;
  DEFB $00,$40,$00        ;
  DEFB $01,$F0,$00        ;
; Array [4] of tank headed left sprites (each element is 3×1 tiles = 24 bytes).
  DEFB $00,$00,$00        ; Frame 1
  DEFB $7F,$00,$00        ;
  DEFB $07,$00,$00        ;
  DEFB $7F,$C0,$00        ;
  DEFB $FF,$C0,$00        ;
  DEFB $2A,$80,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $2A,$80,$00        ;
  DEFB $00,$00,$00        ; Frame 2
  DEFB $1F,$C0,$00        ;
  DEFB $01,$C0,$00        ;
  DEFB $1F,$F0,$00        ;
  DEFB $3F,$F0,$00        ;
  DEFB $05,$40,$00        ;
  DEFB $10,$00,$00        ;
  DEFB $05,$40,$00        ;
  DEFB $00,$00,$00        ; Frame 3
  DEFB $07,$F0,$00        ;
  DEFB $00,$70,$00        ;
  DEFB $07,$FC,$00        ;
  DEFB $0F,$FC,$00        ;
  DEFB $02,$A8,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $02,$A8,$00        ;
  DEFB $00,$00,$00        ; Frame 4
  DEFB $01,$FC,$00        ;
  DEFB $00,$1C,$00        ;
  DEFB $01,$FF,$00        ;
  DEFB $03,$FF,$00        ;
  DEFB $00,$54,$00        ;
  DEFB $00,$01,$00        ;
  DEFB $00,$54,$00        ;
; Array [4] of fighter headed left sprites (each element is 3×1 tiles = 24
; bytes).
  DEFB $00,$00,$00        ; Frame 1
  DEFB $70,$40,$00        ;
  DEFB $00,$C0,$00        ;
  DEFB $FF,$C0,$00        ;
  DEFB $FC,$80,$00        ;
  DEFB $07,$00,$00        ;
  DEFB $03,$80,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ; Frame 2
  DEFB $00,$10,$00        ;
  DEFB $1C,$30,$00        ;
  DEFB $3F,$F0,$00        ;
  DEFB $3F,$20,$00        ;
  DEFB $01,$C0,$00        ;
  DEFB $00,$E0,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ; Frame 3
  DEFB $00,$04,$00        ;
  DEFB $07,$0C,$00        ;
  DEFB $0F,$FC,$00        ;
  DEFB $0F,$C8,$00        ;
  DEFB $00,$70,$00        ;
  DEFB $00,$38,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ; Frame 4
  DEFB $00,$01,$00        ;
  DEFB $01,$C3,$00        ;
  DEFB $03,$FF,$00        ;
  DEFB $03,$F2,$00        ;
  DEFB $00,$1C,$00        ;
  DEFB $00,$0E,$00        ;
  DEFB $00,$00,$00        ;

; Array [5] arrays of enemy headed right sprites (each element is 3×1 tiles × 4
; frames = 96 bytes).
;
; Array [4] of regular helicopter headed right sprites (each element is 3×1
; tiles = 24 bytes).
sprite_enemies_right:
  DEFB $03,$C0,$00        ; Frame 1
  DEFB $1E,$00,$00        ;
  DEFB $03,$00,$00        ;
  DEFB $8F,$80,$00        ;
  DEFB $FF,$C0,$00        ;
  DEFB $87,$80,$00        ;
  DEFB $02,$00,$00        ;
  DEFB $0F,$80,$00        ;
  DEFB $00,$F0,$00        ; Frame 2
  DEFB $07,$80,$00        ;
  DEFB $00,$C0,$00        ;
  DEFB $23,$E0,$00        ;
  DEFB $3F,$F0,$00        ;
  DEFB $21,$E0,$00        ;
  DEFB $00,$80,$00        ;
  DEFB $03,$E0,$00        ;
  DEFB $00,$3C,$00        ; Frame 3
  DEFB $01,$E0,$00        ;
  DEFB $00,$30,$00        ;
  DEFB $08,$F8,$00        ;
  DEFB $0F,$FC,$00        ;
  DEFB $08,$78,$00        ;
  DEFB $00,$20,$00        ;
  DEFB $00,$F8,$00        ;
  DEFB $00,$0F,$00        ; Frame 4
  DEFB $00,$78,$00        ;
  DEFB $00,$0C,$00        ;
  DEFB $02,$3E,$00        ;
  DEFB $03,$FF,$00        ;
  DEFB $02,$1E,$00        ;
  DEFB $00,$08,$00        ;
  DEFB $00,$3E,$00        ;
; Array [4] of ship headed right sprites (each element is 3×1 tiles = 24
; bytes).
  DEFB $00,$00,$00        ; Frame 1
  DEFB $00,$00,$00        ;
  DEFB $01,$80,$00        ;
  DEFB $07,$C0,$00        ;
  DEFB $1F,$F8,$00        ;
  DEFB $FF,$FF,$C0        ;
  DEFB $FF,$FF,$80        ;
  DEFB $7F,$FF,$00        ;
  DEFB $00,$00,$00        ; Frame 2
  DEFB $00,$00,$00        ;
  DEFB $00,$60,$00        ;
  DEFB $01,$F0,$00        ;
  DEFB $07,$FE,$00        ;
  DEFB $3F,$FF,$F0        ;
  DEFB $3F,$FF,$E0        ;
  DEFB $1F,$FF,$80        ;
  DEFB $00,$00,$00        ; Frame 3
  DEFB $00,$00,$00        ;
  DEFB $00,$18,$00        ;
  DEFB $00,$7C,$00        ;
  DEFB $01,$FF,$80        ;
  DEFB $0F,$FF,$FC        ;
  DEFB $0F,$FF,$F8        ;
  DEFB $07,$FF,$E0        ;
  DEFB $00,$00,$00        ; Frame 4
  DEFB $00,$00,$00        ;
  DEFB $00,$06,$00        ;
  DEFB $00,$1F,$00        ;
  DEFB $00,$7F,$E0        ;
  DEFB $03,$FF,$FF        ;
  DEFB $03,$FF,$FE        ;
  DEFB $01,$FF,$F8        ;
; Array [4] of advanced helicopter headed right sprites (each element is 3×1
; tiles = 24 bytes).
  DEFB $03,$C0,$00        ; Frame 1
  DEFB $1E,$00,$00        ;
  DEFB $03,$00,$00        ;
  DEFB $8F,$80,$00        ;
  DEFB $F8,$40,$00        ;
  DEFB $8F,$80,$00        ;
  DEFB $02,$00,$00        ;
  DEFB $0F,$80,$00        ;
  DEFB $00,$F0,$00        ; Frame 2
  DEFB $07,$80,$00        ;
  DEFB $00,$C0,$00        ;
  DEFB $23,$E0,$00        ;
  DEFB $3E,$10,$00        ;
  DEFB $23,$E0,$00        ;
  DEFB $00,$80,$00        ;
  DEFB $03,$E0,$00        ;
  DEFB $00,$3C,$00        ; Frame 3
  DEFB $01,$E0,$00        ;
  DEFB $00,$30,$00        ;
  DEFB $08,$F8,$00        ;
  DEFB $0F,$84,$00        ;
  DEFB $08,$F8,$00        ;
  DEFB $00,$20,$00        ;
  DEFB $08,$F8,$00        ;
  DEFB $00,$0F,$00        ; Frame 4
  DEFB $00,$78,$00        ;
  DEFB $00,$0C,$00        ;
  DEFB $02,$3E,$00        ;
  DEFB $03,$E1,$00        ;
  DEFB $02,$3E,$00        ;
  DEFB $00,$08,$00        ;
  DEFB $02,$3E,$00        ;
; Array [4] of tank headed right sprites (each element is 3×1 tiles = 24
; bytes).
  DEFB $00,$00,$00        ; Frame 1
  DEFB $3F,$80,$00        ;
  DEFB $38,$00,$00        ;
  DEFB $FF,$80,$00        ;
  DEFB $FF,$C0,$00        ;
  DEFB $2A,$00,$00        ;
  DEFB $80,$00,$00        ;
  DEFB $2A,$00,$00        ;
  DEFB $00,$00,$00        ; Frame 2
  DEFB $0F,$E0,$00        ;
  DEFB $0E,$00,$00        ;
  DEFB $3F,$E0,$00        ;
  DEFB $3F,$F0,$00        ;
  DEFB $15,$40,$00        ;
  DEFB $D0,$00,$00        ;
  DEFB $15,$40,$00        ;
  DEFB $00,$00,$00        ; Frame 3
  DEFB $03,$F8,$00        ;
  DEFB $03,$80,$00        ;
  DEFB $0F,$F8,$00        ;
  DEFB $0F,$FC,$00        ;
  DEFB $02,$A0,$00        ;
  DEFB $00,$08,$00        ;
  DEFB $02,$A0,$00        ;
  DEFB $00,$00,$00        ; Frame 4
  DEFB $00,$FE,$00        ;
  DEFB $00,$E0,$00        ;
  DEFB $03,$FE,$00        ;
  DEFB $03,$FF,$00        ;
  DEFB $01,$54,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $01,$54,$00        ;
; Array [4] of fighter headed right sprites (each element is 3×1 tiles = 24
; bytes).
  DEFB $00,$00,$00        ; Frame 1
  DEFB $80,$80,$00        ;
  DEFB $C3,$C0,$00        ;
  DEFB $FF,$C0,$00        ;
  DEFB $4F,$00,$00        ;
  DEFB $38,$00,$00        ;
  DEFB $70,$00,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ; Frame 2
  DEFB $20,$00,$00        ;
  DEFB $30,$E0,$00        ;
  DEFB $3F,$F0,$00        ;
  DEFB $13,$F0,$00        ;
  DEFB $07,$00,$00        ;
  DEFB $1C,$00,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ; Frame 3
  DEFB $08,$00,$00        ;
  DEFB $0C,$38,$00        ;
  DEFB $0F,$FC,$00        ;
  DEFB $04,$FC,$00        ;
  DEFB $03,$80,$00        ;
  DEFB $07,$00,$00        ;
  DEFB $00,$00,$00        ;
  DEFB $00,$00,$00        ; Frame 4
  DEFB $02,$00,$00        ;
  DEFB $03,$0E,$00        ;
  DEFB $03,$FF,$00        ;
  DEFB $01,$3F,$00        ;
  DEFB $00,$E0,$00        ;
  DEFB $01,$C0,$00        ;
  DEFB $00,$00

; Array [4] of balloon sprites (2×2 tiles, 32 bytes).
;
sprite_balloon:
  DEFB $0C,$00            ; Frame 1
  DEFB $3F,$00            ;
  DEFB $7F,$80            ;
  DEFB $7F,$80            ;
  DEFB $FF,$C0            ;
  DEFB $FF,$C0            ;
  DEFB $7F,$80            ;
  DEFB $7F,$80            ;
  DEFB $7F,$80            ;
  DEFB $4C,$80            ;
  DEFB $21,$00            ;
  DEFB $21,$00            ;
  DEFB $12,$00            ;
  DEFB $12,$00            ;
  DEFB $1E,$00            ;
  DEFB $1E,$00            ;
  DEFB $03,$00            ; Frame 2
  DEFB $0F,$C0            ;
  DEFB $1F,$E0            ;
  DEFB $1F,$E0            ;
  DEFB $3F,$F0            ;
  DEFB $3F,$F0            ;
  DEFB $1F,$E0            ;
  DEFB $1F,$E0            ;
  DEFB $1F,$E0            ;
  DEFB $13,$20            ;
  DEFB $08,$40            ;
  DEFB $08,$40            ;
  DEFB $04,$80            ;
  DEFB $04,$80            ;
  DEFB $07,$80            ;
  DEFB $07,$80            ;
  DEFB $00,$C0            ; Frame 3
  DEFB $03,$F0            ;
  DEFB $07,$F8            ;
  DEFB $07,$F8            ;
  DEFB $0F,$FC            ;
  DEFB $0F,$FC            ;
  DEFB $07,$F8            ;
  DEFB $07,$F8            ;
  DEFB $07,$F8            ;
  DEFB $04,$C8            ;
  DEFB $02,$10            ;
  DEFB $02,$10            ;
  DEFB $01,$20            ;
  DEFB $01,$20            ;
  DEFB $01,$E0            ;
  DEFB $01,$E0            ;
  DEFB $00,$30            ; Frame 4
  DEFB $00,$FC            ;
  DEFB $01,$FE            ;
  DEFB $01,$FE            ;
  DEFB $03,$FF            ;
  DEFB $03,$FF            ;
  DEFB $01,$FE            ;
  DEFB $01,$FE            ;
  DEFB $01,$FE            ;
  DEFB $01,$32            ;
  DEFB $00,$84            ;
  DEFB $00,$84            ;
  DEFB $00,$48            ;
  DEFB $00,$48            ;
  DEFB $00,$78            ;
  DEFB $00,$78            ;

; Data block at 89F2
L89F2:
  DEFB $FF,$C0,$FF,$F0,$FF,$FC,$FF,$FF

; Data block at 89FA
L89FA:
  DEFB $FF,$FF,$3F,$FF,$0F,$FF,$03,$FF

; Invoked from the interrupt handler when FIRE is pressed
;
; Used by the routine at handle_controls.
do_fire:
  LD C,$08
do_fire_0:
  LD A,$10
  OUT ($FE),A
  LD D,$20
do_fire_1:
  DEC D
  JR NZ,do_fire_1
  LD A,$00
  OUT ($FE),A
  LD D,$20
  LD D,$20
  DEFB $FD
  DEC C
  JP NZ,do_fire_0
  RET

; Routine at 8A1B
;
; Used by the routine at demo.
L8A1B:
  LD HL,$57FF
  LD C,$08
L8A1B_0:
  LD B,$20
  OR A
L8A1B_1:
  RL (HL)
  DEC HL
  DJNZ L8A1B_1
  LD DE,$00E0
  OR A
  SBC HL,DE
  DEC C
  JP NZ,L8A1B_0
  RET

; Routine at 8A33
;
; Used by the routines at decrease_lives_player_2 and demo.
;
; Sets BORDER to BLACK, sets screen attributes to WHITE-on-BLACK and copies
;      udg_data to the UDG area.
init_udg:
  LD A,$00
  OUT ($FE),A
  LD B,$C0
  LD HL,$5A40
init_udg_loop:
  LD (HL),$07
  INC HL
  DJNZ init_udg_loop
  LD HL,udg_data
  LD DE,(UDG)
  LD BC,$0068
  LDIR
  RET

; Routine at 8A4E
;
; Used by the routines at L6DFF, L6E40, L708E, L7302, L75A2, L7649 and
; render_object.
L8A4E:
  LD DE,$0800
  LD HL,$3800
  LD A,B
  RLCA
  RLCA
  AND $03
  INC A
L8A4E_0:
  ADD HL,DE
  DEC A
  JP NZ,L8A4E_0
  LD A,B
  AND $3F
  LD B,A
  AND $38
  PUSH HL
  LD H,$00
  LD L,A
  ADD HL,HL
  ADD HL,HL
  EX DE,HL
  POP HL
  ADD HL,DE
  LD A,B
  AND $07
  LD B,A
  INC B
  DEC H
L8A4E_1:
  INC H
  DJNZ L8A4E_1
  LD A,C
  SRL A
  SRL A
  SRL A
  LD D,C
  LD C,A
  ADD HL,BC
  LD A,D
  AND $07
  LD B,A
  RET

; Fuel sprite
;
sprite_fuel:
  DEFB $0F,$F0,$0C,$30,$0D,$F0,$0C,$70
  DEFB $0D,$F0,$0D,$F0,$0F,$F0,$0D,$B0
  DEFB $0D,$B0,$0D,$B0,$0D,$B0,$0E,$70
  DEFB $0F,$F0,$0C,$30,$0D,$F0,$0C,$70
  DEFB $0D,$F0,$0C,$30,$0F,$F0,$0D,$F0
  DEFB $0D,$F0,$0D,$F0,$0D,$F0,$0C,$30
  DEFB $0F,$F0

; Data block at 8AB8
L8AB8:
  DEFB $1E,$00,$F0,$00,$07,$80,$3C,$00
  DEFB $01,$E0,$0F,$00,$00,$78,$03,$C0
L8AC8:
  DEFB $1E,$00,$03,$C0,$07,$80,$00,$F0
  DEFB $01,$E0,$00,$3C,$00,$78,$00,$0F
  DEFB $00,$00,$00,$10,$00,$00,$00,$00
  DEFB $00,$00,$00,$18,$18,$00,$00,$00
  DEFB $00,$00

; Message at 8AEA
L8AEA:
  DEFM "888"

; Data block at 8AED
L8AED:
  DEFB $00,$00,$00,$00,$10,$38,$7C,$38
  DEFB $10,$00,$00,$10,$38,$7C,$FE,$7C
  DEFB $38,$10,$00,$18,$3C,$7E,$FF,$FF
  DEFB $7E,$3C,$18

; Pointer to L6136
L8B08:
  DEFW $0000

; Data block at 8B0A
L8B0A:
  DEFW $0000

; Data block at 8B0C
L8B0C:
  DEFW $0000

; Data block at 8B0E
L8B0E:
  DEFW $0000

; Data block at 8B10
L8B10:
  DEFW $0000

; Data block at 8B12
L8B12:
  DEFW $2020

; Data block at 8B14
L8B14:
  DEFW $2020

; Data block at 8B16
L8B16:
  DEFW $2020

; Message at 8B18
L8B18:
  DEFM "  "

; Data block at 8B1A
render_object_width:
  DEFB $00

; Unused
L8B1B:
  DEFS $03

; Routine at 8B1E
;
; Used by the routines at L673D, render_enemy, render_fuel, render_balloon,
; L7158, L7296, L7393, L7441, L754C and L7649.
;
; I:BC Sprite frame size
L8B1E:
  PUSH DE
  LD (render_object_width),A
  LD DE,(L8B0A)
  LD A,E
  AND $07
  SRL A
  INC A
  PUSH HL
  OR A
  SBC HL,BC
L8B1E_0:
  ADD HL,BC
  DEC A
  JR NZ,L8B1E_0
  LD (L8B0E),HL
  POP HL
  LD A,(render_object_width)
  POP DE

; Routine at 8B3C
;
; Used by the routines at L60A5, handle_right, handle_left, L6682, L6794,
; render_rock, L708E, L71A2, L724C, L7441, L75D0 and L76DA.
;
; I:A Sprite width in tiles
; I:BC Sprite size in bytes
; I:D Frame number and some other info
; I:E Screen attributes
; I:HL Pointer to the sprite array
render_object:
  PUSH DE
  LD (render_object_width),A
  NOP
  CALL L928D
  LD A,E
  AND $07
  SRL A
  INC A
  OR A
  SBC HL,BC
render_object_0:
  ADD HL,BC
  DEC A
  JR NZ,render_object_0
  LD (L8B10),HL
  LD (L8B16),HL
  POP DE
; This entry point is used by the routine at L6EC8.
render_object_1:
  PUSH DE
  LD BC,(L8B0C)
  CALL L8A4E
  LD (L8B12),HL
  LD BC,(L8B0A)
  CALL L8A4E
  LD (L8B14),HL
  JP L8B70_3

; Routine at 8B70
L8B70:
  PUSH DE
  LD BC,(L8B0C)
  LD A,B
  AND $07
  CP $00
  JP NZ,L8B70_1
  LD A,B
  AND $3F
  CP $00
  JP Z,L8B70_0
  LD HL,(L8B12)
  LD DE,$07E0
  OR A
  SBC HL,DE
  LD (L8B12),HL
  JP L8B70_1
L8B70_0:
  LD HL,(L8B12)
  LD DE,$00E0
  OR A
  SBC HL,DE
  LD (L8B12),HL
  JP L8B70_1
L8B70_1:
  LD BC,(L8B0A)
  LD A,B
  AND $07
  CP $00
  JP NZ,L8B70_3
  LD A,B
  AND $3F
  CP $00
  JP Z,L8B70_2
  LD HL,(L8B14)
  LD DE,$07E0
  OR A
  SBC HL,DE
  LD (L8B14),HL
  JP L8B70_3
L8B70_2:
  LD HL,(L8B14)
  LD DE,$00E0
  OR A
  SBC HL,DE
  LD (L8B14),HL
; This entry point is used by the routine at render_object.
L8B70_3:
  CALL L8C0B
  LD A,(render_object_width)
  LD D,$00
  LD E,A
  LD HL,(L8B0E)
  ADD HL,DE
  LD (L8B0E),HL
  LD HL,(L8B10)
  ADD HL,DE
  LD (L8B10),HL
  LD HL,(L8B0A)
  INC H
  LD (L8B0A),HL
  LD HL,(L8B0C)
  INC H
  LD (L8B0C),HL
  LD HL,(L8B12)
  INC H
  LD (L8B12),HL
  LD HL,(L8B14)
  INC H
  LD (L8B14),HL
  POP DE
  DEC D
  JP NZ,L8B70
  RET

; Routine at 8C0B
;
; Used by the routine at L8B70.
L8C0B:
  LD A,(render_object_width)
  LD C,A
  LD HL,(L8B14)
  LD DE,(L8B0E)
; This entry point is used by the routine at L8C1B.
L8C0B_0:
  LD A,(DE)
  LD B,A
  LD A,(HL)
  XOR $FF

; Routine at 8C1B
L8C1B:
  OR B
  XOR $FF
  LD (HL),A
  INC DE
  INC HL
  DEC C
  JR NZ,L8C0B_0
  LD A,(render_object_width)
  LD C,A
  LD HL,(L8B12)
  LD DE,(L8B10)
; This entry point is used by the routine at L8C3C.
L8C1B_0:
  PUSH DE
  LD A,(DE)
  LD B,A
  LD A,(HL)
  XOR B
  LD D,A
  XOR B
  OR B
  CP D
  JP NZ,L8C3C_0
; This entry point is used by the routines at L6136 and
; interact_with_something2.
L8C1B_1:
  LD A,(HL)

; Routine at 8C3C
L8C3C:
  OR B
  LD (HL),A
  POP DE
  INC HL
  INC DE
  DEC C
  JR NZ,L8C1B_0
  RET
; This entry point is used by the routine at L8C1B.
L8C3C_0:
  PUSH HL
  LD HL,(L8B08)
  JP (HL)

; Data block at 8C4A
L8C4A:
  DEFB $C3,$90,$EA,$0E,$8B,$E9,$C3,$90
  DEFB $EA,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $01,$80,$01,$80,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$01,$80
  DEFB $03,$C0,$03,$C0,$01,$80,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$01,$80,$03,$C0
  DEFB $07,$E0,$07,$E0,$03,$C0,$01,$80
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00

; label=sprite_explosion_6
L9062:
  DEFB $01,$00,$07,$C0,$0F,$E0,$0F,$E0
  DEFB $1F,$F0,$0F,$E0,$0F,$E0,$07,$C0
  DEFB $01,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$01,$00
  DEFB $07,$C0,$0F,$E0,$1F,$F0,$1F,$F0
  DEFB $3F,$F8,$1F,$F0,$1F,$F0,$0F,$E0
  DEFB $07,$C0,$01,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$01,$00,$07,$C0
  DEFB $1F,$F0,$1F,$F0,$3F,$F8,$3F,$F8
  DEFB $7F,$FC,$3F,$F8,$3F,$F8,$1F,$F0
  DEFB $1F,$F0,$07,$C0,$01,$00,$00,$00
  DEFB $00,$00

; Message at 90BC
state_score_player_1:
  DEFM "000000"

; Message at 90C2
state_score_player_2:
  DEFM "000000"

; Message at 90C8
L90C8:
  DEFM "000000"

; Message at 90CE
L90CE:
  DEFM "000000000000000000"

; Add score points for a hit target
;
; Used by the routines at L615E, interact_with_something, hit_helicopter_reg,
; hit_ship, hit_helicopter_adv, hit_fighter, hit_balloon, interact_with_fuel
; and L74EE.
;
; I:A Number of points to add divided by 10.
add_points:
  PUSH AF
  SRL A
  SRL A
  SRL A
  SRL A
  CP $00
  JP Z,add_points_1
add_points_0:
  PUSH AF
  LD A,$02
  CALL update_score
  POP AF
  DEC A
  JR NZ,add_points_0
add_points_1:
  POP AF
  AND $0F
  CP $00
  RET Z
add_points_2:
  PUSH AF
  LD A,$01
  CALL update_score
  POP AF
  DEC A
  JR NZ,add_points_2
  RET

; Add a life to the current player
;
; Used by the routine at update_score.
add_life:
  PUSH AF
  CALL ld_lives
  INC (HL)
  LD A,$02
  CALL CHAN_OPEN
  CALL print_lives
  LD HL,(ptr_state_controls)
  SET 4,(HL)              ; Set CONTROLS_BIT_BONUS_LIFE
  LD A,$01
  CALL CHAN_OPEN
  POP AF
  RET

; Routine at 9122
;
; Used by the routines at add_points, carry_player_1_score_digit and
; carry_player_2_score_digit.
;
; I:A (can be 1, 2 or 4)
update_score:
  PUSH AF
  LD A,$01
  CALL CHAN_OPEN
  POP AF
  CP $04
  CALL Z,add_life
  LD B,A
  LD A,$06
  SUB B
  LD C,A
  LD A,(state_player)
  CP $02
  JP Z,inc_player_2_score_digit

; Increase a digit in the player 1's score.
;
; I:C Offset of the digit to increase.
; O:D Offset of the digit to increase.
inc_player_1_score_digit:
  LD HL,state_score_player_1
  LD B,$00
  LD A,C
  ADD HL,BC
  LD D,A
  LD A,(HL)
  INC A
  CP $3A                  ; Check for digit overflow (the value got beyond the
                          ; 0-9 ASCII range).
  JP Z,carry_player_1_score_digit
  LD (HL),A
; This entry point is used by the routine at carry_player_1_score_digit.
print_player_1_score_digit:
  LD A,$10                ; INK YELLOW
  RST $10                 ;
  LD A,$06                ;
  RST $10                 ;
  LD A,$11                ; PAPER BLACK
  RST $10                 ;
  LD A,$00                ;
  RST $10                 ;
  LD A,$16                ; AT 1,...
  RST $10                 ;
  LD A,$01                ;
  RST $10                 ;
  LD A,D
  ADD A,$05
  RST $10
  LD A,(HL)
  RST $10
  LD A,$02
  CALL CHAN_OPEN
  RET

; Increase a digit in the player 2's score.
;
; Used by the routine at update_score.
;
; I:C Offset of the digit to increase.
; O:D Offset of the digit to increase.
inc_player_2_score_digit:
  LD HL,state_score_player_2
  LD B,$00
  LD A,C
  ADD HL,BC
  LD D,A
  LD A,(HL)
  INC A
  CP $3A                  ; Check for digit overflow (the value got beyond the
                          ; 0-9 ASCII range).
  JP Z,carry_player_2_score_digit
  LD (HL),A
; This entry point is used by the routine at carry_player_2_score_digit.
print_player_2_score_digit:
  LD A,$10                ; INK CYAN
  RST $10                 ;
  LD A,$05                ;
  RST $10                 ;
  LD A,$16                ; AT 1,...
  RST $10                 ;
  LD A,$01                ;
  RST $10                 ;
  LD A,D
  ADD A,$15
  RST $10
  LD A,(HL)
  RST $10
  LD A,$02
  CALL CHAN_OPEN
  RET

; Carry
;
; Used by the routine at inc_player_1_score_digit.
;
; I:D Offset of the digit to carry.
; I:HL Pointer to the digit.
carry_player_1_score_digit:
  LD (HL),$30             ; Write "0" to the overflown digit.
  LD A,$06                ; Check if D is equal to 0 in a very weird way: set A
                          ; to 6.
  SUB D                   ; Subtract D from it.
  INC A                   ; Increase A by one.
  CP $07                  ; Check if we got 7 (which is only possible if D is
                          ; 0).
  RET Z
  PUSH HL
  PUSH DE
  CALL update_score
  LD A,$01
  CALL CHAN_OPEN
  POP DE
  POP HL
  JP print_player_1_score_digit

; Carry
;
; Used by the routine at inc_player_2_score_digit.
carry_player_2_score_digit:
  LD (HL),$30
  LD A,$06
  SUB D
  INC A
  CP $07
  RET Z
  PUSH HL
  PUSH DE
  CALL update_score
  LD A,$01
  CALL CHAN_OPEN
  POP DE
  POP HL
  JP print_player_2_score_digit

; Routine at 91C1
;
; Used by the routine at L91E8.
print_score_player_2:
  LD A,$10                ; INK CYAN
  RST $10                 ;
  LD A,$05                ;
  RST $10                 ;
  LD BC,L90C8 - state_score_player_2 ; Print score.
  LD DE,state_score_player_2         ;
  CALL PR_STRING                     ;
  LD A,$30                ; "0"
  RST $10                 ;
  LD A,$16                ; AT 1,18
  RST $10                 ;
  LD A,$01                ;
  RST $10                 ;
  LD A,$12                ;
  RST $10                 ;
  LD A,$50                ; "P2"
  RST $10                 ;
  LD A,$32                ;
  RST $10                 ;
  LD A,$02
  CALL CHAN_OPEN
  RET

; Routine at 91E8
;
; Used by the routine at decrease_lives_player_2.
L91E8:
  LD A,$01
  CALL CHAN_OPEN
  LD A,$16
  RST $10
  LD A,$01
  RST $10
  LD A,$15
  RST $10
  LD A,(state_game_mode)
  BIT 0,A
  JP NZ,print_score_player_2
  LD A,$10
  RST $10
  LD A,$07
  RST $10
  LD BC,L90CC - L90C8
  LD HL,L90C8
  LD A,(state_game_mode)
  AND $FE
  LD E,A
  LD A,(state_game_mode)
  AND $FE
  SLA A
  SLA A
  SUB E
  LD D,$00
  LD E,A
  ADD HL,DE
  EX DE,HL
  CALL PR_STRING
  LD A,$30
  RST $10
  LD A,$16
  RST $10
  LD A,$01
  RST $10
  LD A,$12
  RST $10
  LD A,$48
  RST $10
  LD A,$49
  RST $10
  LD A,$02
  CALL CHAN_OPEN
  RET

; The game mode storing the number of players in the first bit and the starting
; bridge in the next two.
state_game_mode:
  DEFB $00

; Number of player 1 lives.
state_lives_player_1:
  DEFB $00

; Number of player 2 lives.
state_lives_player_2:
  DEFB $00

; Current player
state_player:
  DEFB $00

; Print lives.
;
; Used by the routines at decrease_lives_player_2 and add_life.
print_lives:
  LD A,(state_player)
  CP $02
  JP Z,print_lives_player_2
  LD A,$10                ; INK YELLOW
  RST $10                 ;
  LD A,$06                ;
  RST $10                 ;
  LD A,(state_lives_player_1)

; Continue printing lives after the value has been loaded into A.
;
; Used by the routine at print_lives_player_2.
;
; I:A Number of lives.
print_lives_continue:
  LD B,A
  LD A,$16                ; AT 20,18
  RST $10                 ;
  LD A,$14                ;
  RST $10                 ;
  LD A,$12                ;
  RST $10                 ;
  LD A,B
  CP $00
  JP Z,print_lives_padding
print_lives_loop:
  LD A,$9C                ; Print the ✈ UDG symbol
  RST $10                 ;
  DJNZ print_lives_loop

; Print six spaces
;
; Used by the routine at print_lives_continue.
print_lives_padding:
  LD A,$20
  RST $10
  LD A,$20
  RST $10
  LD A,$20
  RST $10
  LD A,$20
  RST $10
  LD A,$20
  RST $10
  LD A,$20
  RST $10
  RET

; The player 2 branch of the print_lives routine.
;
; Used by the routine at print_lives.
;
; O:A Number of lives.
print_lives_player_2:
  LD A,$10                ; INK CYAN
  RST $10                 ;
  LD A,$05                ;
  RST $10                 ;
  LD A,(state_lives_player_2)
  JP print_lives_continue

; Pointer to state_controls
ptr_state_controls:
  DEFW $0000

; Unused
L9285:
  DEFS $08

; Routine at 928D
;
; Used by the routines at L6EC8 and render_object.
L928D:
  PUSH HL
  PUSH BC
  LD ($928B),A
  LD A,E
  CP $00
  JP Z,L928D_5
  LD ($9287),DE
  LD (L9285),BC
  LD ($9289),HL
  LD BC,(L8B0A)
  LD A,B
  AND $F8
  LD H,$00
  LD L,A
  ADD HL,HL
  ADD HL,HL
  LD DE,screen_attributes
  ADD HL,DE
  LD D,$00
  LD E,C
  SRL E
  SRL E
  SRL E
  ADD HL,DE
  LD A,($928B)
  LD C,A
  LD DE,($9287)
  LD A,D
  SRL A
  SRL A
  SRL A
  INC A
  INC A
  INC A
  LD B,A
  EX DE,HL
  LD HL,$0020
  PUSH BC
  LD B,$00
  OR A
  SBC HL,BC
  EX DE,HL
  LD BC,(L8B0A)
  LD A,B
  AND $F8
  CP $00
  LD A,$0C
  JP Z,L928D_8
  POP BC
L928D_0:
  PUSH BC
L928D_1:
  LD (HL),A
  INC HL
  DEC C
  JR NZ,L928D_1
  PUSH HL
  LD BC,$5A20
  OR A
  SBC HL,BC
  POP HL
  JP P,L928D_6
  POP BC
  ADD HL,DE
  DJNZ L928D_0
L928D_2:
  LD BC,(L8B0C)
  LD A,B
  AND $F8
  LD H,$00
  LD L,A
  ADD HL,HL
  ADD HL,HL
  LD DE,screen_attributes
  ADD HL,DE
  LD D,$00
  LD E,C
  SRL E
  SRL E
  SRL E
  ADD HL,DE
  LD A,($928B)
  LD C,A
  LD DE,($9287)
  LD A,D
  SRL A
  SRL A
  SRL A
  INC A
  INC A
  LD B,A
  EX DE,HL
  LD HL,$0020
  PUSH BC
  LD B,$00
  OR A
  SBC HL,BC
  EX DE,HL
  LD BC,(L8B0C)
  LD A,B
  AND $F8
  CP $00
  LD BC,($9287)
  LD A,C
  JP Z,L928D_10
  POP BC
L928D_3:
  PUSH BC
L928D_4:
  LD (HL),A
  INC HL
  DEC C
  JR NZ,L928D_4
  PUSH HL
  LD BC,$5A20
  OR A
  SBC HL,BC
  POP HL
  JP P,L928D_7
  POP BC
  ADD HL,DE
  DJNZ L928D_3
L928D_5:
  LD A,($928B)
  POP BC
  POP HL
  LD DE,(L8B0C)
  RET
L928D_6:
  POP BC
  JP L928D_2
L928D_7:
  POP BC
  JP L928D_5
L928D_8:
  LD BC,$03DF
  ADD HL,BC
  POP BC
  PUSH BC
L928D_9:
  LD (HL),A
  INC HL
  DEC C
  JR NZ,L928D_9
  POP BC
  ADD HL,DE
  DEC B
  PUSH BC
  LD BC,$03DF
  OR A
  SBC HL,BC
  POP BC
  JP L928D_0
L928D_10:
  LD BC,$03DF
  ADD HL,BC
  POP BC
  PUSH BC
L928D_11:
  LD (HL),A
  INC HL
  DEC C
  JR NZ,L928D_11
  POP BC
  ADD HL,DE
  DEC B
  PUSH BC
  LD BC,$03DF
  OR A
  SBC HL,BC
  POP BC
  JP L928D_3
L928D_12:
  LD C,$06
L928D_13:
  LD A,(HL)
  LD B,A
  LD A,(DE)
  SUB B
  JP M,L928D_14
  CP $00
  JP NZ,L928D_15
  INC HL
  INC DE
  DEC C
  JP NZ,L928D_13
  LD A,$00
  RET
L928D_14:
  LD A,$01
  RET
L928D_15:
  LD A,$FF
  RET
; This entry point is used by the routine at game_over.
L928D_16:
  LD A,(state_game_mode)
  BIT 0,A
  CALL NZ,L928D_17
  LD HL,L90C8
  LD A,(state_game_mode)
  AND $FE
  LD E,A
  LD A,(state_game_mode)
  AND $FE
  SLA A
  SLA A
  SUB E
  LD D,$00
  LD E,A
  ADD HL,DE
  EX DE,HL
  LD HL,state_score_player_1
  PUSH DE
  CALL L928D_12
  POP DE
  CP $01
  RET NZ
  LD HL,state_score_player_1
  LD BC,state_score_player_2 - state_score_player_1
  LDIR
  RET
L928D_17:
  LD HL,state_score_player_1
  LD DE,state_score_player_2
  CALL L928D_12
  CP $FF
  RET NZ
  LD HL,state_score_player_2
  LD DE,state_score_player_1
  LD BC,state_score_player_2 - state_score_player_1
  LDIR
  RET

; Clear the screen by setting all pixel bytes to $00 and all attributes to the
; value set in D.
;
; Used by the routines at decrease_lives_player_2, demo, clear_and_setup,
; controls_input and game_mode_input.
;
; I:D Attribute value.
clear_screen:
  LD HL,screen_pixels
  LD C,$18                ; Clear the $18 of 256-byte blocks (6144 bytes) of
                          ; pixels
clear_scr_block:
  LD B,$00                ; 256-byte counter
clear_scr_byte:
  LD (HL),$00
  INC HL
  DJNZ clear_scr_byte     ; ...loop until the counter is zero
  DEC C
  JR NZ,clear_scr_block   ; Process next block
  LD C,$03                ; Set the $03 of 256-byte blocks (768 bytes) of
                          ; attribute
clear_scr_attr:
  LD (HL),D
  INC HL
  DJNZ clear_scr_attr     ; ...loop until the counter is zero
  DEC C
  JR NZ,clear_scr_attr    ; Process next block
  RET

; Load current player lives
;
; Used by the routine at add_life.
;
; O:HL Pointer to the current player lives
ld_lives:
  LD HL,state_lives_player_1
  LD A,(state_player)
  CP $02
  RET NZ
  LD HL,state_lives_player_2
  RET

; Data block at 9430
L9430:
  DEFB $C3,$90,$EA,$30,$06,$79,$CD,$6E
  DEFB $F7,$18,$C9,$22,$95,$FA,$7E,$FE
  DEFB $82,$20,$3E,$23,$22,$95,$FA,$CD
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00

; Array [48] of level terrain data (256 bytes each).
level_terrains:
  DEFB $0C,$83,$4C,$01    ; Bridge 1
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0B,$84,$40,$02    ;
  DEFB $01,$84,$40,$02    ;
  DEFB $0B,$84,$40,$02    ;
  DEFB $01,$84,$40,$02    ;
  DEFB $05,$84,$40,$02    ;
  DEFB $06,$84,$40,$02    ;
  DEFB $0B,$84,$40,$02    ;
  DEFB $0B,$84,$40,$02    ;
  DEFB $05,$84,$40,$02    ;
  DEFB $01,$84,$48,$02    ;
  DEFB $06,$84,$40,$02    ;
  DEFB $0E,$84,$40,$02    ;
  DEFB $0B,$84,$40,$02    ;
  DEFB $0B,$84,$40,$02    ;
  DEFB $08,$84,$30,$02    ;
  DEFB $01,$84,$30,$02    ;
  DEFB $05,$84,$30,$02    ;
  DEFB $05,$84,$38,$02    ;
  DEFB $0E,$84,$40,$02    ;
  DEFB $0E,$84,$40,$02    ;
  DEFB $06,$84,$38,$02    ;
  DEFB $05,$84,$38,$02    ;
  DEFB $0B,$84,$40,$02    ;
  DEFB $0B,$84,$40,$02    ;
  DEFB $0B,$84,$40,$02    ;
  DEFB $06,$84,$38,$02    ;
  DEFB $0E,$84,$38,$02    ;
  DEFB $01,$84,$38,$02    ;
  DEFB $0B,$84,$38,$02    ;
  DEFB $09,$84,$38,$02    ;
  DEFB $01,$84,$50,$02    ;
  DEFB $0B,$84,$50,$02    ;
  DEFB $0E,$84,$50,$02    ;
  DEFB $08,$84,$40,$02    ;
  DEFB $0B,$84,$40,$02    ;
  DEFB $0E,$84,$40,$02    ;
  DEFB $05,$84,$40,$02    ;
  DEFB $0F,$84,$48,$02    ;
  DEFB $0F,$84,$48,$02    ;
  DEFB $06,$84,$40,$02    ;
  DEFB $0E,$84,$40,$02    ;
  DEFB $05,$85,$40,$02    ;
  DEFB $0B,$84,$48,$02    ;
  DEFB $06,$84,$40,$02    ;
  DEFB $07,$84,$40,$02    ;
  DEFB $0F,$84,$50,$02    ;
  DEFB $0E,$84,$50,$02    ;
  DEFB $08,$84,$40,$02    ;
  DEFB $0B,$84,$40,$02    ;
  DEFB $0B,$84,$40,$02    ;
  DEFB $0E,$84,$40,$02    ;
  DEFB $05,$84,$40,$02    ;
  DEFB $01,$84,$48,$02    ;
  DEFB $01,$84,$48,$02    ;
  DEFB $06,$84,$40,$02    ;
  DEFB $0F,$84,$40,$02    ;
  DEFB $0B,$84,$40,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 2
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0A,$84,$2C,$01    ;
  DEFB $06,$84,$24,$01    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$0E    ;
  DEFB $0F,$BC,$24,$1E    ;
  DEFB $0E,$BC,$24,$22    ;
  DEFB $0B,$BC,$24,$76    ;
  DEFB $0F,$BC,$24,$86    ;
  DEFB $01,$BC,$24,$82    ;
  DEFB $05,$BC,$24,$8E    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $01,$84,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $0E,$84,$4C,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $05,$84,$4C,$01    ;
  DEFB $06,$84,$4C,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $01,$84,$4C,$01    ;
  DEFB $05,$84,$4C,$01    ;
  DEFB $06,$84,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $0E,$BC,$2C,$02    ;
  DEFB $0B,$BC,$2C,$16    ;
  DEFB $0F,$BC,$2C,$56    ;
  DEFB $06,$BC,$24,$5A    ;
  DEFB $05,$BC,$24,$56    ;
  DEFB $06,$BC,$24,$4A    ;
  DEFB $01,$BC,$24,$2E    ;
  DEFB $0E,$BC,$24,$46    ;
  DEFB $0F,$BC,$24,$1A    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 3
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $07,$84,$3C,$02    ;
  DEFB $08,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $01,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $0E,$84,$54,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $08,$84,$34,$02    ;
  DEFB $0B,$84,$34,$02    ;
  DEFB $0F,$84,$34,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $07,$84,$3C,$02    ;
  DEFB $08,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0E,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 4
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $0B,$BC,$2C,$02    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $0E,$BC,$2C,$06    ;
  DEFB $06,$BC,$24,$26    ;
  DEFB $0F,$BC,$24,$2A    ;
  DEFB $0B,$BC,$24,$5E    ;
  DEFB $0E,$BC,$24,$3E    ;
  DEFB $0B,$BC,$24,$2E    ;
  DEFB $01,$BC,$24,$32    ;
  DEFB $0F,$BC,$24,$46    ;
  DEFB $05,$BC,$24,$7E    ;
  DEFB $06,$BC,$24,$0A    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $09,$84,$24,$01    ;
  DEFB $05,$84,$3C,$01    ;
  DEFB $0F,$84,$44,$01    ;
  DEFB $0B,$84,$44,$01    ;
  DEFB $0A,$84,$2C,$01    ;
  DEFB $06,$84,$24,$01    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$06    ;
  DEFB $01,$BC,$24,$3E    ;
  DEFB $05,$BC,$24,$32    ;
  DEFB $0F,$BC,$2C,$2E    ;
  DEFB $0B,$BC,$2C,$42    ;
  DEFB $0E,$BC,$2C,$3A    ;
  DEFB $0F,$BC,$2C,$22    ;
  DEFB $0B,$BC,$2C,$1E    ;
  DEFB $0B,$BC,$2C,$36    ;
  DEFB $0E,$BC,$2C,$3E    ;
  DEFB $0F,$BC,$2C,$32    ;
  DEFB $0F,$BC,$2C,$32    ;
  DEFB $0B,$BC,$2C,$2E    ;
  DEFB $06,$BC,$24,$32    ;
  DEFB $0F,$BC,$24,$2E    ;
  DEFB $0E,$BC,$24,$42    ;
  DEFB $01,$BC,$24,$0A    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 5
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $0E,$84,$54,$02    ;
  DEFB $01,$84,$54,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $0E,$82,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $08,$84,$34,$02    ;
  DEFB $07,$84,$34,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $01,$84,$3C,$02    ;
  DEFB $0E,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 6
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$06    ;
  DEFB $06,$BC,$24,$26    ;
  DEFB $0E,$BC,$24,$2A    ;
  DEFB $0F,$BC,$24,$26    ;
  DEFB $05,$BC,$24,$5E    ;
  DEFB $0F,$BC,$2C,$26    ;
  DEFB $0B,$BC,$2C,$2A    ;
  DEFB $06,$BC,$24,$5E    ;
  DEFB $0E,$BC,$24,$5E    ;
  DEFB $0B,$BC,$24,$26    ;
  DEFB $05,$BC,$24,$2A    ;
  DEFB $06,$BC,$24,$26    ;
  DEFB $0F,$BC,$24,$5E    ;
  DEFB $0E,$BC,$24,$2A    ;
  DEFB $01,$BC,$24,$3A    ;
  DEFB $01,$BC,$24,$12    ;
  DEFB $0B,$BC,$24,$8A    ;
  DEFB $0E,$BC,$24,$8E    ;
  DEFB $0F,$BC,$24,$8A    ;
  DEFB $05,$BC,$24,$8E    ;
  DEFB $0F,$BC,$2C,$8A    ;
  DEFB $06,$BC,$24,$72    ;
  DEFB $0F,$BC,$24,$1E    ;
  DEFB $0E,$BC,$24,$22    ;
  DEFB $01,$BC,$24,$22    ;
  DEFB $0B,$BC,$24,$1E    ;
  DEFB $0F,$BC,$24,$1E    ;
  DEFB $05,$BC,$24,$22    ;
  DEFB $06,$BC,$24,$12    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $01,$84,$4C,$01    ;
  DEFB $0E,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $0F,$BC,$2C,$06    ;
  DEFB $06,$BC,$24,$3E    ;
  DEFB $0B,$BC,$24,$42    ;
  DEFB $01,$BC,$24,$0A    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $01,$84,$24,$01    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 7
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $01,$84,$54,$02    ;
  DEFB $0E,$84,$54,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $0E,$84,$54,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $0A,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $01,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 8
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $08,$84,$34,$01    ;
  DEFB $08,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$0E    ;
  DEFB $0E,$BC,$24,$1E    ;
  DEFB $05,$BC,$24,$22    ;
  DEFB $06,$BC,$24,$36    ;
  DEFB $0E,$BC,$24,$3E    ;
  DEFB $0F,$BC,$24,$32    ;
  DEFB $01,$BC,$24,$2E    ;
  DEFB $0B,$BC,$24,$32    ;
  DEFB $0F,$BC,$24,$42    ;
  DEFB $0E,$BC,$24,$0A    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $0B,$BC,$2C,$02    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $0B,$BC,$2C,$02    ;
  DEFB $0E,$BC,$2C,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$16    ;
  DEFB $01,$BC,$24,$56    ;
  DEFB $05,$BC,$24,$4E    ;
  DEFB $06,$BC,$24,$52    ;
  DEFB $0B,$BC,$24,$5A    ;
  DEFB $0F,$BC,$24,$1A    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $01,$84,$4C,$01    ;
  DEFB $05,$84,$4C,$01    ;
  DEFB $06,$84,$4C,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $0E,$84,$4C,$01    ;
  DEFB $01,$84,$4C,$01    ;
  DEFB $0A,$84,$34,$01    ;
  DEFB $08,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $09,$84,$24,$01    ;
  DEFB $07,$84,$3C,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 9
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $08,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $01,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0A,$84,$34,$02    ;
  DEFB $0B,$84,$34,$02    ;
  DEFB $0F,$84,$34,$02    ;
  DEFB $0E,$84,$34,$02    ;
  DEFB $01,$84,$34,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0E,$84,$3C,$02    ;
  DEFB $01,$84,$3C,$02    ;
  DEFB $08,$84,$2C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $01,$84,$2C,$02    ;
  DEFB $0E,$84,$2C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $01,$84,$2C,$02    ;
  DEFB $0B,$84,$2C,$02    ;
  DEFB $05,$84,$2C,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $01,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $07,$84,$3C,$02    ;
  DEFB $08,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 10
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $01,$84,$4C,$01    ;
  DEFB $0C,$84,$4C,$01    ;
  DEFB $0F,$1C,$74,$02    ;
  DEFB $0B,$1C,$74,$02    ;
  DEFB $01,$1C,$74,$02    ;
  DEFB $0D,$84,$4C,$01    ;
  DEFB $0F,$74,$4C,$02    ;
  DEFB $01,$74,$4C,$02    ;
  DEFB $0E,$74,$4C,$02    ;
  DEFB $0C,$84,$4C,$01    ;
  DEFB $08,$1C,$64,$02    ;
  DEFB $07,$1C,$64,$02    ;
  DEFB $01,$1C,$74,$02    ;
  DEFB $0F,$1C,$74,$02    ;
  DEFB $0B,$1C,$74,$02    ;
  DEFB $05,$1C,$74,$02    ;
  DEFB $06,$1C,$74,$02    ;
  DEFB $01,$1C,$74,$02    ;
  DEFB $0F,$1C,$74,$02    ;
  DEFB $0E,$1C,$74,$02    ;
  DEFB $0D,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $0B,$BC,$2C,$16    ;
  DEFB $0E,$BC,$2C,$56    ;
  DEFB $06,$BC,$24,$5A    ;
  DEFB $0F,$BC,$24,$56    ;
  DEFB $0F,$BC,$24,$5A    ;
  DEFB $0B,$BC,$24,$1A    ;
  DEFB $0E,$BC,$24,$8A    ;
  DEFB $01,$BC,$24,$8A    ;
  DEFB $05,$BC,$24,$16    ;
  DEFB $06,$BC,$24,$5A    ;
  DEFB $0F,$BC,$24,$5A    ;
  DEFB $0B,$BC,$24,$56    ;
  DEFB $0E,$BC,$24,$5A    ;
  DEFB $05,$BC,$24,$1A    ;
  DEFB $0F,$BC,$2C,$0E    ;
  DEFB $0B,$BC,$2C,$12    ;
  DEFB $0F,$BC,$2C,$16    ;
  DEFB $0E,$BC,$2C,$4E    ;
  DEFB $0B,$BC,$2C,$52    ;
  DEFB $06,$BC,$24,$56    ;
  DEFB $01,$BC,$24,$5A    ;
  DEFB $0B,$BC,$24,$1A    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 11
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $09,$84,$44,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $0E,$84,$64,$02    ;
  DEFB $0F,$84,$64,$02    ;
  DEFB $0B,$84,$64,$02    ;
  DEFB $0E,$84,$64,$02    ;
  DEFB $0B,$84,$64,$02    ;
  DEFB $0A,$84,$4C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $01,$84,$5C,$02    ;
  DEFB $08,$84,$4C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $09,$84,$4C,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $08,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $07,$84,$3C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $0D,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $09,$84,$2C,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $01,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $08,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 12
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0E,$BC,$24,$16    ;
  DEFB $0F,$BC,$24,$56    ;
  DEFB $0E,$BC,$24,$5A    ;
  DEFB $0B,$BC,$24,$5A    ;
  DEFB $05,$BC,$24,$56    ;
  DEFB $06,$BC,$24,$5A    ;
  DEFB $0F,$BC,$24,$5A    ;
  DEFB $0B,$BC,$24,$56    ;
  DEFB $05,$BC,$24,$5A    ;
  DEFB $0B,$BC,$2C,$56    ;
  DEFB $06,$BC,$24,$4E    ;
  DEFB $0F,$BC,$24,$52    ;
  DEFB $0B,$BC,$24,$56    ;
  DEFB $01,$BC,$24,$1A    ;
  DEFB $0E,$BC,$24,$8A    ;
  DEFB $05,$BC,$24,$8E    ;
  DEFB $0B,$BC,$2C,$8A    ;
  DEFB $0F,$BC,$2C,$72    ;
  DEFB $0E,$BC,$2C,$12    ;
  DEFB $06,$BC,$24,$06    ;
  DEFB $07,$BC,$24,$26    ;
  DEFB $08,$BC,$24,$2A    ;
  DEFB $05,$BC,$24,$26    ;
  DEFB $06,$BC,$24,$26    ;
  DEFB $01,$BC,$24,$2A    ;
  DEFB $0B,$BC,$24,$0A    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $09,$84,$24,$01    ;
  DEFB $05,$84,$3C,$01    ;
  DEFB $0E,$84,$44,$01    ;
  DEFB $0B,$84,$44,$01    ;
  DEFB $08,$84,$34,$01    ;
  DEFB $08,$84,$24,$01    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$8A    ;
  DEFB $0F,$BC,$24,$8E    ;
  DEFB $0B,$BC,$24,$8A    ;
  DEFB $01,$BC,$24,$8E    ;
  DEFB $0B,$BC,$24,$06    ;
  DEFB $07,$BC,$24,$5E    ;
  DEFB $08,$BC,$24,$26    ;
  DEFB $0B,$BC,$24,$2A    ;
  DEFB $0F,$BC,$24,$26    ;
  DEFB $0F,$BC,$24,$5E    ;
  DEFB $0E,$BC,$24,$7A    ;
  DEFB $05,$BC,$24,$56    ;
  DEFB $0B,$BC,$2C,$5A    ;
  DEFB $06,$BC,$24,$56    ;
  DEFB $01,$BC,$24,$5A    ;
  DEFB $0F,$BC,$24,$5A    ;
  DEFB $0E,$BC,$24,$1A    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 13
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0B,$80,$44,$02    ;
  DEFB $07,$80,$44,$02    ;
  DEFB $05,$80,$54,$02    ;
  DEFB $01,$80,$5C,$02    ;
  DEFB $0A,$80,$44,$02    ;
  DEFB $0E,$80,$44,$02    ;
  DEFB $0F,$80,$44,$02    ;
  DEFB $06,$80,$3C,$02    ;
  DEFB $06,$80,$34,$02    ;
  DEFB $07,$80,$34,$02    ;
  DEFB $06,$80,$3C,$02    ;
  DEFB $08,$80,$2C,$02    ;
  DEFB $01,$80,$2C,$02    ;
  DEFB $0B,$80,$2C,$02    ;
  DEFB $0F,$80,$2C,$02    ;
  DEFB $05,$80,$2C,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $08,$84,$2C,$02    ;
  DEFB $0E,$84,$2C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $01,$84,$2C,$02    ;
  DEFB $0B,$84,$2C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $07,$84,$24,$02    ;
  DEFB $06,$84,$2C,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $07,$84,$24,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $01,$84,$3C,$02    ;
  DEFB $07,$84,$3C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $05,$84,$54,$02    ;
  DEFB $01,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0E,$84,$5C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $07,$84,$54,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $01,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $0E,$84,$5C,$02    ;
  DEFB $08,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0B,$84,$44,$01    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 14
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0A,$84,$2C,$01    ;
  DEFB $06,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $0B,$BC,$2C,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $0B,$BC,$2C,$16    ;
  DEFB $0B,$BC,$2C,$56    ;
  DEFB $06,$BC,$24,$5A    ;
  DEFB $05,$BC,$24,$56    ;
  DEFB $06,$BC,$24,$7E    ;
  DEFB $01,$BC,$24,$3A    ;
  DEFB $0F,$BC,$24,$1E    ;
  DEFB $0F,$BC,$24,$22    ;
  DEFB $0E,$BC,$24,$22    ;
  DEFB $0F,$BC,$24,$1E    ;
  DEFB $06,$BC,$1C,$1E    ;
  DEFB $07,$BC,$1C,$22    ;
  DEFB $08,$BC,$1C,$36    ;
  DEFB $05,$BC,$1C,$3E    ;
  DEFB $0B,$BC,$24,$62    ;
  DEFB $05,$BC,$24,$52    ;
  DEFB $06,$BC,$24,$56    ;
  DEFB $0F,$BC,$24,$56    ;
  DEFB $0F,$BC,$24,$5A    ;
  DEFB $0B,$BC,$24,$56    ;
  DEFB $0E,$BC,$24,$5A    ;
  DEFB $0B,$BC,$24,$4E    ;
  DEFB $0F,$BC,$24,$52    ;
  DEFB $0E,$BC,$24,$1A    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 15
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $01,$84,$54,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $07,$84,$3C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $07,$84,$54,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $08,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $0A,$84,$3C,$02    ;
  DEFB $06,$84,$34,$02    ;
  DEFB $0F,$84,$34,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $07,$84,$3C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $08,$84,$3C,$02    ;
  DEFB $08,$84,$2C,$02    ;
  DEFB $05,$84,$2C,$02    ;
  DEFB $01,$84,$34,$02    ;
  DEFB $08,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $0E,$84,$24,$02    ;
  DEFB $07,$84,$24,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $08,$84,$2C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $01,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $09,$84,$2C,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 16
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $01,$84,$24,$01    ;
  DEFB $0B,$84,$24,$01    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$8A    ;
  DEFB $05,$BC,$24,$8E    ;
  DEFB $06,$BC,$24,$8A    ;
  DEFB $0F,$BC,$24,$8E    ;
  DEFB $0B,$BC,$24,$16    ;
  DEFB $05,$BC,$24,$56    ;
  DEFB $0B,$BC,$2C,$5A    ;
  DEFB $0B,$BC,$2C,$4E    ;
  DEFB $0F,$BC,$2C,$52    ;
  DEFB $06,$BC,$24,$5A    ;
  DEFB $0F,$BC,$24,$56    ;
  DEFB $0B,$BC,$24,$4E    ;
  DEFB $0F,$BC,$24,$52    ;
  DEFB $0B,$BC,$24,$4E    ;
  DEFB $0E,$BC,$24,$52    ;
  DEFB $07,$BC,$24,$5A    ;
  DEFB $08,$BC,$24,$56    ;
  DEFB $05,$BC,$24,$5A    ;
  DEFB $06,$BC,$24,$56    ;
  DEFB $0B,$BC,$24,$5A    ;
  DEFB $0F,$BC,$24,$1A    ;
  DEFB $0E,$BC,$24,$8A    ;
  DEFB $0F,$BC,$24,$8E    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $0B,$BC,$2C,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $07,$84,$24,$01    ;
  DEFB $07,$84,$34,$01    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $06,$84,$3C,$01    ;
  DEFB $0A,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$16    ;
  DEFB $0E,$BC,$24,$5A    ;
  DEFB $01,$BC,$24,$4E    ;
  DEFB $05,$BC,$24,$52    ;
  DEFB $0B,$BC,$2C,$56    ;
  DEFB $06,$BC,$24,$1A    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 17
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$40,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $09,$84,$44,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $05,$84,$54,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $05,$84,$54,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $08,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $08,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $0A,$84,$24,$02    ;
  DEFB $07,$84,$24,$02    ;
  DEFB $0B,$84,$34,$02    ;
  DEFB $0B,$84,$34,$02    ;
  DEFB $06,$84,$2C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $0E,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $07,$84,$24,$02    ;
  DEFB $0B,$84,$34,$02    ;
  DEFB $0E,$84,$34,$02    ;
  DEFB $08,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $01,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $01,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $05,$84,$2C,$02    ;
  DEFB $0B,$84,$34,$02    ;
  DEFB $07,$84,$34,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $08,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 18
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$50,$01    ;
  DEFB $0F,$84,$74,$01    ;
  DEFB $0B,$84,$74,$01    ;
  DEFB $01,$84,$74,$01    ;
  DEFB $0F,$84,$74,$01    ;
  DEFB $0B,$84,$74,$01    ;
  DEFB $0F,$84,$74,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0B,$84,$24,$01    ;
  DEFB $0B,$84,$24,$01    ;
  DEFB $07,$84,$24,$01    ;
  DEFB $08,$84,$24,$01    ;
  DEFB $05,$84,$24,$01    ;
  DEFB $06,$84,$24,$01    ;
  DEFB $0B,$84,$24,$01    ;
  DEFB $0F,$84,$24,$01    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $07,$74,$4C,$02    ;
  DEFB $08,$74,$4C,$02    ;
  DEFB $0A,$84,$34,$01    ;
  DEFB $0B,$84,$34,$01    ;
  DEFB $0F,$84,$34,$01    ;
  DEFB $01,$84,$34,$01    ;
  DEFB $0C,$84,$34,$01    ;
  DEFB $01,$54,$5C,$02    ;
  DEFB $08,$54,$4C,$02    ;
  DEFB $06,$54,$44,$02    ;
  DEFB $08,$54,$34,$02    ;
  DEFB $08,$5C,$24,$01    ;
  DEFB $07,$70,$24,$02    ;
  DEFB $08,$6C,$24,$01    ;
  DEFB $07,$90,$24,$02    ;
  DEFB $08,$7C,$24,$01    ;
  DEFB $07,$AE,$24,$02    ;
  DEFB $06,$89,$2C,$01    ;
  DEFB $06,$BD,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $0C,$84,$4C,$01    ;
  DEFB $07,$1C,$74,$02    ;
  DEFB $0B,$94,$84,$01    ;
  DEFB $0B,$94,$84,$01    ;
  DEFB $0F,$94,$84,$01    ;
  DEFB $0E,$94,$84,$01    ;
  DEFB $08,$1C,$74,$02    ;
  DEFB $0D,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $01,$84,$24,$01    ;
  DEFB $07,$84,$24,$01    ;
  DEFB $08,$84,$24,$01    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$84,$4C,$01    ;
  DEFB $01,$84,$74,$01    ;
  DEFB $0B,$84,$74,$01    ;
  DEFB $0D,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0B,$84,$24,$01    ;
  DEFB $0F,$84,$24,$01    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 19
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $0E,$84,$64,$02    ;
  DEFB $08,$85,$54,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $07,$84,$54,$02    ;
  DEFB $0B,$84,$64,$02    ;
  DEFB $08,$85,$54,$02    ;
  DEFB $01,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $06,$84,$34,$02    ;
  DEFB $0F,$84,$34,$02    ;
  DEFB $07,$84,$34,$02    ;
  DEFB $08,$84,$34,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0E,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $07,$84,$3C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $0B,$85,$54,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0B,$85,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $08,$84,$2C,$02    ;
  DEFB $0B,$84,$2C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $07,$84,$2C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 20
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$0E    ;
  DEFB $0E,$BC,$24,$36    ;
  DEFB $0B,$BC,$24,$3A    ;
  DEFB $01,$BC,$24,$22    ;
  DEFB $0F,$BC,$24,$1E    ;
  DEFB $0E,$BC,$24,$1E    ;
  DEFB $0B,$BC,$24,$22    ;
  DEFB $0F,$BC,$24,$22    ;
  DEFB $01,$BC,$24,$36    ;
  DEFB $05,$BC,$24,$7A    ;
  DEFB $06,$BC,$24,$56    ;
  DEFB $01,$BC,$24,$5A    ;
  DEFB $0F,$BC,$24,$1A    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $07,$84,$4C,$01    ;
  DEFB $07,$84,$5C,$01    ;
  DEFB $0F,$2C,$6C,$02    ;
  DEFB $05,$2C,$6C,$02    ;
  DEFB $05,$2C,$74,$02    ;
  DEFB $06,$2C,$74,$02    ;
  DEFB $08,$2C,$64,$02    ;
  DEFB $05,$2C,$64,$02    ;
  DEFB $0A,$84,$54,$01    ;
  DEFB $0F,$84,$54,$01    ;
  DEFB $0B,$84,$54,$01    ;
  DEFB $0E,$84,$54,$01    ;
  DEFB $0B,$84,$54,$01    ;
  DEFB $01,$84,$54,$01    ;
  DEFB $05,$84,$54,$01    ;
  DEFB $06,$84,$54,$01    ;
  DEFB $0D,$84,$2C,$01    ;
  DEFB $06,$84,$24,$01    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $0E,$BC,$2C,$02    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $0B,$BC,$2C,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$16    ;
  DEFB $0E,$BC,$24,$56    ;
  DEFB $05,$BC,$24,$56    ;
  DEFB $06,$BC,$24,$5A    ;
  DEFB $0F,$BC,$24,$56    ;
  DEFB $0B,$BC,$24,$1A    ;
  DEFB $07,$84,$24,$01    ;
  DEFB $08,$84,$24,$01    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 21
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $08,$84,$34,$02    ;
  DEFB $0F,$84,$34,$02    ;
  DEFB $0B,$84,$34,$02    ;
  DEFB $06,$84,$2C,$02    ;
  DEFB $0E,$84,$2C,$02    ;
  DEFB $0B,$84,$2C,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $0B,$84,$2C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $01,$84,$2C,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $0E,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $07,$84,$24,$02    ;
  DEFB $08,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $07,$84,$24,$02    ;
  DEFB $0B,$84,$34,$02    ;
  DEFB $01,$84,$34,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $06,$84,$34,$02    ;
  DEFB $0E,$84,$34,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $07,$84,$3C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0E,$84,$5C,$02    ;
  DEFB $01,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $0F,$84,$64,$02    ;
  DEFB $0B,$84,$64,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $0B,$84,$64,$02    ;
  DEFB $0F,$84,$64,$02    ;
  DEFB $0E,$84,$64,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $01,$84,$54,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 22
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0D,$84,$1C,$01    ;
  DEFB $05,$84,$1C,$01    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$16    ;
  DEFB $05,$BC,$24,$56    ;
  DEFB $06,$BC,$24,$5A    ;
  DEFB $01,$BC,$24,$56    ;
  DEFB $05,$BC,$24,$5A    ;
  DEFB $0E,$BC,$2C,$1A    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $0B,$BC,$2C,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $07,$84,$24,$01    ;
  DEFB $0F,$84,$34,$01    ;
  DEFB $09,$84,$34,$01    ;
  DEFB $01,$84,$4C,$01    ;
  DEFB $08,$84,$3C,$01    ;
  DEFB $06,$84,$34,$01    ;
  DEFB $08,$84,$24,$01    ;
  DEFB $01,$84,$24,$01    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$8A    ;
  DEFB $06,$BC,$24,$82    ;
  DEFB $05,$BC,$24,$82    ;
  DEFB $0F,$BC,$2C,$86    ;
  DEFB $0B,$BC,$2C,$8E    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$84,$4C,$01    ;
  DEFB $0B,$1C,$74,$02    ;
  DEFB $0F,$1C,$74,$02    ;
  DEFB $01,$1C,$74,$02    ;
  DEFB $0D,$84,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 23
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $08,$84,$34,$02    ;
  DEFB $0F,$84,$34,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0E,$84,$3C,$02    ;
  DEFB $01,$84,$3C,$02    ;
  DEFB $06,$84,$34,$02    ;
  DEFB $0E,$84,$34,$02    ;
  DEFB $0B,$84,$34,$02    ;
  DEFB $0F,$84,$34,$02    ;
  DEFB $06,$84,$2C,$02    ;
  DEFB $07,$84,$2C,$02    ;
  DEFB $06,$84,$34,$02    ;
  DEFB $0E,$84,$34,$02    ;
  DEFB $0B,$84,$34,$02    ;
  DEFB $09,$84,$34,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $08,$84,$34,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $06,$84,$34,$02    ;
  DEFB $01,$84,$34,$02    ;
  DEFB $08,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $01,$84,$2C,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $0B,$84,$2C,$02    ;
  DEFB $05,$84,$2C,$02    ;
  DEFB $0F,$84,$34,$02    ;
  DEFB $0E,$84,$34,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $0A,$84,$1C,$02    ;
  DEFB $05,$84,$1C,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $01,$84,$24,$02    ;
  DEFB $0E,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $0B,$84,$2C,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $0E,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $07,$84,$2C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 24
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$84,$4C,$01    ;
  DEFB $0E,$1C,$74,$02    ;
  DEFB $01,$1C,$74,$02    ;
  DEFB $0D,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $09,$84,$24,$01    ;
  DEFB $05,$84,$3C,$01    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $0A,$84,$2C,$01    ;
  DEFB $06,$84,$24,$01    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$16    ;
  DEFB $0E,$BC,$24,$56    ;
  DEFB $01,$BC,$24,$5A    ;
  DEFB $0F,$BC,$24,$56    ;
  DEFB $0B,$BC,$24,$4A    ;
  DEFB $01,$BC,$24,$42    ;
  DEFB $0E,$BC,$24,$3E    ;
  DEFB $0E,$BC,$24,$46    ;
  DEFB $0F,$BC,$24,$5A    ;
  DEFB $0F,$BC,$24,$56    ;
  DEFB $0B,$BC,$24,$5A    ;
  DEFB $0E,$BC,$24,$5A    ;
  DEFB $01,$BC,$24,$1A    ;
  DEFB $05,$BC,$24,$8A    ;
  DEFB $0E,$BC,$2C,$8E    ;
  DEFB $0F,$BC,$2C,$16    ;
  DEFB $06,$BC,$24,$5A    ;
  DEFB $0B,$BC,$24,$56    ;
  DEFB $0E,$BC,$24,$56    ;
  DEFB $01,$BC,$24,$4E    ;
  DEFB $0F,$BC,$24,$52    ;
  DEFB $0E,$BC,$24,$5A    ;
  DEFB $05,$BC,$24,$56    ;
  DEFB $06,$BC,$24,$5A    ;
  DEFB $0F,$BC,$24,$1A    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 25
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $08,$84,$34,$02    ;
  DEFB $07,$84,$34,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $08,$84,$34,$02    ;
  DEFB $01,$84,$34,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0E,$84,$3C,$02    ;
  DEFB $09,$84,$3C,$02    ;
  DEFB $05,$84,$54,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $01,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $0B,$84,$64,$02    ;
  DEFB $0F,$84,$64,$02    ;
  DEFB $0A,$84,$4C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $08,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $0E,$84,$64,$02    ;
  DEFB $0B,$84,$64,$02    ;
  DEFB $0F,$84,$64,$02    ;
  DEFB $0F,$84,$64,$02    ;
  DEFB $0E,$84,$64,$02    ;
  DEFB $0B,$84,$64,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $08,$84,$4C,$02    ;
  DEFB $08,$84,$3C,$02    ;
  DEFB $07,$84,$3C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $01,$84,$54,$02    ;
  DEFB $0A,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $06,$84,$34,$02    ;
  DEFB $0A,$84,$1C,$02    ;
  DEFB $0F,$84,$1C,$02    ;
  DEFB $0B,$84,$1C,$02    ;
  DEFB $07,$84,$1C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $09,$84,$2C,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 26
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0F,$BC,$24,$0E    ;
  DEFB $0B,$BC,$24,$1E    ;
  DEFB $0F,$BC,$24,$22    ;
  DEFB $0E,$BC,$24,$12    ;
  DEFB $0B,$BC,$24,$8A    ;
  DEFB $0E,$BC,$24,$8E    ;
  DEFB $0F,$BC,$24,$8A    ;
  DEFB $05,$BC,$24,$8E    ;
  DEFB $06,$BC,$24,$16    ;
  DEFB $01,$BC,$24,$56    ;
  DEFB $0F,$BC,$24,$56    ;
  DEFB $05,$BC,$24,$5A    ;
  DEFB $0F,$BC,$2C,$56    ;
  DEFB $0E,$BC,$2C,$5A    ;
  DEFB $0F,$BC,$2C,$5A    ;
  DEFB $0B,$BC,$2C,$1A    ;
  DEFB $06,$BC,$24,$8A    ;
  DEFB $0B,$BC,$24,$82    ;
  DEFB $0E,$BC,$24,$8E    ;
  DEFB $01,$BC,$24,$16    ;
  DEFB $0F,$BC,$24,$56    ;
  DEFB $05,$BC,$24,$5A    ;
  DEFB $06,$BC,$24,$5A    ;
  DEFB $0F,$BC,$24,$56    ;
  DEFB $07,$BC,$24,$4E    ;
  DEFB $08,$BC,$24,$52    ;
  DEFB $06,$BC,$1C,$56    ;
  DEFB $05,$BC,$1C,$5A    ;
  DEFB $0F,$BC,$24,$5A    ;
  DEFB $0B,$BC,$24,$4E    ;
  DEFB $0B,$BC,$24,$52    ;
  DEFB $01,$BC,$24,$5A    ;
  DEFB $0E,$BC,$24,$56    ;
  DEFB $0F,$BC,$24,$56    ;
  DEFB $0B,$BC,$24,$5A    ;
  DEFB $01,$BC,$24,$56    ;
  DEFB $0E,$BC,$24,$4E    ;
  DEFB $0B,$BC,$24,$52    ;
  DEFB $0F,$BC,$24,$56    ;
  DEFB $05,$BC,$24,$5A    ;
  DEFB $06,$BC,$24,$5A    ;
  DEFB $05,$BC,$24,$4E    ;
  DEFB $0F,$BC,$2C,$52    ;
  DEFB $0E,$BC,$2C,$5A    ;
  DEFB $0B,$BC,$2C,$1A    ;
  DEFB $06,$BC,$24,$8A    ;
  DEFB $0B,$BC,$24,$82    ;
  DEFB $0E,$BC,$24,$86    ;
  DEFB $01,$BC,$24,$82    ;
  DEFB $0F,$BC,$24,$72    ;
  DEFB $0B,$BC,$24,$36    ;
  DEFB $0F,$BC,$24,$5E    ;
  DEFB $05,$BC,$24,$26    ;
  DEFB $06,$BC,$24,$2A    ;
  DEFB $0E,$BC,$24,$0A    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 27
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$84,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0D,$84,$1C,$02    ;
  DEFB $05,$84,$1C,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $01,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $01,$84,$24,$02    ;
  DEFB $0E,$84,$24,$02    ;
  DEFB $07,$84,$24,$02    ;
  DEFB $01,$84,$34,$02    ;
  DEFB $0F,$84,$34,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $08,$84,$34,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $01,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $0A,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $0E,$84,$2C,$02    ;
  DEFB $07,$84,$2C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $09,$84,$3C,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $0B,$84,$64,$02    ;
  DEFB $0F,$84,$64,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $01,$84,$54,$02    ;
  DEFB $05,$84,$54,$02    ;
  DEFB $08,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 28
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0B,$1C,$74,$02    ;
  DEFB $0F,$1C,$74,$02    ;
  DEFB $0D,$84,$4C,$01    ;
  DEFB $0A,$84,$34,$01    ;
  DEFB $01,$84,$34,$01    ;
  DEFB $0B,$84,$34,$01    ;
  DEFB $0F,$84,$34,$01    ;
  DEFB $09,$84,$34,$01    ;
  DEFB $01,$84,$4C,$01    ;
  DEFB $05,$84,$4C,$01    ;
  DEFB $06,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0F,$84,$24,$01    ;
  DEFB $01,$84,$24,$01    ;
  DEFB $0B,$84,$24,$05    ;
  DEFB $0E,$84,$24,$25    ;
  DEFB $0B,$84,$24,$29    ;
  DEFB $0F,$84,$24,$5D    ;
  DEFB $01,$84,$24,$09    ;
  DEFB $0E,$84,$24,$01    ;
  DEFB $05,$84,$24,$01    ;
  DEFB $0B,$84,$2C,$01    ;
  DEFB $0C,$84,$2C,$01    ;
  DEFB $0C,$84,$54,$01    ;
  DEFB $0B,$0C,$7C,$02    ;
  DEFB $0F,$0C,$7C,$02    ;
  DEFB $0D,$84,$54,$01    ;
  DEFB $0D,$84,$2C,$01    ;
  DEFB $0B,$B4,$2C,$02    ;
  DEFB $0F,$B4,$2C,$02    ;
  DEFB $0F,$B4,$2C,$02    ;
  DEFB $0E,$B4,$2C,$02    ;
  DEFB $01,$B4,$2C,$02    ;
  DEFB $0B,$B4,$2C,$02    ;
  DEFB $0C,$84,$2C,$01    ;
  DEFB $0C,$84,$54,$01    ;
  DEFB $0F,$14,$7C,$02    ;
  DEFB $07,$14,$7C,$02    ;
  DEFB $0A,$14,$74,$02    ;
  DEFB $06,$14,$6C,$02    ;
  DEFB $0D,$74,$44,$01    ;
  DEFB $0D,$74,$1C,$01    ;
  DEFB $05,$B4,$1C,$02    ;
  DEFB $05,$B4,$24,$02    ;
  DEFB $0F,$B4,$2C,$02    ;
  DEFB $0B,$B4,$2C,$02    ;
  DEFB $0E,$B4,$2C,$02    ;
  DEFB $0B,$B4,$2C,$02    ;
  DEFB $01,$B4,$2C,$02    ;
  DEFB $0F,$B4,$2C,$02    ;
  DEFB $0E,$B4,$2C,$02    ;
  DEFB $0B,$B4,$2C,$02    ;
  DEFB $07,$84,$2C,$01    ;
  DEFB $0F,$84,$3C,$01    ;
  DEFB $0B,$84,$3C,$01    ;
  DEFB $05,$84,$3C,$01    ;
  DEFB $0E,$84,$44,$01    ;
  DEFB $01,$84,$44,$01    ;
  DEFB $08,$84,$34,$01    ;
  DEFB $09,$84,$34,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 29
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$30,$01    ;
  DEFB $0D,$84,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $0A,$84,$2C,$02    ;
  DEFB $05,$84,$2C,$02    ;
  DEFB $08,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $01,$84,$24,$02    ;
  DEFB $0E,$84,$24,$02    ;
  DEFB $07,$84,$24,$02    ;
  DEFB $06,$84,$2C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $07,$84,$2C,$02    ;
  DEFB $01,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0A,$84,$2C,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $07,$84,$24,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0E,$84,$3C,$02    ;
  DEFB $06,$84,$34,$02    ;
  DEFB $07,$84,$34,$02    ;
  DEFB $08,$84,$34,$02    ;
  DEFB $09,$84,$34,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $06,$84,$34,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $0A,$84,$24,$02    ;
  DEFB $09,$84,$24,$02    ;
  DEFB $09,$84,$3C,$02    ;
  DEFB $05,$84,$54,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $0E,$84,$54,$02    ;
  DEFB $0A,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 30
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$50,$01    ;
  DEFB $04,$80,$50,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$16    ;
  DEFB $01,$BC,$24,$56    ;
  DEFB $0B,$BC,$24,$5A    ;
  DEFB $05,$BC,$24,$4E    ;
  DEFB $0B,$BC,$2C,$52    ;
  DEFB $0B,$BC,$2C,$4E    ;
  DEFB $0F,$BC,$2C,$52    ;
  DEFB $06,$BC,$24,$56    ;
  DEFB $0F,$BC,$24,$5A    ;
  DEFB $0B,$BC,$24,$7E    ;
  DEFB $01,$BC,$24,$26    ;
  DEFB $07,$BC,$24,$2A    ;
  DEFB $08,$BC,$24,$0A    ;
  DEFB $0B,$BC,$24,$0E    ;
  DEFB $0F,$BC,$24,$12    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $01,$84,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$8A    ;
  DEFB $0F,$BC,$24,$8E    ;
  DEFB $01,$BC,$24,$8A    ;
  DEFB $0B,$BC,$24,$8E    ;
  DEFB $0B,$BC,$24,$06    ;
  DEFB $0E,$BC,$24,$26    ;
  DEFB $0F,$BC,$24,$2A    ;
  DEFB $0B,$BC,$24,$26    ;
  DEFB $05,$BC,$24,$0A    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 31
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$50,$01    ;
  DEFB $04,$80,$50,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $08,$84,$34,$02    ;
  DEFB $06,$84,$2C,$02    ;
  DEFB $0B,$84,$2C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $0E,$84,$2C,$02    ;
  DEFB $07,$84,$2C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $06,$84,$34,$02    ;
  DEFB $06,$84,$2C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $0B,$84,$2C,$02    ;
  DEFB $09,$84,$2C,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $08,$84,$34,$02    ;
  DEFB $0F,$84,$34,$02    ;
  DEFB $06,$84,$2C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $0B,$84,$2C,$02    ;
  DEFB $07,$84,$2C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $01,$84,$3C,$02    ;
  DEFB $06,$84,$34,$02    ;
  DEFB $0F,$84,$34,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $01,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $0A,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $07,$84,$24,$02    ;
  DEFB $0B,$84,$34,$02    ;
  DEFB $07,$84,$34,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 32
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$50,$01    ;
  DEFB $04,$80,$50,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $0B,$83,$4C,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $01,$84,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0B,$84,$24,$01    ;
  DEFB $0F,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$0E    ;
  DEFB $0E,$BC,$24,$1E    ;
  DEFB $05,$BC,$24,$1E    ;
  DEFB $06,$BC,$24,$22    ;
  DEFB $05,$BC,$24,$36    ;
  DEFB $0F,$BC,$2C,$42    ;
  DEFB $06,$BC,$24,$3E    ;
  DEFB $01,$BC,$24,$42    ;
  DEFB $0F,$BC,$24,$3E    ;
  DEFB $0F,$BC,$24,$5E    ;
  DEFB $0B,$BC,$24,$3E    ;
  DEFB $0E,$BC,$24,$42    ;
  DEFB $01,$BC,$24,$42    ;
  DEFB $0B,$BC,$24,$5E    ;
  DEFB $05,$BC,$24,$3E    ;
  DEFB $06,$BC,$24,$42    ;
  DEFB $0F,$BC,$24,$3E    ;
  DEFB $0F,$BC,$24,$42    ;
  DEFB $0B,$BC,$24,$3A    ;
  DEFB $0E,$BC,$24,$76    ;
  DEFB $0F,$BC,$24,$8E    ;
  DEFB $0B,$BC,$24,$8A    ;
  DEFB $0F,$BC,$24,$8E    ;
  DEFB $0E,$BC,$24,$8A    ;
  DEFB $0B,$BC,$24,$8E    ;
  DEFB $01,$BC,$24,$16    ;
  DEFB $05,$BC,$24,$56    ;
  DEFB $06,$BC,$24,$5A    ;
  DEFB $07,$BC,$24,$56    ;
  DEFB $08,$BC,$24,$1A    ;
  DEFB $0B,$BC,$24,$8A    ;
  DEFB $0F,$BC,$24,$8E    ;
  DEFB $0B,$BC,$24,$0E    ;
  DEFB $0E,$BC,$24,$12    ;
  DEFB $01,$BC,$24,$8A    ;
  DEFB $05,$BC,$24,$8E    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $0E,$BC,$2C,$02    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $0B,$BC,$2C,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $07,$BC,$24,$02    ;
  DEFB $06,$BC,$2C,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $0C,$84,$4C,$01    ; Bridge 33
  DEFB $02,$80,$40,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$40,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $05,$84,$54,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $0B,$84,$64,$02    ;
  DEFB $0F,$84,$64,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $06,$85,$54,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $05,$84,$54,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $09,$84,$44,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $06,$85,$54,$02    ;
  DEFB $05,$85,$54,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $08,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $06,$85,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $08,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $01,$84,$3C,$02    ;
  DEFB $06,$84,$34,$02    ;
  DEFB $0B,$84,$34,$02    ;
  DEFB $0F,$84,$34,$02    ;
  DEFB $06,$84,$2C,$02    ;
  DEFB $0B,$84,$2C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $0B,$84,$2C,$02    ;
  DEFB $01,$84,$2C,$02    ;
  DEFB $09,$84,$2C,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$84,$4C,$01    ; Bridge 34
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$50,$01    ;
  DEFB $04,$80,$50,$01    ;
  DEFB $0B,$84,$74,$01    ;
  DEFB $0F,$84,$74,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$06    ;
  DEFB $05,$BC,$24,$26    ;
  DEFB $06,$BC,$24,$2A    ;
  DEFB $0F,$BC,$24,$5E    ;
  DEFB $0E,$BC,$24,$26    ;
  DEFB $0F,$BC,$24,$2A    ;
  DEFB $07,$BC,$24,$26    ;
  DEFB $08,$BC,$24,$5E    ;
  DEFB $05,$BC,$24,$2A    ;
  DEFB $0F,$BC,$2C,$0A    ;
  DEFB $0B,$BC,$2C,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $05,$84,$4C,$01    ;
  DEFB $0B,$64,$54,$02    ;
  DEFB $0F,$64,$54,$02    ;
  DEFB $05,$64,$54,$02    ;
  DEFB $06,$64,$54,$02    ;
  DEFB $0B,$64,$54,$02    ;
  DEFB $07,$64,$54,$02    ;
  DEFB $01,$64,$64,$02    ;
  DEFB $08,$64,$54,$02    ;
  DEFB $0B,$64,$54,$02    ;
  DEFB $0B,$64,$54,$02    ;
  DEFB $0F,$64,$54,$02    ;
  DEFB $0E,$64,$54,$02    ;
  DEFB $0B,$64,$54,$02    ;
  DEFB $06,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$16    ;
  DEFB $0E,$BC,$24,$56    ;
  DEFB $0B,$BC,$24,$5A    ;
  DEFB $0B,$BC,$24,$56    ;
  DEFB $0F,$BC,$24,$1A    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 35
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$50,$01    ;
  DEFB $04,$80,$50,$01    ;
  DEFB $0D,$84,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0A,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $0F,$85,$54,$02    ;
  DEFB $0B,$85,$54,$02    ;
  DEFB $0E,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $01,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $08,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$84,$4C,$01    ; Bridge 36
  DEFB $02,$80,$50,$01    ;
  DEFB $03,$80,$50,$01    ;
  DEFB $04,$80,$50,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$8A    ;
  DEFB $05,$BC,$24,$8E    ;
  DEFB $06,$BC,$24,$8A    ;
  DEFB $0B,$BC,$24,$8E    ;
  DEFB $0F,$BC,$24,$16    ;
  DEFB $05,$BC,$24,$56    ;
  DEFB $0F,$BC,$2C,$5A    ;
  DEFB $0B,$BC,$2C,$56    ;
  DEFB $0F,$BC,$2C,$1A    ;
  DEFB $0E,$BC,$2C,$02    ;
  DEFB $0B,$BC,$2C,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $07,$BC,$24,$02    ;
  DEFB $08,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $0B,$BC,$2C,$02    ;
  DEFB $0E,$BC,$2C,$02    ;
  DEFB $06,$BC,$24,$8A    ;
  DEFB $0B,$BC,$24,$8E    ;
  DEFB $07,$BC,$24,$8A    ;
  DEFB $08,$BC,$24,$8E    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$84,$4C,$01    ; Bridge 37
  DEFB $02,$80,$40,$01    ;
  DEFB $03,$80,$40,$01    ;
  DEFB $04,$80,$40,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $0B,$85,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $08,$84,$34,$02    ;
  DEFB $07,$84,$34,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $08,$84,$2C,$02    ;
  DEFB $0B,$84,$2C,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $01,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $06,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $05,$84,$24,$02    ;
  DEFB $05,$84,$2C,$02    ;
  DEFB $08,$84,$24,$02    ;
  DEFB $0B,$84,$24,$02    ;
  DEFB $0F,$84,$24,$02    ;
  DEFB $07,$84,$24,$02    ;
  DEFB $0B,$84,$34,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $07,$84,$3C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$84,$4C,$01    ; Bridge 38
  DEFB $02,$00,$40,$01    ;
  DEFB $03,$00,$40,$01    ;
  DEFB $04,$00,$40,$01    ;
  DEFB $0D,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $09,$84,$24,$01    ;
  DEFB $0F,$84,$3C,$01    ;
  DEFB $0B,$84,$3C,$01    ;
  DEFB $0E,$84,$3C,$01    ;
  DEFB $0A,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$0E    ;
  DEFB $0E,$BC,$24,$1E    ;
  DEFB $0B,$BC,$24,$22    ;
  DEFB $05,$BC,$24,$1E    ;
  DEFB $06,$BC,$24,$76    ;
  DEFB $01,$BC,$24,$82    ;
  DEFB $0B,$BC,$24,$82    ;
  DEFB $0F,$BC,$24,$8E    ;
  DEFB $0E,$BC,$24,$16    ;
  DEFB $0B,$BC,$24,$56    ;
  DEFB $0B,$BC,$24,$5A    ;
  DEFB $0F,$BC,$24,$56    ;
  DEFB $05,$BC,$24,$4E    ;
  DEFB $06,$BC,$24,$52    ;
  DEFB $0B,$BC,$24,$1A    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0E,$84,$4C,$01    ;
  DEFB $0E,$84,$4C,$01    ;
  DEFB $09,$84,$4C,$01    ;
  DEFB $0B,$84,$64,$01    ;
  DEFB $0F,$84,$64,$01    ;
  DEFB $0B,$84,$64,$01    ;
  DEFB $05,$84,$64,$01    ;
  DEFB $06,$84,$64,$01    ;
  DEFB $01,$84,$64,$01    ;
  DEFB $0B,$84,$64,$01    ;
  DEFB $0F,$84,$64,$01    ;
  DEFB $0F,$84,$64,$01    ;
  DEFB $05,$84,$64,$01    ;
  DEFB $06,$84,$64,$01    ;
  DEFB $0B,$84,$64,$01    ;
  DEFB $0A,$84,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 39
  DEFB $02,$00,$40,$01    ;
  DEFB $03,$00,$30,$01    ;
  DEFB $04,$00,$00,$01    ;
  DEFB $0D,$84,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0E,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $08,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $06,$85,$54,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $0B,$85,$54,$02    ;
  DEFB $05,$84,$54,$02    ;
  DEFB $01,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $0B,$84,$64,$02    ;
  DEFB $0F,$84,$64,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $07,$85,$54,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0E,$84,$5C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $01,$84,$54,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 40
  DEFB $02,$00,$40,$01    ;
  DEFB $03,$00,$40,$01    ;
  DEFB $04,$00,$40,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$0E    ;
  DEFB $0F,$BC,$24,$1E    ;
  DEFB $0B,$BC,$24,$22    ;
  DEFB $0F,$BC,$24,$36    ;
  DEFB $0E,$BC,$24,$26    ;
  DEFB $01,$BC,$24,$5E    ;
  DEFB $0B,$BC,$24,$2A    ;
  DEFB $0E,$BC,$24,$26    ;
  DEFB $0B,$BC,$24,$7A    ;
  DEFB $0F,$BC,$24,$56    ;
  DEFB $05,$BC,$24,$56    ;
  DEFB $06,$BC,$24,$5A    ;
  DEFB $0F,$BC,$24,$56    ;
  DEFB $0B,$BC,$24,$4A    ;
  DEFB $07,$BC,$24,$2E    ;
  DEFB $08,$BC,$24,$32    ;
  DEFB $05,$BC,$24,$32    ;
  DEFB $0F,$BC,$2C,$2E    ;
  DEFB $0B,$BC,$2C,$2E    ;
  DEFB $0E,$BC,$2C,$32    ;
  DEFB $0B,$BC,$2C,$2E    ;
  DEFB $06,$BC,$24,$3E    ;
  DEFB $0B,$BC,$24,$26    ;
  DEFB $0F,$BC,$24,$5E    ;
  DEFB $0E,$BC,$24,$2A    ;
  DEFB $0B,$BC,$24,$26    ;
  DEFB $0B,$BC,$24,$7A    ;
  DEFB $05,$BC,$24,$56    ;
  DEFB $06,$BC,$24,$5A    ;
  DEFB $0F,$BC,$24,$1A    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$84,$4C,$01    ;
  DEFB $0E,$84,$74,$01    ;
  DEFB $0F,$84,$74,$01    ;
  DEFB $0D,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $0B,$BC,$2C,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$0E    ;
  DEFB $0F,$BC,$24,$1E    ;
  DEFB $0B,$BC,$24,$22    ;
  DEFB $0E,$BC,$24,$1E    ;
  DEFB $05,$BC,$24,$12    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 41
  DEFB $02,$00,$40,$01    ;
  DEFB $03,$00,$40,$01    ;
  DEFB $04,$00,$40,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $07,$85,$54,$02    ;
  DEFB $08,$85,$54,$02    ;
  DEFB $0B,$85,$54,$02    ;
  DEFB $05,$84,$54,$02    ;
  DEFB $0F,$85,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $07,$85,$54,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $06,$85,$54,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $05,$84,$54,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 42
  DEFB $02,$00,$00,$01    ;
  DEFB $03,$00,$00,$01    ;
  DEFB $04,$44,$44,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$84,$4C,$01    ;
  DEFB $0B,$84,$74,$01    ;
  DEFB $0D,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$06    ;
  DEFB $0E,$BC,$24,$26    ;
  DEFB $0B,$BC,$24,$2A    ;
  DEFB $0F,$BC,$24,$3A    ;
  DEFB $05,$BC,$24,$22    ;
  DEFB $06,$BC,$24,$1E    ;
  DEFB $05,$BC,$24,$1E    ;
  DEFB $0B,$BC,$2C,$22    ;
  DEFB $0F,$BC,$2C,$12    ;
  DEFB $0E,$BC,$2C,$02    ;
  DEFB $0F,$BC,$2C,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $09,$84,$24,$01    ;
  DEFB $0B,$84,$3C,$01    ;
  DEFB $0F,$84,$3C,$01    ;
  DEFB $0A,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$0E    ;
  DEFB $0B,$BC,$24,$22    ;
  DEFB $0F,$BC,$24,$1E    ;
  DEFB $0B,$BC,$24,$22    ;
  DEFB $01,$BC,$24,$1E    ;
  DEFB $0E,$BC,$24,$1E    ;
  DEFB $0F,$BC,$24,$22    ;
  DEFB $01,$BC,$24,$1E    ;
  DEFB $0B,$BC,$24,$76    ;
  DEFB $0F,$BC,$24,$82    ;
  DEFB $0F,$BC,$24,$86    ;
  DEFB $05,$BC,$24,$8E    ;
  DEFB $06,$BC,$24,$06    ;
  DEFB $05,$BC,$24,$26    ;
  DEFB $06,$BC,$24,$2A    ;
  DEFB $0B,$BC,$24,$26    ;
  DEFB $0F,$BC,$24,$26    ;
  DEFB $0B,$BC,$24,$2A    ;
  DEFB $07,$BC,$24,$5E    ;
  DEFB $08,$BC,$24,$26    ;
  DEFB $0E,$BC,$24,$2A    ;
  DEFB $0B,$BC,$24,$0A    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 43
  DEFB $02,$22,$22,$01    ;
  DEFB $03,$33,$33,$01    ;
  DEFB $04,$44,$44,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $05,$84,$54,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $01,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $08,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $01,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $05,$84,$54,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0A,$84,$44,$02    ;
  DEFB $09,$84,$44,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0E,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $08,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $09,$84,$44,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0E,$84,$5C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $01,$84,$54,$02    ;
  DEFB $05,$84,$54,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0E,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $08,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0E,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0A,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 44
  DEFB $02,$22,$22,$01    ;
  DEFB $03,$33,$33,$01    ;
  DEFB $04,$44,$44,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$06    ;
  DEFB $0F,$BC,$24,$26    ;
  DEFB $0E,$BC,$24,$2A    ;
  DEFB $0B,$BC,$24,$26    ;
  DEFB $0B,$BC,$24,$0A    ;
  DEFB $0F,$BC,$24,$8A    ;
  DEFB $01,$BC,$24,$82    ;
  DEFB $0F,$BC,$24,$82    ;
  DEFB $0B,$BC,$24,$72    ;
  DEFB $0F,$BC,$24,$1E    ;
  DEFB $0E,$BC,$24,$22    ;
  DEFB $05,$BC,$24,$12    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $01,$84,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $0C,$84,$4C,$01    ;
  DEFB $0B,$84,$74,$01    ;
  DEFB $0F,$84,$74,$01    ;
  DEFB $0F,$84,$74,$01    ;
  DEFB $0B,$84,$74,$01    ;
  DEFB $0A,$84,$5C,$01    ;
  DEFB $0B,$84,$5C,$01    ;
  DEFB $0B,$84,$5C,$01    ;
  DEFB $08,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0B,$84,$24,$01    ;
  DEFB $0F,$84,$24,$01    ;
  DEFB $0B,$84,$24,$01    ;
  DEFB $0E,$84,$24,$01    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $09,$84,$4C,$01    ;
  DEFB $0B,$84,$64,$01    ;
  DEFB $0F,$84,$64,$01    ;
  DEFB $0E,$84,$64,$01    ;
  DEFB $0B,$84,$64,$01    ;
  DEFB $0D,$84,$3C,$01    ;
  DEFB $0A,$84,$24,$01    ;
  DEFB $0B,$84,$24,$01    ;
  DEFB $0F,$84,$24,$01    ;
  DEFB $0E,$84,$24,$01    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $09,$84,$4C,$01    ;
  DEFB $0B,$84,$64,$01    ;
  DEFB $0B,$84,$64,$01    ;
  DEFB $0A,$84,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0E,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 45
  DEFB $02,$22,$22,$01    ;
  DEFB $03,$33,$33,$01    ;
  DEFB $04,$44,$44,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $0B,$84,$3C,$02    ;
  DEFB $07,$84,$3C,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $01,$84,$54,$02    ;
  DEFB $05,$85,$54,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $06,$84,$3C,$02    ;
  DEFB $08,$84,$2C,$02    ;
  DEFB $0B,$84,$2C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $01,$84,$2C,$02    ;
  DEFB $05,$84,$2C,$02    ;
  DEFB $06,$84,$2C,$02    ;
  DEFB $0F,$84,$2C,$02    ;
  DEFB $07,$84,$2C,$02    ;
  DEFB $08,$84,$2C,$02    ;
  DEFB $05,$84,$2C,$02    ;
  DEFB $0B,$84,$34,$02    ;
  DEFB $05,$84,$34,$02    ;
  DEFB $0F,$84,$3C,$02    ;
  DEFB $05,$84,$3C,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $0E,$84,$4C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $01,$84,$5C,$02    ;
  DEFB $06,$84,$54,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $08,$84,$3C,$02    ;
  DEFB $07,$84,$3C,$02    ;
  DEFB $07,$84,$4C,$02    ;
  DEFB $08,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 46
  DEFB $02,$22,$22,$01    ;
  DEFB $03,$33,$33,$01    ;
  DEFB $04,$44,$44,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$8A    ;
  DEFB $0F,$BC,$24,$8E    ;
  DEFB $0F,$BC,$24,$8A    ;
  DEFB $05,$BC,$24,$8E    ;
  DEFB $06,$BC,$24,$16    ;
  DEFB $0F,$BC,$24,$56    ;
  DEFB $0B,$BC,$24,$5A    ;
  DEFB $01,$BC,$24,$5A    ;
  DEFB $0E,$BC,$24,$56    ;
  DEFB $07,$BC,$24,$56    ;
  DEFB $08,$BC,$24,$5A    ;
  DEFB $0B,$BC,$24,$1A    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $09,$84,$24,$01    ;
  DEFB $07,$84,$3C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $05,$84,$4C,$01    ;
  DEFB $06,$84,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $0E,$84,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $08,$84,$3C,$01    ;
  DEFB $08,$84,$2C,$01    ;
  DEFB $06,$84,$24,$01    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $05,$BC,$24,$02    ;
  DEFB $06,$BC,$24,$02    ;
  DEFB $07,$BC,$24,$02    ;
  DEFB $08,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $01,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$06    ;
  DEFB $01,$BC,$24,$26    ;
  DEFB $05,$BC,$24,$2A    ;
  DEFB $06,$BC,$24,$26    ;
  DEFB $0F,$BC,$24,$0A    ;
  DEFB $0E,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0F,$BC,$24,$02    ;
  DEFB $0B,$BC,$24,$02    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 47
  DEFB $02,$22,$22,$01    ;
  DEFB $03,$33,$33,$01    ;
  DEFB $04,$44,$44,$01    ;
  DEFB $0D,$83,$4C,$01    ;
  DEFB $06,$84,$44,$01    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $05,$84,$44,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $0E,$85,$54,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $05,$84,$54,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $07,$84,$5C,$02    ;
  DEFB $08,$84,$5C,$02    ;
  DEFB $01,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $0E,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0E,$84,$5C,$02    ;
  DEFB $08,$84,$4C,$02    ;
  DEFB $0F,$84,$4C,$02    ;
  DEFB $0B,$84,$4C,$02    ;
  DEFB $01,$84,$4C,$02    ;
  DEFB $05,$84,$4C,$02    ;
  DEFB $06,$84,$4C,$02    ;
  DEFB $06,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $08,$84,$34,$02    ;
  DEFB $07,$84,$34,$02    ;
  DEFB $0B,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $01,$84,$44,$02    ;
  DEFB $0F,$84,$44,$02    ;
  DEFB $07,$84,$44,$02    ;
  DEFB $0B,$84,$54,$02    ;
  DEFB $0F,$84,$54,$02    ;
  DEFB $05,$84,$54,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $07,$84,$5C,$02    ;
  DEFB $08,$84,$5C,$02    ;
  DEFB $01,$84,$5C,$02    ;
  DEFB $05,$84,$5C,$02    ;
  DEFB $06,$84,$5C,$02    ;
  DEFB $0B,$84,$5C,$02    ;
  DEFB $0F,$84,$5C,$02    ;
  DEFB $0A,$84,$44,$02    ;
  DEFB $05,$84,$44,$01    ;
  DEFB $0C,$83,$4C,$01    ; Bridge 48
  DEFB $02,$22,$22,$01    ;
  DEFB $03,$33,$33,$01    ;
  DEFB $04,$44,$44,$01    ;
  DEFB $08,$84,$64,$01    ;
  DEFB $0B,$84,$64,$01    ;
  DEFB $0F,$84,$64,$01    ;
  DEFB $0E,$84,$64,$01    ;
  DEFB $0F,$84,$64,$01    ;
  DEFB $0B,$84,$64,$01    ;
  DEFB $05,$84,$64,$01    ;
  DEFB $06,$84,$64,$01    ;
  DEFB $01,$84,$64,$01    ;
  DEFB $0B,$84,$64,$01    ;
  DEFB $0F,$84,$64,$01    ;
  DEFB $0F,$84,$64,$01    ;
  DEFB $0A,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0B,$84,$24,$01    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0C,$84,$4C,$01    ;
  DEFB $01,$84,$74,$01    ;
  DEFB $0F,$84,$74,$01    ;
  DEFB $0B,$84,$74,$01    ;
  DEFB $0B,$84,$74,$01    ;
  DEFB $01,$84,$74,$01    ;
  DEFB $0F,$84,$74,$01    ;
  DEFB $0E,$84,$74,$01    ;
  DEFB $08,$84,$64,$01    ;
  DEFB $0B,$84,$64,$01    ;
  DEFB $0F,$84,$64,$01    ;
  DEFB $0A,$84,$4C,$01    ;
  DEFB $0D,$84,$24,$01    ;
  DEFB $0B,$84,$24,$01    ;
  DEFB $0F,$84,$24,$01    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $0F,$84,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $0B,$84,$4C,$01    ;
  DEFB $07,$84,$4C,$01    ;
  DEFB $07,$84,$5C,$01    ;
  DEFB $0B,$84,$6C,$01    ;
  DEFB $0F,$84,$6C,$01    ;
  DEFB $0F,$84,$6C,$01    ;
  DEFB $0B,$84,$6C,$01    ;
  DEFB $0F,$84,$6C,$01    ;
  DEFB $0E,$84,$6C,$01    ;
  DEFB $0B,$84,$6C,$01    ;
  DEFB $08,$84,$5C,$01    ;
  DEFB $0B,$84,$5C,$01    ;
  DEFB $0F,$84,$5C,$01    ;
  DEFB $0E,$84,$5C,$01    ;
  DEFB $07,$84,$5C,$01    ;
  DEFB $0F,$84,$6C,$01    ;
  DEFB $0B,$84,$6C,$01    ;
  DEFB $0F,$84,$6C,$01    ;
  DEFB $0B,$84,$6C,$01    ;
  DEFB $0D,$84,$44,$01    ;
  DEFB $0A,$84,$2C,$01    ;
  DEFB $06,$84,$24,$01    ;
  DEFB $0B,$84,$24,$01    ;
  DEFB $0F,$84,$24,$01    ;
  DEFB $0B,$84,$24,$01    ;
  DEFB $0C,$84,$24,$01    ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
LC600:
  DEFB $09,$00,$01,$0A,$00,$01,$07,$00
  DEFB $01,$08,$00,$01,$0C,$00,$01,$0D
  DEFB $00,$01,$0E,$10,$01,$0F,$10,$01
  DEFB $0B,$18,$01,$0E,$18,$01,$0F,$20
  DEFB $01,$0B,$20,$01,$05,$10,$01,$06
  DEFB $10,$01,$05,$18,$01,$06,$18,$01
  DEFB $05,$20,$01,$06,$20,$01,$05,$28
  DEFB $01,$06,$28,$01,$0E,$28,$01,$0F
  DEFB $28,$01,$01,$18,$01,$07,$20,$01
  DEFB $08,$20,$01,$09,$20,$01,$0A,$20
  DEFB $01,$05,$08,$01,$06,$08,$01,$07
  DEFB $18,$01,$08,$18,$01,$0B,$08,$01
  DEFB $0F,$08,$01,$05,$00,$01,$06,$00
  DEFB $01,$C3,$90,$EA,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00
  DEFB $00,$00,$00,$00,$00,$00,$00,$00

; Byte 1: lowest 3 bits - object type; Byte 2 - position. $07 - fuel station,
; $06 - balloon, $04-05 - unknown
levels:
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 1
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$78,$00,$00,$01,$60,$00,$00 ;
  DEFB $00,$00,$42,$A0,$00,$00,$0B,$08 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$70,$0B,$E0 ;
  DEFB $00,$00,$00,$00,$00,$00,$02,$90 ;
  DEFB $08,$10,$00,$00,$00,$00,$01,$80 ;
  DEFB $00,$00,$00,$00,$08,$E8,$00,$00 ;
  DEFB $87,$70,$00,$00,$42,$60,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$60 ;
  DEFB $0B,$08,$00,$00,$02,$A0,$00,$00 ;
  DEFB $00,$00,$42,$70,$00,$00,$0B,$01 ;
  DEFB $02,$60,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$A0,$00,$00 ;
  DEFB $00,$00,$87,$A0,$0B,$08,$00,$00 ;
  DEFB $00,$00,$87,$70,$00,$00,$41,$60 ;
  DEFB $00,$00,$00,$00,$09,$01,$00,$00 ;
  DEFB $02,$90,$00,$00,$00,$00,$00,$00 ;
  DEFB $0B,$E8,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$90,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$60,$0A,$01 ;
  DEFB $02,$90,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$80,$00,$00,$02,$90 ;
  DEFB $00,$00,$00,$00,$42,$98,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$41,$78,$00,$00,$00,$00 ;
  DEFB $01,$98,$00,$00,$00,$00,$09,$08 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 2
  DEFB $00,$00,$84,$20,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$42,$90,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$42,$B0 ;
  DEFB $00,$00,$00,$00,$00,$00,$02,$A0 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$A0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$98,$00,$00,$41,$58,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$58 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$30,$00,$00,$02,$50 ;
  DEFB $00,$00,$00,$00,$02,$50,$0A,$01 ;
  DEFB $00,$00,$00,$00,$02,$60,$0A,$E8 ;
  DEFB $00,$00,$00,$00,$02,$50,$0A,$01 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $0A,$E8,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$A0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$60,$01,$78,$00,$00 ;
  DEFB $00,$00,$00,$00,$08,$E8,$87,$A0 ;
  DEFB $00,$00,$42,$A8,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$42,$B0,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$B8,$00,$00,$41,$B0 ;
  DEFB $00,$00,$02,$40,$00,$00,$00,$00 ;
  DEFB $42,$40,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$0A,$68,$00,$00 ;
  DEFB $00,$00,$0A,$88,$87,$C0,$00,$00 ;
  DEFB $00,$00,$0A,$68,$00,$00,$87,$B0 ;
  DEFB $00,$00,$00,$00,$01,$A8,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$70 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 3
  DEFB $00,$00,$C4,$A0,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $46,$A0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$60,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$80,$00,$00 ;
  DEFB $0B,$E0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$42,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$60 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$50,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$02,$A0 ;
  DEFB $00,$00,$00,$00,$00,$00,$09,$01 ;
  DEFB $00,$00,$87,$A0,$00,$00,$0B,$E8 ;
  DEFB $06,$78,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$90,$00,$00,$00,$00,$09,$E0 ;
  DEFB $00,$00,$00,$00,$42,$70,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$0B,$E8,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$70,$00,$00,$00,$00 ;
  DEFB $46,$A0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$08,$01,$00,$00 ;
  DEFB $00,$00,$42,$88,$00,$00,$09,$E8 ;
  DEFB $00,$00,$00,$00,$00,$00,$09,$01 ;
  DEFB $00,$00,$87,$98,$00,$00,$00,$00 ;
  DEFB $87,$80,$00,$00,$01,$90,$08,$08 ;
  DEFB $00,$00,$00,$00,$01,$A0,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$70,$00,$00,$01,$98,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$80 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 4
  DEFB $00,$00,$84,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$40,$08,$01 ;
  DEFB $00,$00,$87,$C0,$02,$38,$00,$00 ;
  DEFB $00,$00,$42,$A8,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$46,$C0 ;
  DEFB $00,$00,$42,$B8,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$42,$B8,$08,$01 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$30,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$0A,$80 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$B0,$00,$00,$00,$00,$00,$00 ;
  DEFB $0A,$80,$87,$38,$00,$00,$00,$00 ;
  DEFB $87,$B0,$00,$00,$00,$00,$00,$00 ;
  DEFB $42,$C0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$A0,$02,$50,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$46,$B0 ;
  DEFB $00,$00,$42,$40,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$42,$30,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$B8,$00,$00 ;
  DEFB $00,$00,$00,$00,$42,$48,$00,$00 ;
  DEFB $00,$00,$42,$30,$00,$00,$00,$00 ;
  DEFB $42,$30,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$40,$0A,$80 ;
  DEFB $00,$00,$87,$B0,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$30,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$06,$80 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 5
  DEFB $00,$00,$84,$30,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$0B,$D0 ;
  DEFB $00,$00,$00,$00,$87,$A0,$41,$50 ;
  DEFB $00,$00,$09,$E8,$00,$00,$00,$00 ;
  DEFB $00,$00,$85,$80,$09,$01,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$60,$09,$E0 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$90 ;
  DEFB $00,$00,$00,$00,$08,$01,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $01,$A0,$09,$08,$00,$00,$00,$00 ;
  DEFB $01,$A0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $09,$08,$06,$80,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$0B,$E0,$41,$98 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$80,$00,$00,$02,$90,$0A,$08 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$90 ;
  DEFB $00,$00,$00,$00,$41,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$46,$88 ;
  DEFB $00,$00,$00,$00,$00,$00,$0A,$E0 ;
  DEFB $00,$00,$00,$00,$C5,$80,$0A,$08 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$A0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$88,$00,$00,$00,$00,$02,$70 ;
  DEFB $00,$00,$00,$00,$08,$01,$00,$00 ;
  DEFB $87,$60,$00,$00,$42,$90,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$80,$00,$00,$00,$00,$06,$68 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$A0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 6
  DEFB $00,$00,$84,$58,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$0B,$01 ;
  DEFB $00,$00,$00,$00,$02,$60,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$41,$40,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$40,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$0A,$68 ;
  DEFB $06,$B0,$00,$00,$00,$00,$0A,$80 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$B0,$00,$00 ;
  DEFB $00,$00,$0A,$80,$87,$48,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$B0 ;
  DEFB $00,$00,$42,$38,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$60,$00,$00,$00,$00 ;
  DEFB $87,$90,$00,$00,$00,$00,$02,$B0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$40,$00,$00,$42,$50 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $02,$30,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$01,$50,$00,$00,$00,$00 ;
  DEFB $0A,$D0,$00,$00,$87,$60,$00,$00 ;
  DEFB $08,$E8,$87,$A0,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$C0,$00,$00,$00,$00 ;
  DEFB $00,$00,$06,$40,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$48 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$40 ;
  DEFB $00,$00,$00,$00,$42,$C0,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 7
  DEFB $00,$00,$C4,$B0,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$0A,$08,$87,$70 ;
  DEFB $00,$00,$42,$98,$0B,$E0,$00,$00 ;
  DEFB $00,$00,$42,$98,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$42,$98,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$50 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$90 ;
  DEFB $00,$00,$00,$00,$85,$90,$00,$00 ;
  DEFB $00,$00,$0B,$08,$87,$B0,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$85,$88,$00,$00 ;
  DEFB $00,$00,$00,$00,$42,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$A4,$30,$08,$E0 ;
  DEFB $87,$80,$0B,$01,$41,$90,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$0B,$E0,$42,$60,$00,$00 ;
  DEFB $00,$00,$02,$68,$00,$00,$00,$00 ;
  DEFB $00,$00,$09,$E0,$06,$70,$00,$00 ;
  DEFB $00,$00,$41,$78,$00,$00,$00,$00 ;
  DEFB $00,$00,$A4,$28,$00,$00,$87,$A8 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$0B,$E0,$C5,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$A8,$02,$50,$00,$00,$00,$00 ;
  DEFB $00,$00,$0A,$E0,$85,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$70 ;
  DEFB $00,$00,$00,$00,$00,$00,$02,$90 ;
  DEFB $0B,$E0,$00,$00,$00,$00,$87,$80 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 8
  DEFB $00,$00,$84,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $42,$88,$00,$00,$00,$00,$42,$90 ;
  DEFB $0A,$E0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$85,$50,$00,$00 ;
  DEFB $00,$00,$0A,$E0,$00,$00,$42,$A0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$C0,$00,$00,$C5,$A0,$00,$00 ;
  DEFB $02,$A0,$00,$00,$00,$00,$00,$00 ;
  DEFB $01,$B0,$00,$00,$00,$00,$02,$B8 ;
  DEFB $00,$00,$0A,$80,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$38,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$42,$A8,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$06,$40 ;
  DEFB $00,$00,$85,$40,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$42,$C0 ;
  DEFB $00,$00,$00,$00,$41,$40,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$42,$30 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$C0,$00,$00,$00,$00 ;
  DEFB $00,$00,$41,$A0,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$0A,$01 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$A0 ;
  DEFB $00,$00,$00,$00,$41,$98,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$06,$60 ;
  DEFB $00,$00,$00,$00,$08,$E8,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$08,$E8,$42,$A0 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$80 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 9
  DEFB $00,$00,$84,$40,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$0B,$E0,$87,$A0 ;
  DEFB $41,$88,$00,$00,$00,$00,$00,$00 ;
  DEFB $08,$D8,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$0A,$01,$46,$90 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$90 ;
  DEFB $00,$00,$A4,$30,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$58,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$88,$00,$00,$00,$00 ;
  DEFB $00,$00,$02,$80,$08,$01,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$85,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$02,$A0 ;
  DEFB $09,$E0,$00,$00,$00,$00,$0A,$01 ;
  DEFB $00,$00,$87,$80,$42,$A0,$00,$00 ;
  DEFB $08,$E0,$A4,$28,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$70,$00,$00,$03,$80 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $08,$E0,$87,$58,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$80,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$68,$00,$00,$0B,$E0 ;
  DEFB $A4,$10,$87,$A0,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$80,$0B,$E0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$08,$01,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$08,$E0,$87,$90 ;
  DEFB $00,$00,$03,$60,$08,$08,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$68 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$68,$00,$00,$85,$70,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 10
  DEFB $00,$00,$84,$50,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$08,$08 ;
  DEFB $42,$88,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$08,$08,$00,$00,$41,$78 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $0B,$E0,$00,$00,$00,$00,$42,$A0 ;
  DEFB $00,$00,$A4,$30,$43,$78,$00,$00 ;
  DEFB $0B,$E0,$00,$00,$00,$00,$00,$00 ;
  DEFB $0B,$B0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $0B,$D0,$42,$78,$00,$00,$00,$00 ;
  DEFB $00,$00,$0B,$01,$02,$70,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$42,$90 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$C0,$00,$00,$02,$40 ;
  DEFB $00,$00,$41,$B0,$85,$30,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$C0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $02,$C0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$B8,$00,$00,$00,$00 ;
  DEFB $87,$A8,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$02,$C0 ;
  DEFB $0B,$90,$00,$00,$00,$00,$00,$00 ;
  DEFB $06,$C0,$00,$00,$00,$00,$46,$50 ;
  DEFB $00,$00,$00,$00,$00,$00,$C5,$C0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $0B,$80,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$C0,$00,$00,$02,$30 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$58 ;
  DEFB $00,$00,$00,$00,$00,$00,$0A,$E0 ;
  DEFB $00,$00,$00,$00,$42,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 11
  DEFB $00,$00,$C4,$B0,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$08,$E0 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$58 ;
  DEFB $00,$00,$00,$00,$02,$88,$09,$D8 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$80,$01,$60,$0A,$E0 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$80 ;
  DEFB $0A,$01,$00,$00,$41,$A0,$00,$00 ;
  DEFB $00,$00,$0A,$18,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$80,$00,$00,$09,$01 ;
  DEFB $E4,$D8,$02,$80,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$B0,$00,$00,$0B,$E0 ;
  DEFB $03,$80,$00,$00,$00,$00,$00,$00 ;
  DEFB $09,$08,$00,$00,$00,$00,$00,$00 ;
  DEFB $09,$E0,$87,$A8,$08,$08,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$08,$01,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $06,$80,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$58,$00,$00 ;
  DEFB $42,$70,$00,$00,$00,$00,$00,$00 ;
  DEFB $42,$A0,$00,$00,$00,$00,$42,$70 ;
  DEFB $00,$00,$00,$00,$0B,$08,$46,$70 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$90 ;
  DEFB $00,$00,$00,$00,$41,$A0,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$70,$08,$08 ;
  DEFB $00,$00,$00,$00,$06,$90,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$50,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 12
  DEFB $00,$00,$C4,$90,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$30,$00,$00 ;
  DEFB $00,$00,$01,$B8,$0A,$60,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$06,$30 ;
  DEFB $42,$30,$00,$00,$0A,$60,$00,$00 ;
  DEFB $00,$00,$00,$00,$0A,$88,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$58,$00,$00,$02,$C0,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $02,$B8,$00,$00,$00,$00,$42,$40 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$B0 ;
  DEFB $0B,$80,$00,$00,$00,$00,$01,$B0 ;
  DEFB $00,$00,$00,$00,$00,$00,$46,$B0 ;
  DEFB $00,$00,$00,$00,$00,$00,$C5,$A0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $03,$60,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$40,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$B0 ;
  DEFB $01,$90,$00,$00,$00,$00,$00,$00 ;
  DEFB $06,$A0,$00,$00,$00,$00,$00,$00 ;
  DEFB $42,$30,$00,$00,$00,$00,$87,$C0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$C5,$60 ;
  DEFB $00,$00,$00,$00,$00,$00,$0A,$80 ;
  DEFB $87,$C0,$00,$00,$03,$C0,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$06,$C0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $42,$B0,$00,$00,$00,$00,$41,$80 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 13
  DEFB $00,$00,$84,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$A0,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$8C,$00,$00 ;
  DEFB $00,$00,$00,$00,$08,$E0,$00,$00 ;
  DEFB $00,$00,$00,$00,$09,$10,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$0A,$D0 ;
  DEFB $00,$00,$00,$00,$00,$00,$0A,$E8 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $06,$40,$00,$00,$00,$00,$03,$5C ;
  DEFB $00,$00,$00,$00,$00,$00,$42,$5C ;
  DEFB $00,$00,$00,$00,$08,$E0,$00,$00 ;
  DEFB $00,$00,$00,$00,$0A,$C0,$41,$30 ;
  DEFB $00,$00,$00,$00,$01,$60,$0A,$E0 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$68 ;
  DEFB $00,$00,$00,$00,$42,$90,$0B,$D8 ;
  DEFB $00,$00,$A4,$08,$42,$90,$08,$B8 ;
  DEFB $00,$00,$01,$48,$08,$E8,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$A0,$00,$00 ;
  DEFB $02,$A0,$09,$D8,$00,$00,$0A,$08 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$9C ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$C0,$0B,$08 ;
  DEFB $00,$00,$00,$00,$41,$7C,$00,$00 ;
  DEFB $00,$00,$00,$00,$06,$A0,$00,$00 ;
  DEFB $00,$00,$00,$00,$0A,$18,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$09,$38 ;
  DEFB $C5,$80,$00,$00,$0B,$01,$00,$00 ;
  DEFB $00,$00,$00,$00,$C5,$88,$00,$00 ;
  DEFB $00,$00,$09,$10,$01,$78,$08,$E0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 14
  DEFB $00,$00,$84,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$06,$70 ;
  DEFB $00,$00,$42,$90,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$B0 ;
  DEFB $0A,$E0,$08,$08,$41,$B4,$00,$00 ;
  DEFB $00,$00,$85,$34,$00,$00,$00,$00 ;
  DEFB $08,$01,$00,$00,$00,$00,$01,$48 ;
  DEFB $E4,$E8,$C5,$BC,$00,$00,$00,$00 ;
  DEFB $06,$B8,$00,$00,$41,$A8,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$34,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$C0,$00,$00,$08,$08,$01,$30 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$08,$01,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$C0,$00,$00,$02,$60 ;
  DEFB $00,$00,$01,$38,$00,$00,$00,$00 ;
  DEFB $87,$38,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$06,$34,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$C0,$00,$00 ;
  DEFB $01,$B8,$00,$00,$00,$00,$00,$00 ;
  DEFB $41,$BC,$0B,$78,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$42,$48 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$A0,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$50,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$30,$00,$00 ;
  DEFB $00,$00,$06,$30,$C5,$C0,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $06,$C0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 15
  DEFB $00,$00,$84,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$0B,$08 ;
  DEFB $00,$00,$00,$00,$87,$9C,$00,$00 ;
  DEFB $87,$78,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$90,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$98,$0B,$E0,$02,$70,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$84,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$78,$00,$00,$08,$E8,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$B0,$00,$00 ;
  DEFB $00,$00,$87,$68,$0A,$20,$00,$00 ;
  DEFB $00,$00,$42,$A8,$00,$00,$00,$00 ;
  DEFB $00,$00,$02,$70,$85,$88,$08,$10 ;
  DEFB $42,$98,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$02,$90,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$06,$78 ;
  DEFB $00,$00,$00,$00,$42,$8C,$00,$00 ;
  DEFB $00,$00,$0A,$E8,$06,$60,$00,$00 ;
  DEFB $00,$00,$0A,$D0,$00,$00,$0B,$08 ;
  DEFB $00,$00,$06,$6C,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $01,$84,$0A,$E0,$01,$7C,$00,$00 ;
  DEFB $00,$00,$00,$00,$A4,$08,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$80,$00,$00 ;
  DEFB $42,$30,$00,$00,$08,$E8,$00,$00 ;
  DEFB $00,$00,$01,$68,$0A,$C8,$00,$00 ;
  DEFB $02,$58,$09,$E8,$00,$00,$00,$00 ;
  DEFB $02,$50,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$0A,$E0,$00,$00,$00,$00 ;
  DEFB $87,$50,$0A,$C0,$01,$38,$00,$00 ;
  DEFB $00,$00,$0A,$E8,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 16
  DEFB $00,$00,$84,$50,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$08,$E8,$00,$00,$00,$00 ;
  DEFB $87,$94,$00,$00,$42,$94,$00,$00 ;
  DEFB $00,$00,$00,$00,$42,$90,$00,$00 ;
  DEFB $00,$00,$00,$00,$85,$60,$00,$00 ;
  DEFB $00,$00,$41,$C0,$00,$00,$00,$00 ;
  DEFB $01,$94,$00,$00,$00,$00,$85,$84 ;
  DEFB $00,$00,$00,$00,$43,$48,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$C0,$00,$00 ;
  DEFB $00,$00,$85,$80,$00,$00,$00,$00 ;
  DEFB $01,$B8,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$0A,$80,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$B8,$00,$00 ;
  DEFB $06,$30,$01,$30,$00,$00,$0B,$70 ;
  DEFB $00,$00,$00,$00,$06,$38,$00,$00 ;
  DEFB $0B,$78,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$90,$42,$60,$00,$00 ;
  DEFB $C5,$40,$00,$00,$01,$30,$02,$30 ;
  DEFB $00,$00,$00,$00,$01,$50,$00,$00 ;
  DEFB $01,$50,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$98,$00,$00,$00,$00,$A4,$18 ;
  DEFB $87,$98,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$58,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$40,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$C5,$30 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$B8,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$38,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$70,$01,$70 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 17
  DEFB $00,$00,$C4,$B0,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$08,$10,$06,$8C,$00,$00 ;
  DEFB $00,$00,$42,$98,$08,$08,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$88 ;
  DEFB $09,$01,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$08,$20,$01,$84,$00,$00 ;
  DEFB $00,$00,$00,$00,$42,$84,$00,$00 ;
  DEFB $C5,$70,$0A,$01,$00,$00,$00,$00 ;
  DEFB $02,$80,$00,$00,$E4,$D8,$41,$88 ;
  DEFB $00,$00,$08,$01,$85,$84,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$90,$00,$00 ;
  DEFB $00,$00,$0B,$08,$41,$50,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$9C,$02,$70,$09,$08,$00,$00 ;
  DEFB $00,$00,$02,$9C,$00,$00,$41,$30 ;
  DEFB $00,$00,$42,$90,$00,$00,$00,$00 ;
  DEFB $E4,$C0,$41,$88,$00,$00,$00,$00 ;
  DEFB $85,$9C,$00,$00,$42,$90,$00,$00 ;
  DEFB $03,$40,$C5,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$41,$80,$00,$00,$09,$E8 ;
  DEFB $06,$68,$00,$00,$00,$00,$02,$88 ;
  DEFB $00,$00,$09,$D0,$00,$00,$42,$5C ;
  DEFB $0B,$E8,$00,$00,$00,$00,$00,$00 ;
  DEFB $01,$78,$00,$00,$00,$00,$08,$E0 ;
  DEFB $00,$00,$00,$00,$87,$88,$00,$00 ;
  DEFB $00,$00,$00,$00,$08,$E0,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$70,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$70,$09,$D8 ;
  DEFB $C5,$58,$00,$00,$00,$00,$06,$68 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 18
  DEFB $00,$00,$C4,$94,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$C5,$70,$0B,$08 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$0B,$28,$41,$78,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$0A,$E8,$87,$88,$00,$00 ;
  DEFB $41,$A0,$42,$60,$00,$00,$00,$00 ;
  DEFB $08,$E8,$00,$00,$00,$00,$85,$68 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $08,$E8,$00,$00,$00,$00,$87,$A4 ;
  DEFB $00,$00,$03,$64,$00,$00,$01,$64 ;
  DEFB $00,$00,$41,$A0,$00,$00,$00,$00 ;
  DEFB $01,$40,$41,$B0,$00,$00,$00,$00 ;
  DEFB $00,$00,$A4,$28,$41,$94,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$02,$60 ;
  DEFB $08,$E0,$00,$00,$01,$58,$00,$00 ;
  DEFB $08,$D8,$87,$30,$00,$00,$00,$00 ;
  DEFB $C5,$C0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$06,$A8,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$58,$00,$00,$01,$7C ;
  DEFB $00,$00,$00,$00,$41,$80,$41,$8C ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$8C ;
  DEFB $00,$00,$00,$00,$0B,$C8,$00,$00 ;
  DEFB $00,$00,$87,$80,$00,$00,$00,$00 ;
  DEFB $00,$00,$41,$94,$08,$08,$00,$00 ;
  DEFB $87,$C0,$00,$00,$41,$90,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$78,$00,$00 ;
  DEFB $00,$00,$41,$78,$00,$00,$08,$08 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $08,$01,$01,$30,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 19
  DEFB $00,$00,$C4,$B0,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$0A,$E0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$08,$08,$87,$88 ;
  DEFB $00,$00,$00,$00,$02,$80,$0B,$10 ;
  DEFB $00,$00,$00,$00,$01,$A8,$08,$18 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$80,$00,$00 ;
  DEFB $0A,$E8,$41,$90,$00,$00,$01,$88 ;
  DEFB $08,$08,$41,$80,$02,$70,$0A,$D8 ;
  DEFB $41,$AC,$02,$A8,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$42,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$E4,$E8 ;
  DEFB $00,$00,$00,$00,$87,$88,$09,$10 ;
  DEFB $01,$A4,$C5,$68,$00,$00,$42,$A8 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$50,$00,$00,$00,$00,$02,$58 ;
  DEFB $00,$00,$43,$58,$00,$00,$00,$00 ;
  DEFB $41,$60,$00,$00,$00,$00,$00,$00 ;
  DEFB $09,$E0,$00,$00,$00,$00,$42,$88 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $06,$5C,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$68,$00,$00,$02,$78,$00,$00 ;
  DEFB $A4,$30,$42,$B0,$01,$68,$00,$00 ;
  DEFB $00,$00,$41,$B4,$00,$00,$00,$00 ;
  DEFB $00,$00,$06,$9C,$00,$00,$43,$64 ;
  DEFB $00,$00,$00,$00,$00,$00,$85,$A8 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $06,$9C,$00,$00,$00,$00,$42,$60 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$40,$00,$00,$41,$70 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 20
  DEFB $00,$00,$84,$40,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$C0,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$06,$A0 ;
  DEFB $0A,$80,$00,$00,$42,$48,$00,$00 ;
  DEFB $00,$00,$C5,$48,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$50,$02,$C8,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$B8 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$40,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$70,$42,$90,$00,$00 ;
  DEFB $00,$00,$00,$00,$C5,$78,$0A,$D0 ;
  DEFB $00,$00,$00,$00,$43,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$01,$60,$01,$60,$00,$00 ;
  DEFB $0A,$01,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$0A,$01,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$70,$00,$00 ;
  DEFB $01,$40,$00,$00,$00,$00,$00,$00 ;
  DEFB $41,$A0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$40,$42,$B0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $46,$C8,$00,$00,$41,$38,$00,$00 ;
  DEFB $00,$00,$01,$B8,$C5,$40,$00,$00 ;
  DEFB $0A,$78,$42,$38,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$C3,$60,$00,$00 ;
  DEFB $87,$30,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 21
  DEFB $00,$00,$84,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$85,$60,$08,$08 ;
  DEFB $C5,$90,$09,$E0,$00,$00,$41,$A8 ;
  DEFB $00,$00,$00,$00,$0A,$08,$06,$70 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$42,$50,$00,$00,$08,$E0 ;
  DEFB $41,$80,$00,$00,$02,$88,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$40,$C5,$80 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $01,$88,$09,$C8,$A4,$08,$00,$00 ;
  DEFB $09,$E0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$41,$70,$00,$00,$0B,$C8 ;
  DEFB $00,$00,$02,$70,$00,$00,$00,$00 ;
  DEFB $41,$40,$0A,$E0,$03,$48,$00,$00 ;
  DEFB $01,$60,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$80,$00,$00,$41,$60,$09,$E0 ;
  DEFB $00,$00,$00,$00,$85,$80,$00,$00 ;
  DEFB $03,$70,$00,$00,$09,$08,$00,$00 ;
  DEFB $87,$90,$00,$00,$09,$E0,$00,$00 ;
  DEFB $C5,$B0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$80,$0A,$01 ;
  DEFB $00,$00,$87,$90,$0B,$20,$00,$00 ;
  DEFB $01,$60,$0A,$01,$E4,$E8,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$09,$20 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $46,$B0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$09,$01 ;
  DEFB $00,$00,$00,$00,$87,$C0,$08,$18 ;
  DEFB $00,$00,$87,$90,$08,$01,$00,$00 ;
  DEFB $00,$00,$00,$00,$C3,$70,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 22
  DEFB $00,$00,$84,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$02,$60 ;
  DEFB $01,$58,$0A,$01,$00,$00,$00,$00 ;
  DEFB $00,$00,$42,$C8,$00,$00,$00,$00 ;
  DEFB $00,$00,$02,$C8,$00,$00,$00,$00 ;
  DEFB $00,$00,$02,$C8,$00,$00,$0A,$78 ;
  DEFB $00,$00,$00,$00,$46,$30,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$41,$B0,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$40,$A4,$08 ;
  DEFB $01,$30,$0B,$E8,$00,$00,$00,$00 ;
  DEFB $0B,$01,$87,$30,$41,$C0,$00,$00 ;
  DEFB $0B,$01,$00,$00,$08,$E8,$00,$00 ;
  DEFB $01,$30,$02,$38,$41,$C0,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$C0,$00,$00 ;
  DEFB $00,$00,$00,$00,$09,$E8,$85,$40 ;
  DEFB $41,$B0,$42,$A0,$00,$00,$A4,$20 ;
  DEFB $09,$E0,$00,$00,$01,$80,$01,$58 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$A0 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$30 ;
  DEFB $00,$00,$85,$40,$00,$00,$01,$30 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$42,$50,$00,$00,$00,$00 ;
  DEFB $01,$A0,$42,$50,$00,$00,$00,$00 ;
  DEFB $00,$00,$C5,$58,$00,$00,$00,$00 ;
  DEFB $87,$30,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$0B,$20 ;
  DEFB $87,$78,$00,$00,$00,$00,$0A,$D0 ;
  DEFB $87,$80,$00,$00,$43,$A0,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 23
  DEFB $00,$00,$84,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$90,$00,$00 ;
  DEFB $0A,$08,$41,$78,$00,$00,$00,$00 ;
  DEFB $46,$88,$00,$00,$00,$00,$02,$A0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$60,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$06,$50 ;
  DEFB $00,$00,$02,$80,$00,$00,$41,$80 ;
  DEFB $00,$00,$00,$00,$0A,$E0,$06,$50 ;
  DEFB $00,$00,$02,$60,$00,$00,$00,$00 ;
  DEFB $01,$68,$00,$00,$08,$08,$00,$00 ;
  DEFB $00,$00,$42,$80,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $02,$90,$42,$70,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$0A,$E0,$00,$00 ;
  DEFB $00,$00,$42,$78,$00,$00,$00,$00 ;
  DEFB $08,$D8,$00,$00,$00,$00,$09,$08 ;
  DEFB $00,$00,$00,$00,$42,$90,$0B,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$06,$88 ;
  DEFB $00,$00,$01,$60,$85,$60,$0A,$D0 ;
  DEFB $02,$60,$00,$00,$00,$00,$02,$40 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$85,$70,$42,$78 ;
  DEFB $00,$00,$42,$30,$0A,$E0,$00,$00 ;
  DEFB $00,$00,$00,$00,$08,$E0,$06,$30 ;
  DEFB $00,$00,$00,$00,$0A,$E0,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$46,$80 ;
  DEFB $00,$00,$00,$00,$00,$00,$0A,$E0 ;
  DEFB $00,$00,$00,$00,$42,$60,$00,$00 ;
  DEFB $00,$00,$87,$80,$00,$00,$0A,$E0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 24
  DEFB $00,$00,$C4,$90,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$08,$01 ;
  DEFB $00,$00,$00,$00,$00,$00,$08,$01 ;
  DEFB $00,$00,$00,$00,$41,$C0,$00,$00 ;
  DEFB $00,$00,$41,$90,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$78,$00,$00 ;
  DEFB $08,$E8,$85,$40,$42,$B0,$02,$30 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $A4,$04,$03,$38,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$50,$00,$00 ;
  DEFB $85,$50,$0A,$E0,$00,$00,$06,$50 ;
  DEFB $0A,$10,$42,$A0,$00,$00,$00,$00 ;
  DEFB $00,$00,$41,$B0,$00,$00,$00,$00 ;
  DEFB $00,$00,$42,$C0,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$40,$00,$00,$00,$00 ;
  DEFB $00,$00,$02,$B8,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$38,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$B0 ;
  DEFB $01,$B8,$0B,$80,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$0A,$80 ;
  DEFB $87,$38,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$02,$98,$C5,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$C0,$00,$00 ;
  DEFB $00,$00,$00,$00,$0B,$80,$00,$00 ;
  DEFB $03,$C0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$01,$B8,$0A,$80,$00,$00 ;
  DEFB $00,$00,$01,$B8,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$30,$00,$00,$46,$80 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 25
  DEFB $00,$00,$84,$40,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $0B,$E0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$80,$01,$60 ;
  DEFB $0A,$10,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$02,$90,$42,$A0,$00,$00 ;
  DEFB $85,$80,$09,$E0,$01,$70,$02,$60 ;
  DEFB $00,$00,$00,$00,$E4,$C0,$42,$A0 ;
  DEFB $00,$00,$41,$80,$00,$00,$00,$00 ;
  DEFB $0A,$E0,$01,$58,$00,$00,$43,$60 ;
  DEFB $00,$00,$42,$68,$08,$E8,$00,$00 ;
  DEFB $00,$00,$02,$90,$00,$00,$42,$90 ;
  DEFB $00,$00,$00,$00,$01,$98,$00,$00 ;
  DEFB $00,$00,$41,$B0,$00,$00,$41,$B8 ;
  DEFB $0B,$10,$00,$00,$01,$90,$41,$70 ;
  DEFB $00,$00,$43,$80,$00,$00,$00,$00 ;
  DEFB $00,$00,$A4,$20,$00,$00,$00,$00 ;
  DEFB $87,$88,$09,$E0,$42,$58,$00,$00 ;
  DEFB $0A,$08,$00,$00,$00,$00,$42,$90 ;
  DEFB $00,$00,$00,$00,$00,$00,$C5,$90 ;
  DEFB $00,$00,$00,$00,$41,$70,$0B,$10 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$90 ;
  DEFB $00,$00,$00,$00,$85,$A0,$00,$00 ;
  DEFB $41,$80,$0A,$08,$85,$90,$00,$00 ;
  DEFB $41,$60,$00,$00,$00,$00,$00,$00 ;
  DEFB $42,$A0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$A0,$00,$00,$01,$70 ;
  DEFB $00,$00,$00,$00,$85,$70,$00,$00 ;
  DEFB $87,$60,$00,$00,$02,$88,$00,$00 ;
  DEFB $00,$00,$C5,$55,$00,$00,$00,$00 ;
  DEFB $00,$00,$C6,$90,$00,$00,$81,$80 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 26
  DEFB $00,$00,$C4,$90,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$A0,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$58,$00,$00 ;
  DEFB $42,$58,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$85,$C0,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$B8,$0A,$80 ;
  DEFB $00,$00,$41,$38,$01,$C0,$00,$00 ;
  DEFB $0A,$80,$43,$C0,$01,$C0,$00,$00 ;
  DEFB $01,$C0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$58,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$0B,$80 ;
  DEFB $00,$00,$85,$B8,$00,$00,$0B,$98 ;
  DEFB $00,$00,$00,$00,$87,$B8,$00,$00 ;
  DEFB $41,$30,$41,$30,$41,$30,$0B,$80 ;
  DEFB $00,$00,$01,$B8,$00,$00,$00,$00 ;
  DEFB $43,$38,$C5,$30,$0B,$80,$00,$00 ;
  DEFB $0B,$98,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$85,$B0,$0B,$80,$00,$00 ;
  DEFB $0B,$98,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$0B,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $02,$B0,$00,$00,$85,$90,$00,$00 ;
  DEFB $41,$40,$00,$00,$41,$40,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$06,$B0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$06,$30,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$46,$70 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 27
  DEFB $00,$00,$84,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$88,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$80,$0B,$E0 ;
  DEFB $41,$90,$00,$00,$00,$00,$85,$70 ;
  DEFB $09,$E0,$85,$70,$00,$00,$85,$A0 ;
  DEFB $41,$70,$42,$90,$00,$00,$00,$00 ;
  DEFB $E4,$C0,$85,$70,$41,$60,$00,$00 ;
  DEFB $0A,$E0,$41,$60,$00,$00,$00,$00 ;
  DEFB $41,$A0,$00,$00,$0B,$01,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $C5,$60,$01,$90,$0B,$01,$06,$70 ;
  DEFB $00,$00,$00,$00,$43,$50,$41,$70 ;
  DEFB $00,$00,$01,$A0,$00,$00,$85,$B0 ;
  DEFB $00,$00,$87,$A0,$0B,$01,$C5,$90 ;
  DEFB $00,$00,$00,$00,$08,$E0,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$88,$00,$00 ;
  DEFB $00,$00,$42,$80,$00,$00,$00,$00 ;
  DEFB $42,$90,$09,$E0,$00,$00,$0B,$08 ;
  DEFB $00,$00,$87,$A0,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$90,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$85,$C0 ;
  DEFB $42,$A0,$42,$80,$02,$90,$00,$00 ;
  DEFB $00,$00,$E4,$E8,$09,$10,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $02,$78,$00,$00,$02,$90,$00,$00 ;
  DEFB $42,$90,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$C5,$60 ;
  DEFB $00,$00,$00,$00,$01,$70,$00,$00 ;
  DEFB $02,$80,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$90,$01,$80,$01,$78 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 28
  DEFB $00,$00,$84,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$80,$0B,$18 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $01,$40,$00,$00,$41,$B0,$00,$00 ;
  DEFB $41,$90,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$46,$A0,$0A,$08,$42,$A0 ;
  DEFB $00,$00,$85,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$C0,$C5,$60,$00,$00 ;
  DEFB $02,$B0,$41,$40,$00,$00,$C5,$40 ;
  DEFB $0A,$78,$41,$40,$00,$00,$00,$00 ;
  DEFB $41,$40,$00,$00,$00,$00,$87,$C0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$C5,$60 ;
  DEFB $0B,$D0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$A0,$0B,$E8,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$02,$30 ;
  DEFB $41,$A0,$00,$00,$02,$80,$00,$00 ;
  DEFB $02,$78,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$78,$00,$00 ;
  DEFB $02,$68,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$38,$0B,$E0 ;
  DEFB $42,$A0,$00,$00,$01,$38,$00,$00 ;
  DEFB $02,$40,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$46,$98,$00,$00,$C5,$98 ;
  DEFB $00,$00,$85,$50,$00,$00,$85,$70 ;
  DEFB $01,$50,$00,$00,$02,$50,$00,$00 ;
  DEFB $01,$58,$00,$00,$0B,$E0,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$90,$00,$00,$01,$78,$41,$78 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 29
  DEFB $00,$00,$C4,$90,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$02,$90,$0A,$01,$00,$00 ;
  DEFB $87,$88,$00,$00,$42,$80,$00,$00 ;
  DEFB $02,$90,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$90,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$02,$80,$0A,$E0,$01,$40 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$50,$00,$00,$01,$40,$00,$00 ;
  DEFB $01,$30,$00,$00,$0A,$E0,$00,$00 ;
  DEFB $00,$00,$41,$80,$00,$00,$42,$88 ;
  DEFB $00,$00,$00,$00,$02,$38,$0A,$E0 ;
  DEFB $43,$90,$02,$50,$00,$00,$85,$90 ;
  DEFB $02,$A0,$00,$00,$41,$90,$82,$88 ;
  DEFB $41,$90,$00,$00,$00,$00,$00,$00 ;
  DEFB $E5,$C0,$41,$90,$00,$00,$00,$00 ;
  DEFB $00,$00,$41,$60,$42,$70,$00,$00 ;
  DEFB $00,$00,$42,$90,$0A,$E0,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$46,$90,$09,$E0 ;
  DEFB $0B,$01,$00,$00,$00,$00,$00,$00 ;
  DEFB $42,$60,$0B,$E0,$A5,$08,$C5,$A0 ;
  DEFB $00,$00,$00,$00,$06,$50,$00,$00 ;
  DEFB $00,$00,$43,$80,$00,$00,$00,$00 ;
  DEFB $00,$00,$42,$80,$00,$00,$00,$00 ;
  DEFB $00,$00,$0B,$E0,$02,$80,$00,$00 ;
  DEFB $02,$60,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$90,$41,$60,$0A,$E0 ;
  DEFB $00,$00,$00,$00,$0B,$01,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$80,$00,$00 ;
  DEFB $00,$00,$0A,$E0,$00,$00,$46,$80 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 30
  DEFB $00,$00,$84,$40,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $01,$50,$02,$50,$0A,$08,$00,$00 ;
  DEFB $08,$E8,$42,$A0,$85,$30,$C5,$A8 ;
  DEFB $00,$00,$42,$88,$00,$00,$42,$C0 ;
  DEFB $00,$00,$00,$00,$06,$30,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$06,$44 ;
  DEFB $00,$00,$42,$30,$0A,$80,$43,$3C ;
  DEFB $00,$00,$00,$00,$87,$3C,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $0A,$78,$00,$00,$41,$3C,$00,$00 ;
  DEFB $00,$00,$01,$C0,$0A,$78,$06,$44 ;
  DEFB $00,$00,$42,$40,$00,$00,$00,$00 ;
  DEFB $41,$44,$00,$00,$00,$00,$01,$98 ;
  DEFB $00,$00,$01,$98,$41,$50,$00,$00 ;
  DEFB $02,$A0,$41,$34,$00,$00,$41,$C0 ;
  DEFB $00,$00,$02,$50,$00,$00,$01,$50 ;
  DEFB $A4,$08,$02,$50,$00,$00,$00,$00 ;
  DEFB $41,$90,$02,$70,$00,$00,$00,$00 ;
  DEFB $00,$00,$01,$A0,$43,$A4,$00,$00 ;
  DEFB $00,$00,$00,$00,$08,$08,$41,$A4 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$C0,$01,$40,$01,$40,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$BC,$42,$C0 ;
  DEFB $00,$00,$00,$00,$02,$A8,$00,$00 ;
  DEFB $00,$00,$00,$00,$C5,$68,$00,$00 ;
  DEFB $01,$AC,$00,$00,$42,$44,$00,$00 ;
  DEFB $00,$00,$02,$B0,$02,$B0,$02,$AC ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$A8 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$78 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 31
  DEFB $00,$00,$84,$50,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$0A,$08 ;
  DEFB $06,$6C,$0A,$D8,$00,$00,$02,$88 ;
  DEFB $00,$00,$02,$98,$C5,$7C,$00,$00 ;
  DEFB $08,$E0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$0A,$08,$00,$00,$00,$00 ;
  DEFB $41,$88,$42,$7C,$00,$00,$02,$90 ;
  DEFB $0A,$10,$43,$78,$00,$00,$00,$00 ;
  DEFB $06,$84,$00,$00,$00,$00,$42,$50 ;
  DEFB $08,$E0,$42,$4C,$00,$00,$42,$74 ;
  DEFB $00,$00,$00,$00,$85,$AC,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$02,$90 ;
  DEFB $0B,$E8,$41,$48,$00,$00,$00,$00 ;
  DEFB $01,$40,$09,$D0,$00,$00,$85,$80 ;
  DEFB $42,$80,$85,$70,$02,$68,$0A,$D0 ;
  DEFB $00,$00,$00,$00,$41,$4C,$85,$70 ;
  DEFB $0A,$E8,$01,$80,$00,$00,$02,$70 ;
  DEFB $09,$E0,$02,$70,$08,$C8,$00,$00 ;
  DEFB $42,$40,$00,$00,$01,$80,$00,$00 ;
  DEFB $01,$60,$42,$40,$00,$00,$01,$50 ;
  DEFB $08,$E0,$42,$90,$00,$00,$00,$00 ;
  DEFB $85,$74,$00,$00,$00,$00,$00,$00 ;
  DEFB $09,$E0,$00,$00,$00,$00,$42,$88 ;
  DEFB $00,$00,$42,$70,$00,$00,$41,$7C ;
  DEFB $42,$68,$0B,$08,$00,$00,$00,$00 ;
  DEFB $00,$00,$02,$AC,$00,$00,$02,$9C ;
  DEFB $00,$00,$42,$74,$00,$00,$02,$9C ;
  DEFB $00,$00,$08,$D8,$02,$68,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$90,$00,$00 ;
  DEFB $01,$58,$00,$00,$03,$5C,$85,$78 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 32
  DEFB $00,$00,$84,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$06,$70,$00,$00,$0A,$E0 ;
  DEFB $42,$88,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$6C,$00,$00 ;
  DEFB $00,$00,$00,$00,$06,$30,$00,$00 ;
  DEFB $02,$98,$00,$00,$00,$00,$01,$A0 ;
  DEFB $00,$00,$02,$C0,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$85,$30,$00,$00 ;
  DEFB $00,$00,$43,$40,$C5,$30,$0B,$80 ;
  DEFB $00,$00,$01,$A8,$01,$A8,$00,$00 ;
  DEFB $08,$80,$00,$00,$00,$00,$C5,$60 ;
  DEFB $01,$A8,$00,$00,$02,$AC,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$08,$80 ;
  DEFB $06,$B0,$00,$00,$42,$40,$00,$00 ;
  DEFB $00,$00,$85,$B8,$00,$00,$00,$00 ;
  DEFB $01,$A8,$03,$A8,$00,$00,$00,$00 ;
  DEFB $00,$00,$06,$A0,$00,$00,$01,$A4 ;
  DEFB $02,$A4,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $0B,$90,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$50 ;
  DEFB $42,$50,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$A8,$00,$00,$00,$00,$41,$48 ;
  DEFB $00,$00,$43,$40,$C5,$84,$00,$00 ;
  DEFB $02,$30,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$80 ;
  DEFB $02,$80,$42,$80,$00,$00,$08,$01 ;
  DEFB $41,$80,$C5,$7C,$00,$00,$41,$B0 ;
  DEFB $C5,$78,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 33
  DEFB $00,$00,$84,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$0B,$08 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $02,$98,$00,$00,$0B,$08,$42,$90 ;
  DEFB $00,$00,$00,$00,$00,$00,$06,$60 ;
  DEFB $00,$00,$00,$00,$06,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$02,$B0,$00,$00,$42,$90 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$90 ;
  DEFB $00,$00,$00,$00,$02,$C0,$0A,$20 ;
  DEFB $41,$A0,$00,$00,$00,$00,$06,$90 ;
  DEFB $00,$00,$00,$00,$00,$00,$06,$C0 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$88 ;
  DEFB $02,$B8,$0B,$01,$41,$A0,$E4,$E8 ;
  DEFB $0A,$20,$43,$C0,$00,$00,$01,$7C ;
  DEFB $00,$00,$01,$88,$0B,$08,$00,$00 ;
  DEFB $87,$B0,$00,$00,$01,$80,$02,$74 ;
  DEFB $02,$74,$09,$10,$C5,$88,$00,$00 ;
  DEFB $00,$00,$01,$7C,$00,$00,$41,$C0 ;
  DEFB $0B,$08,$41,$88,$02,$80,$E4,$E8 ;
  DEFB $00,$00,$00,$00,$87,$8C,$00,$00 ;
  DEFB $0B,$01,$00,$00,$08,$18,$42,$BC ;
  DEFB $02,$AC,$00,$00,$00,$00,$0A,$01 ;
  DEFB $87,$C0,$00,$00,$41,$80,$00,$00 ;
  DEFB $03,$90,$42,$90,$00,$00,$00,$00 ;
  DEFB $42,$8C,$42,$88,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$68,$00,$00 ;
  DEFB $01,$78,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$42,$78,$00,$00,$00,$00 ;
  DEFB $00,$00,$41,$40,$02,$40,$41,$74 ;
  DEFB $C5,$74,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 34
  DEFB $00,$00,$84,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$78,$01,$78 ;
  DEFB $09,$D0,$0B,$01,$00,$00,$06,$80 ;
  DEFB $00,$00,$00,$00,$09,$E8,$41,$C0 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$40 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$30,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$85,$B0,$C5,$48 ;
  DEFB $00,$00,$00,$00,$41,$40,$00,$00 ;
  DEFB $43,$40,$00,$00,$01,$B0,$00,$00 ;
  DEFB $00,$00,$41,$38,$00,$00,$41,$40 ;
  DEFB $00,$00,$02,$B4,$00,$00,$41,$C0 ;
  DEFB $00,$00,$41,$C0,$00,$00,$41,$90 ;
  DEFB $00,$00,$00,$00,$C5,$80,$0A,$08 ;
  DEFB $00,$00,$00,$00,$41,$90,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$80,$0A,$01 ;
  DEFB $00,$00,$C5,$88,$01,$78,$00,$00 ;
  DEFB $00,$00,$0B,$18,$06,$80,$0A,$01 ;
  DEFB $00,$00,$01,$78,$42,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$90 ;
  DEFB $41,$90,$00,$00,$41,$94,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$40,$00,$00 ;
  DEFB $41,$C0,$41,$38,$00,$00,$C5,$30 ;
  DEFB $00,$00,$0B,$80,$06,$C0,$00,$00 ;
  DEFB $01,$BC,$00,$00,$00,$00,$00,$00 ;
  DEFB $02,$C0,$00,$00,$02,$38,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$50,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$41,$80,$01,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 35
  DEFB $00,$00,$84,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$A0,$87,$80 ;
  DEFB $00,$00,$02,$A0,$0B,$E0,$02,$70 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$02,$78,$00,$00,$42,$90 ;
  DEFB $00,$00,$41,$68,$00,$00,$09,$08 ;
  DEFB $C5,$70,$00,$00,$00,$00,$01,$B0 ;
  DEFB $00,$00,$85,$80,$41,$B0,$08,$08 ;
  DEFB $00,$00,$00,$00,$42,$A8,$00,$00 ;
  DEFB $00,$00,$00,$00,$C5,$84,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$B8,$E4,$E0 ;
  DEFB $41,$7C,$00,$00,$00,$00,$01,$C0 ;
  DEFB $00,$00,$85,$C0,$0A,$20,$00,$00 ;
  DEFB $87,$C0,$00,$00,$C5,$B0,$00,$00 ;
  DEFB $01,$88,$00,$00,$00,$00,$08,$08 ;
  DEFB $87,$A8,$02,$B8,$00,$00,$42,$B8 ;
  DEFB $00,$00,$01,$90,$E4,$E0,$08,$01 ;
  DEFB $01,$A0,$02,$98,$0A,$18,$01,$A0 ;
  DEFB $42,$A0,$02,$88,$09,$01,$00,$00 ;
  DEFB $42,$90,$00,$00,$02,$C0,$00,$00 ;
  DEFB $01,$B8,$0B,$08,$42,$A8,$00,$00 ;
  DEFB $42,$B0,$0B,$20,$00,$00,$01,$B4 ;
  DEFB $00,$00,$01,$90,$0A,$01,$02,$A8 ;
  DEFB $E4,$E0,$00,$00,$C5,$80,$01,$A8 ;
  DEFB $42,$A4,$0B,$10,$00,$00,$01,$A8 ;
  DEFB $00,$00,$00,$00,$01,$A0,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $01,$88,$00,$00,$00,$00,$02,$80 ;
  DEFB $00,$00,$00,$00,$43,$78,$00,$00 ;
  DEFB $41,$A0,$0A,$08,$01,$7C,$01,$7C ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 36
  DEFB $00,$00,$84,$30,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$C5,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$30,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$C0,$00,$00 ;
  DEFB $02,$38,$00,$00,$00,$00,$02,$98 ;
  DEFB $42,$B8,$42,$BC,$00,$00,$42,$50 ;
  DEFB $00,$00,$01,$A8,$00,$00,$00,$00 ;
  DEFB $41,$30,$00,$00,$00,$00,$C5,$34 ;
  DEFB $00,$00,$85,$AC,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$42,$AC ;
  DEFB $00,$00,$42,$AC,$00,$00,$42,$98 ;
  DEFB $00,$00,$00,$00,$00,$00,$42,$90 ;
  DEFB $0A,$08,$02,$70,$00,$00,$00,$00 ;
  DEFB $08,$D8,$06,$90,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$70,$00,$00 ;
  DEFB $43,$80,$0B,$10,$06,$70,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$09,$08,$00,$00,$01,$80 ;
  DEFB $C5,$30,$00,$00,$00,$00,$85,$60 ;
  DEFB $41,$B8,$09,$01,$00,$00,$03,$50 ;
  DEFB $42,$A0,$00,$00,$42,$A4,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$50 ;
  DEFB $0B,$E8,$A4,$08,$85,$90,$85,$78 ;
  DEFB $00,$00,$01,$3C,$00,$00,$42,$B8 ;
  DEFB $00,$00,$02,$30,$00,$00,$06,$60 ;
  DEFB $00,$00,$00,$00,$00,$00,$02,$A0 ;
  DEFB $00,$00,$00,$00,$41,$58,$00,$00 ;
  DEFB $00,$00,$87,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$06,$C0,$00,$00,$41,$78 ;
  DEFB $00,$00,$01,$68,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 37
  DEFB $00,$00,$84,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$0A,$10 ;
  DEFB $87,$7C,$02,$88,$41,$80,$00,$00 ;
  DEFB $01,$B8,$41,$78,$0A,$08,$02,$98 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$70 ;
  DEFB $00,$00,$C5,$80,$00,$00,$00,$00 ;
  DEFB $00,$00,$C5,$84,$00,$00,$00,$00 ;
  DEFB $00,$00,$42,$90,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$84,$00,$00,$03,$70,$00,$00 ;
  DEFB $01,$70,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$0A,$E0,$41,$70 ;
  DEFB $00,$00,$01,$80,$02,$30,$0A,$C8 ;
  DEFB $00,$00,$01,$78,$09,$E8,$00,$00 ;
  DEFB $00,$00,$42,$70,$00,$00,$00,$00 ;
  DEFB $00,$00,$01,$84,$08,$E8,$41,$30 ;
  DEFB $01,$70,$00,$00,$0B,$D0,$00,$00 ;
  DEFB $87,$68,$09,$E8,$00,$00,$42,$58 ;
  DEFB $09,$D0,$00,$00,$42,$80,$00,$00 ;
  DEFB $41,$78,$0A,$E8,$00,$00,$00,$00 ;
  DEFB $01,$78,$42,$70,$E4,$D8,$42,$90 ;
  DEFB $00,$00,$08,$E0,$01,$58,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$03,$58 ;
  DEFB $00,$00,$00,$00,$C5,$68,$00,$00 ;
  DEFB $01,$70,$00,$00,$00,$00,$41,$50 ;
  DEFB $00,$00,$09,$E0,$06,$78,$00,$00 ;
  DEFB $00,$00,$87,$90,$00,$00,$00,$00 ;
  DEFB $42,$7C,$0B,$E0,$41,$68,$00,$00 ;
  DEFB $01,$74,$C5,$68,$00,$00,$00,$00 ;
  DEFB $00,$00,$42,$64,$0A,$E8,$00,$00 ;
  DEFB $00,$00,$00,$00,$08,$D0,$06,$68 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 38
  DEFB $00,$00,$C4,$B8,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$0B,$E8 ;
  DEFB $00,$00,$08,$08,$C5,$A8,$42,$C0 ;
  DEFB $00,$00,$00,$00,$02,$30,$00,$00 ;
  DEFB $02,$30,$00,$00,$01,$60,$00,$00 ;
  DEFB $42,$90,$00,$00,$06,$A0,$00,$00 ;
  DEFB $00,$00,$02,$74,$00,$00,$00,$00 ;
  DEFB $42,$A0,$00,$00,$42,$C0,$00,$00 ;
  DEFB $00,$00,$01,$38,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$85,$80 ;
  DEFB $01,$30,$00,$00,$00,$00,$C5,$38 ;
  DEFB $00,$00,$C5,$70,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$50 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$A0,$00,$00,$C5,$30,$00,$00 ;
  DEFB $00,$00,$00,$00,$0B,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $41,$C0,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$70 ;
  DEFB $85,$74,$02,$80,$00,$00,$06,$78 ;
  DEFB $00,$00,$0B,$E8,$41,$74,$00,$00 ;
  DEFB $41,$74,$00,$00,$85,$74,$0B,$D0 ;
  DEFB $00,$00,$00,$00,$00,$00,$42,$80 ;
  DEFB $0B,$10,$02,$7C,$00,$00,$00,$00 ;
  DEFB $01,$78,$00,$00,$41,$78,$00,$00 ;
  DEFB $41,$7C,$00,$00,$0B,$08,$41,$78 ;
  DEFB $85,$C0,$0B,$E0,$00,$00,$41,$80 ;
  DEFB $00,$00,$41,$90,$41,$90,$00,$00 ;
  DEFB $0B,$E8,$02,$74,$C5,$74,$00,$00 ;
  DEFB $00,$00,$41,$BC,$41,$BC,$00,$00 ;
  DEFB $00,$00,$06,$80,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 39
  DEFB $00,$00,$C4,$C0,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$08,$08 ;
  DEFB $87,$78,$00,$00,$02,$78,$41,$88 ;
  DEFB $00,$00,$C5,$70,$09,$01,$42,$78 ;
  DEFB $00,$00,$00,$00,$85,$9C,$08,$18 ;
  DEFB $42,$78,$00,$00,$42,$78,$09,$01 ;
  DEFB $00,$00,$02,$88,$41,$B8,$00,$00 ;
  DEFB $02,$A8,$00,$00,$01,$B8,$E4,$E8 ;
  DEFB $09,$08,$C5,$78,$41,$88,$00,$00 ;
  DEFB $85,$B4,$00,$00,$06,$A0,$09,$10 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $87,$B4,$00,$00,$01,$B8,$0B,$08 ;
  DEFB $41,$80,$42,$98,$08,$20,$02,$90 ;
  DEFB $00,$00,$02,$80,$00,$00,$02,$90 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $01,$80,$00,$00,$43,$88,$E4,$E8 ;
  DEFB $02,$90,$00,$00,$02,$90,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$8C ;
  DEFB $C5,$90,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$06,$80,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$A8,$00,$00 ;
  DEFB $42,$B0,$08,$01,$E4,$E8,$00,$00 ;
  DEFB $09,$18,$02,$B8,$85,$C0,$C5,$A8 ;
  DEFB $C5,$A8,$08,$01,$00,$00,$00,$00 ;
  DEFB $41,$9C,$00,$00,$01,$9C,$00,$00 ;
  DEFB $00,$00,$00,$00,$08,$18,$00,$00 ;
  DEFB $00,$00,$01,$80,$00,$00,$42,$A8 ;
  DEFB $00,$00,$42,$A0,$02,$A0,$00,$00 ;
  DEFB $41,$90,$00,$00,$01,$88,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 40
  DEFB $00,$00,$C4,$98,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$85,$B0,$00,$00 ;
  DEFB $42,$B0,$06,$58,$00,$00,$42,$4C ;
  DEFB $00,$00,$00,$00,$41,$44,$00,$00 ;
  DEFB $42,$A8,$00,$00,$01,$B0,$00,$00 ;
  DEFB $00,$00,$00,$00,$06,$40,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$0A,$88 ;
  DEFB $00,$00,$00,$00,$01,$C0,$00,$00 ;
  DEFB $00,$00,$43,$38,$00,$00,$42,$C0 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$BC ;
  DEFB $00,$00,$00,$00,$01,$38,$41,$38 ;
  DEFB $00,$00,$01,$B8,$00,$00,$01,$B8 ;
  DEFB $42,$38,$00,$00,$42,$38,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $0A,$80,$00,$00,$00,$00,$01,$C0 ;
  DEFB $00,$00,$01,$BC,$02,$30,$00,$00 ;
  DEFB $02,$30,$00,$00,$01,$80,$00,$00 ;
  DEFB $42,$84,$01,$7C,$42,$7C,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$8C,$00,$00 ;
  DEFB $00,$00,$42,$B0,$42,$B0,$C5,$70 ;
  DEFB $02,$68,$00,$00,$00,$00,$41,$C0 ;
  DEFB $00,$00,$00,$00,$03,$38,$41,$BC ;
  DEFB $42,$BC,$00,$00,$00,$00,$41,$B4 ;
  DEFB $00,$00,$42,$C0,$00,$00,$00,$00 ;
  DEFB $00,$00,$42,$50,$00,$00,$00,$00 ;
  DEFB $00,$00,$41,$40,$42,$40,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $41,$58,$85,$90,$42,$B8,$00,$00 ;
  DEFB $41,$C0,$00,$00,$06,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 41
  DEFB $00,$00,$C4,$A0,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$42,$80 ;
  DEFB $01,$90,$09,$08,$41,$68,$00,$00 ;
  DEFB $41,$80,$42,$90,$00,$00,$42,$8C ;
  DEFB $0B,$08,$00,$00,$02,$8C,$00,$00 ;
  DEFB $02,$80,$00,$00,$01,$A4,$00,$00 ;
  DEFB $01,$70,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$E4,$E0,$00,$00,$00,$00 ;
  DEFB $87,$90,$00,$00,$00,$00,$00,$00 ;
  DEFB $06,$70,$00,$00,$06,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$02,$78 ;
  DEFB $00,$00,$01,$78,$00,$00,$02,$C0 ;
  DEFB $00,$00,$C5,$A0,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$90,$C5,$88,$00,$00 ;
  DEFB $41,$80,$00,$00,$01,$78,$00,$00 ;
  DEFB $E4,$E0,$41,$A0,$42,$88,$0A,$01 ;
  DEFB $43,$90,$00,$00,$01,$90,$0B,$18 ;
  DEFB $41,$B8,$02,$90,$02,$80,$00,$00 ;
  DEFB $42,$80,$00,$00,$85,$90,$00,$00 ;
  DEFB $00,$00,$00,$00,$01,$78,$01,$90 ;
  DEFB $00,$00,$01,$80,$42,$80,$00,$00 ;
  DEFB $0A,$08,$01,$88,$01,$B8,$00,$00 ;
  DEFB $00,$00,$00,$00,$06,$90,$00,$00 ;
  DEFB $08,$08,$42,$BC,$00,$00,$03,$80 ;
  DEFB $00,$00,$00,$00,$87,$9C,$00,$00 ;
  DEFB $00,$00,$01,$88,$00,$00,$41,$90 ;
  DEFB $00,$00,$00,$00,$42,$B8,$00,$00 ;
  DEFB $42,$B0,$42,$90,$00,$00,$02,$AC ;
  DEFB $00,$00,$02,$8C,$00,$00,$00,$00 ;
  DEFB $41,$AC,$01,$AC,$00,$00,$00,$00 ;
  DEFB $03,$78,$01,$78,$01,$78,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 42
  DEFB $00,$00,$84,$40,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$80,$00,$00 ;
  DEFB $01,$70,$00,$00,$00,$00,$87,$70 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $06,$90,$00,$00,$85,$90,$00,$00 ;
  DEFB $C5,$70,$00,$00,$42,$48,$00,$00 ;
  DEFB $01,$B8,$C5,$C0,$00,$00,$01,$B0 ;
  DEFB $00,$00,$02,$B0,$00,$00,$C5,$40 ;
  DEFB $00,$00,$42,$50,$00,$00,$01,$B0 ;
  DEFB $A4,$78,$02,$B4,$00,$00,$02,$B8 ;
  DEFB $00,$00,$42,$BC,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$C0,$02,$48 ;
  DEFB $00,$00,$41,$B0,$42,$B0,$08,$E8 ;
  DEFB $00,$00,$41,$B0,$85,$A8,$00,$00 ;
  DEFB $08,$E8,$41,$A0,$02,$58,$0A,$08 ;
  DEFB $00,$00,$41,$90,$00,$00,$01,$58 ;
  DEFB $01,$90,$00,$00,$06,$30,$00,$00 ;
  DEFB $00,$00,$43,$48,$00,$00,$00,$00 ;
  DEFB $00,$00,$02,$A0,$41,$40,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $02,$A0,$85,$A0,$00,$00,$00,$00 ;
  DEFB $41,$50,$00,$00,$42,$50,$00,$00 ;
  DEFB $00,$00,$00,$00,$06,$54,$00,$00 ;
  DEFB $00,$00,$02,$A0,$00,$00,$00,$00 ;
  DEFB $41,$C0,$00,$00,$C5,$30,$01,$B8 ;
  DEFB $00,$00,$02,$B4,$00,$00,$02,$B4 ;
  DEFB $00,$00,$00,$00,$01,$B4,$02,$B4 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $41,$40,$00,$00,$01,$30,$41,$C0 ;
  DEFB $00,$00,$41,$90,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 43
  DEFB $00,$00,$C4,$90,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$02,$70,$00,$00 ;
  DEFB $41,$68,$00,$00,$42,$90,$08,$08 ;
  DEFB $00,$00,$01,$80,$02,$70,$00,$00 ;
  DEFB $00,$00,$42,$90,$00,$00,$02,$A0 ;
  DEFB $00,$00,$C5,$98,$42,$B0,$00,$00 ;
  DEFB $0A,$10,$41,$98,$00,$00,$00,$00 ;
  DEFB $06,$9C,$C5,$90,$08,$08,$01,$88 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$08,$01,$08,$18,$06,$98 ;
  DEFB $00,$00,$00,$00,$42,$84,$00,$00 ;
  DEFB $09,$01,$42,$94,$41,$9C,$00,$00 ;
  DEFB $00,$00,$41,$78,$00,$00,$43,$70 ;
  DEFB $41,$78,$42,$94,$42,$C0,$0B,$08 ;
  DEFB $00,$00,$00,$00,$01,$94,$00,$00 ;
  DEFB $41,$94,$00,$00,$06,$9C,$0A,$10 ;
  DEFB $02,$78,$00,$00,$00,$00,$02,$A0 ;
  DEFB $A4,$30,$41,$A0,$03,$A0,$00,$00 ;
  DEFB $00,$00,$85,$94,$0A,$20,$41,$80 ;
  DEFB $00,$00,$41,$90,$0A,$08,$41,$80 ;
  DEFB $00,$00,$01,$94,$42,$80,$00,$00 ;
  DEFB $00,$00,$09,$01,$01,$90,$C5,$80 ;
  DEFB $09,$18,$00,$00,$01,$78,$0B,$01 ;
  DEFB $02,$98,$00,$00,$01,$84,$43,$98 ;
  DEFB $00,$00,$00,$00,$06,$98,$0B,$10 ;
  DEFB $00,$00,$02,$BC,$41,$C0,$00,$00 ;
  DEFB $01,$BC,$00,$00,$02,$B0,$00,$00 ;
  DEFB $00,$00,$08,$01,$41,$7C,$00,$00 ;
  DEFB $41,$7C,$42,$7C,$00,$00,$41,$AC ;
  DEFB $0B,$08,$02,$98,$00,$00,$01,$78 ;
  DEFB $C5,$80,$41,$88,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 44
  DEFB $00,$00,$84,$20,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $01,$4C,$42,$BC,$00,$00,$41,$4C ;
  DEFB $00,$00,$41,$4C,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$40 ;
  DEFB $02,$B0,$00,$00,$00,$00,$06,$A0 ;
  DEFB $00,$00,$00,$00,$42,$54,$00,$00 ;
  DEFB $C5,$60,$00,$00,$00,$00,$00,$00 ;
  DEFB $42,$50,$00,$00,$42,$50,$00,$00 ;
  DEFB $01,$B0,$00,$00,$02,$30,$00,$00 ;
  DEFB $01,$30,$00,$00,$02,$70,$00,$00 ;
  DEFB $41,$8C,$00,$00,$00,$00,$0B,$E0 ;
  DEFB $02,$70,$00,$00,$00,$00,$87,$80 ;
  DEFB $00,$00,$01,$78,$00,$00,$41,$78 ;
  DEFB $00,$00,$00,$00,$41,$80,$00,$00 ;
  DEFB $41,$80,$42,$88,$01,$70,$0A,$08 ;
  DEFB $00,$00,$87,$70,$00,$00,$00,$00 ;
  DEFB $00,$00,$08,$E8,$06,$C0,$08,$08 ;
  DEFB $00,$00,$42,$88,$85,$7C,$00,$00 ;
  DEFB $00,$00,$02,$80,$0B,$D8,$02,$84 ;
  DEFB $00,$00,$00,$00,$C5,$70,$00,$00 ;
  DEFB $00,$00,$01,$7C,$02,$7C,$01,$7C ;
  DEFB $43,$8C,$00,$00,$00,$00,$41,$90 ;
  DEFB $00,$00,$02,$38,$41,$C0,$42,$90 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$80 ;
  DEFB $00,$00,$01,$80,$0A,$10,$41,$80 ;
  DEFB $42,$80,$0A,$E0,$00,$00,$01,$84 ;
  DEFB $00,$00,$01,$70,$00,$00,$41,$98 ;
  DEFB $00,$00,$01,$78,$00,$00,$00,$00 ;
  DEFB $43,$88,$42,$88,$00,$00,$00,$00 ;
  DEFB $01,$80,$41,$90,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 45
  DEFB $00,$00,$84,$50,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$09,$10 ;
  DEFB $42,$7C,$00,$00,$02,$70,$00,$00 ;
  DEFB $42,$90,$00,$00,$41,$A0,$42,$8C ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$06,$98,$41,$84,$00,$00 ;
  DEFB $01,$B0,$C5,$90,$00,$00,$09,$08 ;
  DEFB $00,$00,$C5,$70,$41,$80,$00,$00 ;
  DEFB $00,$00,$01,$70,$0A,$08,$41,$80 ;
  DEFB $00,$00,$41,$90,$00,$00,$41,$A0 ;
  DEFB $01,$98,$0A,$08,$42,$98,$00,$00 ;
  DEFB $02,$78,$00,$00,$02,$A0,$02,$8C ;
  DEFB $00,$00,$00,$00,$00,$00,$85,$70 ;
  DEFB $02,$90,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$06,$88,$00,$00,$00,$00 ;
  DEFB $02,$98,$00,$00,$41,$98,$42,$60 ;
  DEFB $00,$00,$01,$74,$09,$08,$41,$8C ;
  DEFB $85,$8C,$42,$78,$09,$E0,$42,$84 ;
  DEFB $00,$00,$42,$A0,$00,$00,$42,$98 ;
  DEFB $00,$00,$00,$00,$00,$00,$08,$10 ;
  DEFB $00,$00,$41,$78,$00,$00,$01,$78 ;
  DEFB $00,$00,$00,$00,$0B,$08,$87,$84 ;
  DEFB $00,$00,$00,$00,$00,$00,$87,$7C ;
  DEFB $00,$00,$00,$00,$02,$70,$00,$00 ;
  DEFB $01,$90,$00,$00,$42,$70,$0A,$E0 ;
  DEFB $00,$00,$41,$B0,$41,$6C,$00,$00 ;
  DEFB $01,$6C,$00,$00,$0B,$E0,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$09,$E0,$87,$80,$01,$78 ;
  DEFB $00,$00,$01,$74,$00,$00,$03,$A0 ;
  DEFB $41,$88,$0B,$E0,$C5,$7C,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 46
  DEFB $00,$00,$C4,$C0,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$A0,$42,$50 ;
  DEFB $00,$00,$00,$00,$41,$50,$00,$00 ;
  DEFB $00,$00,$06,$40,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$C5,$30,$00,$00 ;
  DEFB $00,$00,$00,$00,$0B,$80,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$85,$30 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$41,$C0,$41,$C0,$00,$00 ;
  DEFB $02,$70,$00,$00,$42,$A0,$00,$00 ;
  DEFB $02,$70,$0B,$08,$42,$A0,$00,$00 ;
  DEFB $00,$00,$08,$E0,$06,$78,$00,$00 ;
  DEFB $00,$00,$01,$88,$01,$74,$00,$00 ;
  DEFB $00,$00,$00,$00,$87,$A0,$08,$10 ;
  DEFB $01,$74,$02,$74,$42,$90,$00,$00 ;
  DEFB $41,$90,$85,$80,$00,$00,$00,$00 ;
  DEFB $42,$A4,$08,$E8,$00,$00,$42,$B0 ;
  DEFB $00,$00,$00,$00,$00,$00,$85,$50 ;
  DEFB $00,$00,$41,$C0,$85,$50,$41,$B8 ;
  DEFB $08,$08,$00,$00,$C5,$98,$85,$50 ;
  DEFB $00,$00,$00,$00,$41,$B8,$08,$08 ;
  DEFB $C5,$B0,$00,$00,$00,$00,$00,$00 ;
  DEFB $01,$48,$01,$48,$01,$48,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ;
  DEFB $41,$B4,$00,$00,$C5,$B4,$41,$C0 ;
  DEFB $00,$00,$00,$00,$42,$40,$00,$00 ;
  DEFB $42,$44,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$01,$AC ;
  DEFB $01,$B4,$00,$00,$42,$C0,$00,$00 ;
  DEFB $41,$C0,$85,$A0,$00,$00,$41,$80 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 47
  DEFB $00,$00,$C4,$B0,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$08,$08 ;
  DEFB $87,$80,$00,$00,$42,$A0,$00,$00 ;
  DEFB $00,$00,$85,$80,$0B,$01,$00,$00 ;
  DEFB $00,$00,$42,$A0,$00,$00,$08,$18 ;
  DEFB $41,$7C,$00,$00,$06,$B0,$00,$00 ;
  DEFB $00,$00,$00,$00,$0A,$08,$00,$00 ;
  DEFB $00,$00,$00,$00,$41,$90,$00,$00 ;
  DEFB $43,$AC,$00,$00,$00,$00,$C5,$98 ;
  DEFB $0A,$38,$00,$00,$41,$C0,$00,$00 ;
  DEFB $01,$90,$01,$C0,$41,$90,$00,$00 ;
  DEFB $01,$88,$02,$C0,$01,$AC,$0A,$18 ;
  DEFB $02,$80,$00,$00,$00,$00,$00,$00 ;
  DEFB $08,$38,$00,$00,$42,$70,$0B,$20 ;
  DEFB $01,$B4,$01,$B4,$08,$38,$01,$B4 ;
  DEFB $E4,$E8,$41,$B4,$00,$00,$00,$00 ;
  DEFB $02,$70,$00,$00,$00,$00,$00,$00 ;
  DEFB $00,$00,$0B,$10,$00,$00,$00,$00 ;
  DEFB $00,$00,$87,$60,$00,$00,$01,$50 ;
  DEFB $00,$00,$43,$50,$42,$98,$00,$00 ;
  DEFB $01,$80,$00,$00,$41,$58,$41,$68 ;
  DEFB $00,$00,$01,$58,$0B,$E0,$00,$00 ;
  DEFB $01,$50,$85,$98,$42,$78,$00,$00 ;
  DEFB $02,$84,$0B,$D8,$00,$00,$00,$00 ;
  DEFB $01,$A0,$00,$00,$00,$00,$01,$90 ;
  DEFB $85,$B0,$09,$20,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$85,$A8 ;
  DEFB $00,$00,$41,$A0,$00,$00,$85,$A8 ;
  DEFB $01,$88,$00,$00,$00,$00,$0B,$28 ;
  DEFB $00,$00,$87,$B0,$00,$00,$43,$B0 ;
  DEFB $01,$B0,$41,$80,$00,$00,$41,$78 ;
  DEFB $00,$00,$00,$00,$00,$00,$00,$00 ; Bridge 48
  DEFB $00,$00,$84,$60,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$00,$00,$41,$88 ;
  DEFB $00,$00,$41,$88,$00,$00,$41,$80 ;
  DEFB $00,$00,$01,$80,$00,$00,$00,$00 ;
  DEFB $00,$00,$0A,$18,$00,$00,$00,$00 ;
  DEFB $41,$80,$41,$70,$0A,$01,$02,$78 ;
  DEFB $00,$00,$41,$80,$0A,$18,$41,$88 ;
  DEFB $42,$84,$08,$01,$42,$84,$00,$00 ;
  DEFB $00,$00,$01,$50,$00,$00,$00,$00 ;
  DEFB $00,$00,$08,$08,$00,$00,$00,$00 ;
  DEFB $00,$00,$C5,$80,$00,$00,$00,$00 ;
  DEFB $00,$00,$0B,$E8,$00,$00,$00,$00 ;
  DEFB $00,$00,$00,$00,$0B,$D0,$41,$78 ;
  DEFB $01,$78,$00,$00,$01,$78,$0A,$08 ;
  DEFB $01,$80,$0A,$E0,$00,$00,$41,$88 ;
  DEFB $00,$00,$85,$A0,$41,$98,$42,$94 ;
  DEFB $00,$00,$08,$01,$02,$38,$42,$A0 ;
  DEFB $00,$00,$01,$70,$01,$70,$00,$00 ;
  DEFB $41,$9C,$01,$70,$00,$00,$02,$88 ;
  DEFB $0B,$E0,$02,$88,$00,$00,$00,$00 ;
  DEFB $06,$88,$00,$00,$01,$78,$00,$00 ;
  DEFB $41,$80,$00,$00,$43,$84,$00,$00 ;
  DEFB $41,$84,$02,$80,$0B,$20,$00,$00 ;
  DEFB $00,$00,$0B,$E0,$87,$8C,$00,$00 ;
  DEFB $42,$88,$0A,$08,$02,$80,$00,$00 ;
  DEFB $01,$78,$0A,$20,$01,$78,$00,$00 ;
  DEFB $42,$80,$00,$00,$43,$80,$00,$00 ;
  DEFB $00,$00,$41,$80,$41,$80,$01,$84 ;
  DEFB $00,$00,$00,$00,$41,$8C,$00,$00 ;
  DEFB $00,$00,$02,$58,$01,$50,$41,$80 ;
  DEFB $00,$00,$41,$80,$00,$00,$00,$00 ;

