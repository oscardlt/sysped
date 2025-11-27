10XXX * 01 JOV PTF10 kun dds - skrv "SNDNR:.... kun dersom 52 ON
10XXX * 02 SH  PTF10 FLYTTET SENDINGSNUMMRENE + DATO
10XXX * 03 SH  PTF10 FLYTETT ALT 1 POS TIL HØYRE
10XXX * 04 YBC PTF10 RETT FEIL I ENDRING 3
10XXX * 05 SH  PTF10 LITT FLYTTING
10XXX * 06 JOV PTF10 BREDERE BARCODE - SAMME FOR AFP/PDF
********************************************************************
     A* Stringkode linje 1/2
     A          R CMRH1
     A            KFMT1         75      1  1
     A          R CMRH2
     A            KFMT2         75      2  1
      * SELVE CMR-BREVET
     A          R CMR
      * 52N53 SKAL ERSTATTES AV STRINGKODE MED SENDNR INNFLETTET.
      *            (SE SYFA12)
     A* 52N53     SNDNR0420     17      1 51
e12  A N49                              2  3'Trip No:'
e12  A N49        HEPRO          8  0   2 11
e12  A N50                              2 20'Truck No:'
e12  A N50        TUBILN        10      2 29
e12  A N51                              2 40'Ref No:'
e12  A N51        HEAVD          4  0   2 47
e12  A N51                              2 51'/'
e12  A N51        HEOPD          7  0   2 52
e12  A N51                              2 59'/'
e12  A N51        HESG           3      2 60
      * BARCODE VED FAX/PDF-ARKIV / PDF-PRINT
S02  A* 52 53     SNDNR         20      3 83BARCODE(CODE128 3 *HRI *VRT +
S02  A*                                     (*WIDTH 0.020) (*RATIO 3) X'02')
      * BARCODE VED AFP-PRINT
S02  A* 52 56     SNDNRB        20      3 76BARCODE(CODE128 3 *HRI *VRT +
S02  A*                                     (*WIDTH 0.020) (*RATIO 3) X'02')
     A            ANAVN         30      4 11
     A            AADR1         30      5 11
     A            AADR2         30      6 11
     A            TUNAT         30      6 47
     A N46        HELKS          2      7 11
     A N46                              7 13'-'
     A N46        AADR3         30      7 15
     A  46        AADR3X        30      7 11
     A            TUAD1T        30      7 47
     A                                  8 11'Custno:'
     A            HEKNS          8  0   8 19
     A            TUAD2T        30      8 47
     A            TUAD3T        30      9 47
     A            DCNAM         30     10 11
      * BARCODE VED FAX/PDF-ARKIV / PDF-PRINT - SAMT AFP
N06  A  52        SNDNR         20     10 50BARCODE(CODE128 2 *HRI *HRZ +
N06  A                                      (*WIDTH 0.018) (*RATIO 3) X'02')
S06  A* 52 53     SNDNR         20     10 47BARCODE(CODE128 1 *HRI *HRZ +
S06  A*                                     (*WIDTH 0.014) (*RATIO 3) X'02')
S06   * BARCODE VED AFP-PRINT
S06  A* 52 56     SNDNRB        20     10 47BARCODE(CODE128 1 *NOHRI *HRZ +
S06  A*                                     (*WIDTH 0.014) (*RATIO 3) X'02')
S06  A* 52N56
S06  A*AN53                             10 47'SNDNR: '
S06  A* 52N56
S06  A*AN53        SNDNRN        20     10 54
     A            DCADM1        30     11 11
     A            DCADM2        30     12 11
     A N47        HELKK          2     13 11
     A N47                             13 13'-'
     A N47        DCADM3        30     13 15
     A  47        DCADM3X       30     13 11
     A N48                             14 11'Custno:'
     A N48        HEKNK          8  0  14 19
     A            DCR13A        30     14 47
     A            DCR13B        30     15 47
     A            DCR13C        30     16 47
E02  A            DCNAL         30     17 11
S02  A*           DCNAL         30     17 11
S02  A            DCR13D        30     17 47
N02  A            DCADL1        30     18 11
S02  A*           DCADL1        30     18 11
     A  99 98                          18 47'LINJEDEKLARERT:       '
     A  99N98                          18 47'LINJEDEKLARERT  ID.NR:'
     A  99N98     FIRG          11     18 69
N02  A            DCADL2        30     19 11
S02  A*           DCADL2        30     19 11
     A  99                             19 47'Eks.enh:'
     A  99        HETLE          6     19 55
     A  99                             19 62'Løpenr:'
     A  99        HETLL         10     19 69
S02  A*           DCADL3        30     20 11
N02  A            DCADL3        30     20 11
     A            FRA1B         18     22 11
     A            XCDT           6  0  22 34EDTCDE(Y)
     A            DCVL1         30     22 47
     A            DCVL2         30     23 47
     A            DCVL3         30     24 47
     A            TIL1          18     25 13
     A            HEGM1         15     30 11
     A            HENT           7  0  30 27EDTCDE(Z)
     A            HEVS1         25     30 35
     A            HEVKT          9  0  30 61EDTCDE(Z)
     A N44        HEM3           7  3  30 72EDTCDE(3)
S03  A*N44                             30 78'cbm'
     A            HEGM2         15     31 11
     A            HEVS2         25     31 35
E05  A N45        HELM           4  2  31 72EDTCDE(3)
E05  A N45                             31 77'LM'
S15  A*           XDCAI1        35     39 11
S15  A*           XDCAI2        35     40 11
S15  A*           XDCAI3        35     41 11
S15  A*           XDCAI4        35     42 11
N51  A            XDCAI150      55     39 11FONT(223)
N15  A            XDCAI250      55     40 11FONT(223)
N15  A            XDCAI350      55     41 11FONT(223)
N15  A            XDCAI450      55     42 11FONT(223)
S15  A*N54                             43 11'U.FB.: '
S15  A*           DCAI5         23     43 18
N15  A            XDCAI550      55     43 11FONT(223)
S15  A*           DCAI51        28     44 13
N15  A            XDCAI650      55     44 11FONT(223)
S01  A*                                43 11'SNDNR: '
S01  A*           SNDNRN        20     43 18
S01  A* 52                             45 11'SNDNR: '
S01  A* 52        SNDNRN        20     45 18
     A            DCFR           3     46 11
     A            DCFRFT        26     46 15
E05   * TO LINJER NED FRA HER
E05  A            DCFT          50     52 11
E05  A N90        DCVAL          3     52 68
E05  A N90        DCBEL          6  0  52 74EDTCDE(Z)
E05  A  90        TRETTB        13  2  52 66EDTCDE(3)
E05  A  90        TRETTV         3     52 65
E05  A            DCR12A        30     54 11
E05  A            DCR12B        30     55 11
E05  A            DCR12C        30     56 11
E05   * TO LINJER NED SLUTT
E02  A            FRA1          18     62 11
E02  A            FRA1X         18     62 35
E02  A            XCDTB          6  0  63 24EDTCDE(Y)
E02  A            XCDTC          6  0  63 48EDTCDE(Y)
      *
      * Stringkode bunn
     A          R CNRH3                     SKIPB(62)
     A            KFMT3         75         1
     A          R OVL
     A                                      ENDPAGE
     A                                      OVERLAY(&FB01 0 0)
     A            FB01           8A  P
      *
