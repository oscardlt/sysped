      *__________________________
      * Utskrift av samlefaktura.
      *""""""""""""""""""""""""""
*****F**************************************************************
      * RETTINGER I DETTE PROGRAM:
PTFnrF*Sek Sig Vers Beskrivelse...........................
"""""F*"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
P00XXF* 01 JOV VER5 ENDR. AV MOMS-BEREG. PÅ  SPESIF. TOTALLISTE PR GEB
P00XXF* 02 SH  PTF5 120399 ENDRING TIL 01
P0504F* 03 JOV PTF5 LOGGE I TRACK/TRACE
P000XF* 04 SH  PTF5 SKRIVER IKKE SLETTEDE FAKTURALINJER
P000XF* 05 SH  PTF5 FEIL I UTSKRIFT AVSENDER MOTTAGER ETC
P000XF* 06 JOV PTF5 MANUELT NULLET UTL SKRIVES IKKE
P000XF* 07 YBC PTF5 FEIL TEST PÅ *IN90
P000XF* 08 YBC PTF5 FEIL OPPDRAGSDATO PÅ SPESIFIKASJON
P00XXF* 09 SH  PTF5 (8LPI SETTER PÅ INDIKATOR 60)
P00XXF* 09 SH  PTF5 (LASER SETTER PÅ INDIKATOR 61)
P00XXF* 10 SH  PTF5 KALLER OGSÅ BETSR VED KOPI FOR BETTXT
P00XXF* 11 SH  PTF5 FASK = I MÅ IKKE VÆRE MED
P00XXF* 12 SH  PTF5 STYGG FEIL VED PRØVEUTSKRIFT , LASERUTSKRIFT
P00XXF* 13 SH  PTF5 PLASS TIL FLERE LINJER VED LASER
P00XXF* 14 JOV PTF5 KODE BLANK (IKKE OCR) SKRIVER NÅ PÅ "FELLESBLANKET"
P0510F* 15 YBC PTF5 OPPDATER STATUS PÅ LAGER-FAKTURA DETALJER
P0510F* 16 SH  PTF5 OCR FØR/ETTER
P0XXXF* 17 SH  PTF5 RETTET GAL VALUTATEST
P0XXXF* 18 SH  PTF5 TEKST KOPI KUN VED KOPI
P0XXXF* 19 JOV PTF5 TEST manglende prosj-nr  Ny filter-mulighet mm.
P0XXXF* 20 JOV PTF5 KAN BLI KALLT FRA SYFA20 VED KOPI MED FANR SOM PARM
P0XXXF* 21 SH  PTF5 IKKE SKRIVE KOSTNADSLINJER
P0XXXF* 22 SH  PTF5 KID MED LENGDE 8
P0XXXF* 23 JOV PTF6 FEIL DATOTEST MOMS VED KOPI
P0XXXF* 24 SH  PTF6 VALUTA SELV VED NOK
P0XXXF* 25 CB  PTF6 IKKE SLÅ SAMMEN LIK VAREKODE VED "SAMM" ULIK " "
P0602F* 26 JOV PTF6 V/FLY KAN FBVKT TASTES(UTEN M3/LM) VIS DA HEFBV..
P0603F* 27 CB  PTF6 SKRIV TIL TRANSAKSJONSFILE FOR EDIFACT(INVOIC)
P0605F* 28 SH  PTF6 LASERFORBEDRINGER FAKTURA
      * 28 SH  PTF6 KODE 'A' = AVANSERT LASER IND 63
P06XXF* 29 YBC PTF6 NYE SUMLINJER FOR LAGERFAKTURA
P0607F* 30 YBC PTF6 SØKEVEI FRA 15 TEGN TIL 35 TEGN
P0XXXF* 31 JOV PTF7 HINDRE FAKTURERING AV "E"-LINJER
P0XXXF* 32 SH  PTF7 UNGÅR POSISJON 1 I SAMLEFAKTURA GRUNNET LASER
P0XXXF* 33 JOV PTF7 MISS I PTF 31
P0XXXF* 34 SH  PTF7 OVERLOW PROBLEM VED LASER RETTET I PRINTFIL
P0XXXF* 35 SH  PTF7 OVERLOW RETTELSE - ENDRET JOV , MAX 16 V/LASER
P0XXXF* 36 SH  PTF7 PROBLEM NÅR IKKE GEBYRKODE FINNES PÅ MASKIN
P0XXXF* 37 SH  PTF7 PROBLEMER 8 LANG KID I VISSE TILFELLER
P0705F* 38 JOV PTF7 UTVIDET TRACKF.
P0XXXF* 39 JOV PTF7 BETMAT B GIR DELT GIRO
P0XXXF* 40 SH  PTF7 OPPDATERER OGSÅ NOK TIL FACURI
P0XXXF* 41 SH  PTF7 OPPDATERER OGSÅ NOK TIL FACURI RETTELSE KEY TIL FAK
P0XXXF* 42 SH  PTF7 OCR-RETTELSE
P07XXF* 43 YBC PTF7 TEST OM ANTALL KOPI ER LIK 0.
P07XXF* 44 SH  PTF7 UHOD = F FAX MAIL ETC
P0708F* 45 SH  PTF7 ARKIVERING AV FAKTURA
P0708F* 46 TR  PTF7 FLEXIBEL MOMS
P0XXXF* 47 SH  PTF7 arkivering tillegg ikke printerstyring ved fax
P0XXXF* 48 SH  PTF7 RETTELSE TIL 46
P0XXXF* 49 SH  PTF7 feil ved 41 FAVAL etc
P0XXXF* 50 SH  PTF7 VED FAX/ARKIV ETC SETON 68
P0XXXF* 51 jov PTF7 Retting til PTF 04
P0XXXF* 52 SH  PTF7 TILLEGG ARKIV
P0XXXF* 53 SH  PTF7 endringer for hodetekst ved fax
P0XXXF* 54 SH  PTF7 nytt valgkriterie er mailmottagere
P0XXXF* 55 SH  PTF8 SELEKSJON MAILKUNDER SOM TEXT
P0XXXF* 56 SH  PTF8 obs feil i 55
P8011 * 57 sh  PTF8 nå logikk innført fo faktura 72 linjer me kid i bunn
     F* 58 SH  PTF8 FAKTURADATO NULLSTILLT I VISSE TILFELLOE
P8XXX * 59 YBC PTF8 XML TIL POSTEN
P8XXX * 60 YBC PTF8 Feil valuta ved kall på syfa27b og orginalutskrift hvor NOK->FACURI
P8XXX * 61 SH  PTF8 MOMS MISTER MILLIONTALL
P8XXX * 62 SH  PTF8 tar vare på 1. avdeling ved samlefakltura
P8XXX * 63 TR  PTF8 PGA NON NUMERIC DATA
P8XXX * 64 SH  PTF8 kundes regno
P8XXX * 65 SH  PTF8 PDF direkte ind 64
P8XXX * F7 SH  PTF8 fakturanummer 7 lang
P8XXX * 66 SH  PTF8 FRITEKST PÅ KUNDE AVDELING FIRMA + BRUDDTEST
      *             INDIKATOR 65 VED KIDLINJE-FAKTURA
P8XXX * 67 YBC PTF8 TYPE AV XML-FAKTURA
P8XXX * 68 SH  PTF8 PROBLEM VED KRASJ KOSTNADSBILAG / FAKTURA
*****F**************************************************************
      *____________________________________________________
      *  INDIKATORER 01 - 26 KUN CMD-TASTER / ROLL TASTER
      *  INNDIKATOR 27 PÅ/28 AV = KOPI AV SAMLEFAKTURA
      *  INNDIKATOR 27 PÅ/28 PÅ = PRØVEKJØRING AV SAMLEFAKTURA
      *  INNDIKATOR 27 PÅ/28 PÅ/URETUR=S PRØVEKJ. KUN SPESIFIK.DELEN
      *  INNDIKATOR 90 PÅ = OVERFLOW AV SYFA27PS (SAMLELIST)
      *  35 = GIRO SKRIVES IKKE
      *"""""""""""""""""""""""""""""""""""""""""""""""""""""
N57  FBAGIRO    IF   E           K DISK
N55  FCUNDC03   IF   E           K DISK
N47  FARKTXT    IF   E           K DISK
N45  FFIRMARC   IF   E           K DISK
N45  FARKIVP    O  A E             DISK
N22  FFIRKID    UF   E           K DISK
N22  FKIDTRAN   UF A E           K DISK
N66  FKODTFT    IF   E           K DISK
     FKODTFM    IF   E           K DISK
     FKODTP     IF   E           K DISK
     FFAKT      UF   E           K DISK
     FFAK8      IF   E           K DISK
     F                                     RENAME(FAKTR:FAK8R)
     FSORT      UF A E           K DISK
     FFAIN      UF A E           K DISK
     FHEADF     UF   E           K DISK
     FTURER     IF   E           K DISK
     FDISP      IF   E           K DISK
     FKODTGE    IF   E           K DISK
     FKODTLK    IF   E           K DISK
     FKODTG2    IF   E           K DISK
     FKODSAM    IF   E           K DISK
     FKODTOTY   IF   E           K DISK
     FKODTFR    IF   E           K DISK
     FKODTA     IF   E           K DISK
N19  FKODTV     IF   E           K DISK
     FKODTÅ     IF   E           K DISK
     FKODTH     IF   E           K DISK
     FKODTW     IF   E           K DISK
     FHODE      IF   E           K DISK
N44  FHODEFAX   IF   E           K DISK
     F                                     RENAME(HODER:HODERF)
sf7  F*IRM      UF   E           K DISK
nf7  FfIRM      iF   E           K DISK
nf7  Ftellfa    uF   E           K DISK
     FFREETXT2  UF   E           K DISK
     FCUNDL01   IF   E           K DISK
     FSAML      UF   E           K DISK
     FWSAML     UF A E           K DISK
     FWSAMGE    UF A E           K DISK
     FWSAMGE1   IF   E           K DISK
     F                                     RENAME(WSAMGER:WSAMG1R)
     FCUSAPR    IF   E           K DISK
     FFRISOK    IF   E           K DISK
     FKODFRI    IF   E           K DISK
     FCUFLD     IF   E           K DISK
N29  FLLGSFL06  IF   E           K DISK
N03  FTRACKF    O  A E           K DISK
N27  FSYFA27W   O  A E             DISK
N27  FECMSG     IF   E           K DISK
N46  FKODWL01   IF   E           K DISK
N59  FXMLUFF    O  A E             DISK
S20  F*YFA27FMCF  E                    WORKSTN
N20  FSYFA27FM  CF   E             WORKSTN USROPN
     F                                     INFDS(FBAREA)
