     A*%%TS  SD  19991229  143250  JOVO        REL-V4R2M0  5769-PW1
     A*%%EC
     A                                      DSPSIZ(24 80 *DS3)
     A                                      REF(*LIBL/SADW SADWR)
     A                                      PRINT
     A                                      HLPDOC('SAD010' 'SAD061' 'SY400LO/S-
     A                                      ADTVINN')
     A                                      HELP
     A          R SUBFIL                    SFL
     A            WSNR           1A  I  6  2VALUES(' ' '2' '4' '5')
     A            SWVF           1A  H
     A            SWVKTB         9Y 0H
     A            SWVKTN         9Y 0H
     A            W2CHAS         8A  B  6  4TEXT('CHASSIS NR')
     A  28                                  DSPATR(PR)
     A            W2CASE         8A  B  6 13TEXT('CASE NR')
     A  28                                  DSPATR(PR)
     A            SWPACB    R        O  6 22
     A            SWLI           5Y 0O  6 31EDTCDE(4)
     A            SWLK           2A  O  6 37TEXT('Landk. oppr.land')
     A            SWVNT          8S 0O  6 40TEXT('Varenr Tolltariff')
     A            SWBELT        11Y 2O  6 49EDTCDE(4)
     A            WXVKTN         5Y 0O  6 62EDTCDE(4)
     A            SWMFR          1A  O  6 68TEXT('MVA fri kod')
     A            LINTOT         9Y 0O  6 70TEXT('TOT AVG INKL MVA')
     A                                      EDTCDE(4)
     A          R SUBCTL                    SFLCTL(SUBFIL)
     A                                      SFLSIZ(0014)
     A                                      SFLPAG(0013)
     A  91                                  SFLDSP
     A  92                                  SFLDSPCTL
     A  93                                  SFLCLR
     A  94                                  SFLEND
     A  91N93N94                            ROLLUP(25)
     A  91N93N94                            ROLLDOWN(26)
     A                                  1  2'SYSPED/SAD061B'
     A                                      COLOR(BLU)
     A                                  1 21'TOLLDEKLARASJON'
     A                                      COLOR(WHT)
     A                                  1 37'Mototvognfortoll'
     A                                      COLOR(WHT)
     A                                  1 54'Tdeknr.'
     A            UAVD           4Y 0O  1 62COLOR(WHT)
     A                                      EDTCDE(4)
     A                                  1 67'-'
     A                                      COLOR(WHT)
     A            UTDN           5Y 0O  1 69COLOR(WHT)
     A                                      EDTCDE(4)
     A            ZRECNO         4S 0O  1 76SFLRCDNBR
     A                                      DSPATR(ND)
     A                                  2  3'Fakt.bel:'
     A            UFAKNO         9Y 0O  2 15COLOR(WHT)
     A                                      EDTCDE(4)
     A                                  2 30'Frakt:'
     A            SIBEL8        11Y 2O  2 38TEXT('Frakt omberegnet')
     A                                      EDTCDE(4)
     A                                      COLOR(WHT)
     A                                  2 54'Rabatt:'
     A            SIBELC        11Y 2O  2 62COLOR(WHT)
     A                                      EDTCDE(4)
     A                                  3  3'Andre kost:'
     A            SIBEL9        11Y 2O  3 15TEXT('Andre kost.omber')
     A                                      EDTCDE(4)
     A                                      COLOR(WHT)
     A                                  3 30'Forsik:'
     A            SIBELA         7Y 0O  3 38TEXT('Beløp Forsikring')
     A                                      COLOR(WHT)
     A                                      EDTCDE(4)
     A                                  3 54'CIFSUM:'
     A            WSBEL4         9Y 0O  3 62TEXT('Beløp CIFsum')
     A                                      COLOR(WHT)
     A                                      EDTCDE(4)
     A N27                              4  2'Velg option, 2=Endre 4=Slette '
     A                                      COLOR(BLU)
     A  27                              4  2'Velg option, 5=Vise detaljer'
     A                                      COLOR(BLU)
     A                                  4 49'Avg.modus..:'
     A N50                              4 62'HELAUTOMATISK(F10)'
     A                                      COLOR(PNK)
     A  50                              4 62'MANUELL/AUTOM(F10)'
     A                                      COLOR(PNK)
     A                                  5  1'Op Chass.nr Case.nr  Merke    Linj-
     A                                      e LK Tariffnr     Verdi   N.vekt Mf-
     A                                       Sum avg. '
     A                                      COLOR(WHT)
     A          R BUNN
     A                                      CSRLOC(LINNBR     POSNBR)
     A                                      ROLLUP(25)
     A                                      ROLLDOWN(26)
     A                                      CF05(05 'FRISK')
     A N27                                  CF06(06 'LAGE NY')
     A N36                                  CF07(07 'SØKE OPPDRAG')
     A N27                                  CF10(10 'MANUELL MODUS PÅ/AV')
     A                                      CF03(03 'Be om utskrift/AVSLUTT')
     A                                      CF12(12 'Gå til bilde02')
     A                                      SLNO(19)
     A                                      CLRL(06)
     A                                      OVERLAY
     A            LINNBR         3S 0H
     A            POSNBR         3S 0H
     A            MSGNR          7A  P
     A  27                              3  2MSGCON(005 DIV1938 *LIBL/SYMSGF)
     A  27        SIBEL5         9Y 0O  3  8TEXT('Beløp Tot Toll')
     A                                      COLOR(WHT)
     A                                      EDTCDE(4)
     A  27                              3 22MSGCON(005 DIV1939 *LIBL/SYMSGF)
     A  27        SIBEL6         9Y 0O  3 28TEXT('Beløp Tot MVA')
     A                                      COLOR(WHT)
     A                                      EDTCDE(4)
     A  27                              3 42MSGCON(005 DIV1940 *LIBL/SYMSGF)
     A  27        W2AVGA         9Y 0O  3 48COLOR(WHT)
     A                                      EDTCDE(4)
     A  27                              3 62MSGCON(005 DIV1941 *LIBL/SYMSGF)
     A  27        SIBEL7        11Y 0O  3 68TEXT('Beløp Tot avg')
     A                                      COLOR(WHT)
     A                                      EDTCDE(4)
     A                                  4  2'Fsum->'
     A            SIBEL3        13Y 2O  4 10TEXT('Beløp Faktsum')
     A                                      COLOR(WHT)
     A                                      EDTCDE(4)
     A                                  4 27'Vsum->'
     A            W2VSUM        13Y 2O  4 35TEXT('Beløp Faktsum')
     A                                      COLOR(WHT)
     A                                      EDTCDE(4)
     A                                  4 52'Diff->'
     A            W2DIFF        13Y 2O  4 60TEXT('Beløp Faktsum')
     A                                      COLOR(WHT)
     A                                      EDTCDE(L)
     A N27                              5  2'F3=Neste/avslutt'
     A  35                                  COLOR(RED)
     A N35                                  COLOR(BLU)
     A N27                              5 21'F5=Forny   F6=Lage ny  F7=Soking o-
     A                                      ppdrag F12=Forrige bilde'
     A                                      COLOR(BLU)
     A N30        MSGTX2        78A  O  6  2COLOR(WHT)
     A  30        MSGTXT        78A  O  6  2MSGID(&MSGNR SYMSGF)
     A                                      COLOR(WHT)
     A  27                              5  2'F3=Avslutt        F7=Spørring på o-
     A                                      ppdrag       F12=Forrige bilde'
     A                                      COLOR(BLU)
     A          R VARELI
     A*%%TS  SD  19991229  143250  JOVO        REL-V4R2M0  5769-PW1
     A N27                                  CF04(04 'Søk')
     A N36                                  CF07(07 'Søke oppdrag')
     A N40                                  CF03(03 'Be om utskrift/AVSL.')
     A                                      CF12(12 'Forrige')
     A N27                                  CF10(10 'MANUELL MODUS PÅ/AV')
     A N27                                  CF13(13 'OPPD. MERKE-STD')
     A N27                                  CF23(23 'MER ENN EN=OK')
     A N27                                  CF14(14 'HENT merke-std (v/endring)-
     A                                      ')
     A                                      SLNO(14)
     A                                      CLRL(11)
     A                                      CSRLOC(LINNBR     POSNBR)
     A                                      OVERLAY
     A            W2WPR1         1A  H
     A            W2WPR2         1A  H
     A            W2WPR3         1A  H
     A            W2WPR4         1A  H
     A            W2WPR5         1A  H
     A            W2LI           5S 0H
     A            W2BELS        11S 0H
     A            W2BEL2        11S 0H
     A            W2WJUS        11S 0H
     A            W2WFTG         1A  H
     A            W2WTOL         9S 0H
     A            W2WMVG         9S 0H
     A            W2WMVA         9S 0H
     A            W2WSUM        11S 0H
     A            LINNBR         3S 0H
     A            POSNBR         3S 0H
     A            MSGNR          7A  P
     A                                  1  4'VF Opp Varenr.  TN P Tollverdi... -
     A                                      Brut.vekt Nettovekt Mengde. PVA T.s-
     A                                      ats Mf'
     A                                      COLOR(WHT)
     A            W2VF           1A  B  2  4TEXT('Verdi fasts.kode')
     A                                      DSPATR(UL)
     A  89                                  DSPATR(RI)
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A            W2LK           2A  B  2  7TEXT('Landk. oppr.land')
     A  27                                  DSPATR(PR)
     A                                      DSPATR(UL)
     A  88                                  DSPATR(RI)
     A                                      COLOR(YLW)
     A            W2VNT          8A  B  2 11TEXT('Varenr Tolltariff')
     A  27                                  DSPATR(PR)
     A                                      DSPATR(UL)
     A  87                                  DSPATR(RI)
     A                                      COLOR(YLW)
     A            W2TN           1A  B  2 20TEXT('Tollnedsettelse')
     A  27                                  DSPATR(PR)
     A                                      DSPATR(UL)
     A  86                                  DSPATR(RI)
     A                                      COLOR(YLW)
     A            W2PRE          1A  B  2 23TEXT('Preferanse')
     A  27                                  DSPATR(PR)
     A                                      DSPATR(UL)
     A  85                                  DSPATR(RI)
     A                                      COLOR(YLW)
     A            W2BELT        11Y 2B  2 25TEXT('Beløp Tollverdi')
     A  27                                  DSPATR(PR)
     A                                      DSPATR(UL)
     A                                      COLOR(YLW)
     A                                      EDTCDE(4)
     A  67                                  DSPATR(RI)
     A            W2VKTB         9Y 0B  2 38TEXT('Vekt Brutto')
     A  27                                  DSPATR(PR)
     A                                      DSPATR(UL)
     A  84                                  DSPATR(RI)
     A                                      EDTCDE(4)
     A                                      COLOR(YLW)
     A            W2VKTN         9Y 0B  2 48TEXT('Vekt Netto')
     A  27                                  DSPATR(PR)
     A  66                                  DSPATR(RI)
     A                                      DSPATR(UL)
     A                                      COLOR(YLW)
     A                                      EDTCDE(4)
     A            W2NTM          7Y 0B  2 58TEXT('Mengde')
     A  27                                  DSPATR(PR)
     A                                      DSPATR(UL)
     A  83                                  DSPATR(RI)
     A                                      EDTCDE(4)
     A                                      COLOR(YLW)
     A            W2PVA          1A  B  2 67TEXT('Enhet PVAF')
     A                                      DSPATR(UL)
     A  82                                  DSPATR(RI)
     A  27
     AO 46                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A            W2AS           5Y 2B  2 70TEXT('Avgiftssats')
     A                                      DSPATR(UL)
     A  81                                  DSPATR(RI)
     A  27
     AO 46                                  DSPATR(PR)
     A                                      EDTCDE(4)
     A                                      COLOR(YLW)
     A            W2MFR          1A  B  2 78TEXT('MVA fri kod')
     A                                      DSPATR(UL)
     A  80                                  DSPATR(HI)
     A  27
     AO 46                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A                                  3  1'Merke'
     A            W2PACB    R        B  3  7REFFLD(SADWR/SWPACB *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A  76                                  DSPATR(RI)
     A                                  3 15'Mod.bet.1/2'
     A            W2TX1C    R        B  3 27REFFLD(SADWR/SWTX1C *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A  75                                  DSPATR(RI)
     A            W2TX2C    R        B  3 38REFFLD(SADWR/SWTX2C *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A                                  3 49'Typegk'
     A            W2TX3C    R        B  3 56REFFLD(SADWR/SWTX3C *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A  74                                  DSPATR(RI)
     A                                  3 67'Av.g/kla'
     A            W2PC1C    R        B  3 76REFFLD(SADWR/SWPC1C *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A  73                                  DSPATR(RI)
     A            W2PC1D    R        B  3 78REFFLD(SADWR/SWPC1D *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A  72                                  DSPATR(RI)
     A  66                              4  1'V'
     A N66                              4  1'Vkt'
     A  66        W2VEKA    R        B  4  3REFFLD(SADWR/SWVEKM *LIBL/SADW)
     A                                      VALUES(' ' 'X' '0')
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A            W2TX1A    R        B  4  5REFFLD(SADWR/SWTX1A *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A  66                                  DSPATR(RI)
     A                                      EDTWRD('     , ')
     A                                      COLOR(YLW)
     A                                  4 13'Eff'
     A            W2TX2A    R        B  4 17REFFLD(SADWR/SWTX2A *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A  71                                  DSPATR(RI)
     A                                      EDTWRD('    ,  ')
     A                                  4 25'Kub'
     A            W2TX3A    R        B  4 29REFFLD(SADWR/SWTX3A *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      EDTCDE(4)
     A                                      COLOR(YLW)
     A  70                                  DSPATR(RI)
     A  67                              4 36'C'
     A N67                              4 36'CIF'
     A  67        W2CIFA    R        B  4 38REFFLD(SADWR/SWVEKM *LIBL/SADW)
     A                                      VALUES(' ' 'X' '0')
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A            W2PC1A    R        B  4 40REFFLD(SADWR/SWPC1A *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A  67                                  DSPATR(RI)
     A                                      EDTCDE(4)
     A                                      COLOR(YLW)
     A                                  4 47'Grunnlag  %-sats Vrakp.'
     A                                      COLOR(WHT)
     A N57                              4 71'MO-avgift'
     A                                      COLOR(WHT)
     A  57                              4 71'MOavg'
     A                                      COLOR(WHT)
     A  57        W2WSK1         3A  B  4 77
     A  27
     AON57                                  DSPATR(PR)
     A  27
     AON57                                  COLOR(WHT)
     A  57                                  COLOR(YLW)
     A            W2VEKM    R        B  5  3REFFLD(SADWR/SWVEKM *LIBL/SADW)
     A                                      VALUES(' ' 'X')
     A  27
     AON51                                  DSPATR(PR)
     A  27
     AON51                                  COLOR(WHT)
     A  51                                  COLOR(YLW)
     A            W2TX1B    R        B  5  5REFFLD(SADWR/SWTX1B *LIBL/SADW)
     A                                      EDTWRD('   .   ')
     A  27
     AON51                                  DSPATR(PR)
     A  27
     AON51                                  COLOR(WHT)
     A  51                                  COLOR(YLW)
     A            W2EFFM    R        B  5 15REFFLD(SADWR/SWEFFM *LIBL/SADW)
     A                                      VALUES(' ' 'X')
     A  27
     AON52                                  DSPATR(PR)
     A  27
     AON52                                  COLOR(WHT)
     A  52                                  COLOR(YLW)
     A            W2TX2B    R        B  5 17REFFLD(SADWR/SWTX2B *LIBL/SADW)
     A                                      EDTWRD('   .   ')
     A  27
     AON52                                  DSPATR(PR)
     A  27
     AON52                                  COLOR(WHT)
     A  52                                  COLOR(YLW)
     A            W2KUBM    R        B  5 26REFFLD(SADWR/SWKUBM *LIBL/SADW)
     A                                      VALUES(' ' 'X')
     A  27
     AON53                                  DSPATR(PR)
     A  27
     AON53                                  COLOR(WHT)
     A  53                                  COLOR(YLW)
     A            W2TX3B    R        B  5 28REFFLD(SADWR/SWTX3B *LIBL/SADW)
     A                                      EDTWRD('   .   ')
     A  27
     AON53                                  DSPATR(PR)
     A  27
     AON53                                  COLOR(WHT)
     A  53                                  COLOR(YLW)
     A            W2CIFM    R        B  5 37REFFLD(SADWR/SWCIFM *LIBL/SADW)
     A                                      VALUES(' ' 'X')
     A  27
     AON54                                  DSPATR(PR)
     A  27
     AON54                                  COLOR(WHT)
     A  54                                  COLOR(YLW)
     A            W2PC1B    R        B  5 39REFFLD(SADWR/SWPC1B *LIBL/SADW)
     A                                      EDTWRD('   .   ')
     A  27
     AON54                                  DSPATR(PR)
     A  27
     AON54                                  COLOR(WHT)
     A  54                                  COLOR(YLW)
     A            W2PC2B    R        B  5 47REFFLD(SADWR/SWPC2B *LIBL/SADW)
     A                                      DSPATR(PR)
     A                                      COLOR(WHT)
     A                                      EDTWRD('   .   ')
     A            W2PROM    R        B  5 55REFFLD(SADWR/SWPROM *LIBL/SADW)
     A                                      VALUES(' ' 'X')
     A  27
     AON55                                  DSPATR(PR)
     A  27
     AON55                                  COLOR(WHT)
     A  55                                  COLOR(YLW)
     A            W2PC2A    R        B  5 57REFFLD(SADWR/SWPC2A *LIBL/SADW)
     A                                      EDTCDE(4)
     A  27
     AON55                                  DSPATR(PR)
     A  27
     AON55                                  COLOR(WHT)
     A  55                                  COLOR(YLW)
     A            W2VRAM    R        B  5 64REFFLD(SADWR/SWVRAM *LIBL/SADW)
     A                                      VALUES(' ' 'X')
     A  27
     AON56                                  DSPATR(PR)
     A  27
     AON56                                  COLOR(WHT)
     A  56                                  COLOR(YLW)
     A            W2VRAK         4Y 0B  5 66EDTCDE(4)
     A  27
     AON56                                  DSPATR(PR)
     A  27
     AON56                                  COLOR(WHT)
     A  56                                  COLOR(YLW)
     A            W2ENGM    R        B  5 71REFFLD(SADWR/SWENGM *LIBL/SADW)
     A                                      VALUES(' ' 'X')
     A  27
     AON57                                  DSPATR(PR)
     A  27
     AON57                                  COLOR(WHT)
     A  57                                  COLOR(YLW)
     A            W2PC2C    R        B  5 73REFFLD(SADWR/SWPC2C *LIBL/SADW)
     A                                      EDTWRD('   .   ')
     A  27
     AON57                                  DSPATR(PR)
     A  27
     AON57                                  COLOR(WHT)
     A  57                                  COLOR(YLW)
     A                                  6  1'Chass'
     A            W2CHAS         8A  B  6  7COLOR(YLW)
     A  27                                  DSPATR(PR)
     A  69                                  DSPATR(RI)
     A                                  6 16'Case'
     A            W2CASE         8A  B  6 21COLOR(YLW)
     A  27                                  DSPATR(PR)
     A  68                                  DSPATR(RI)
     A                                  6 30'Rub.44'
     A            W2R442    R        B  6 37REFFLD(SADWR/SWR442 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A            W2REF2    R        B  6 55REFFLD(SADWR/SWREF2 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A  77                                  DSPATR(RI)
     A            W2R443    R        B  6 59REFFLD(SADWR/SWR443 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A            W2REF3    R        B  6 77REFFLD(SADWR/SWREF3 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A  77                                  DSPATR(RI)
     A                                  7 28'(Øvrige)'
     A            W2R444    R        B  7 37REFFLD(SADWR/SWR444 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A            W2REF4    R        B  7 55REFFLD(SADWR/SWREF4 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A  77                                  DSPATR(RI)
     A            W2R445    R        B  7 59REFFLD(SADWR/SWR445 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A            W2REF5    R        B  7 77REFFLD(SADWR/SWREF5 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      COLOR(YLW)
     A  77                                  DSPATR(RI)
     A                                  8  1'Øvrige'
     A            W2WTY2    R        B  8  9REFFLD(SADWR/SWWTY2 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      TEXT('Avgiftskode')
     A                                      DSPATR(UL)
     A  79                                  DSPATR(RI)
     A                                      COLOR(YLW)
     A            W2WSK2         3A  B  8 12
     A  27                                  DSPATR(PR)
     A                                      DSPATR(UL)
     A  79                                  DSPATR(RI)
     A                                      COLOR(YLW)
     A            W2WST2    R        B  8 16REFFLD(SADWR/SWWST2 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      TEXT('Toll og Avg.sats')
     A                                      DSPATR(UL)
     A                                      COLOR(YLW)
     A                                      EDTCDE(4)
     A            W2WGL2    R        B  8 25REFFLD(SADWR/SWWGL2 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      TEXT('Avgiftsgrunnlag')
     A                                      DSPATR(UL)
     A                                      COLOR(YLW)
     A                                      EDTCDE(4)
     A            W2WBL2    R        B  8 36REFFLD(SADWR/SWWBL2 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      DSPATR(UL)
     A  78                                  DSPATR(RI)
     A                                      COLOR(YLW)
     A                                      EDTCDE(4)
     A            W2WTY3    R        B  8 46REFFLD(SADWR/SWWTY3 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      TEXT('Avgiftskode')
     A                                      DSPATR(UL)
     A  79                                  DSPATR(RI)
     A                                      COLOR(YLW)
     A            W2WSK3         3A  B  8 49
     A  27                                  DSPATR(PR)
     A                                      DSPATR(UL)
     A  79                                  DSPATR(RI)
     A                                      COLOR(YLW)
     A            W2WST3    R        B  8 53REFFLD(SADWR/SWWST3 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      TEXT('Toll og Avg.sats')
     A                                      DSPATR(UL)
     A                                      COLOR(YLW)
     A                                      EDTCDE(4)
     A            W2WGL3    R        B  8 62REFFLD(SADWR/SWWGL3 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      TEXT('Avgiftsgrunnlag')
     A                                      DSPATR(UL)
     A                                      COLOR(YLW)
     A                                      EDTCDE(4)
     A            W2WBL3    R        B  8 73REFFLD(SADWR/SWWBL3 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      DSPATR(UL)
     A  78                                  DSPATR(RI)
     A                                      COLOR(YLW)
     A                                      EDTCDE(4)
     A                                  9  1'særavg.'
     A            W2WTY4    R        B  9  9REFFLD(SADWR/SWWTY4 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      TEXT('Avgiftskode')
     A                                      DSPATR(UL)
     A  79                                  DSPATR(RI)
     A                                      COLOR(YLW)
     A            W2WSK4         3A  B  9 12
     A  27                                  DSPATR(PR)
     A                                      DSPATR(UL)
     A  79                                  DSPATR(RI)
     A                                      COLOR(YLW)
     A            W2WST4    R        B  9 16REFFLD(SADWR/SWWST4 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      TEXT('Toll og Avg.sats')
     A                                      DSPATR(UL)
     A                                      COLOR(YLW)
     A                                      EDTCDE(4)
     A            W2WGL4    R        B  9 25REFFLD(SADWR/SWWGL4 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      TEXT('Avgiftsgrunnlag')
     A                                      DSPATR(UL)
     A                                      COLOR(YLW)
     A                                      EDTCDE(4)
     A            W2WBL4    R        B  9 36REFFLD(SADWR/SWWBL4 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      DSPATR(UL)
     A  78                                  DSPATR(RI)
     A                                      COLOR(YLW)
     A                                      EDTCDE(4)
     A            W2WTY5    R        B  9 46REFFLD(SADWR/SWWTY5 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      TEXT('Avgiftskode')
     A                                      DSPATR(UL)
     A  79                                  DSPATR(RI)
     A                                      COLOR(YLW)
     A            W2WSK5         3A  B  9 49
     A  27                                  DSPATR(PR)
     A                                      DSPATR(UL)
     A  79                                  DSPATR(RI)
     A                                      COLOR(YLW)
     A            W2WST5    R        B  9 53REFFLD(SADWR/SWWST5 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      TEXT('Toll og Avg.sats')
     A                                      DSPATR(UL)
     A                                      COLOR(YLW)
     A                                      EDTCDE(4)
     A            W2WGL5    R        B  9 62REFFLD(SADWR/SWWGL5 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      TEXT('Avgiftsgrunnlag')
     A                                      DSPATR(UL)
     A                                      COLOR(YLW)
     A                                      EDTCDE(4)
     A            W2WBL5    R        B  9 73REFFLD(SADWR/SWWBL5 *LIBL/SADW)
     A  27                                  DSPATR(PR)
     A                                      DSPATR(UL)
     A  78                                  DSPATR(RI)
     A                                      COLOR(YLW)
     A                                      EDTCDE(4)
     A                                 10  1'Fakturasum'
     A            SIBEL3        13Y 2O 10 12TEXT('Beløp Faktsum')
     A                                      COLOR(WHT)
     A                                      EDTCDE(4)
     A                                 10 28'Hittil deklarert'
     A            W2VSUM        13Y 2O 10 45TEXT('Beløp Faktsum')
     A                                      COLOR(WHT)
     A                                      EDTCDE(4)
     A                                 10 60'Diff'
     A            W2DIFF        13Y 2O 10 65TEXT('Beløp Faktsum')
     A                                      COLOR(WHT)
     A                                      EDTCDE(L)
     A N30N27                          11  1'F13=Lagre STD for merke/mod (hente-
     A                                      s autom. ved nyreg.)  F14=Hent STD -
     A                                      (v/endr.)'
     A                                      COLOR(BLU)
     A  30        MSGTXT        78A  O 11  2MSGID(&MSGNR SYMSGF)
     A                                      COLOR(WHT)
     A          R NYWRK
     A                                      ROLLUP(25)
     A                                      ROLLDOWN(26)
     A                                      CF05(05 'FRISK')
     A N27                                  CF06(06 'LAGE NY')
     A N36                                  CF07(07 'Søke oppdrag')
     A N27                                  CF10(10 'MANUELL MODUS PÅ/AV')
     A                                      CF03(03 'Be om utskrift/AVSLUTT')
     A                                      CF12(12 'Gå til bilde02')
     A            MSGNR          7A  P
     A                                  1  2'SYSPED/SAD061B'
     A                                      COLOR(BLU)
     A                                  1 21'TOLLDEKLARASJON'
     A                                      COLOR(WHT)
     A                                  1 37'Motorvognfortoll'
     A                                      COLOR(WHT)
     A                                  1 54'Tdeknr.'
     A            UAVD           4Y 0O  1 62COLOR(WHT)
     A                                      EDTCDE(4)
     A                                  1 67'-'
     A                                      COLOR(WHT)
     A            UTDN           5Y 0O  1 69COLOR(WHT)
     A                                      EDTCDE(4)
     A                                  2  3'Fakt.bel:'
     A            UFAKNO         9Y 0O  2 15COLOR(WHT)
     A                                      EDTCDE(4)
     A                                  2 30'Frakt:'
     A            SIBEL8        11Y 2O  2 38TEXT('Frakt omberegnet')
     A                                      EDTCDE(4)
     A                                      COLOR(WHT)
     A                                  2 54'Rabatt:'
     A            SIBELC        11Y 2O  2 62COLOR(WHT)
     A                                      EDTCDE(4)
     A                                  3  3'Andre kost:'
     A            SIBEL9        11Y 2O  3 15TEXT('Andre kost.omber')
     A                                      EDTCDE(4)
     A                                      COLOR(WHT)
     A                                  3 30'Forsik:'
     A            SIBELA         7Y 0O  3 38TEXT('Beløp Forsikring')
     A                                      COLOR(WHT)
     A                                      EDTCDE(4)
     A                                  3 54'CIFSUM:'
     A            WSBEL4         9Y 0O  3 62TEXT('Beløp CIFsum')
     A                                      COLOR(WHT)
     A                                      EDTCDE(4)
     A N27                              4  2'Velg option, 2=Endre 4=Slette '
     A                                      COLOR(BLU)
     A  27                              4  2'Velg option, 5=Vis detaljer'
     A                                      COLOR(BLU)
     A N50                              4 62'HELAUTOMATISK(F10)'
     A                                      COLOR(PNK)
     A  50                              4 62'MANUELL/AUTOM(F10)'
     A                                      COLOR(PNK)
     A                                  5  1'Op Chass.nr Case.nr  Merke    Linj-
     A                                      e LK Tariffnr     Verdi   N.vekt Mf-
     A                                       Sum avg. '
     A                                      COLOR(WHT)
     A                                 21  2'Fsum->'
     A            SIBEL3        13Y 2O 21 10TEXT('Beløp Faktsum')
     A                                      COLOR(WHT)
     A                                      EDTCDE(4)
     A                                 21 27'Vsum->'
     A            W2VSUM        13Y 2O 21 35TEXT('Beløp Faktsum')
     A                                      COLOR(WHT)
     A                                      EDTCDE(4)
     A                                 21 52'Diff->'
     A            W2DIFF        13Y 2O 21 60TEXT('Beløp Faktsum')
     A                                      COLOR(WHT)
     A                                      EDTCDE(L)
     A N27                             22  2'F3=Neste/avslutt'
     A  35                                  COLOR(RED)
     A N35                                  COLOR(BLU)
     A  27                             22  2'F3=Avslutt        F7=Spørring på o-
     A                                      ppdrag       F12=Forrige bilde'
     A                                      COLOR(BLU)
     A N27                             22 21'F5=Forny   F6=Lage ny  F7=Soking o-
     A                                      ppdrag F12=Forrige bilde'
     A                                      COLOR(BLU)
     A  30        MSGTXT        78A  O 24  2MSGID(&MSGNR SYMSGFHOL)
     A                                      COLOR(WHT)
