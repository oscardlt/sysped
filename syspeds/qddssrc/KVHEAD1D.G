     A                                      DSPSIZ(24 80 *DS3)
     A                                      PRINT
     A          R BILDE
     A                                      CF03(03 'Avslutt program')
     A                                  1  2'SYSPED/KVHEAD1R'
     A                                      COLOR(BLU)
     A                                  1 21'Konvertering av oppdragsfil'
     A                                      COLOR(WHT)
     A                                  1 62DATE
     A                                      EDTCDE(Y)
     A                                      COLOR(BLU)
     A                                  1 72TIME
     A                                      COLOR(BLU)
     A                                  5  2'Filnavn (HEADF/HEADFCMP) ...:'
     A            WSFILN        10A  B  5 32DSPATR(UL)
     A                                      COLOR(YLW)
     A                                  7  2'Fra bibliotek ..............:'
     A            WSLIBF        10A  B  7 32DSPATR(UL)
     A                                      COLOR(YLW)
     A                                  9  2'Til bibliotek ..............:'
     A            WSLIBT        10A  B  9 32DSPATR(UL)
     A                                      COLOR(YLW)
     A                                 12  2'OBS!    Det er to HEADF''er. En li-
     A                                      gger i SYSPEDF og en i SYSPEDO.'
     A                                 13 10'Det er en HEADFCMP som liger i SYF-
     A                                      AKT400O.'
     A                                 14 10'Dette programet skal kjøres tre ga-
     A                                      nger for å konvertere alle'
     A                                 15 10'tre filene. Etter det må man slett-
     A                                      e de tre filene fra fra-bibl.'
     A                                 16 10'før man starter CPYLIBC.'
     A                                 23  2'F3=Avslutt'
     A                                      COLOR(BLU)
