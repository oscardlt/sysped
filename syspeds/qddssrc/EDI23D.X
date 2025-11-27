     A*%%TS  SD  19981123  122519  SVEIN       REL-V4R2M0  5769-PW1
     A*%%EC
     A                                      DSPSIZ(24 80 *DS3)
     A                                      PRINT
     A                                      HLPDOC('VEDLSAK' 'HELPNU' 'HLP400')
     A                                      HELP
     A          R SUBFIL                    SFL
     A*%%TS  SD  19981123  122519  SVEIN       REL-V4R2M0  5769-PW1
     A            BRUKE5    R        H      REFFLD(PWDINTR/BRUKER4 *LIBL/PWDINT)
     A            WSNR           1A  B  6  5VALUES(' ' '2' '4')
     A            PREFCA    R        O  6  7REFFLD(HEURFILR/PREFCA *LIBL/HEURFI-
     A                                      L)
     A            CUSTCL    R        O  6 18REFFLD(HEURFILR/CUSTCL *LIBL/HEURFI-
     A                                      L)
     A            HEUR      R        O  6 29REFFLD(HEURFILR/HEUR *LIBL/HEURFIL)
     A            HEAVD     R        O  6 31REFFLD(HEURFILR/HEAVD *LIBL/HEURFIL)
     A            BRUKE1    R        O  6 36REFFLD(HEURFILR/BRUKER1 *LIBL/HEURF-
     A                                      IL)
     A            BRUKE2    R        O  6 47REFFLD(HEURFILR/BRUKER2 *LIBL/HEURF-
     A                                      IL)
     A            BRUKE3    R        O  6 58REFFLD(HEURFILR/BRUKER3 *LIBL/HEURF-
     A                                      IL)
     A            BRUKE4    R        O  6 69REFFLD(HEURFILR/BRUKER4 *LIBL/HEURF-
     A                                      IL)
     A          R SUBCTL                    SFLCTL(SUBFIL)
     A*%%TS  SD  19981123  122519  SVEIN       REL-V4R2M0  5769-PW1
     A                                      SFLSIZ(0015)
     A                                      SFLPAG(0014)
     A  91                                  SFLDSP
     A  92                                  SFLDSPCTL
     A  93                                  SFLCLR
     A  94                                  SFLEND
     A  91N93N94                            ROLLUP(25)
     A  91N93N94                            ROLLDOWN(26)
     A            ZRECNO         4S 0O  3 76SFLRCDNBR
     A                                      DSPATR(ND)
     A                                  1  2'SYSPED400/EDI23R'
     A                                      COLOR(BLU)
     A                                  1 68DATE
     A                                      EDTCDE(Y)
     A                                      COLOR(BLU)
     A                                  2 68TIME
     A                                      COLOR(BLU)
     A                                  3  2MSGCON(040 SHU0002 *LIBL/EDIMSGF)
     A                                      COLOR(BLU)
     A                                  4  2MSGCON(040 SHU0003 *LIBL/EDIMSGF)
     A                                      COLOR(BLU)
     A                                  1 19MSGCON(045 SHU0010 *LIBL/EDIMSGF)
     A                                      COLOR(WHT)
     A                                  5  3MSGCON(075 SHU0011 *LIBL/EDIMSGF)
     A                                      COLOR(WHT)
     A          R BUNN
     A*%%TS  SD  19981123  103942  SVEIN       REL-V4R2M0  5769-PW1
     A                                      CSRLOC(LINNBR     POSNBR)
     A                                      CF03(03 'EXIT')
     A                                      CF05(05 'Frisk')
     A                                      CF06(06 'LAGE NY')
     A                                      CF08(08 'SØK')
     A                                      ROLLUP(25)
     A                                      ROLLDOWN(26)
     A                                      SLNO(21)
     A                                      CLRL(04)
     A                                      OVERLAY
     A            LINNBR         3S 0H
     A            POSNBR         3S 0H
     A  98        MSG205        78A  O  4  2MSGID(DIV 0012 SYMSGF)
     A                                      COLOR(WHT)
     A N98                              4 40'(C) COPYRIGHT  SYSTEMA A/S  1990  '
     A                                      COLOR(WHT)
     A                                  3  2MSGCON(018 EDI0803 *LIBL/EDIMSGF)
     A                                      COLOR(BLU)
     A                                  3 22MSGCON(018 EDI0805 *LIBL/EDIMSGF)
     A                                      COLOR(BLU)
     A                                  3 42MSGCON(018 EDI0806 *LIBL/EDIMSGF)
     A                                      COLOR(BLU)
     A                                  3 62MSGCON(018 SHU0004 *LIBL/EDIMSGF)
     A                                      COLOR(BLU)
     A          R VARELI
     A*%%TS  SD  19981123  122519  SVEIN       REL-V4R2M0  5769-PW1
     A                                      CSRLOC(LINNBR     POSNBR)
     A                                      CF12(12 'Forrige')
     A                                      SLNO(21)
     A                                      CLRL(04)
     A                                      OVERLAY
     A            LINNBR         3S 0H
     A            POSNBR         3S 0H
     A            MSGNR          7A  P
     A                                  1  3MSGCON(075 SHU0011 *LIBL/EDIMSGF)
     A            WSPREF    R        B  2  7REFFLD(HEURFILR/PREFCA *LIBL/HEURFI-
     A                                      L)
     A  40                                  DSPATR(HI)
     A  40                                  DSPATR(PR)
     A  90                                  DSPATR(RI)
     A            WSCUST    R        B  2 18REFFLD(HEURFILR/CUSTCL *LIBL/HEURFI-
     A                                      L)
     A  40                                  DSPATR(HI)
     A  40                                  DSPATR(PR)
     A  90                                  DSPATR(RI)
     A            WSHEUR    R        B  2 29REFFLD(HEURFILR/HEUR *LIBL/HEURFIL)
     A  89                                  DSPATR(RI)
     A            WSAVD     R        B  2 31REFFLD(HEURFILR/HEAVD *LIBL/HEURFIL)
     A                                      EDTCDE(4)
     A            WSBRU1    R        B  2 36REFFLD(PWDINTR/BRUKER1 *LIBL/PWDINT)
     A            WSBRU2    R        B  2 47REFFLD(PWDINTR/BRUKER2 *LIBL/PWDINT)
     A            WSBRU3    R        B  2 58REFFLD(PWDINTR/BRUKER3 *LIBL/PWDINT)
     A            WSBRU4    R        B  2 69REFFLD(PWDINTR/BRUKER4 *LIBL/PWDINT)
     A                                  3  3MSGCON(018 EDI0812 *LIBL/EDIMSGF)
     A                                      COLOR(BLU)
     A            WSBRU5    R        B  3 36REFFLD(PWDINTR/BRUKER5 *LIBL/PWDINT)
     A  30        MSGTXT        78A  O  4  2MSGID(&MSGNR SYMSGF)
     A                                      COLOR(WHT)
     A N30                              4 40'(C) COPYRIGHT  SYSTEMA A/S  1990  '
     A                                      COLOR(WHT)
     A          R VAREL2
     A*%%TS  SD  19981123  122519  SVEIN       REL-V4R2M0  5769-PW1
     A                                      CF12(12 'Forrige')
     A                                      SLNO(21)
     A                                      CLRL(04)
     A                                      OVERLAY
     A                                  2  2MSGCON(010 SHU0006 *LIBL/EDIMSGF)
     A            W2PREF        10   I  2 15
     A                                  3  2MSGCON(018 EDI0812 *LIBL/EDIMSGF)
     A                                      COLOR(BLU)
     A                                  4 40'(C) COPYRIGHT  SYSTEMA A/S  1990  '
     A                                      COLOR(WHT)
     A          R VAREL3
     A*%%TS  SD  19981123  122519  SVEIN       REL-V4R2M0  5769-PW1
     A                                      CF12(12 'Forrige')
     A                                      SLNO(21)
     A                                      CLRL(04)
     A                                      OVERLAY
     A                                  4 40'(C) COPYRIGHT  SYSTEMA A/S  1990  '
     A                                      COLOR(WHT)
     A                                  3  2MSGCON(018 EDI0812 *LIBL/EDIMSGF)
     A                                      COLOR(BLU)
     A            BRUKE1    R        O  2 36REFFLD(PWDINTR/BRUKER1 *LIBL/PWDINT)
     A            BRUKE2    R        O  2 47REFFLD(PWDINTR/BRUKER2 *LIBL/PWDINT)
     A            BRUKE3    R        O  2 58REFFLD(PWDINTR/BRUKER3 *LIBL/PWDINT)
     A            BRUKE4    R        O  2 69REFFLD(PWDINTR/BRUKER4 *LIBL/PWDINT)
     A            BRUKE5    R        O  3 36REFFLD(PWDINTR/BRUKER5 *LIBL/PWDINT)
     A                                  1  3MSGCON(075 SHU0011 *LIBL/EDIMSGF)
     A                                      COLOR(WHT)
     A            PREFCA    R        O  2  7REFFLD(HEURFILR/PREFCA *LIBL/HEURFI-
     A                                      L)
     A            CUSTCL    R        O  2 18REFFLD(HEURFILR/CUSTCL *LIBL/HEURFI-
     A                                      L)
     A            HEUR      R        O  2 29REFFLD(HEURFILR/HEUR *LIBL/HEURFIL)
     A            HEAVD     R        O  2 31REFFLD(HEURFILR/HEAVD *LIBL/HEURFIL)
     A          R NYWRK
     A*%%TS  SD  19981123  122519  SVEIN       REL-V4R2M0  5769-PW1
     A                                      CF03(03 'EXIT')
     A                                      CF05(05 'Frisk')
     A                                      CF06(06 'LAGE NY')
     A                                      CF08(08 'SØK')
     A                                  1  2'SYSPED400/EDI23R'
     A                                      COLOR(BLU)
     A                                  1 67DATE
     A                                      EDTCDE(Y)
     A                                      COLOR(BLU)
     A                                  2 67TIME
     A                                      COLOR(BLU)
     A                                 24 40'(C) COPYRIGHT  SYSTEMA A/S  1990  '
     A                                      COLOR(WHT)
     A                                  3  2MSGCON(045 SHU0002 *LIBL/EDIMSGF)
     A                                      COLOR(BLU)
     A                                  4  2MSGCON(025 SHU0003 *LIBL/EDIMSGF)
     A                                      COLOR(BLU)
     A                                 23  3MSGCON(018 EDI0803 *LIBL/EDIMSGF)
     A                                      COLOR(BLU)
     A                                 23 22MSGCON(018 EDI0805 *LIBL/EDIMSGF)
     A                                      COLOR(BLU)
     A                                 23 42MSGCON(018 EDI0806 *LIBL/EDIMSGF)
     A                                      COLOR(BLU)
     A                                 23 62MSGCON(018 SHU0004 *LIBL/EDIMSGF)
     A                                      COLOR(BLU)
     A                                  1 19MSGCON(045 SHU0010 *LIBL/EDIMSGF)
     A                                      COLOR(WHT)
     A                                  5  2MSGCON(075 SHU0011 *LIBL/EDIMSGF)
     A                                      COLOR(WHT)