S20  F*YFA27PFO   E                    PRINTER
S20  F*YFA27PGO   E                    PRINTER
S20  FSYFA27PF  O    E             PRINTER USROPN
S20  FSYFA27PG  O    E             PRINTER USROPN
     FSYFA27PS  O    E             PRINTER OFLIND(*IN90)
     F                                     USROPN
     D HO              S             80    DIM(10)
     D HE              S             80    DIM(10)
     D HT              S             80    DIM(10)
      *___________________________
      * Finner username
      *"""""""""""""""""""""""""""
     D                SDS
     D  ZJOB                 244    253
     D  ZUSER                254    263
     D  ZJOBNR               264    269  0
     D                 DS
     D  DFS                    1     10
     D                                     DIM(10)
     D  FSDOKK                 1     10
     D                 DS
     D  HEPOS1                 1      7
     D  XPOS1                  1      4
     D FBAREA          DS
     D  WSCLOC               370    371B 0
     D  WSSUBN               378    379B 0
     D UCMD            DS          1024
     D                 DS
     D XCMD11          C                   CONST('OVRPRTF -
     D                                     FILE(SYFA27PS) -
     D                                     COPIES(')
     D                 DS
     D  WSFDAD                 1      2  0
     D  WSFDAM                 3      4  0
     D  WSFDAA                 5      6  0
     D  WSFDAT                 1      6  0
     D                 DS
     D  WKID                   1     19
     D  XWKID                  1     19
     D  KWKID                  1     19
     D  KUNDNR                 1      8  0
     D  TEFFNR                 9     15  0
     D  XNULL                 16     19  0
     D                 DS
     D  XBAK                   1      1  0
     D  ABAK                   1      1
     D  KBAK                   1      1
     D  XTOTØR                13     14  0
     D  ATOTØR                13     14
     D  ATOTØK                13     14
     D  KTOTØR                13     14  0
N28  D                 DS
N28  D  XBRUT                  1     13  2
N28  D  CBRUTT                 1     13  2
     D                 DS
     D  A                      1     11
     D                                     DIM(11)
     D  ATOTKR                 1     11
     D  ATOTKK                 1     11
     D                 DS
     D  D                      1     10
     D                                     DIM(10)
     D  WSDS                   1     10
     D                 DS
     D  DGR                    1     10
     D                                     DIM(10)
     D  WSGRDS                 1     10
     D                 DS
     D  ADR3                   1     24
     D  ADR31                  1     24
     D  ADR3B                  1     24
     D  ADR3C                  1     24
     D                 DS
     D  XVAL                   1      3
     D  XVAL1                  1      3
     D                 DS
     D  SAAVD                  1      4  0
     D  SAOPD                  5      9  0
     D  AVOPDS                 1      9
     D                 DS
SV5  D*                                       1   60FADATO
SV5  D*                                       1   20XDTKÅ
SV5  D*                                       5   60XDTKD
NV5  D  FADATO                 1      8  0
NV5  D  FADATÅ                 1      4  0
NV5  D  FADATM                 5      6  0
NV5  D  FADATD                 7      8  0
NV5  D                 DS
NV5  D  FADAFF                 1      8  0
NV5  D  FADAFÅ                 1      4  0
NV5  D  FADAFM                 5      6  0
NV5  D  FADAFD                 7      8  0
NV5  D                 DS
NV5  D  IDAGÅ                  1      4  0
NV5  D  IDAGM                  5      6  0
NV5  D  IDAGD                  7      8  0
NV5  D  IDAG8                  1      8  0
NV5  D  IDAG                   3      8  0
NV5  D                 DS
NV5  D  IDAGXD                 1      2  0
NV5  D  IDAGXM                 3      4  0
NV5  D  IDAGXÅ                 5      6  0
NV5  D  IDAGX                  1      6  0
NV5  D                 DS
NV5  D  XFFDTD                 1      2  0
NV5  D  XFFDTM                 3      4  0
NV5  D  XFFDTÅ                 5      6  0
NV5  D  XFFDT                  1      6  0
SV5  D*           DS
SV5  D*                                       1   60HEDTS
SV5  D*                                       1   20XDTSÅ
SV5  D*                                       5   60XDTSD
SV5  D*           DS
SV5  D*                                       1   20HEDTD
SV5  D*                                       3   40HEDTM
SV5  D*                                       5   60HEDTÅ
SV5  D*                                       1   60XDT
NV5  D                 DS
NV5  D  HEDTÅ                  1      4  0
NV5  D  HEDTM                  5      6  0
NV5  D  HEDTD                  7      8  0
NV5  D  HEDTOP                 1      8  0
NV5  D                 DS
NV5  D  XEDTOD                 1      2  0
NV5  D  XEDTOM                 3      4  0
NV5  D  XEDTOÅ                 5      6  0
NV5  D  XEDTOP                 1      6  0
SV5  D*           DS
SV5  D*                                       1   20W2DTÅ
SV5  D*                                       3   40W2DTM
SV5  D*                                       5   60W2DTD
SV5  D*                                       1   60W2DATE
     D                 DS
     D  WSPER                  1      4  0
EV5  D  YDTPM                  1      2  0
EV5  D  YDTPÅ                  3      4  0
     D                 DS
     D  SOLNR                  1      3  0
     D  KG2SRT                 1      3  0
     D                 DS
     D  SOAVD                  4      7  0
     D  FAAVD                  4      7  0
     D  SOOPD                  8     12  0
     D  FAOPD                  8     12  0
     D  SOSK                  13     13
     D  FASK                  13     13
     D  SOVK                  14     16
     D  FAVK                  14     16
     D  SOVT                  17     36
     D  FAVT                  17     36
     D  XFAVT1                17     17
     D  XFAVT2                18     36
     D  SOVAL                 37     39
     D  FAVAL                 37     39
     D  SOBELV                40     52  2
     D  FABELV                40     52  2
     D  SOKDM                 53     53
     D  FAKDM                 53     53
     D  SOBELN                54     66  2
     D  FABELN                54     66  2
     D  SOSAMM                67     67
     D  FACD11                67     67
     D                 DS
     D  HOHT1                  1     80
     D  HOHT2                 81    160
     D  HOHT3                161    240
     D  HOHT4                241    320
     D  HOHT5                321    400
     D  HOHT6                401    480
     D  HOHT7                481    560
     D  HOBT1                561    640
     D  HOBT2                641    720
     D  HOBT3                721    800
     D  HP                     1    800
     D                                     DIM(10)
     D                 DS
     D  XTOTKR                 1     11  0
     D  KTOTKR                 1     11  0
     D                 DS
     D  XFBANK                 1     15
     D  KFBANK                 1     15
N67  D  XFB1                   1     15    DIM(15)
N67  D                 DS
N67  D  XFBANK2                1     15
N67  D  XFB2                   1     15    DIM(15)
     D                 DS
     D  BANKG                  1     15
     D  BANKGK                 1     15
N03   *
N03  D                 DS
N03  D  XULTID                 1     14  0
N03  D  XULTM                  1      6  0
N03  D  XULDD                  7      8  0
N03  D  XULMM                  9     10  0
N03  D  XULÅÅ                 11     14  0
N03  D                 DS
N03  D  ULÅÅ                   1      4  0
N03  D  ULMM                   5      6  0
N03  D  ULDD                   7      8  0
N03  D  ULDT                   1      8  0
N03  D                 DS
N03  D  TTTEXT                 1     70
N03  D  TTINT1                 1      9
N03  D  TTINVN                11     40
N03  D  TTINT2                44     50
N03  D  TTINVR                52     57
N46  D  WSMVAK         S              1    DIM(11)
N46  D  WSMVAP         S              4  2 DIM(11)
N46  D  WSMVAG         S             13  2 DIM(11)
N46  D  WSMVAN         S              8  0 DIM(11)
N46  D  WSMVAV         S              8  0 DIM(11)
     D                UDS
     D  UFIRM                  1      2
     D  UAVD                  15     18  0
     D  USG                   19     21
     D  UPRO                  22     29  0
     D  UDT                   30     35  0
     D  UHOD                  47     47
     D  UBBS                  48     48
     D  UGN                  981    995
N64  D                 DS
N64  D  SYRG                   1     14
N64  D  SYFOR1                 1      9
N64  D  SYFOR2                10     11
     D EPOTXI          C                   CONST('SELEKTERING EPOST-MO-
     D                                     TTAGERE')
     IKODSAMR
     I              SANORS                      KGENOT
     I              SAENGE                      KGEENT
     I              SATYSK                      KG2TYT
      *
     C                   EXSR      INIT
N20  C     UFNKOP        IFEQ      *ZEROS
N20  C                   OPEN      SYFA27FM
N20  C                   END
      *
     C     *IN27         IFEQ      *OFF
      * ORIGINAL
     C                   EXSR      PRINT1
     C                   ELSE
      * KOPI
     C                   EXSR      PRINTK
     C                   END
      *
     C                   MOVE      XPRANT        UPRANT
      *
N20  C     UFNKOP        IFEQ      *ZEROS
N20  C                   CLOSE     SYFA27FM
N20  C                   END
     C                   SETON                                        LR
     C                   RETURN
      *
      ******************************************
     C     PRINT1        BEGSR
      ******************************************
      *
     C     STB1          TAG
     C                   EXSR      XDTFMT
     C                   EXFMT     BILDE01
     C                   EXSR      XDTFMT
      *
     C     *IN03         IFEQ      '1'
      * Tøm WSAML for poster denne job/WS
     C                   EXSR      DELW
     C                   GOTO      ENDPR1
     C                   END
      *
     C     *IN04         IFEQ      '1'
     C                   EXSR      SØKDTA
     C                   GOTO      STB1
     C                   END
      *
     C                   EXSR      TESTB1
     C     *IN30         IFEQ      '1'
     C                   GOTO      STB1
     C                   END
      * Plukk (basert på valg i BILDE01) poster til Work-fil
      * Workfil vises/kan fjerne poster (F12 - tilbake til Bild01)
     C                   EXSR      PLUKK
      *
      * F12=NYTT UTVALG
     C     URETUR        IFEQ      'Y'
     C                   GOTO      STB1
     C                   END
      * F3=AVBRUDD
     C     URETUR        IFEQ      '3'
     C                   GOTO      ENDPR1
     C                   END
      *
      *""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      * HAR NÅ SLÅTT F16= KJØR FAKTURA  ( )
      *        ELLER F10= KJØR PRØVEKJ. (P)
      *        ELLER F11= KJØR PRØVEKJ. KUN SPESIFIK.(S)
      *''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
      * Hvis prøvekjøring valgt SIMULERES kopi med fakt.nr=0 + *IN28 ON
     C     URETUR        IFEQ      'P'
     C     URETUR        OREQ      'S'
     C                   MOVE      *ZEROS        WSFN
     C                   MOVEA     '11'          *IN(27)                         *IN27 OG 28
     C                   END                                                     =PRØVEKJ.
      *
     C                   MOVE      *ZEROS        XXFAKT
     C                   EXSR      PRISAM
      *
     C     ENDPR1        ENDSR
      *
      ******************************************
     C     PRISAM        BEGSR
      ******************************************
     C     PRISTR        TAG
      *PRØVEUTSKRIFT
N12  C   27              Z-ADD     1             ANTKOP
      *
      * RESTILLER TIL FØRSTE HEADINGTEKST
     C     KOPFM         SETLL     KODTFM
     C     KOPFM         READE     KODTFM                                 42
     C                   Z-ADD     1             KOPINR            5 0
     C                   EXSR      LESWFI
      *
      * SKRIVER EKSTRAKOPIER AV SAMLEFAKTURA
      *
E12  C  N27KOPINR        IFLT      ANTKOP
     C                   SETOFF                                       42
     C     *IN42         DOWEQ     '0'
     C     KOPFM         READE     KODTFM                                 42
     C                   ADD       1             KOPINR
     C  N42              DO
     C                   MOVE      XFN           WSFN
     C                   Z-ADD     WSFN          XXFAKT
     C                   Z-ADD     WSFN          TEFFNR
     C                   SETON                                        27
     C                   EXSR      LESWFI
     C                   SETOFF                                       27
     C                   END
     C                   END
     C                   END
      *  flere kunde/valutaer i workfila.
     C     XXUNIK        SETLL     WSAML
     C     XXUNIK        READE     WSAML                                  30
N12  C  N30              MOVE      *ZEROS        WSFN
N12  C  N30              MOVE      *ZEROS        XXFAKT
     C  N30              GOTO      PRISTR
     C                   ENDSR
      ******************************************
     C     TESTB1        BEGSR
      ******************************************
      *
     C                   SETOFF                                       30
     C                   MOVEA     '000000'      *IN(94)
      *
     C     WSAVD         IFNE      *ZEROS
     C     KODTAK        CHAIN     KODTA                              99
     C   99              SETON                                        30
     C   99              MOVE      'SPA0002'     MSGNR
     C                   END
      * Dersom avdeling er gitt test gyldighet
      * Dersom varsel alt er gitt - Ikke sjekk kundenr =0
     C   72WSKN          IFEQ      *ZEROS
     C                   SETOFF                                           72
     C                   GOTO      STINI2
     C                   END
     C  N72WSKN          IFEQ      *ZEROS
     C                   SETON                                            72
     C   98              MOVE      'SPK0002'     MSGNR
     C   98              SETON                                        30
     C                   END
      * Test Periode
     C     STINI2        TAG
NV5  C  N30YDTPÅ         IFGT      50
NV5  C                   MOVE      '19'          YDTPC
NV5  C                   ELSE
NV5  C                   MOVE      '20'          YDTPC
NV5  C                   END
     C     KODTÅK        CHAIN     KODTÅ                              96
     C   96              MOVE      'SPP0001'     MSGNR
     C   96              SETON                                        30
      *** TEST DATO
     C     WSFDAT        IFNE      *ZEROS
SV5  C*                    MOVE WSFDAT    XMMÅÅ   40
SV5  C*                    MOVE XMMÅÅ     UÅÅ     20
SV5  C*                    MOVELXMMÅÅ     UMM     20
SV5  C*                    MOVELWSFDAT    UDD     20
NV5  C                   MOVE      WSFDAA        UÅÅ               2 0
NV5  C                   MOVE      WSFDAM        UMM               2 0
NV5  C                   MOVE      WSFDAD        UDD               2 0
     C                   CALL      'TESTDATO'
     C                   PARM                    UDD
     C                   PARM                    UMM
     C                   PARM                    UÅÅ
     C                   PARM                    UFLAGG            1 0
     C     UFLAGG        COMP      1                                      94
     C   94              MOVE      'SPD0001'     MSGNR
     C   94              SETON                                        30
     C     *IN30         IFEQ      '0'
     C                   MOVE      WSFDAT        IDAGX
SV5  C*                    MOVE WSFDAT    IDAG
SV5  C*                    MOVELWSFDAA    IDAG
SV5  C*                    MOVE WSFDAD    IDAG
NV5  C     WSFDAT        IFEQ      0
NV5  C                   MOVE      *ZEROS        IDAG8
NV5  C                   ELSE
NV5  C                   MOVE      IDAGXD        IDAGD
NV5  C                   MOVE      IDAGXM        IDAGM
NV5  C     IDAGXÅ        IFGT      50
NV5  C     IDAGXÅ        ADD       1900          IDAGÅ
NV5  C                   ELSE
NV5  C     IDAGXÅ        ADD       2000          IDAGÅ
NV5  C                   END
NV5  C                   END
     C                   END
     C                   END
      *
      *
     C                   ENDSR
      *
      ******************************************
     C     PLUKK         BEGSR
      ******************************************
     C     *LOVAL        SETLL     SAML
      *
      *
     C                   SORTA     D
     C                   SORTA     DGR
      *
S19  C*                    READ SAML                     30
N19  C                   READ(N)   SAML                                   30
     C     *IN30         DOWEQ     '0'
      * TESTER AVDELING
     C     WSAVD         IFNE      *ZEROS
     C     WSAVD         ANDNE     SAAVD
     C                   GOTO      NESTE
     C                   END
      * TESTER KUNDENUMMER
     C     WSKN          IFNE      *ZEROS
     C     WSKN          ANDNE     SAKN
     C                   GOTO      NESTE
     C                   END
      *
      * er epostmottager valgt
      *
N59  C                   MOVE      '1'           *IN33
N56  c     arksnd        ifeq      'J'
N55  c     epokey        CHAIN     cundc03                            33
N55   * 33 på er prinkunde
N55  c     UEMAIL        IFEQ      'J'
S59  c*  33              goto      neste
N59  c   33              goto      NESTE1
N55  c                   end
N55   * N33 på er MAILKUNDE
N55  c     UEMAIL        IFEQ      'N'
N55  c  N33              goto      neste
N55  c                   end
N56  c                   end
N59   * XML
N59  C     NESTE1        TAG
N59  C     *IN33         IFEQ      '1'
N59  C     ARKSND        ORNE      'J'
N59  C     CUNDC03K      CHAIN     CUNDC03                            33
N59   * 33 på er printkunde
N59  C   33UEMAIL        IFEQ      'J'
N59  C                   goto      NESTE
N59  C                   end
N59   * N33 på er XML-KUNDE
N59  C  N33UEMAIL        IFEQ      'N'
N59  C                   goto      NESTE
N59  C                   end
N59  C                   END
      * TESTER PROSJEKT(INIT HAR VIA SYFA27D REFRESHET SAML MHT. SAPRO)
     C     WSPRO         IFNE      *ZEROS
     C     WSPRO         ANDNE     SAPRO
     C                   GOTO      NESTE
     C                   END
N19   * TESTER AT PROSJ.NR ER GITT DERSOM AVD. KREVER DET
N19  C     WSKUNT        IFEQ      'J'
N19  C     SAPRO         ANDEQ     *ZEROS
N19  C     KOVKEY        CHAIN     KODTV                              33
N19  C     *IN33         IFEQ      '0'
N19  C     KOVPRO        ANDEQ     'J'
N19  C                   GOTO      NESTE
N19  C                   END
N19  C                   END
      * TESTER OPPDRAG (
     C                   Z-ADD     SAAVD         HEAVD
     C                   Z-ADD     SAOPD         HEOPD
     C     HEADFK        CHAIN(N)  HEADF                              33
     C     *IN33         IFEQ      '1'
     C     HEST          OREQ      'S'
     C                   GOTO      NESTE
     C                   END
      * TESTER DATO
     C     WSDATE        IFNE      *ZEROS
SV5  C*                    MOVE HEDTÅ     W2DTÅ
SV5  C*                    MOVE HEDTM     W2DTM
SV5  C*                    MOVE HEDTD     W2DTD
SV5  C*          W2DATE    IFGT WSDATE
SV5  C*                    GOTO NESTE
SV5  C*                    END
NV5  C     WSDATE        IFGT      501231
NV5  C     WSDATE        ADD       19000000      WSDAT8            8 0
NV5  C                   ELSE
NV5  C     WSDATE        ADD       20000000      WSDAT8
NV5  C                   END
NV5  C     HEDTOP        CABGT     WSDAT8        NESTE
     C                   END
      * TESTER URSPRUNGSKODE
     C     D(10)         IFNE      ' '
     C     HEUR          LOOKUP    D                                      33
     C  N33              GOTO      NESTE
     C                   END
      *
      * TESTER SAMLEFAKTURAGRUPPE
     C     DGR(10)       IFNE      ' '
     C     SAGRP         LOOKUP    DGR                                    33
     C  N33              GOTO      NESTE
     C                   END
      *
      *  Legg ut post i workfile evt. m.kundens spesielle sort.ønske
     C                   MOVE      XXUNIK        WAUNIK
     C                   MOVE      SAKN          WAKN
     C                   MOVE      SAVAL         WAVAL
     C                   MOVE      *BLANKS       WASORT
     C     WAKN          CHAIN     CUSAPR                             33
     C   33              MOVE      ' '           CPSORT
     C                   SELECT
     C     CPSORT        WHENEQ    ' '
     C                   MOVEL     AVOPDS        WASORT
     C     CPSORT        WHENEQ    'A'
     C                   MOVEL     HERFA         WASORT
     C     CPSORT        WHENEQ    'B'
SV5  C*                    MOVELHEDTÅ     XXÅM    40
SV5  C*                    MOVE HEDTM     XXÅM
SV5  C*                    MOVELXXÅM      XXÅMD   60
SV5  C*                    MOVE HEDTD     XXÅMD
SV5  C*                    MOVELXXÅMD     WASORT
NV5  C                   MOVEL     HEDTOP        WASORT
     C     CPSORT        WHENEQ    'C'
     C                   MOVEL     HEPRO         WASORT
     C     CPSORT        WHENEQ    'D'
     C                   MOVEL     HESDF         WASORT
     C     CPSORT        WHENEQ    'E'
     C                   MOVEL     HESDT         WASORT
     C     CPSORT        WHENEQ    'F'
     C                   MOVEL     HEGM1         WASORT
     C     CPSORT        WHENEQ    'G'
     C                   MOVEL     HEVS1         WASORT
     C     CPSORT        WHENEQ    'H'
     C     WAKN          IFEQ      HEKNKF
     C                   MOVEL     HENAS         XXPART
     C                   ELSE
      * Faktura mot selger - oppgi mottaker på s-faktspesifikasj.
     C     WAKN          IFEQ      HEKNSF
     C                   MOVEL     HENAK         XXPART
     C                   ELSE
      * Faktura mot 3.part - oppgi Avsender OG mottaker
     C                   MOVEL     HENAS         XXPARA
     C                   MOVEL     HENAK         XXPARB
     C                   MOVEL     XXPARA        XXPART
     C                   MOVE      XXPARB        XXPART
     C                   END
     C                   END
     C                   MOVEL     XXPART        WASORT
     C     CPSORT        WHENEQ    'I'
     C                   MOVEL     HEGN          WASORT
     C     CPSORT        WHENEQ    'J'
     C                   MOVEL     HEHAWB        WASORT
     C     CPSORT        WHENEQ    'K'
     C                   MOVEL     HEOT          WASORT
     C     CPSORT        WHENEQ    'L'
     C                   MOVEL     HEFR          WASORT
     C     CPSORT        WHENEQ    '1'
     C                   MOVE      CPFS01        YFSKOD
     C     FRIKEY        CHAIN     FRISOK                             33
     C     *IN33         IFEQ      '0'
     C                   MOVEL     FSSOK         WASORT
     C                   END
     C     CPSORT        WHENEQ    '2'
     C                   MOVE      CPFS02        YFSKOD
     C     FRIKEY        CHAIN     FRISOK                             33
     C     *IN33         IFEQ      '0'
     C                   MOVEL     FSSOK         WASORT
     C                   END
     C     CPSORT        WHENEQ    '3'
     C                   MOVE      CPFS03        YFSKOD
     C     FRIKEY        CHAIN     FRISOK                             33
     C     *IN33         IFEQ      '0'
     C                   MOVEL     FSSOK         WASORT
     C                   END
     C     CPSORT        WHENEQ    '4'
     C                   MOVE      CPFS04        YFSKOD
     C     FRIKEY        CHAIN     FRISOK                             33
     C     *IN33         IFEQ      '0'
     C                   MOVEL     FSSOK         WASORT
     C                   END
     C     CPSORT        WHENEQ    '5'
     C                   MOVE      CPFS05        YFSKOD
     C     FRIKEY        CHAIN     FRISOK                             33
     C     *IN33         IFEQ      '0'
     C                   MOVEL     FSSOK         WASORT
     C                   END
     C     CPSORT        WHENEQ    'M'
     C                   MOVEL     HENAK         WASORT
     C     CPSORT        WHENEQ    'N'
     C                   MOVEL     HENAS         WASORT
     C                   ENDSL
     C                   MOVE      SAAVD         WAAVD
     C                   MOVE      SAOPD         WAOPD
     C                   MOVE      SAPRO         WAPRO
     C                   MOVE      SAGRP         WAGRP
     C                   MOVE      SADATO        WADATO
     C                   MOVE      SAUR          WAUR
      * Legg ut i workfile
     C                   WRITE     WSAMLR
      *
     C     NESTE         TAG
S19  C*                    READ SAML                     30
N19  C                   READ(N)   SAML                                   30
     C                   END                                                       DOWEQ'0'
      *
      *
      * Program for å vise/tilby sletting av valgte poster
     C                   CALL      'SYFA27A '
     C                   PARM                    URETUR            1
      *
      *TØMMER WORKFILE HVIS RETUR = Y/3  (F12 / F3)
     C     URETUR        IFEQ      'Y'
     C     URETUR        OREQ      '3'
     C                   EXSR      DELW
     C                   END
      *
     C                   ENDSR
      *
      ******************************************
     C     DELW          BEGSR
      ******************************************
      * Oppdrag til samlefakt
     C     XXUNIK        SETLL     WSAML
     C     XXUNIK        READE     WSAML                                  33
     C     *IN33         DOWEQ     '0'
     C                   DELETE    WSAMLR
     C     XXUNIK        READE     WSAML                                  33
     C                   END
     C                   ENDSR
      *
      ******************************************
     C     DELW2         BEGSR
      ******************************************
      * Sumliste pr gebyr
     C     XXUNIK        SETLL     WSAMGE
     C     XXUNIK        READE     WSAMGE                                 33
     C     *IN33         DOWEQ     '0'
     C                   DELETE    WSAMGER
     C     XXUNIK        READE     WSAMGE                                 33
     C                   END
      *
     C                   ENDSR
      *
      ******************************************
     C     PRINTK        BEGSR
      ******************************************
      *
     c                   move      'J'           ekteko            1
     c*3ukke kopitekst v fax og email
n53  c     uhod          ifne      'F'
N18  C                   MOVE      '  COPY  '    CPYTXT
n53  c                   end
N20  C     UFNKOP        IFNE      *ZEROS
N20  C                   MOVE      UFNKOP        WSFN
N20  C                   GOTO      STPRK2
N20  C                   END
     C     STPRK         TAG
     C                   EXFMT     BILDE02
     C   03              GOTO      SLPRK
N20  C     STPRK2        TAG
     C                   SETOFF                                       9930
     C     WSFN          SETLL     FAIN
     C     WSFN          READE     FAIN                                   99
     C     *IN99         IFEQ      '1'
     C                   MOVE      'SPF0003'     MSGNR
     C                   MOVE      '1'           *IN30
     C                   GOTO      STPRK
     C                   END
      * Finn kundenr via 1. reelle fakt linje
      * Hvis det/de første er nulloppdr, les vider. BARE nulloppd=FEIL
     C     *IN99         DOWEQ     '0'
     C                   MOVE      FIAVD         HEAVD
     C                   MOVE      FIOPD         HEOPD
     C     FAK8K2        CHAIN     FAK8                               33
     C     *IN33         IFEQ      '0'
N68  C     FAKDA         ANDNE     'K'
     C                   GOTO      STKOPI
     C                   END
     C     WSFN          READE     FAIN                                   99
     C  N99              END
     C     *IN99         IFEQ      '1'
     C                   MOVE      'JOV0540'     MSGNR
     C                   MOVE      '1'           *IN30
     C                   GOTO      STPRK
     C                   END
      *
     C     STKOPI        TAG
S68  C*    WSFN          SETLL     FAIN
S68  C*    WSFN          READE     FAIN                                   99
     C     *IN99         DOWEQ     '0'
     C                   MOVE      FIAVD         HEAVD
     C                   MOVE      FIOPD         HEOPD
     C     HEADFK        CHAIN(N)  HEADF                              33
     C     *IN33         IFEQ      '0'
      * Legg ut post i workfile
      * Blank i WASORT alle poster - gir samme rekkefølge som FAIN..
     C                   MOVE      XXUNIK        WAUNIK
     C                   MOVE      FAKUNR        WAKN
     C                   MOVE      FACURI        WAVAL
     C                   MOVE      *BLANKS       WASORT
     C     WAKN          CHAIN     CUSAPR                             33
     C   33              MOVE      ' '           CPSORT
     C                   SELECT
     C     CPSORT        WHENEQ    ' '
     C                   MOVEL     AVOPDS        WASORT
     C     CPSORT        WHENEQ    'A'
     C                   MOVEL     HERFA         WASORT
     C     CPSORT        WHENEQ    'B'
SV5  C*                    MOVELHEDTÅ     XXÅM    40
SV5  C*                    MOVE HEDTM     XXÅM
SV5  C*                    MOVELXXÅM      XXÅMD   60
SV5  C*                    MOVE HEDTD     XXÅMD
SV5  C*                    MOVELXXÅMD     WASORT
NV5  C                   MOVE      HEDTOP        WASORT
     C     CPSORT        WHENEQ    'C'
     C                   MOVEL     HEPRO         WASORT
     C     CPSORT        WHENEQ    'D'
     C                   MOVEL     HESDF         WASORT
     C     CPSORT        WHENEQ    'E'
     C                   MOVEL     HESDT         WASORT
     C     CPSORT        WHENEQ    'F'
     C                   MOVEL     HEGM1         WASORT
     C     CPSORT        WHENEQ    'G'
     C                   MOVEL     HEVS1         WASORT
     C     CPSORT        WHENEQ    'H'
     C     WAKN          IFEQ      HEKNKF
     C                   MOVEL     HENAS         XXPART
     C                   ELSE
      * Faktura mot selger - oppgi mottaker på s-faktspesifikasj.
     C     WAKN          IFEQ      HEKNSF
     C                   MOVEL     HENAK         XXPART
     C                   ELSE
      * Faktura mot 3.part - oppgi Avsender OG mottaker
     C                   MOVEL     HENAS         XXPARA
     C                   MOVEL     HENAK         XXPARB
     C                   MOVEL     XXPARA        XXPART
     C                   MOVE      XXPARB        XXPART
     C                   END
     C                   END
     C                   MOVEL     XXPART        WASORT
     C     CPSORT        WHENEQ    'I'
     C                   MOVEL     HEGN          WASORT
     C     CPSORT        WHENEQ    'J'
     C                   MOVEL     HEHAWB        WASORT
     C     CPSORT        WHENEQ    'K'
     C                   MOVEL     HEOT          WASORT
     C     CPSORT        WHENEQ    'L'
     C                   MOVEL     HEFR          WASORT
     C     CPSORT        WHENEQ    '1'
     C                   MOVE      CPFS01        YFSKOD
     C     FRIKEY        CHAIN     FRISOK                             33
     C     *IN33         IFEQ      '0'
     C                   MOVEL     FSSOK         WASORT
     C                   END
     C     CPSORT        WHENEQ    '2'
     C                   MOVE      CPFS02        YFSKOD
     C     FRIKEY        CHAIN     FRISOK                             33
     C     *IN33         IFEQ      '0'
     C                   MOVEL     FSSOK         WASORT
     C                   END
     C     CPSORT        WHENEQ    '3'
     C                   MOVE      CPFS03        YFSKOD
     C     FRIKEY        CHAIN     FRISOK                             33
     C     *IN33         IFEQ      '0'
     C                   MOVEL     FSSOK         WASORT
     C                   END
     C     CPSORT        WHENEQ    '4'
     C                   MOVE      CPFS04        YFSKOD
     C     FRIKEY        CHAIN     FRISOK                             33
     C     *IN33         IFEQ      '0'
     C                   MOVEL     FSSOK         WASORT
     C                   END
     C     CPSORT        WHENEQ    '5'
     C                   MOVE      CPFS05        YFSKOD
     C     FRIKEY        CHAIN     FRISOK                             33
     C     *IN33         IFEQ      '0'
     C                   MOVEL     FSSOK         WASORT
     C                   END
     C     CPSORT        WHENEQ    'M'
     C                   MOVEL     HENAK         WASORT
     C     CPSORT        WHENEQ    'N'
     C                   MOVEL     HENAS         WASORT
     C                   ENDSL
     C                   MOVE      HEAVD         WAAVD
     C                   MOVE      HEOPD         WAOPD
     C                   MOVE      *ZEROS        WAPRO
     C                   MOVE      *BLANKS       WAGRP
     C                   MOVE      *ZEROS        WADATO
     C                   MOVE      *BLANKS       WAUR
     C                   END
N51   * Hvis dette oppdrag er SLETTET fra fakt. - skipp...
N51   * (men er det et NULL oppdrag - ta det med )
N51  C     FAK8K2        CHAIN     FAK8                               33
N51  C   33              move      'O'           faopko
N04  C     FAOPKO        IFNE      'D'
     C                   WRITE     WSAMLR
N04  C                   END
     C     WSFN          READE     FAIN                                   99
     C  N99              END
      *
     C                   Z-ADD     WSFN          XXFAKT
     C                   Z-ADD     WSFN          TEFFNR
     C                   EXSR      PRISAM
      *
     C     SLPRK         ENDSR
      *
      *
      *
      ******************************************
     C     LESWFI        BEGSR
      ******************************************
      *
      *
      *
      * Les fortløpende posterfra workfila.
      * Brudd på Kunde/valutasort.
      *
     C     XXUNIK        SETLL     WSAML
     C     XXUNIK        READE     WSAML                                  30
      * 30 ER INGEN FUNNET
     C     *IN30         IFEQ      '0'
      * Funnet en post... Behandle/slette alle på akt. kunde/valuta
     C                   EXSR      KUNVAL
     C                   END
      *
     C                   ENDSR
      *
      *
      ***********************************************
     C     KUNVAL        BEGSR
      ***********************************************
      *
      * Denne SR skriver EN samlefaktura.
      * D.v.s. EN kunde / EN valuta.
      *
      * Først klargjør div "Heading-info"
     C                   EXSR      HEAINF
      *
      * Behandle alle oppdrag på aktuell kunde/valutkode..
     C     KUNVAK        SETLL     WSAML
     C     KUNVAK        READE     WSAML                                  33
     C     *IN33         DOWEQ     '0'
     C                   EXSR      ETTOPD
     C     KOPINR        IFGE      ANTKOP
     C                   DELETE    WSAMLR
     C                   END
     C     DELKEY        CHAIN     SAML                               33
     C     KOPINR        IFGE      ANTKOP
     C     URETUR        ANDNE     'P'
     C     URETUR        ANDNE     'S'
     C  N33              DELETE    SAMLR
     C                   END
     C     KUNVAK        READE     WSAML                                  33
     C                   END
      *
     C                   EXSR      TOTFAK
      * STENG PRINTERFILER MELLOM HVER FOR SORTERING
N20  C                   CLOSE     SYFA27PF
N20  C                   CLOSE     SYFA27PG
N20  C                   CLOSE     SYFA27PS
     C                   ENDSR
      ***********************************************
     C     HEAINF        BEGSR
      ***********************************************
      *
     C     KUND1K        CHAIN     CUNDL01                            33
     C     POSTNR        COMP      0                                      37
     C     SYPOGE        COMP      *BLANKS                                38
     C  N33SPRAAK        COMP      'E'                                    70
     C  N33SPRAAK        COMP      'T'                                    79
      *
N64   * Har kunden ORG.nr registrert (må ikke være persnr)
N64  C                   move      *off          *in75
N64  C     SYFOR1        Ifne      '000000000'
N64  C     SYFOR1        andne     '         '
N64  C     SYFOR2        andeq     *blanks
N64  C                   move      *on           *in75
N64  C                   END                                                                   D150
N64   *
     C  N70
     CANN79              MOVE      HO            HP
     C   70              MOVE      HE            HP
     C   79              MOVE      HT            HP
     C                   SETOFF                                       88
     C                   MOVE      *BLANKS       KLKNVN
     C     LKKEY         CHAIN     KODTLK                             33
      *
     C                   MOVE      WAVAL         XVAL
      *
      * OPEN / CLOSE FOR HVER KUNDE FOR SORTERING (SYFA27PS LENGER NED)
     C                   OPEN      SYFA27PF
     C                   OPEN      SYFA27PG
      *
      * SPESIELL SAMLEFAKTURAPROFIL, OG EVT EGEN SAML.SPESIF.-LAYOUT
     C                   MOVE      'N'           PROFIL            1            Egen profil?
     C                   MOVE      'N'           PROFI2            1            Egen fltlis?
     C                   MOVE      'N'           PRTKO             1            Print Kos.O?
     C                   MOVE      '1'           ANTKOK            1            Ant. KO.kop?
     C                   MOVE      *BLANKS       XKOHE            28            Ko.over.HEAD
     C                   MOVE      'J'           PRTSPE            1            Print Spes.?
     C                   MOVE      '1'           ANTSPK            1            Ant. Sp.kop?
     C                   MOVE      'J'           PRTSPS            1            Spes.SUM/KOD
     C                   MOVE      'J'           PRTLIN            1            Print F.lin?
     C                   MOVE      *BLANKS       CPHEN1                         Fast henvis?
     C     WAKN          CHAIN     CUSAPR                             33
     C     *IN33         IFEQ      *OFF
     C                   MOVE      'J'           PROFIL
      * Engelsk Y likeverdig med "J" i alle J/N valg
     C     CPSP          IFEQ      'Y'
     C                   MOVE      'J'           CPSP
     C                   END
     C     CPSPSU        IFEQ      'Y'
     C                   MOVE      'J'           CPSPSU
     C                   END
     C     CPFALI        IFEQ      'Y'
     C                   MOVE      'J'           CPFALI
     C                   END
     C                   MOVE      CPKO          PRTKO
     C                   MOVE      CPKOAK        ANTKOK
     C                   MOVE      CPSP          PRTSPE
     C                   MOVE      CPSPSU        PRTSPS
     C                   MOVE      CPFALI        PRTLIN
     C                   MOVE      CPSPAK        ANTSPK
     C     CUFLDK        CHAIN     CUFLD                              33
     C     *IN33         IFEQ      *OFF
     C                   MOVE      'J'           PROFI2
     C                   END
     C                   END
      *
      * Antall kopier kan variere fra kunde til kunde
S20  C*          ANTSPK    IFNE GMSPK
S20  C*          GMSPK     IFNE ' '
S20  C*                    CLOSESYFA27PS
S20  C*                    END
S20  C*                    MOVE ANTSPK    GMSPK
      * Ny override av printerfil
N43  C     ANTSPK        IFEQ      '0'
N43  C     ANTSPK        OREQ      ' '
N43  C                   MOVE      '1'           ANTSPK
N43  C                   END
     C                   MOVE      *BLANKS       UCMD
     C     XCMD11        CAT       ANTSPK:0      UCMD
     C                   CAT       ')':0         UCMD
     C                   CALL      'QCMDEXC'                            33
     C                   PARM                    UCMD
     C                   PARM                    UCMDL
     C                   OPEN      SYFA27PS
S20  C*                    END
      *
      * Ikke henvisning til oppdrag, men bare fast tekst om 93 ON.
     C     CPHEN1        COMP      *BLANKS                            9393      *For PRTF
      *
      * Skriv gebyr sumliste... tøm workfile
     C     PRTSPS        IFEQ      'J'
     C                   EXSR      DELW2
     C                   END
      *
      * Faktnr/forfallsdato....
      * Original
N59  C                   MOVE      'N'           XNYFAKT           1
     C     *IN27         IFEQ      '0'
sf7  C*    UFIRM         CHAIN     FIRM                               33
nf7  C     UFIRM         CHAIN     tellfa                             33
     C     *IN33         IFEQ      '0'
sf7  C*                  MOVE      FIFNR         XFN               6 0
nf7  C                   MOVE      FIFNR         XFN               7 0
     C                   ADD       1             FIFNR
sf7  C*                  UPDATE    FIRMR
nf7  C                   UPDATE    tellfar
N59  C                   MOVE      'J'           XNYFAKT
     C                   END
     C                   MOVE      XFN           TEFFNR
     C                   EXSR      BETSR
N45  C     FIFIRM        CHAIN     FIRMARC                            33
N45  C     *IN33         IFEQ      '0'
N47  C     'fs'          chain     arktxt                             33
N47  C     *IN33         IFEQ      '0'
N47  C     arkjn         andeq     'J'
N03  C                   TIME                    XULTID
N03  C                   MOVE      XULDD         ULDD
N03  C                   MOVE      XULMM         ULMM
N03  C                   MOVE      XULÅÅ         ULÅÅ
N45  C                   MOVE      FIFIRM        ARFIRM
s62  C*                  MOVE      HEAVD         ARAVD
s62  C*                  MOVE      HEOPD         AROPD
n62  C                   MOVE      UAVD          ARAVD
n62  C                   MOVE      *zeros        AROPD
N45  C                   MOVEL     XFN           ARUNDE
N45  C                   MOVE      'fs'          ARTYPE
N45  C                   MOVE      ZUSER         ARUSER
N45  C                   MOVE      ULDT          ARDATE
N45  C                   MOVE      XULTM         ARTIME
N52  C                   MOVE      KUNDNR        ARKUND
N45  C                   WRITE     ARKIVR
N45  C                   END
N47  C                   END
     C                   ELSE
      * Prøvekjøring
     C     *IN28         IFEQ      '1'
     C                   EXSR      BETSR
     C                   ELSE
      * Kopi
N10  C                   EXSR      BETSR
     C                   MOVE      WSFN          XFN
SV5  C*                    MOVE FADATO    IDAGX
SV5  C*                    MOVELXDTKD     IDAGX
SV5  C*                    MOVE XDTKÅ     IDAGX
N58  c     ekteko        ifeq      'J'
N23  C                   MOVE      FADATO        IDAG8
NV5  C                   MOVE      FADATD        IDAGXD
NV5  C                   MOVE      FADATM        IDAGXM
NV5  C                   MOVE      FADATÅ        IDAGXÅ
SV5  C*                    MOVE FADAFF    XFFDT
SV5  C*                    MOVE FADAFF    KFFDT
NV5  C                   MOVE      FADAFD        XFFDTD
NV5  C                   MOVE      FADAFM        XFFDTM
NV5  C                   MOVE      FADAFÅ        XFFDTÅ
NV5  C                   MOVE      XFFDT         KFFDT
N58  C                   end
     C                   END
     C                   END
      *
      * VARIABLE VAT
     C     FITAXD        IFNE      *ZEROS
     C     FITAX2        ANDNE     *ZEROS
SV5  C*          IDAG      ANDLTFITAXD
NV5  C     IDAG8         ANDLT     FITAXD
     C                   MOVE      FITAX2        FITAX
     C                   MOVE      FITAX2        FITAXB            4 4
     C                   MOVE      FITAX2        MVAPRO            4 2
     C                   END
      *
      * Nullstill div. variable/indikatore..
      *
     C                   Z-ADD     1             PAGEPS            4 0
     C                   Z-ADD     1             PAGEPF            4 0
     C                   MOVE      *ZEROS        XMVAGR            9 2
     C                   Z-ADD     1             XANT              2 0
     C                   SETOFF                                       908889
N27  C                   MOVE      *OFF          *IN16
      *
      *
      *
      * Skriv heading selve fakturaen
     C                   EXSR      KDTFM1
     C     URETUR        IFNE      'S'
     C                   WRITE     FHEAD                                         SYFA27PF
N66  C                   EXSR      FRISR
N27   *
N27  C     ECMKEY        CHAIN     ECMSG                              17
N27  C     *IN17         IFEQ      *OFF
N27  C     *IN27         ANDEQ     *OFF
N27  C                   MOVE      *ON           *IN16
N27  C                   CLEAR                   SYFA27WR
N27  C                   MOVEL     ECIIDI        WA01
N27  C                   MOVEL     ECIIDC        WA02
N27  C                   Z-ADD     XFN           WA03
N27  C                   MOVEL     'FHEAD'       WA04
N27  C                   MOVEL     KNAVN         WB01
N27  C                   MOVEL     ADR1          WB02
N27  C                   MOVEL     ADR2          WB03
N27  C                   Z-ADD     POSTNR        WB04
N27  C                   MOVEL     ADR3          WB05
N27  C                   Z-ADD     XFN           WB06
N27  C                   Z-ADD     KUNDNR        WB07
N27  C                   Z-ADD     IDAGX         WB08
N27  C                   Z-ADD     XFFDT         WB09
N27  C                   WRITE     SYFA27WR
N27  C                   ENDIF
N27   *
     C                   END
      * Skriv heading spesifikasjon
     C     PRTSPE        IFEQ      'J'
N09  C     KOPINR        ANDLE     ANTKOS
     C                   EXSR      SPHEAD
     C                   END
     C                   EXSR      KDTFM1
      *
     C                   ADD       1             XPRANT
      *
     C                   ENDSR
      *
      *
      ******************************************
     C     ETTOPD        BEGSR
      ******************************************
      *
     C                   MOVE      WAAVD         HEAVD
     C                   MOVE      WAOPD         HEOPD
     C     HEADFK        CHAIN     HEADF                              33
     C     *IN33         IFEQ      '0'
     C     *IN27         ANDEQ     '0'                                             ORIGINAL
      * X-ref oppdrag/faktnr i FAIN
     C                   MOVE      XFN           FIFN
     C                   MOVE      HEAVD         FIAVD
     C                   MOVE      HEOPD         FIOPD
     C                   WRITE     FAINR
N03  C     FIURBL        IFEQ      'J'
N03  C                   EXSR      TTSR
N03  C                   END
     C                   END
      * DISSE FELTENE SKAL VEL DROPPES I VER4.....
      * Kjøper
     C     KUNDNR        IFEQ      HEKNKF
     C                   MOVE      'K'           XXSKKO
     C                   ELSE
      * Selger
     C     KUNDNR        IFEQ      HEKNSF
     C                   MOVE      'S'           XXSKKO
     C                   ELSE
     C                   MOVE      'X'           XXSKKO
     C                   END
     C                   END
     C     *IN33         IFEQ      '0'
     C     *IN27         ANDEQ     '0'                                             ORIGINAL
     C                   MOVE      'F'           HEST
     C                   UPDATE    HEADFR
     C                   END
      *
     C     HEUR          IFEQ      'H'
     C     HEADFK        CHAIN     DISP                               33
     C     TUKEY2        CHAIN     TURER                              33
     C                   END
      *
N26   * VED FLY KAN F.B.VEKT TASTES DIREKTE (UTEN M3/LM)
N26  C                   Z-ADD     HEVKT         XXVKT
N26  C     HEUR          IFEQ      'C'
N26  C     HEUR          OREQ      'D'
N26  C     HEUR          OREQ      'E'
N26  C     HEFBV         IFGT      HEVKT
N26  C                   Z-ADD     HEFBV         XXVKT
N26  C                   END
N26  C                   END
      * HENTER FRANKATURTEKST
     C     KODFRK        CHAIN     KODTFR                             33
     C                   MOVEL     KFRNTX        XFRNTX           20
     C                   MOVEL     KFRTTX        XFRTTX           20
      *
      * HENTER OPPDRAGSTYPE TEKST
     C     KODOTK        CHAIN     KODTOTY                            33
      *
      * Skriv "Motsatt" part  (39/49=indikator for ledetekst i prtf)
     C                   SETOFF                                         3949
      * Faktura mot kjøper - oppgi avsender på s-faktspesifikasj.
     C     KUNDNR        IFEQ      HEKNKF
     C                   MOVEL     HENAS         XXPART           20            *39OFF/49OFF
     C                   ELSE
      * Faktura mot selger - oppgi mottaker på s-faktspesifikasj.
S05  C*          KUNDNR    IFEQ HEKNKF
S05  C*                    MOVELHENAS     XXPART           *39ON /49OFF
N05  C     KUNDNR        IFEQ      HEKNSF
N05  C                   MOVEL     HENAK         XXPART                         *39ON /49OFF
     C                   SETON                                            39
     C                   ELSE
      * Faktura mot 3.part - oppgi Avsender OG mottaker
     C                   MOVEL     HENAS         XXPARA            9
     C                   MOVEL     HENAK         XXPARB            9
     C                   MOVEL     XXPARA        XXPART                         *39OFF/49ON
     C                   MOVE      XXPARB        XXPART                         *39OFF/49ON
     C                   SETON                                            49
     C                   END
     C                   END
      *
      * Behandle varelinjene (samt skriv oppdraget) på fakt/spes.
     C                   EXSR      VALI
     C                   EXSR      TOTOPD
      * 89 On: Første oppdr. skrevet (minst). Skriv ==== foran neste.
     C                   SETON                                        89
      *
      *  Syfa27b bruker også SORT - kalles derfor først nå..
      *  SKAL "KOSTNADSOVERSLAG" (FULL A4 SPESIFIKASJON) SKRIVES
      * (O=PÅ OPPDR.TIDSPKUNKT, S=SAML.FAK.TIDSP., B=BEGGE)
     C     PRTKO         IFEQ      'S'                                          B1
     C     PRTKO         OREQ      'B'                                          B1
sf7  C*                  Z-ADD     XFN           UFAKT             6 0
nf7  C                   Z-ADD     XFN           UFAKT             7 0
     C                   Z-ADD     KUNDNR        UKUNDE            8 0
      *(XTYPE:O=PÅ OPPDRAGSTIDSP./S=SAMLEF.TIDSP./P=PRØVE/K=KOPI)
     C     *IN27         IFEQ      '0'
     C                   MOVE      'S'           XTYPE             1
     C                   ELSE
     C     *IN28         IFEQ      '0'
     C                   MOVE      'K'           XTYPE             1
     C                   ELSE
     C                   MOVE      'P'           XTYPE             1
     C                   END
     C                   END
N60  C                   move      waval         uuuval            3
n60  c  N27waval         ifeq      '   '
n60  c                   move      ficurr        uuuval
n60  c                   end
     C                   CALL      'SYFA27B'
     C                   PARM                    UKUNDE
     C                   PARM                    HEAVD
     C                   PARM                    HEOPD
     C                   PARM                    UFAKT
s60  C*                  PARM                    WAVAL
N60  C                   PARM                    UUUVAL
     C                   PARM                    ANTKOK
     C                   PARM                    XKOHE
EV5  C     IDAG          PARM      IDAG          IDAG6P            6 0
EV5  C     XFFDT         PARM      XFFDT         XFDT6P            6 0
     C                   PARM                    XTYPE
     C                   END                                                    E1
      *
N15   * OPPDATER FAKTURANR PÅ GRUNNLAGFIL
N15  C                   MOVE      HEAVD         ULAVD             4
N15  C                   MOVE      HEOPD         ULOPD             5
N15  C                   MOVE      *ZEROS        ULLI              5
sf7  C*                  MOVE      XFN           ULFN              6
nf7  C                   MOVE      XFN           ULFN              7
N15  C     *IN27         IFEQ      '0'
N15  C                   MOVE      'N'           ULKOPI            1
N15  C                   MOVE      IDAG8         ULFDT             8
N15  C                   ELSE
N15  C                   MOVE      'J'           ULKOPI
N15  C                   MOVE      FADATO        ULFDT
N15  C                   END
N15  C                   MOVE      'O'           ULOPT             1
N15  C                   CALL      'LL054C'
N15  C                   PARM                    ULAVD
N15  C                   PARM                    ULOPD
N15  C                   PARM                    ULLI
N15  C                   PARM                    ULFDT
N15  C                   PARM                    ULFN
N15  C                   PARM                    ULKOPI
N15  C                   PARM                    ULOPT
      *
     C                   ENDSR
      ***********************************************
     C     SPHEAD        BEGSR
      ***********************************************
      * Skriv spesifikasjons-header
      * Hvis overflow skriv "Fortsetter..." i bunnen før sideskift
      *
      * VED FLERE SIDER LEGGER INN NY STRINGKODE
      *
N09  C     KOPINR        IFGT      1
N09  C                   MOVE      SFMT12        SFMT1
N09  C                   MOVE      SFMT22        SFMT2
N09  C                   END
     C     *IN90         IFEQ      '1'
     C                   ADD       1             PAGEPS
     C                   WRITE     KJØP1                                             ..Ps
     C                   END
     C                   EXSR      KDTFM1
     C                   WRITE     KJØP                                              ..PS
     C                   EXSR      KDTFM1
     C     PROFIL        IFEQ      'J'                                            B3
     C     CPSPH1        IFNE      *BLANKS
     C                   WRITE     KJØPH1                                            ..PS
     C                   END
     C     CPSPH2        IFNE      *BLANKS
     C                   WRITE     KJØPH2                                            ..PS
     C                   END
     C     CPSPH3        IFNE      *BLANKS
     C                   WRITE     KJØPH3                                            ..PS
     C                   END
     C                   END                                                      E3
     C                   WRITE     KJØPHX
     C   90              EXSR      SPHEA2
     C                   SETOFF                                       90
      *
     C                   ENDSR
      *
      ***********************************************
     C     SPHEA2        BEGSR
      ***********************************************
      *
      * KUNDESPESIFIK LAYOUT - returner inntil 3 komponerte linjer.
     C     PROFI2        IFEQ      'J'                                           B2
     C                   Z-ADD     HEOPD         UOPD              7 0
     C                   Z-ADD     KUNDNR        UKUNDE            8 0
     C                   Z-ADD     XFN           YYFAKT
      *
      * ved original er linjer alklerede oppdatert med valutakode
      *
N49  C                   move      waval         uuuval            3
n49  c  N27waval         ifeq      '   '
n49  c                   move      ficurr        uuuval
n49  c                   end
     c
     C                   CALL      'SYFA27C'
     C                   PARM                    UKUNDE
     C                   PARM                    UDOKUM
     C                   PARM                    HEAVD
     C                   PARM                    UOPD
     C                   PARM                    YYFAKT
s49  C*                  PARM                    WAVAL
n49  C                   PARM                    uuuval
     C                   PARM                    XKULI1           79
     C                   PARM                    XKULI2           79
     C                   PARM                    XKULI3           79
     C     XKULI1        IFNE      *BLANKS
     C                   WRITE     KJØP21                                        SYFA27PS
     C                   END
     C     XKULI2        IFNE      *BLANKS
     C                   WRITE     KJØP22                                        ......PS
     C                   END
     C     XKULI3        IFNE      *BLANKS
     C                   WRITE     KJØP23
     C                   END                                                      .....PS
     C                   ELSE                                                    X2
      * Standard spesifik. layout
N08  C                   EXSR      KDTFM2
     C                   WRITE     KJØP2                                          .....PS
     C                   END                                                     E2
     C                   ENDSR                                                   E2
      ***********************************************
     C     VALI          BEGSR
      ***********************************************
      *
      * Summer fakt.linjer m.m. uansett om de skal skrives eller ei
      * Summer linjer/legg ut i SORT/sett indikator for kredit/S,K,X?
     C                   EXSR      KREDIT
      *
      *  SKAL VANLIG SPESIFIKASJON SKRIVES....
      *
     C     PRTSPE        IFEQ      'J'                                          B1
N09  C     KOPINR        ANDLE     ANTKOS
      *
      * overflow på spesifikasjonen....
     C     *IN90         IFEQ      '1'                                           B2
     C                   EXSR      SPHEAD
     C                   ELSE
     C                   EXSR      SPHEA2
     C                   END                                                     E2
      *
      * Fritekstlinjer på spesifikasjon (overflowchek i rutinen)
     C                   EXSR      FRILIN
      *
     C     PRTLIN        IFEQ      'J'
      * ------------------  SPACEB(1)/SPACEA(1) kun når FA.linj skrives
     C                   WRITE     KJØP4
     C                   END
      *
     C                   END                                                    E1
      *
      *
      *
      **
      ** GÅR I LØKKE OG HENTER LINJER FRA SORT (LAGT UT AV SR KREDIT)
      **  (MANGE FAKT/SORT VARIABLER ER DOBBELTDEFINERT VIA DS)
      **
     C     SORTK         SETLL     SORT
      *
     C     STVALI        TAG
     C                   SETOFF                                       33
     C                   READ      SORT                                   33
     C   33              GOTO      SLVALI
      *
      * TEST IF NEXT LINE HAVE SOME CODE AND NO TEXT
      *
     C     SOVT          IFEQ      *BLANKS
     C                   MOVE      SOKDM         XOKDM             1
     C                   MOVE      SOSAMM        XOSAMM            1
     C                   MOVE      SOVK          XOVK              3
     C                   MOVE      SOVT          XOVT             20
     C                   MOVE      SOBELN        XOBELN           13 2
     C                   MOVE      SOBELV        XOBELV           13 2
     C                   EXSR      TESTEQ
     C                   END
     C     SOKDM         COMP      'J'                                    34
N46   * sjekk momskoder fra Løsning1                                      34
N46  C  N34              EXSR      MOMSKD
     C   34
     CANN71              ADD       SOBELN        XMVAGR
     C   34
     CAN 71              ADD       SOBELV        XMVAGR
     C                   MOVE      SOVK          YVK
     C     KODGEK        CHAIN     KODTGE                             33
S36  C*  79      KODG2K    CHAINKODTG2               33
N36  C     KODG2K        CHAIN     KODTG2                             33
N36  C   33              MOVE      *ZEROS        KG2SRT
N36  C   33              MOVE      *BLANKS       KGENOT
N36  C   33              MOVE      *BLANKS       KGEENT
N36  C   33              MOVE      *BLANKS       KG2TYT
N36  C   33              MOVEL     YVK           KGENOT
N36  C   33              MOVEL     YVK           KGEENT
N36  C   33              MOVEL     YVK           KG2TYT
     C     SOSAMM        IFNE      *BLANK
     C     SOSAMM        CHAIN     KODSAM                             33
     C                   END
     C  N71              Z-ADD     SOBELN        XPFNOK
     C   71              Z-ADD     SOBELV        XPFNOK
     C                   ADD       XPFNOK        XTOTAL           13 2
      *
     C     PRTSPE        IFEQ      'J'
N09  C     KOPINR        ANDLE     ANTKOS
      * Hvis 0 skrives blank (ikke 0,00) Indikator for prtf.
     C     XPFNOK        COMP      *ZEROS                             3636
      *
      * Hvis sum pr gebyrkode - akkumuler i workfile
     C     PRTSPS        IFEQ      'J'
     C     SOSAMM        IFNE      *BLANK
     C                   MOVE      SOSAMM        WGVK
     C                   MOVEL     '**'          WGVK
     C                   ELSE
     C                   MOVE      SOVK          WGVK
     C                   END
     C                   MOVE      SOKDM         WGKDM
S46  C*    WGKDM         IFEQ      'J'
N46  C*    MVAKODER
N46  C     WGKDM         IFNE      'N'
S46  C*    XPFNOK        MULT(H)   FITAX         MVA              13 2
N46  C                   EXSR      MVAPST
N01  C                   ELSE
N01  C                   MOVE      *ZEROS        MVA
N01  C                   END
N02  C                   Z-ADD     XPFNOK        NETTO
N01  C     NETTO         ADD       MVA           BRUTTO           13 2
     C     SUMKEY        CHAIN     WSAMGE                             33
     C     *IN33         IFEQ      '1'
     C  N70
     CANN79              MOVE      KGENOT        WGTEXT
     C   70              MOVE      KGEENT        WGTEXT
     C   79              MOVE      KG2TYT        WGTEXT
     C                   MOVE      SOLNR         WGSORT
     C                   Z-ADD     XPFNOK        WGNETT
N01  C                   Z-ADD     MVA           WGMVA
N01  C                   Z-ADD     BRUTTO        WGBRUT
     C                   WRITE     WSAMGER
     C                   ELSE
     C                   ADD       XPFNOK        WGNETT
N01  C                   ADD       MVA           WGMVA
N01  C                   ADD       BRUTTO        WGBRUT
     C                   UPDATE    WSAMGER
     C                   END
     C                   END
      *
     C     PRTLIN        IFEQ      'J'
N09  C     KOPINR        ANDLE     ANTKOS
      * Sjekk overflow på spesifikasjon
     C     *IN90         IFEQ      '1'
     C                   EXSR      SPHEAD
     C                   END
     C* "Tillegsttekst" fakt.linje skal ERSTATTE standardtekst
     C     XFAVT1        IFEQ      'X'
     C                   MOVEL     XFAVT2        KGENOT
     C                   MOVEL     XFAVT2        KGEENT
     C                   MOVEL     XFAVT2        KG2TYT
     C                   MOVE      ' '           KGENOT
     C                   MOVE      ' '           KGEENT
     C                   MOVE      ' '           KG2TYT
     C                   MOVE      *BLANKS       SOVT
     C                   END
      *
     C                   WRITE     DET
     C                   END
      *
     C                   END
      *
     C                   DELETE    SORTR
     C                   GOTO      STVALI
      *
     C     SLVALI        ENDSR
      *
      ***********************************************
     C     KREDIT        BEGSR
      ***********************************************
      * WAVAL 'kommer fra" FACURI i FAKT
      *  - Denne er ulik blank kun ved fremmedvaluta (ulik FICURR)
     C     WAVAL         COMP      *BLANKS                            7171
N17  C   71WAVAL         COMP      FICURR                             7171
     C                   MOVE      *ZEROS        XTOTAL
     C                   MOVE      *ZEROS        XMVAGR
      *
N41   * DA FACURI OPPDATERES  MED NOK I RUNDE 1 MÅ VI
N41   * LEGGE FICURR I KEYEN VED RUNDE NUMMER 2
N41   *
N41  C                   MOVE      WAVAL         WAVAL8
N41  C   27KOPINR        IFGT      1
N41  C     WAVAL         ANDEQ     *BLANKS
N41  C                   MOVE      FICURR        WAVAL8
N41  C                   END
     C     FAK8K         SETLL     FAK8
      *
     C     STKRE         TAG
     C                   SETOFF                                       33
     C     FAK8K         READE     FAK8                                   33
      *
     C   33              GOTO      SLKRE
      *
      * AGENTLINJER SKAL IKKE VÆRE MED
      *
     C     FASK          CABEQ     'A'           STKRE
     C     FASK          CABEQ     'F'           STKRE
N11  C     FASK          CABEQ     'I'           STKRE
S33  C*          FASK      CABEQ'I'       STKRE
N33  C     FASK          CABEQ     'E'           STKRE
N21  C     FAKDA         CABEQ     'K'           STKRE
      *
N04   * SLETTEDE LINJER SKAL IKKE
N04   *
N04  C     FAOPKO        CABEQ     'D'           STKRE
      *
      * ORIGINAL: OPPDATER FILE (ELLER SKIPP/DELETE)
      *
     C     *IN27         IFEQ      '0'                                          1B
      *
      * INVOICE LINES WITH AMT. ZERO:
      *
     C     FABELN        IFEQ      0                                             2B
      *
      * SKIPP BUT DO NOT DELETE IF OTHER UNIT=D(PR DAY)
      *
     C     FA01B         IFEQ      'D'                                            3B
     C                   GOTO      STKRE
     C                   END                                                      3E
      *
      * SKIPP 0-LINE TYPE "PR LINE ON SAD" - DELETE IF SAD FINISHED
      *
     C     FA01B         IFEQ      'L'                                            3B
     C     HEPK1         IFEQ      'J'                                             4B
     C                   GOTO      STKRE                                         SAD UFERDIG
     C                   ELSE                                                      X4
     C     FAKTK         CHAIN     FAKT                               33
     C  N33              DELETE    FAKTR
     C                   GOTO      STKRE
     C                   END                                                       4E
     C                   END                                                      3E
N06  C* UTL-LINJE SOM ER ENDRET TIL 0
N06  C     FAVK          IFEQ      'UTL'
N06  C     FAKDA         IFEQ      'M'
N06  C     FAKDA         OREQ      'E'
N06  C     FAKTK         CHAIN     FAKT                               33
N06  C  N33              DELETE    FAKTR
N06  C                   GOTO      STKRE
N06  C                   END                                                     3<-E
N06  C                   END                                                     3<-E
      *
      * SKIPP AND DELETE IF AUTOGENERATED LINE
      *
     C     FAKDA         IFEQ      'A'                                            3B
     C     FAKDA         OREQ      'B'
     C                   MOVE      FAVK          YVK
     C     KODGEK        CHAIN     KOGER                              33
     C     KGETYP        IFNE      'NUL'                                           4B
     C     FAKTK         CHAIN     FAKT                               33
     C  N33              DELETE    FAKTR
     C                   GOTO      STKRE
     C                   END                                                       4E
     C                   END                                                      3E
     C                   END                                                     2E (BEL=0)
      *
      * Linjen skal skrives .. oppdater
     C     FAKTK         CHAIN     FAKT                               33
     C     *in33         IFEQ      '0'
     C                   MOVE      KUNDNR        FAKUNR
     C                   MOVE      XFN           FAFAKT
     C                   MOVE      'F'           FAOPKO
SV5  C*                    MOVE YDTMP     FAMND
SV5  C*                    MOVE YDTÅP     FAÅR
NV5  C                   MOVE      YDTPM         FAMND
NV5  C                   MOVE      YDTPÅ         FAÅR
NV5  C                   MOVE      YDTPC         FACC
SV5  C*                    MOVE IDAG      FADATO
SV5  C*                    MOVE XFFDT     FADAFF
NV5  C                   MOVE      IDAG8         FADATO
NV5  C                   MOVE      XFFDTD        FADAFD
NV5  C                   MOVE      XFFDTM        FADAFM
NV5  C     XFFDTÅ        IFGT      50
NV5  C     XFFDTÅ        ADD       1900          FADAFÅ
NV5  C                   ELSE
NV5  C     XFFDTÅ        ADD       2000          FADAFÅ
NV5  C                   END
     C                   MOVE      'S'           FAKDA
     C                   MOVE      WAVAL         FACURI
N40  C     WAVAL         IFEQ      *BLANKS
N40  C                   MOVE      FICURR        FACURI
N40  C                   END
     C                   EXCEPT    OPDFAK
     C                   END
      *
     C                   END                                                    1E(N27=ORI.)
      *
     C     FAKDM         COMP      'J'                                    34
     C                   MOVE      FAVK          YVK
     C     KODGEK        CHAIN     KODTGE                             33
     C     KODG2K        CHAIN     KODTG2                             33
N36  C   33              MOVE      *ZEROS        KG2SRT
N36  C   33              MOVE      *BLANKS       KGENOT
N36  C   33              MOVE      *BLANKS       KGEENT
N36  C   33              MOVE      *BLANKS       KG2TYT
N36  C   33              MOVEL     YVK           KGENOT
N36  C   33              MOVEL     YVK           KGEENT
N36  C   33              MOVEL     YVK           KG2TYT
     C     SOSAMM        IFNE      *BLANK
     C     SOSAMM        CHAIN     KODSAM                             33
     C                   END
     C     SOSAMM        IFNE      *BLANKS
     C                   Z-SUB     1             SOLNR
     C                   END
     C                   WRITE     SORTR
      * Selger/kjøper/X??? for key FREETK
     C                   MOVE      FASK          XXSKKO
      *
     C                   GOTO      STKRE
      *
     C     SLKRE         ENDSR
      *
      ******************************************
     C     TOTOPD        BEGSR
      ******************************************
S61  C                   Z-ADD     0             XMOMS             8 2
N61  C                   Z-ADD     0             XMOMS             9 2
N46  C                   Z-ADD     1             XX
N46  C                   Z-ADD     XTOTAL        XBRUTT
N46  C     ADDMVA        TAG
N46  C     WSMVAK(XX)    IFNE      ' '
N46  C                   ADD       WSMVAN(XX)    XBRUTT
N46  C                   ADD       WSMVAN(XX)    XMOMS
N46  C                   ADD       1             XX
N46  C                   GOTO      ADDMVA
N46  C                   ENDIF
S46  C*    XMVAGR        MULT(H)   FITAXB        XMOMS             8 2
S61  C*                  Z-ADD     XMOMS         XPMOMS            8 2
N61  C     XMVAGR        MULT(H)   FITAXB        XMOMS             9 2
N61  C                   Z-ADD     XMOMS         XPMOMS            9 2
S46  C     XTOTAL        ADD       XMOMS         XBRUTT           13 2
      *
     C     XPMOMS        COMP      *ZEROS                             7272
S61  C*                  ADD       XPMOMS        XMOM              8 2
N61  C                   ADD       XPMOMS        XMOM              9 2
     C                   ADD       XBRUTT        XBRUT            13 2
     C                   ADD       XMVAGR        XMVGR             9 2
      *
      *
N66  C                   EXSR      TSTBRU
N66   * FJERNET LIBNJER FYSISK
N66   *
     C     *IN88         IFEQ      '1'
     C                   ADD       1             PAGEPF
     C                   WRITE     FHEAD1
     C                   EXSR      KDTFM1
     C                   WRITE     FHEAD
     C                   EXSR      KDTFM1
S35  C*                    MOVE *ZEROS    XANT    20
N35  C                   Z-ADD     1             XANT              2 0
     C                   SETOFF                                       88
     C                   END
      *
      * Selve fakturaen, detaljlinje
      * IKKE skriv/tell hvis fast teskt i steden for linje pr oppdrag
     C     CPHEN1        IFEQ      *BLANKS
     C     URETUR        ANDNE     'S'
     C                   WRITE     FDET
     C                   ADD       1             XANT
N27   *
N27  C     *IN16         IFEQ      *ON
N27  C                   MOVEL     'FDET '       WA04
N27  C                   Z-ADD     HEFBV         WC01
N27  C                   Z-ADD     HEVKT         WC02
N27  C                   Z-ADD     HENT          WC03
N27  C                   Z-ADD     HEAVD         WC04
N27  C                   Z-ADD     HEOPD         WC05
N27  C                   Z-ADD     XTOTAL        WC06
N27  C                   MOVEL     *BLANKS       WC07                           FSSOK
N27  C                   WRITE     SYFA27WR
N27  C                   ENDIF
N27   *
     C                   END
      *
      * Spesifikasjon, oppdragstotal  (men kun hvis linjene skrives)
     C     PRTSPE        IFEQ      'J'
N09  C     KOPINR        ANDLE     ANTKOS
     C     PRTLIN        ANDEQ     'J'
      * Overflow..
S07  C*          *IN90     IFEQ 'J'
N07  C     *IN90         IFEQ      '1'
     C                   EXSR      SPHEAD
     C                   END
      *                                    C
N46  C                   Z-ADD     1             XX
N46  C     SKMVA         TAG
N46  C     WSMVAK(XX)    IFNE      ' '
N46  C     WSMVAK(XX)    IFEQ      'J'
N46  C                   MOVE      '*'           TVATKN
N46  C                   MOVE      '*'           TVATKE
N46  C                   MOVE      '*'           TVATKT
N46  C                   ELSE
N46  C                   MOVE      WSMVAK(XX)    TVATKN
N46  C                   MOVE      WSMVAK(XX)    TVATKE
N46  C                   MOVE      WSMVAK(XX)    TVATKT
N46  C                   ENDIF
N46  C                   Z-ADD     WSMVAP(XX)    MVAPRO
N46  C                   Z-ADD     WSMVAG(XX)    XMVAGR
N46  C                   Z-ADD     WSMVAN(XX)    XPMOMS
N46  C*                  ADD       XPMOMS        XBRUTT
     C                   WRITE     TOT
N46  C                   ADD       1             XX
N46  C                   GOTO      SKMVA
N46  C                   ENDIF
N48  C                   WRITE     TOT1
     C                   END
S48  C*                  WRITE     TOT1
      *
     C                   MOVE      *ZEROS        XMVAGR
     C                   MOVE      *ZEROS        XPMOMS
     C                   MOVE      *ZEROS        XBRUTT
     C                   MOVE      *ZEROS        XTOTAL
      *
     C                   ENDSR
      *
     C********************************************************
     C     SPESUM        BEGSR
     C********************************************************
     C                   MOVE      *ZEROS        XETTO            13 2
     C                   MOVE      *ZEROS        XVA              13 2
     C                   MOVE      *ZEROS        XRUTTO           13 2
N29  C                   MOVE      *ZEROS        X2NETT
N29  C                   MOVE      *ZEROS        X2MVAT
N29  C                   MOVE      *ZEROS        X2BRTT
      * Heading
     C                   EXSR      KDTFM1
     C                   ADD       1             PAGEPS
     C                   WRITE     KJØP                                              ..PS
     C                   EXSR      KDTFM1
N29   * SETT IND. 48 PÅ HVIS DET ER LAGERFAKTURA
N29  C     WGUNIK        SETLL     WSAMGE1
N29  C     WGUNIK        READE     WSAMGE1                                33
N29  C     *IN33         IFEQ      '0'
N29  C     XFN           SETLL     LLGSFL06
N29  C     XFN           READE     LLGSFL06                               33
N29  C     *IN33         IFEQ      '0'
N29  C                   MOVE      '1'           *IN48
N29  C                   ELSE
N29  C                   MOVE      '0'           *IN48
N29  C                   END
N29  C                   MOVE      '0'           *IN33
N29  C                   END
N29  C     *IN48         IFEQ      '0'
     C                   WRITE     SUMLH
N29  C                   ELSE
N29  C                   WRITE     SUMLH2
N29  C                   END
     C                   MOVE      '0'           *IN90
      *
     C     WGUNIK        SETLL     WSAMGE1
     C     ST            TAG
     C     WGUNIK        READE     WSAMGE1                                33
     C     *IN33         DOWEQ     '0'
      * overflow på spesifikasjonen....
     C     *IN90         IFEQ      '1'
     C                   EXSR      KDTFM1
     C                   ADD       1             PAGEPS
     C                   WRITE     KJØP                                              ..PS
     C                   EXSR      KDTFM1
N29  C     *IN48         IFEQ      '0'
     C                   WRITE     SUMLH
N29  C                   ELSE
N29  C                   WRITE     SUMLH2
N29  C                   END
     C                   MOVE      '0'           *IN90
     C                   END
N29  C     *IN48         IFEQ      '0'
     C                   Z-ADD     WGNETT        NETTO            13 2
N01  C                   Z-ADD     WGMVA         MVA              13 2
N01  C                   Z-ADD     WGBRUT        BRUTTO           13 2
S01  C*          WGKDM     IFEQ 'J'
S01  C*          NETTO     MULT FITAX     MVA    132
S01  C*                    ELSE
S01  C*                    MOVE *ZEROS    MVA
S01  C*                    END
S01  C*          NETTO     ADD  MVA       BRUTTO 132
     C                   WRITE     SUMLD
      *
     C                   ADD       NETTO         XETTO            13 2
     C                   ADD       MVA           XVA              13 2
     C                   ADD       BRUTTO        XRUTTO           13 2
N29  C                   ELSE
N29  C                   MOVE      *ZEROS        X2ANT
N29  C                   MOVE      *ZEROS        X2PRIS
N29  C     LGS06K        SETLL     LLGSFL06
N29  C     LGS06K        READE     LLGSFL06                               33
N29  C     *IN33         DOWEQ     '0'
N29  C                   ADD       GSANT         X2ANT
N29  C                   SELECT
N29  C     X2PRIS        WHENEQ    0
N29  C                   MOVE      GSPR          X2PRIS
N29  C     X2PRIS        WHENNE    GSPR
N29  C                   MOVE      9999999       X2PRIS
N29  C                   ENDSL
N29  C     LGS06K        READE     LLGSFL06                               33
N29  C  N33              ENDDO
N29  C                   Z-ADD     WGNETT        X2NET
N29  C                   Z-ADD     WGMVA         X2MVA
N29  C                   Z-ADD     WGBRUT        X2BRT
N29  C                   WRITE     SUMLD2
N29  C                   ADD       X2NET         X2NETT
N29  C                   ADD       X2MVA         X2MVAT
N29  C                   ADD       X2BRT         X2BRTT
N29  C                   END
     C*
     C     WGUNIK        READE     WSAMGE1                                33
     C                   END
      *
      * TOTAL
N29  C     *IN48         IFEQ      '0'
     C                   WRITE     SUMLT
N29  C                   ELSE
N29  C                   WRITE     SUMLT2
N29  C                   END
      *
     C                   ENDSR
      *
      ***********************************************
     C     TOTFAK        BEGSR
      ***********************************************
     C     XBRUT         COMP      *ZEROS                               73
     C     XMOM          COMP      *ZEROS                             7272
      *
      *TOTALER PÅ SPESIFIKASJON
      * MEN KUN NÅR SPESIFIKASJON SKRIVES
     C     PRTSPE        IFEQ      'J'
N09  C     KOPINR        ANDLE     ANTKOS
      * overflow på spesifikasjonen....
     C     *IN90         IFEQ      '1'                                           B2
     C                   EXSR      SPHEAD
     C                   END                                                     E2
     C                   WRITE     TOT2
      * SKRIVER GEBYR-TOTALLISTE
      *         IKKE HVIS PROFIL SIER NEI/IKKE VED PRØVEKJØRING
     C     PRTSPS        IFEQ      'J'
     C                   EXSR      SPESUM
     C                   END
     C                   END
      *
      * Splitt heltall/desimal for giro
     C                   MOVEL     XBRUT         XTOTKR
     C                   MOVE      XBRUT         XTOTØR
      * MVA (TOTAL) Skrives som separat detaljlinje.
      * HVIS IND 72 ON. - SJEKK OVERFLOW.
      * (men ikke hvis kunden har profil med fast teksthenvisning)
     C     URETUR        IFNE      'S'
     C     CPHEN1        IFEQ      *BLANKS
N35  C     *IN72         ANDEQ     '1'
      *
N66  C                   EXSR      TSTBRU
N66   * FJERNET LIBNJER FYSISK
N66   *
N35  C     *IN88         IFEQ      '1'
N35  C                   ADD       1             PAGEPF
N35  C                   WRITE     FHEAD1
N35  C                   EXSR      KDTFM1
N35  C                   WRITE     FHEAD
N35  C                   EXSR      KDTFM1
N35  C                   Z-ADD     1             XANT              2 0
N35  C                   SETOFF                                       88
N35  C                   END
     C                   WRITE     FTOT
     C                   END
N24  C     XVAL          IFNE      *BLANKS
N24  C                   MOVE      XVAL          PVAL              3
N24  C                   ELSE
N24  C                   MOVE      FICURR        PVAL
N24  C                   END
      *
      * VED KIDGIRO EGEN TOTALLINJE
      *
     C  N35              WRITE     FTOT2
     C   35              WRITE     FTOT2B
N27   *
N27  C     *IN16         IFEQ      *ON
N27  C                   MOVEL     'FTOT '       WA04
N27  C                   Z-ADD     MVAPRO        WD01
N27  C                   Z-ADD     XMVGR         WD02
N27  C                   Z-ADD     XMOM          WD03
N27  C                   Z-ADD     XBRUT         WE01
N27  C                   WRITE     SYFA27WR
N27  C                   ENDIF
N27   *
N59  C     XNYFAKT       IFEQ      'J'
N59  C     CUNDC03K      CHAIN     CUNDC03                            33
N59  C  N33              EXSR      OPDXML
N59  C                   ENDIF
N59   *
     C                   END
     C                   MOVE      *ZEROS        XMVGR
     C                   MOVE      *ZEROS        XMOM
     C                   MOVE      *ZEROS        XBRUT
      *
      *
      * PRINT GIRO (73 OFF= BELØP ER POSITIVT/71 OFF="BLANK" Valuta
      *
      *
N57  C     kowawb        ifeq      'K'
N57  C                   exsr      KIDGIR
N57  C                   GOTO      slgiro
N57  c                   end
     C     *IN73         IFEQ      '0'                                          1<-B
     C     *IN71         ANDEQ     '0'                                          1<-B
     C     URETUR        ANDNE     'S'
     C     UBBS          IFNE      'N'                                           2<-B
     C     KOWAWB        IFNE      'J'                                            3<-B
     C                   EXSR      KDTFM1
     C                   WRITE     BGIR
     C                   EXSR      KDTFM1
     C                   EXSR      MOD10
     C     UBBS          IFEQ      'A'                                             4<-B
     C                   WRITE     BGIR2A
     C                   ELSE                                                      4
     C     UBBS          IFEQ      'B'                                              5<-B
      * FIX Z-SUPRESS FOR ALFA-FILED
     C                   MOVE      XTOTKR        ATOTKR
     C     1             DO        10            AX                2 0               6<-B
     C     A(AX)         IFEQ      '0'                                                7<-B
     C                   MOVE      ' '           A(AX)
     C                   ELSE                                                         7
     C                   GOTO      BGIRT2
     C                   END                                                          7<-E
     C                   END                                                         6<-E
     C     BGIRT2        TAG
      *
     C                   WRITE     BGIR2B
     C                   ELSE                                                       5
     C     UBBS          IFEQ      'C'                                               6<-B
     C                   WRITE     BGIR2C
     C                   ELSE                                                        6
     C     UBBS          IFEQ      'D'                                                7<-B
     C                   WRITE     BGIR2D
     C                   ELSE                                                         7
     C     UBBS          IFEQ      'E'                                                 8<-B
      * FIX Z-SUPRESS FOR ALFA-FILED
     C                   MOVE      XTOTKR        ATOTKR
     C     1             DO        10            AX                2 0                  9<-B
     C     A(AX)         IFEQ      '0'                                                   10<-B
     C                   MOVE      ' '           A(AX)
     C                   ELSE                                                            10
     C                   GOTO      BGIRE2
     C                   END                                                             10<-E
     C                   END                                                            9<-E
     C     BGIRE2        TAG
      *
     C                   WRITE     BGIR2E
     C                   ELSE                                                          8
      *
     C     UBBS          IFEQ      'F'
     C                   WRITE     BGIR2F
      *
     C                   ELSE
     C                   WRITE     BGIR3
     C                   END
      *
     C                   END                                                           8<-E
     C                   END                                                          7<-E
     C                   END                                                         6<-E
     C                   END                                                        5<-E
     C                   END                                                       4<-E
      * WHEN SPLIT INVOICE/GIRO
     C                   ELSE                                                     3
N39  C     BETMAT        IFEQ      'B'
     C                   EXSR      DELTG
N36  C                   END                                                      3<-E
     C                   END                                                      3<-E
     C                   END                                                     2<-E
     C                   END                                                    1<-E
      *
N57  c     slgiro        tag
      *
     C                   ENDSR
      *
      ***********************************************
     C     DELTG         BEGSR
      ***********************************************
     C                   EXSR      KDTFM1
     C                   WRITE     SGIR
     C                   EXSR      KDTFM1
     C                   EXSR      MOD10
     C     UBBS          IFEQ      'A'
     C                   WRITE     SGIR2A
     C                   ELSE
     C     UBBS          IFEQ      'B'
      * FIX Z-SUPRESS FOR ALFA-FILED
     C                   MOVE      XTOTKR        ATOTKR
     C     1             DO        10            AX                2 0
     C     A(AX)         IFEQ      '0'
     C                   MOVE      ' '           A(AX)
     C                   ELSE
     C                   GOTO      SGIRT
     C                   END
     C                   END
     C     SGIRT         TAG
      *
     C                   WRITE     SGIR2B
     C                   ELSE
     C     UBBS          IFEQ      'C'
     C                   WRITE     SGIR2C
     C                   ELSE
     C     UBBS          IFEQ      'D'
     C                   WRITE     SGIR2D
     C                   ELSE
     C     UBBS          IFEQ      'E'
      * FIX Z-SUPRESS FOR ALFA-FILED
     C                   MOVE      XTOTKR        ATOTKR
     C     1             DO        10            AX                2 0
     C     A(AX)         IFEQ      '0'
     C                   MOVE      ' '           A(AX)
     C                   ELSE
     C                   GOTO      SGIRE
     C                   END
     C                   END
     C     SGIRE         TAG
      *
     C                   WRITE     SGIR2E
     C                   ELSE
      *
     C     UBBS          IFEQ      'F'
     C                   WRITE     SBGIR2F
      *
     C                   ELSE
     C                   WRITE     SGIR3
     C                   END
      *
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
      *
      ***********************************************
     C     BETSR         BEGSR
      ***********************************************
      *
      *** FINNER BETBET OG FORFALLSDATO
      *** INN ÅÅMMDD   UT DDMMÅÅ
     C     WSFDAT        IFEQ      *ZEROS
     C                   MOVE      *ZEROS        XFFDT             6 0
     C                   ELSE
     C                   MOVE      WSFDAT        XFFDT
     C                   END
     C                   MOVE      *BLANKS       BETTXT           30
     C                   CALL      'SYFA20A'
SV5  C*                    PARM           XFFDT
NV5  C     XFFDT         PARM      XFFDT         UFFDT             6 0
     C                   PARM                    BETTXT
     C                   PARM                    UFIRM
     C                   PARM                    BETBET
     C                   MOVE      XFFDT         KFFDT
      *
     C                   ENDSR
      *
      ******************************************
      *  MOD10     -    UTREGNING AV MOD-10 KONTROLLFELT (WBAK)
      *-----------------------------------------
     C     MOD10         BEGSR
     C                   MOVE      *ZEROS        UPAR21           21
     C                   MOVE      WKID          UPAR21
     C                   CALL      'SYGE09'
     C                   PARM                    UPAR21
     C                   PARM                    UMOD              1 0
     C                   MOVE      UMOD          XBAK              1 0
      * HENTER MODULUS TIL BELØP
     C   59              MOVE      *ZEROS        UPAR21           21
     C   59              MOVE      *ZEROS        UPAR19           19
     C   59              MOVE      XTOTKR        UPAR19
     C   59              MOVEL     UPAR19        UPAR21
     C   59              MOVE      XTOTØR        UPAR21
     C   59              CALL      'SYGE09'
     C                   PARM                    UPAR21
     C                   PARM                    UMOD              1 0
     C   59              MOVE      UMOD          KNYMOD            1
      *                                                                   D150
      *
N22   * KID AV LENGDE 8
      *
N22  C                   MOVEL     WKID          KID20            20
N22  C                   MOVE      XBAK          KID20
      *
     C                   SETOFF                                       62
N22  C     UFIRM         CHAIN(N)  FIRKID                             33
N22  C  N33              SETON                                        62
N22  C     *IN62         IFEQ      '1'
      *
N22  C*FINNES FRA FØR ? VED KOPI
      *
N22  C     *IN27         IFEQ      '1'
N22  C     KID20         CHAIN     KIDTRAN                            33
N22  C   33              SETOFF                                       62
N22  C  N33              MOVE      TRKI08        KID8              8
N22  C  N33              MOVE      KID8          KID8B             8
N22  C* ELSE IKKE KOPI
N22  C                   ELSE
N37  C     KID20         CHAIN     KIDTRAN                            33
N37  C  N33              MOVE      TRKI08        KID8              8
N37  C  N33              MOVE      KID8          KID8B             8
N37  C  N33              GOTO      UTKID
N22  C     UFIRM         CHAIN     FIRKID                             33
N22  C     *IN33         IFEQ      '0'
N22  C                   ADD       1             FIKID8
N22  C                   UPDATE    FIRKIDR
N22  C                   SUB       1             FIKID8
N22  C                   MOVE      *ZEROS        UPAR21           21
N22  C                   MOVE      FIKID8        UPAR21
N22  C                   CALL      'SYGE09'
N22  C                   PARM                    UPAR21
N22  C                   PARM                    UMOD              1 0
N22  C                   MOVEL     FIKID8        KID8              8
N22  C                   MOVE      UMOD          KID8
N22  C                   MOVE      KID8          KID8B             8
N22  C                   MOVE      KID8          TRKI08
N22  C                   MOVE      KID20         TRKI20
N22  C                   WRITE     KIDTRANR
N22  C                   END
N22  C                   END
N22  C                   END
     C*                                                                   D150
      *
S37  C*                    ENDSR
N37  C     UTKID         ENDSR
      *
      ******************************************                       ***
     C     AVDSR         BEGSR
      ******************************************
     C     KODTA9        CHAIN     KODTA                              33
     C                   MOVE      KOAKNR        WAKN
     C     KUND1K        CHAIN     CUNDL01                            33
     C  N33              DO
     C                   MOVE      KNAVN         XFNAVN           30
     C                   MOVE      ADR1          XFADR1           30
     C                   MOVE      ADR2          XFADR2           30
     C                   MOVE      POSTNR        XFPONR            4 0
     C                   MOVE      ADR3          XFADR3           24
     C                   MOVE      BANKG         XFBANK           15
     C                   END
      *
     C                   ENDSR
      *
     C***********************************************
     C     SØKDTA        BEGSR
     C***********************************************
     C     WSCLOC        DIV       256           LINNBR
     C                   MVR                     POSNBR
      *
     C                   Z-ADD     1             UFLAGG
     C     LINNBR        IFEQ      8
     C     POSNBR        ANDGE     37
     C     POSNBR        ANDLE     40
     C                   CALL      'SYFA14B'
     C                   PARM                    WSAVD
     C                   Z-ADD     9             LINNBR
     C                   Z-ADD     33            POSNBR
     C                   GOTO      SLSØK
     C                   END
      *
     C     LINNBR        IFEQ      9
     C     POSNBR        ANDGE     33
     C     POSNBR        ANDLE     40
     C                   MOVE      *BLANKS       USØKNV           30
     C                   CALL      'SOEKKUN'
     C                   PARM                    WSKN
     C                   PARM                    UFIRM
     C                   PARM                    USØKNV           30
     C                   Z-ADD     10            LINNBR
     C                   Z-ADD     33            POSNBR
     C                   GOTO      SLSØK
     C                   END
     C*
     C                   MOVE      'DIV1037'     MSGNR
     C                   SETON                                        30
     C*
     C     SLSØK         ENDSR
     C*
N59  C*******************************************************
N59  C     OPDXML        BEGSR
N59  C*******************************************************
N59  C                   MOVE      FIFIRM        XFFIRM
N67  C                   MOVEL     CPHONE        XFTYPE
N59  C                   MOVE      XFN           XFFN
N59  C                   MOVE      WAKN          XFKN
N59  C                   MOVE      'F'           XFFK
N59  C                   MOVE      UAVD          XFAVD
N59  C                   MOVE      'J'           XFSAML
N59  C                   MOVE      PVAL          XFVAL
N59  C                   MOVE      BETBET        XFBB
N59  C                   MOVE      BETTXT        XFBBT
N67  C*                  MOVEL     XFBANK        XFKT
N67  C                   MOVE      *BLANKS       XFBANK2
N67  C                   MOVE      *ZEROS        XN2               3 0
N67  C     1             DO        15            XN1               3 0
N67  C                   IF        ((XFB1(XN1) >= '0') AND (XFB1(XN1) <= '9'))
N67  C                   ADD       1             XN2
N67  C                   MOVE      XFB1(XN1)     XFB2(XN2)
N67  C                   END
N67  C                   ENDDO
N67  C                   MOVEL     XFBANK2       XFKT
N59  C                   EVAL      XFKID = WKID
N59  C                   EXSR      MOD10
N59  C                   CAT       KBAK:0        XFKID
N59  C                   MOVE      XBRUT         XFTOT
N59  C                   MOVE      MVAPRO        XFMS01
N59  C                   MOVE      PVAL          XFMV01
N59  C                   MOVE      XMVGR         XFMGN1
N59  C                   MOVE      XMVGR         XFMGV1
N59  C                   WRITE     XMLUFFR
N59   *
N59  C                   ENDSR
N59   *
      ***********************************************
     C     INIT          BEGSR
      ***********************************************
      *
     C     TUKEY2        KLIST
     C                   KFLD                    DITUAV
     C                   KFLD                    DITUR
      *
     C     KODTPK        KLIST
     C                   KFLD                    KOPUNI
     C                   KFLD                    UAVD
     C                   KFLD                    KOPLNR
     C                   MOVE      'P'           KOPUNI
     C     FREETK        KLIST
     C                   KFLD                    HEAVD
     C                   KFLD                    HEOPD
     C                   KFLD                    XXSKKO            1
sf7  C*                  KFLD                    XXFA00            6 0
nf7  C                   KFLD                    XXFA00            7 0
     C                   MOVEL     'LK'          YLKUNI            3
     C     LKKEY         KLIST
     C                   KFLD                    YLKUNI
     C                   KFLD                    SYLAND
     C     FAKTK         KLIST
     C                   KFLD                    FAAVD
     C                   KFLD                    FAOPD
     C                   KFLD                    FALI
     C     FAK8K         KLIST
     C                   KFLD                    HEAVD
     C                   KFLD                    HEOPD
     C                   KFLD                    XXFAKT
     C                   KFLD                    WAKN
S41  C*                    KFLD           WAVAL
N41  C                   KFLD                    WAVAL8
N41  C     *LIKE         DEFINE    WAVAL         WAVAL8
     C     *LIKE         DEFINE    FAFAKT        XXFAKT
     C     *LIKE         DEFINE    FAFAKT        YYFAKT
      *
     C     FAK8K2        KLIST
     C                   KFLD                    HEAVD
     C                   KFLD                    HEOPD
     C                   KFLD                    WSFN
     C     SORTK         KLIST
     C                   KFLD                    YSOLNR
     C                   KFLD                    YSAMM
     C                   KFLD                    YSOAVD
     C                   KFLD                    YSOOPD
     C                   KFLD                    YSOSK
     C     HEADFK        KLIST
     C                   KFLD                    HEAVD
     C                   KFLD                    HEOPD
     C     KODGEK        KLIST
     C                   KFLD                    YGEUNI
     C                   KFLD                    YVK
     C     KODG2K        KLIST
     C                   KFLD                    YG2UNI
     C                   KFLD                    YVK
     C     KODOTK        KLIST
     C                   KFLD                    YOTUNI
     C                   KFLD                    HEOT
     C     KODFRK        KLIST
     C                   KFLD                    YFRUNI
     C                   KFLD                    HEFR
     C     KODTHK        KLIST
     C                   KFLD                    YHUNI
     C                   KFLD                    UAVD
     C     KODTAK        KLIST
     C                   KFLD                    YAUNI
     C                   KFLD                    WSAVD
     C     KODTA9        KLIST
     C                   KFLD                    YAUNI
     C                   KFLD                    UAVD
     C     KODTÅK        KLIST
     C                   KFLD                    YÅUNI
SV5  C*                    KFLD           YDTMP
SV5  C*                    KFLD           YDTÅP
NV5  C                   KFLD                    YDTPC
NV5  C                   KFLD                    YDTPÅ
NV5  C                   KFLD                    YDTPM
N27  C     ECMKEY        KLIST
N27  C                   KFLD                    UFIRM
N27  C                   KFLD                    KUNDNR
N27  C                   KFLD                    WCSR
N27  C                   KFLD                    WC0065
N27  C     *LIKE         DEFINE    ECSR          WCSR
N27  C     *LIKE         DEFINE    EC0065        WC0065
N27  C                   MOVEL     'S'           WCSR
N27  C                   MOVEL     'INVOIC'      WC0065
     C     HODEK         KLIST
     C                   KFLD                    YNET
     C                   KFLD                    UAVD
     C     KUND1K        KLIST
     C                   KFLD                    UFIRM
     C                   KFLD                    WAKN
     C     KUNVAK        KLIST
     C                   KFLD                    XXUNIK
     C                   KFLD                    WAKN
     C                   KFLD                    WAVAL
     C     DELKEY        KLIST
     C                   KFLD                    WAKN
     C                   KFLD                    WAVAL
     C                   KFLD                    WAAVD
     C                   KFLD                    WAOPD
     C     CUFLDK        KLIST
     C                   KFLD                    KUNDNR
     C                   KFLD                    UDOKUM
     C     KODTWK        KLIST
     C                   KFLD                    KOWUNI
     C                   KFLD                    UAVD
     C     SUMKEY        KLIST
     C                   KFLD                    WGUNIK
     C                   KFLD                    WGVK
     C                   KFLD                    WGKDM
     C                   MOVEL     ZJOBNR        WGUNIK
     C     FRIKEY        KLIST
     C                   KFLD                    HEAVD
     C                   KFLD                    HEOPD
     C                   KFLD                    YFSKOD            3
N29  C     LGS06K        KLIST
N29  C                   KFLD                    XFN
N29  C                   KFLD                    WGVK
      *
N19  C     KOVKEY        KLIST
N19  C                   KFLD                    KOVUNI
N19  C                   KFLD                    SAAVD
N55  C     EPOKEY        KLIST
N55  C                   KFLD                    UFIRM
N55  C                   KFLD                    mail30
N55  C                   KFLD                    SAKN
N59  C     CUNDC03K      KLIST
N59  C                   KFLD                    UFIRM
N59  C                   KFLD                    XCTYPE           30
N59  C                   KFLD                    SAKN
N59  C                   EVAL      XCTYPE = '*XML FAKTURA SAM'
      *
      * fix key for epostmottager
      *
N55  C     'fs'          CHAIN     ARKTXT                             33
N55  C  N33ARKSND        IFEQ      'J'
N55  C                   MOVE      ARTXT         MAIL16           16
N55  C                   MOVEL     '*'           MAIL16
N55  c                   movel     MAIL16        mail30           30
N55  c                   end
      *
      *
N19  C                   MOVE      'V'           KOVUNI
N46  C     KODWKY        KLIST
N46  C                   KFLD                    FIFIRM
N46  C                   KFLD                    WMVAKD
N46  C                   KFLD                    SOKDM
N43  C                   MOVE      *BLANKS       WMVAKD            2
      *
N09  C                   MOVE      ' '           BLANK1            1
     C                   MOVE      'W'           KOWUNI
N18  C                   MOVE      '********'    CPYTXT
     C     KODTWK        CHAIN     KOWR                               33
     C     KOWKOM        COMP      'J'                                    59
      *
      * SKAL GIRO SKRIVES
      *
     C     UBBS          COMP      'N'                                    35
     C  N35KOWAWB        COMP      'J'                                    35
      *
      *
     C     *ENTRY        PLIST
     C                   PARM                    UPRANT            2
     C                   PARM                    UIN01             1
N20  C                   PARM                    UFNKOP            6 0
N55  C                   PARM                    UEMAIL            1
      *
N55  C     UEMAIL        IFEQ      'J'
N55  C                   MOVEL     EPOTXI        EPOTXT
N55  C                   END
      *
      * 27 ON=KOPI..
      *
     C     UIN01         COMP      '1'                                    27
      *
     C                   MOVEL     'SAMLEF.S'    UDOKUM           10
     C                   MOVE      'PE'          UDOKUM
     C                   MOVEL     ZJOBNR        XXUNIK            6 0
      * Tøm WSAML for poster denne job/WS
     C                   EXSR      DELW
      *
     C                   MOVE      ' '           YSK               1
     C                   MOVE      *ZEROS        YOPD              5 0
     C                   MOVE      ' '           YST               1
     C                   MOVE      '<'           HAKE              1
     C                   Z-SUB     1             YSOLNR            3 0
     C                   MOVE      ' '           YSAMM             1
     C                   MOVE      *ZEROS        YSOAVD            4 0
     C                   MOVE      *ZEROS        YSOOPD            5 0
     C                   MOVE      ' '           YSOSK             1
     C                   MOVE      *ZEROS        YSKKN             8 0
     C                   MOVE      *ZEROS        YSKPOS            4 0
     C                   MOVE      'GE'          YGEUNI            2
     C                   MOVE      *BLANKS       YVK               3
     C                   MOVE      'G2'          YG2UNI            2
     C                   MOVE      'OTY'         YOTUNI            3
     C                   MOVE      'FR'          YFRUNI            2
     C                   MOVE      'H'           YHUNI             1
     C                   MOVE      'A'           YAUNI             1
     C                   MOVE      'Å'           YÅUNI             1
     C                   MOVE      *BLANKS       YNET              1
     C                   MOVE      *ZEROS        XPRANT            2 0
     C                   MOVE      *ZEROS        KUNDNR
     C                   MOVE      *ZEROS        TEFFNR
     C                   MOVE      *ZEROS        XNULL
     C                   MOVEL     'F A K T '    XF2NV            16
     C                   MOVE      'U R A   '    XF2NV
     C                   MOVEL     'I N V O '    XF2NV2           16
     C                   MOVE      'I C E   '    XF2NV2
SV5  C*                    MOVELUMONTH    IDMMDD  40
SV5  C*                    MOVE UDAY      IDMMDD
SV5  C*                    MOVE IDMMDD    IDAG    60
SV5  C*                    MOVELUYEAR     IDAG
NV5  C     UYEAR         IFGT      50
NV5  C     UYEAR         ADD       1900          IDAGÅ
NV5  C                   ELSE
NV5  C     UYEAR         ADD       2000          IDAGÅ
NV5  C                   END
NV5  C                   MOVE      UMONTH        IDAGM
NV5  C                   MOVE      UDAY          IDAGD
SV5  C*                    MOVE UYEAR     IDMMDD
SV5  C*                    MOVE IDMMDD    IDAGX   60
SV5  C*                    MOVELUDAY      IDAGX
NV5  C                   MOVE      UYEAR         IDAGXÅ
NV5  C                   MOVE      UMONTH        IDAGXM
NV5  C                   MOVE      UDAY          IDAGXD
SV5  C*                    MOVE *ZEROS    YDTÅP
SV5  C*                    MOVE *ZEROS    YDTMP
NV5  C                   MOVE      *ZEROS        YDTPC             2 0
NV5  C                   MOVE      *ZEROS        WSPER
     C                   MOVEL     '2BD10601'    XW77             16
     C                   MOVE      '00000154'    XW77
     C                   MOVEL     '2BD10601'    XW66             16
     C                   MOVE      '00000277'    XW66
     C                   MOVE      *ZEROS        WSFDAT
N28  C                   MOVE      *ZEROS        CBRUTT
N15JOC                   MOVE      *ZEROS        FADATO
      *
sf7  C*                  READ(N)   FIRM                                   33
nf7  C                   READ      FIRM                                   33
     C     FITAX         MULT      100           MVAPRO            4 2
     C                   MOVE      FITAX         FITAXB            4 4
     C*
     C* HENTER HEADINGTEKST TIL SPESIFIKASJONEN
     C*
     C                   Z-ADD     19            KOPLNR
N09  C                   Z-ADD     1             ANTKOS            2 0
     C     KODTPK        CHAIN     KOPR                               42
      * ikke printerstyring ved fax etc
n47  c     uhod          ifeq      'F'
N50  C                   SETON                                        68
N47  c                   move      *blanks       KOPFM
N47  c                   end
     C  N42KOPFM         IFNE      *BLANKS
     C     KOPFM         SETLL     KODTFM
N09  C*SIDE 1
     C     KOPFM         READE     KODTFM                                 42
     C  N42              MOVE      KFMT1         SFMT1            75
     C  N42              MOVE      KFMT2         SFMT2            75
N09  C*SIDE 2
     C     KOPFM         READE     KODTFM                                 42
N09  C  N42              Z-ADD     2             ANTKOS            2 0
N09  C  N42              MOVE      KFMT1         SFMT12           75
N09  C  N42              MOVE      KFMT2         SFMT22           75
N09  C                   END
     C*
     C* GÅR I RUNDER FOR LASERLOGIKK FOR SELVE FAKTURAEN
     C*
     C                   Z-ADD     4             KOPLNR
     C                   Z-ADD     0             ANTKOP            5 0
N44  C                   MOVE      *BLANKS       KFMT1
N44  C                   MOVE      *BLANKS       KFMT2
     C     KODTPK        CHAIN     KOPR                               42
N09  C     KOPLPI        COMP      8                                      60
N09  C     KOPLAS        COMP      'J'                                    61
N09  C  N61KOPLAS        COMP      'A'                                    61
N65  C  N61KOPLAS        COMP      'P'                                    61
N09  C     KOPLAS        COMP      'A'                                    63
N65  C     KOPLAS        COMP      'P'                                    64
N66   *
N66   * KIDLINJE
N66   *
N66  C     KOWAWB        COMP      'K'                                    65
N44  C     UHOD          IFEQ      'F'
N47  c                   move      *blanks       KOPFM
N44  C                   SETOFF                                       606163
N44  C                   END
     C     KOPFM         IFEQ      *BLANKS
     C                   SETON                                        42
     C                   Z-ADD     1             ANTKOP
     C                   END
      * FINN ANT KOPIER (POSTER I KODTFM) FOR Å KUNNE SLETTE I SISTE..
     C  N42              DO
      *
      * HENTER OCRSTYRING FØR OG ETTER H-LINJEN
      *
N16  C     KOPFM         IFNE      *BLANKS
N16  C     KOPFM         CHAIN     KODTFM                             42
N16  C  N42KFMOCR        IFNE      *BLANKS
N16  C     KFMOCR        CHAIN     KODTFM                             42
N16  C  N42              MOVE      KFMT1         OCRF             75
N16  C  N42              MOVE      KFMT2         OCRE             75
N16  C                   END
N16  C                   END
N16   *
     C     KOPFM         SETLL     KODTFM
     C     STFM0         TAG
     C     KOPFM         READE     KODTFM                                 42
     C  N42              ADD       1             ANTKOP
     C  N42              GOTO      STFM0
     C     ANTKOP        IFEQ      0
     C                   Z-ADD     1             ANTKOP
     C                   END
     C                   END
      *
      * HENT EGEN (BESTILLENDE) AVDELINGS  NAVN. OG GIRONR.
     C                   EXSR      AVDSR
      *
     C     KODTHK        CHAIN     KODTH                              33
     C     KOHFAK        COMP      'J'                                    47
      * Koden for hode kan være J(topp/bunntekst), T(kuntopp)
      * B(kun bunn) - videre setninger setter indikator (PRTF)
     C     UHOD          IFEQ      'J'
N44  C     UHOD          OREQ      'F'
     C                   SETON                                        4446
     C                   ELSE
     C     UHOD          IFEQ      'T'
     C                   SETOFF                                       44
     C                   SETON                                        46
     C                   ELSE
     C     UHOD          IFEQ      'B'
     C                   SETON                                        44
     C                   SETOFF                                       46
     C                   END
     C                   END
     C                   END
      *
      * Henter hode i alle språkvarianter
     C   44
     COR 46
     COR 47              DO
      *** 44 PÅ SKRIVER UT BUNN     46 PÅ SKRIVER UT TOPP
N44  C     UHOD          IFNE      'F'
     C     HODEK         CHAIN     HODE                               33
N44  C                   ELSE
s53  C*    HODEK         CHAIN     HODE                               33
N44  C     HODEK         CHAIN     HODEFAX                            33
N53  C   33HODEK         CHAIN     HODE                               33
N44  C                   END
     C  N33              MOVE      HP            HO
N66  C  N33              MOVE      HOSTFR        XHOSTN            2
     C                   MOVEL     'E'           YNET
N44  C     UHOD          IFNE      'F'
     C     HODEK         CHAIN     HODE                               33
N44  C                   ELSE
s53  C*    HODEK         CHAIN     HODE                               33
N44  C     HODEK         CHAIN     HODEFAX                            33
N53  C   33HODEK         CHAIN     HODE                               33
N44  C                   END
     C  N33              MOVE      HP            HE
N66  C  N33              MOVE      HOSTFR        XHOSTE            2
     C                   MOVEL     'T'           YNET
N44  C     UHOD          IFNE      'F'
     C     HODEK         CHAIN     HODE                               33
N44  C                   ELSE
s53  C*    HODEK         CHAIN     HODE                               33
N44  C     HODEK         CHAIN     HODEFAX                            33
N53  C   33HODEK         CHAIN     HODE                               33
N44  C                   END
     C  N33              MOVE      HP            HT
N66  C  N33              MOVE      HOSTFR        XHOSTT            2
     C                   END
      *
      * OPPDATER TURNR/DATO PÅ ALLE OPPDRAG
     C                   CALL      'SYFA27D'
      *
     C                   MOVE      ' '           GMSPK             1            Ant. Sp.kop?
     C                   Z-ADD     1024          UCMDL            15 5
      *
N63  C                   Z-ADD     0             FADAFF
     C                   ENDSR
      *
      *
      ***********************************************
     C     KDTFM1        BEGSR
      ***********************************************
SV5  C*                    MOVE XFFDT     XKDTFM  40
SV5  C*                    MOVELXFFDT     UDT1    20
SV5  C*                    MOVELXKDTFM    UDT2    20
SV5  C*                    MOVE XKDTFM    UDT3    20
NV5  C                   MOVE      XFFDTD        UDT1              2 0
NV5  C                   MOVE      XFFDTM        UDT2              2 0
NV5  C                   MOVE      XFFDTÅ        UDT3              2 0
     C                   EXSR      KDTFMT
SV5  C*                    MOVELUDT1      XFFDT
SV5  C*                    MOVELUDT2      XKDTFM
SV5  C*                    MOVE UDT3      XKDTFM
SV5  C*                    MOVE XKDTFM    XFFDT
NV5  C                   MOVE      UDT1          XFFDTD
NV5  C                   MOVE      UDT2          XFFDTM
NV5  C                   MOVE      UDT3          XFFDTÅ
      *
SV5  C*                    MOVE XDT       XKDTFM
SV5  C*                    MOVELXDT       UDT1
SV5  C*                    MOVELXKDTFM    UDT2
SV5  C*                    MOVE XKDTFM    UDT3
NV5  C                   MOVE      HEDTD         UDT1
NV5  C                   MOVE      HEDTM         UDT2
NV5  C                   MOVE      HEDTÅ         UDT3
     C                   EXSR      KDTFMT
SV5  C*                    MOVELUDT1      XDT
SV5  C*                    MOVELUDT2      XKDTFM
SV5  C*                    MOVE UDT3      XKDTFM
SV5  C*                    MOVE XKDTFM    XDT
NV5  C                   MOVE      UDT1          XEDTOD
NV5  C                   MOVE      UDT2          XEDTOM
NV5  C                   MOVE      UDT3          XEDTOÅ
      *
     C                   ENDSR
      *
N08   ***********************************************
N08  C     KDTFM2        BEGSR
N08   ***********************************************
N08  C                   MOVE      HEDTD         UDT1
N08  C                   MOVE      HEDTM         UDT2
N08  C                   MOVE      HEDTÅ         UDT3
N08  C                   EXSR      KDTFMT
N08  C                   MOVE      UDT1          XEDTOD
N08  C                   MOVE      UDT2          XEDTOM
N08  C                   MOVE      UDT3          XEDTOÅ
N08   *
N08  C                   ENDSR
N08   *
      ***********************************************
     C     KDTFMT        BEGSR
      ***********************************************
     C                   CALL      'DATOFMT'
     C                   PARM                    UDT1
     C                   PARM                    UDT2
     C                   PARM                    UDT3
      *
     C                   ENDSR
      ***********************************************
     C     XDTFMT        BEGSR
      ***********************************************
     C                   MOVE      WSFDAD        UDT1              2 0
     C                   MOVE      WSFDAM        UDT2              2 0
     C                   MOVE      WSFDAA        UDT3              2 0
     C                   EXSR      KDTFMT
     C                   MOVE      UDT1          WSFDAD
     C                   MOVE      UDT2          WSFDAM
     C                   MOVE      UDT3          WSFDAA
      *
     C                   ENDSR
      *
      *
      ***********************************************
     C     TESTEQ        BEGSR
      ***********************************************
     C     STEQ          TAG
     C                   READ      SORT                                   33
     C   33              DO
     C     *LOVAL        SETLL     SORT
     C                   READ      SORT                                   33
     C                   GOTO      UTEQSR
     C                   END
      *
     C     XOKDM         IFEQ      SOKDM
     C     XOSAMM        IFNE      ' '
     C     XOSAMM        IFEQ      SOSAMM
     C                   ADD       SOBELN        XOBELN
     C                   ADD       SOBELV        XOBELV
     C                   DELETE    SORTR
     C                   GOTO      STEQ
     C                   END
     C                   END
     C     XOVK          IFEQ      SOVK
     C     XOVT          IFEQ      SOVT
N25  C     SOSAMM        ANDEQ     ' '
     C                   ADD       SOBELN        XOBELN
     C                   ADD       SOBELV        XOBELV
     C                   DELETE    SORTR
     C                   GOTO      STEQ
     C                   ELSE
     C                   GOTO      UTEQ
     C                   END
     C                   ELSE
     C                   GOTO      UTEQ
     C                   END
     C                   ELSE
     C                   GOTO      UTEQ
     C                   END
     C     UTEQ          TAG
     C                   READP     SORT                                   33
     C     UTEQSR        TAG
     C                   Z-ADD     XOBELN        SOBELN
     C                   Z-ADD     XOBELV        SOBELV
     C                   ENDSR
      ***********************************************
     C     FRILIN        BEGSR
      ***********************************************
      * FRIE SØKEVEIER (KUN DE SOM HAR DOK.KODE LIK K/S/X  EL B)
      * SKRIVES IKKE!! NÅR KUNDEN HAR SPESIALLAYOUT(SPESIFIKE FELT)
      * (DA KAN JO INNTIL 5 FRIE SØKEV. INNGÅ I SPESIALEN-BLIR DOBBELT)
     C                   MOVE      *BLANKS       FSFORI
     C     *LIKE         DEFINE    FSKODE        FSFORI
     C     PROFI2        IFNE      'J'
     C     HEADFK        SETLL     FRISOK
     C     HEADFK        READE     FRISOK                                 91
     C     *IN91         DOWEQ     '0'
     C                   SORTA     DFS
     C     DFS(10)       IFNE      ' '
     C     XXSKKO        LOOKUP    DFS                                    91
     C  N91'B'           LOOKUP    DFS                                    91
     C     *IN91         IFEQ      '1'
     C     FSKODE        CHAIN     KODFRI                             91
     C     *IN91         IFEQ      '0'
     C     FSKODE        IFEQ      FSFORI
     C                   MOVE      *BLANKS       KFSOTX
     C                   END
     C                   MOVE      FSKODE        FSFORI
      * OVERFLOW??
     C   90              DO
     C                   SETON                                        88
     C                   WRITE     KJØP1
     C                   ADD       1             PAGEPS
     C                   EXSR      KDTFM1
     C                   WRITE     KJØP
     C                   EXSR      KDTFM1
     C     PROFIL        IFEQ      'J'
     C     CPSPH1        IFNE      *BLANKS
     C                   WRITE     KJØPH1                                            ..PS
     C                   END
     C     CPSPH2        IFNE      *BLANKS
     C                   WRITE     KJØPH2                                            ..PS
     C                   END
     C     CPSPH3        IFNE      *BLANKS
     C                   WRITE     KJØPH3                                            ..PS
     C                   END
     C                   END
     C                   WRITE     KJØPHX
     C                   SETOFF                                       90
     C                   END
     C                   WRITE     KJØPFS
     C                   END
     C                   END
     C                   END
     C*
     C     HEADFK        READE     FRISOK                                 91
     C                   END
     C                   END
      *
      * FRIE LINJER OPPDRAG
      *
      *
     C   27              MOVE      XFN           XXFA00
     C  N27              MOVE      *ZEROS        XXFA00
     C     FREETK        SETLL     FREETXT2
     C     FRIST         TAG
     C     FREETK        READE     FREETXT2                               91
     C  N91              DO
     C  N27              MOVE      XFN           FRTFAK
     C                   UPDATE    FREETXTR
     C   90              DO
     C                   SETON                                        88
     C                   WRITE     KJØP1
     C                   ADD       1             PAGEPS
     C                   EXSR      KDTFM1
     C                   WRITE     KJØP
     C                   EXSR      KDTFM1
     C     PROFIL        IFEQ      'J'
     C     CPSPH1        IFNE      *BLANKS
     C                   WRITE     KJØPH1                                            ..PS
     C                   END
     C     CPSPH2        IFNE      *BLANKS
     C                   WRITE     KJØPH2                                            ..PS
     C                   END
     C     CPSPH3        IFNE      *BLANKS
     C                   WRITE     KJØPH3                                            ..PS
     C                   END
     C                   END
     C                   WRITE     KJØPHX
     C                   SETOFF                                       90
     C                   END
     C                   WRITE     KJØP3
     C                   GOTO      FRIST
     C                   END
     C                   ENDSR
N03   *
N03  C***********************************************
N03  C     TTSR          BEGSR
N03  C***********************************************
N03  C                   MOVE      HEAVD         TTAVD
N03  C                   MOVE      HEOPD         TTOPD
N03  C                   TIME                    XULTID
N03  C                   MOVE      XULDD         ULDD
N03  C                   MOVE      XULMM         ULMM
N03  C                   MOVE      XULÅÅ         ULÅÅ
N03  C                   MOVE      'INV'         TTACTI
N03  C                   MOVE      ULDT          TTDATE
N03  C                   MOVE      XULTM         TTTIME
N38  C                   MOVE      TTDATE        TTDATL
N38  C                   MOVE      TTTIME        TTTIML
N03  C                   MOVE      ZUSER         TTUSER
N03  C                   MOVEL     'Invoiced'    TTINT1
N03  C                   MOVE      ':'           TTINT1
N03  C                   MOVE      KNAVN         TTINVN
N03  C                   MOVE      'INVNBR:'     TTINT2
N03  C                   MOVE      FIFN          TTINVR
N03  C                   WRITE     TRACKFR
N03  C                   ENDSR
N03  C*
      *
N57  C*******************************************************
N57  C     KIDGIR        BEGSR
N57  C*******************************************************
N57  C                   MOVE      *BLANKS       kidtxt            4
N57  C                   MOVE      *BLANKS       LIN20
N57  C                   MOVE      *BLANKS       GIRO20
N57  C     XVAL          CHAIN     bagiro                             33
N57  C     *IN(33)       IFEQ      '1'
N57  C     KOWBBS        IFNE      ' '
N57  C                   MOVE      'KID:'        kidtxt
N57  C                   EXSR      MOD10
N57  C  N62              MOVEL     KWKID         LIN20
N57  C  N62              MOVE      KBAK          LIN20
N57  C   62              MOVEL     KID8          LIN20
N57  C                   end
N57  C                   MOVEL     'KONTONR:'    IBATXT            8
N57  C                   MOVEL     XFBANK        GIRO20
N57  C                   ELSE
N57  C                   MOVEL     'SWIFT:'      LIN20
N57  C                   MOVEL     'IBAN NO:'    IBATXT
N57  C                   MOVE      BASWIF        LIN20
N57  C                   MOVEL     BAGIRN        GIRO20
N57  C                   END
N57  C  N73              WRITE     KIDLIN
N65  C   64              write     cvrpa2
N57  C                   ENDSR
N66  C*******************************************************
N66  C     FRISR         BEGSR
N66  C*******************************************************
N66  C     KODFTK        KLIST
N66  C                   KFLD                    XXSTKO            2
N66  C
N66  C* Standardtekst for kunde = 1. prioritet
N66  C     SYFR03        IFNE      *BLANKS
N66  C                   MOVE      SYFR03        XXSTKO
N66  C                   END
N66  C* Standardtekst for avdeling = 2. prioritet
N66  C*          - ULIKE FELT ALT ETTER SPRAAKKODE
N66  C     XXSTKO        IFEQ      *BLANKS
N66  C                   MOVE      HOSTFR        XXSTKO
N66  C     SPRAAK        IFEQ      'E'
N66  C                   MOVE      XHOSTE        XXSTKO
N66  C                   ELSE
N66  C     SPRAAK        IFEQ      'T'
N66  C                   MOVE      XHOSTT        XXSTKO
N66  C                   ELSE
N66  C                   MOVE      XHOSTN        XXSTKO
N66  C                   END
N66  C                   END
N66  C                   END
N66  C* Standardtekst for firma = 3. prioritet
N66  C*          - ULIKE FELT ALT ETTER SPRAAKKODE
N66  C     XXSTKO        IFEQ      *BLANKS
N66  C     SPRAAK        IFEQ      'E'
N66  C                   MOVE      FISTFE        XXSTKO
N66  C                   ELSE
N66  C     SPRAAK        IFEQ      'T'
N66  C                   MOVE      FISTFE        XXSTKO
N66  C                   ELSE
N66  C                   MOVE      FISTFN        XXSTKO
N66  C                   END
N66  C                   END
N66  C                   END
N66  c     xxstko        ifne      *blanks
N66  C     KODFTK        SETLL     KODTFT
N66  C     KODFTK        READE     KODTFT                                 33
N66  C     *IN(33)       DOWEQ     '0'
N66  C                   write     prtfri
n66  c                   add       1             xant
N66  C     KODFTK        READE     KODTFT                                 33
N66  C                   END
N66  C                   END
N66  C                   ENDSR
N66  C*******************************************************
N66  C     TSTBRU        BEGSR
N66  C*******************************************************
N66   *
N66   * Sideskift kort/lang faktura...
N66   *
N66  C* N35N60   XANT      COMP 19                   88
N66   *
N66   * GIRO - IKKE 8LPI - IKKE LASER
N66  C  N35
n66  CANN60
N66  CANN61XANT          COMP      19                                 88        6 LPI/72-LIN
N66   *
N66   * GIRO - IKKE 8LPI - LASER
N66  C  N35
N66  CANN60
N66  CAN 61XANT          COMP      16                                 88        6 LPI/LASER
N66   *
N66   * GIRO - 8LPI
n66  C  N35
N66  CAN 60XANT          COMP      24                                 88        8 LPI
N66   *
N66   *  IKKE GIRO
N66  C   35XANT          COMP      33                                 88        FULL A4
N66   *
N66   *  KIDLINJEFAKTURA
N66  C   65XANT          COMP      33                                 88        FULL A4
N66  C                   ENDSR
N46  C***********************************************
N46  C     MOMSKD        BEGSR
N46  C***********************************************
N46  C     KODWKY        CHAIN     KODWL01                            84
N46  C     *IN84         IFEQ      *OFF
N46  C     MVAAVI        ANDNE     *ZERO
N46  C*                  Z-ADD     MVAAVI        WITAX
N46  C                   MOVE      *ON           *IN34
N46  C                   ENDIF
N46  C                   ENDSR
N46  C*
N46  C*
N46  C***********************************************
N46  C     MVAPST        BEGSR
N46  C***********************************************
N46  C* finn momskode her
N46  C                   MOVE      FADATO        FADAMO            8 0
N46  C                   MOVE      FITAX         FITAXB
N46  C*                  MOVE      FITAX         PRITAX
N46  C     FITAXD        IFNE      *ZEROS
N46  C     FITAX2        ANDNE     *ZEROS
N46  C     FADAMO        ANDLT     FITAXD
N46  C     FADAMO        ANDNE     *ZEROS
N46  C                   MOVE      FITAX2        FITAXB
N46  C                   END
N46  C     KODWKY        CHAIN     KODWL01                            84
N46  C     *IN84         IFEQ      *OFF
N46  C     MVAAVI        DIV       100           FITAXB
N46  C                   ENDIF
N46  C*
N46  C                   Z-ADD     1             XX
N46  C     XPFNOK        MULT(H)   FITAXB        MVA
N46  C     XPFNOK        MULT(H)   FITAXB        WSMVN             8 0
N46  C     XPFNOK        MULT(H)   FITAXB        WSMVV             8 0
N46  C*
N46  C                   Z-ADD     1             XX                2 0
N46  C     TMVA          TAG
N46  C     WSMVAK(XX)    IFEQ      ' '
N46  C     WSMVAK(XX)    OREQ      SOKDM
N46  C                   MOVEL     SOKDM         WSMVAK(XX)
N46  C     FITAXB        MULT      100           WSMVAP(XX)
N46  C                   ADD       FABELN        WSMVAG(XX)
N46  C                   ADD       WSMVN         WSMVAN(XX)
N46  C                   ADD       WSMVV         WSMVAV(XX)
N46  C                   ELSE
N46  C                   ADD       1             XX
N46  C                   GOTO      TMVA
N46  C                   ENDIF
N46  C*>                 MOVEL     SOKDM         XMVAK
N46  C*
N46  C**>                ADD       WSMVAN(1)     WSMVTN
N46  C**>                ADD       WSMVAV(1)     WSMVTV
N46  C*
N46  C                   ENDSR
     OFAKTR     E            OPDFAK
     O                       FAOPKO
     O                       FAKDA
     O                       FAKUNR
     O                       FAFAKT
     O                       FACC
     O                       FAÅR
     O                       FAMND
     O                       FADATO
     O                       FADAFF
     O                       FACURI
