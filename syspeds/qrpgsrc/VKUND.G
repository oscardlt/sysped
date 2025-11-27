*****F**************************************************************
      *
      ***********************************************************
      *** PROGRAM SKAL VEDLIKEHOLDE KUNDER (SPEDISJON)        ***
      *** INDIKATORER 01 - 26 KUN CMD-TASTER / ROLL TASTER    ***
      *** LEDIGE INDIKATORER 01 02 05 07-09 11 13-24          ***
      *** LEDIGE INDIKATORER 28 39 32 37-89                   ***
      ***********************************************************
      * BRUK AV NOEN SENTRALE INDIKATORE....                    *
      * 27 ON = I SAD-MODUL, KUNDEN FINNES IKKE!!! I L1.        *
      *         KAN LAGE NYE (NR ANGIS PÅ INNGANG)              *
      * 27 OFF= ORDINÆR SYSPED, NORMALT MÅ!! KUNDEN FINNES I L1!*
      * 28 ON = (NÅR 27 OFF) TILLATT Å OPPRETTE "ADRESSE-KUNDER"*
      * 29 ON = (NÅR 27 OFF) ER I FERD MED Å OPPRETTE/ENDRE     *
      *         EN ADRESSEKUNDE (-> AKTKOD -> I)                *
      ***********************************************************
      *
*****F**************************************************************
      * RETTINGER I DETTE PROGRAM:
PTFnrF*Sek Sig Vers Beskrivelse...........................
"""""F*"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
PXXXXF* 01 SH  VER5 SØKING ZIP-KODE   ......
PXXXXF* 02 JOV VER5 MISTET L1-SAMLEFAKTKODE NÅR FMOT VAR UTFYLT
P0504F* 03 CB  PTF5 VEDLIKEHOLD KONTAKTPERSONER
PXXXXF* 04 CB  PTF5 VEDLIKEHOLD KUNDES OPPDRAGSTILLEGG
PXXXXF* 05 YBC PTF5 F15=VEDLIKEHOLD AV MILJØAVGIFT
P0508F* 06 SH  PTF5 AVTALEKUNDENUMMER/EPOSTADRESSE LAGT TIL
P0508F* 07 JOV PTF5 KAN LEGGE INN REN "ADRESSE-KUNDE"
P0510F* 08 YBC PTF5 LENGDE PÅ ADRESSENR ER ØKT FRA 3.0 TIL 5.0
P0XXXF* 09 SH  PTF5 TAR LØSNING 1 SELGERKODE OVER
P0XXXF* 10 JOV PTF5 HVIS CI2000 ER INSTALLERT - NYE/ENDREDE TIL LOGGFIL
P0XXXF* 11 SH  PTF5 RETTELSE TIL 10
P0414F* 12 SH  PTF5 NUMMER-TELLER FOR ADRESSEKUNDER INNFØRT
P0XXXF* 13 YBC PTF6 HENT OGSÅ NAVN TIL KONTAKTPERSON
P0XXXF* 14 SH  PTF6 UTVIDET SØKING
P0XXXF* 15 SH  PTF6 FEIL VED UTENLANDS POSTNUMMER
P0607F* 16 SH  PTF6 RETTELSER M.H.T NY LØSNING1
P0XXXF* 17 SH  PTF7 SECURED UNSECURED PÅ FLYSIDEN
*****F**************************************************************
      *
     FKUNDL01   UF A E           K DISK
     FCUNDL01   UF A E           K DISK
     F                                     RENAME(KUNDR:CUNDR)
     FKODTLIK   IF   E           K DISK
     FVADR      UF A E           K DISK
N10  FCI2KUN    UF A E           K DISK
     FVALUL01   IF   E           K DISK
     FFIRM      IF   E           K DISK
N12  FFIRKU     UF   E           K DISK
     FCUSAPR    IF   E           K DISK
N01  FSTED2D2   IF   E           K DISK
     FCUSAAV    IF   E           K DISK
     FVKUNDFM   CF   E             WORKSTN
     F                                     INFDS(FBAREA)
N03  FCUNDC01   IF A E           K DISK
N14  D FBAREA          DS
N14  D  WSCLOC               370    371B 0
N14  D  WSSUBN               378    379B 0
     D                 DS
     D  WSKN1                  1      5  0
     D  WSKN2                  6      7  0
     D  WSKONT                 1      7  0
N16  D                 DS
N16  D  SYBAGI                 1     15
N16  D  BANKG                  1     35
N16  D                 DS
N16  D  SYPOGI                 1     20
N16  D  POSTG                  1     35
     D                 DS
     D  SYRG                   1     14
     D  SYFORE                 1      9
     IKUNDR
     I              SFAKT                       SFAKTK
N16  ICUNDR
N16  I              BANKG                       SYBAGI
N16  I              POSTG                       SYPOGI
      *
     C                   EXSR      INIT
     C     KUNDNR        IFNE      *ZEROS
     C                   Z-ADD     KUNDNR        WSKNR
     C                   SETOFF                                       33
     C  N27KUND1K        CHAIN     KUNDL01                            33
     C  N33KUND1K        CHAIN     CUNDL01                            34
     C  N33
     CANN34
     CANN27KUND1K        CHAIN     KUNDL01                            33
     C  N33
     CANN34              UPDATE    CUNDR
      * SKRIVER RECORD TIL KUNDEREGISTER SYSPED
     C  N33
     CAN 34              MOVE      SFAKTK        SFAKT
     C  N33
     CAN 34              MOVE      FIFIRM        FIRMA
     C  N33
     CAN 34              WRITE     CUNDR
     C  N33
N10  CAN 34FICI2         IFEQ      'J'
N10  C                   MOVE      'N'           XNDKO1                           NY!!
N10  C                   END
     C  N33              GOTO      SSSS
     C   33              GOTO      SLUTT
     C                   END
     C*
     C     START         TAG
     C                   EXFMT     BILDE01
     C                   SETOFF                                       3099
     C*
     C   03              GOTO      SLUTT
     C   04              DO
     C                   EXSR      SØKUNR
     C                   GOTO      START
     C                   END
     C*
     C     SSSS          TAG
     C                   EXSR      TESTB1
     C   99              GOTO      START
N06   * GJØR TEST FOR Å FINNE KUNDENAVN TIL ANDRE PARTER
N06  C                   EXSR      TESTB2
     C*
     C     START2        TAG
N07  C     *IN31         IFEQ      '1'
N07  C                   MOVEA     '11'          *IN(35)
N07  C                   MOVE      *BLANKS       INACT
N07  C                   ELSE
N07  C     AKTKOD        IFEQ      'I'
N07  C                   MOVEL     'INACTIVE'    INACT
N07  C                   ELSE
N07  C                   MOVE      *BLANKS       INACT
N07  C                   END
N07  C                   END
     C                   EXFMT     BILDE02
N14  C     WSCLOC        DIV       256           LINNBR
N14  C                   MVR                     POSNBR
     C                   SETOFF                                       309899
     C                   SETOFF                                       929394
N06  C                   SETOFF                                       89
     C                   SETOFF                                       959697
     C                   SETOFF                                       91
N01  C                   SETOFF                                       90
     C*
     C   03              GOTO      SLUTT
      *
      * 04 = SØKING ZIP KODE
      *
N01  C   04              DO
S14  C*                    EXSR SOKZIP
N14  C                   EXSR      SOKDTA
N01  C                   GOTO      START2
N01  C                   END
     C* VED OPPRETTING AV ADRESSEKUNDE ER DET 0 I KUNDENR HELT TIL
     C* DET ER TASTET ENTER PÅ FERDIG UTFYLT POST (KRAVFELT)
     C* (FOR Å UNNGÅ OPPRETTING VIA "UHELL")
     C* FØLGENDE F-TASTER UGYLDIGE NÅR KUNDENR ER 0....
N07  C     WSKNR         IFEQ      *ZEROS
N07  C                   GOTO      NULLNR
N07  C                   END
     C* Vareadresse nr 1.(Kun ved spedisjon -27 Off- styrt av DDS)
     C   06              DO
     C   31              SETON                                        99
     C   31              GOTO      START2
     C                   EXSR      HENTAD
     C                   GOTO      START3
     C                   END
     C* Samlefakt profil.(Kun ved 27 Off styrt av DDS)
     C     *IN08         IFEQ      '1'
     C                   MOVE      'J'           UPDATE            1
     C                   CALL      'SYFA57B'
     C                   PARM                    WSKNR
     C                   PARM                    UPDATE
     C                   GOTO      START2
     C                   END
     C* Samlefakt avd.liste (avvikende samlefakt.kode) (kun ved 27 off)
     C     *IN09         IFEQ      '1'
     C                   MOVE      'J'           UPDATE            1
     C                   CALL      'SYFA57'
     C                   PARM                    WSKNR
     C                   PARM                    UPDATE
     C                   GOTO      START2
     C                   END
N03  C* FRITEKST
N03  C     *IN07         IFEQ      '1'
N03  C                   EXSR      FRITXT
N03  C                   GOTO      START2
N03  C                   END
S10  C* FLYTTET TIL ETTER OPDKUN FOR Å FORENKLE CI2000-INTEGRASJ
S10  C* KONTAKTPERSONER
S10  C*          *IN11     IFEQ '1'
S10  C*                    EXSR CUNDCV
S10  C*                    GOTO START2
S10  C*                    END
N03  C* OPPDRAGSTILLEGG
N04  C     *IN13         IFEQ      '1'
N04  C                   CALL      'VCUNDOR'
N04  C                   PARM                    FIFIRM
N04  C                   PARM                    WSKNR
N04  C                   GOTO      START2
N04  C                   END
     C* Slette (F10 tillatt kun ved ren SAD - 27 ON- styrt av DDS)
     C   10              DO
     C                   MOVE      WSKNR         KUNDNR
     C     KUND1K        CHAIN     CUNDL01                            33
     C  N33
     CANN27KUND1K        CHAIN     KUNDL01                            33
     C  N33
     CANN27              DELETE    KUNDR
     C  N33              DELETE    CUNDR
     C                   GOTO      START
     C                   END
N07   *
N07  C     NULLNR        TAG
     C   12DIREKT        IFEQ      'J'
     C                   GOTO      SLUTT
     C                   END
     C   12              GOTO      START
     C*
     C                   EXSR      TESTB2
     C   30              GOTO      START2
     C                   EXSR      OPDKUN
N10  C* KONTAKTPERSONER
N10  C     *IN11         IFEQ      '1'
N10  C                   EXSR      CUNDCV
N10  C     FICI2         IFEQ      'J'
     C  N29
N10  CANN27KUND1K        CHAIN     CI2KUN                             37           CI2000
     C  N37
     CANN29
N10  CANN27              MOVE      'X'           ENDKO2
     C  N37
     CANN29
N10  CANN27              UPDATE    CI2KUNR
N10  C                   END
N10  C                   GOTO      START2
N10  C                   END
N05   * VEDLIKEHOLD AV MILJØAVGIFT
N05  C   15              DO
N05  C                   CALL      'SAD014'
N05  C                   PARM                    FIFIRM
N05  C                   PARM      KUNDNR        UKN               8 0
N05  C                   PARM                    KNAVN
N05  C                   PARM                    UFLAGG
N05  C     UFLAGG        CABEQ     1             START2
N05  C                   END
     C*
S03   *                    EXSR FRITXT
S03   *                    EXSR CUNDCV
     C     DIREKT        IFEQ      'J'
     C                   GOTO      SLUTT
     C                   END
     C                   GOTO      START
     C*
     C     START3        TAG
     C                   EXFMT     BILDE03
     C                   SETOFF                                       309897
     C   12              GOTO      START2
     C*
     C                   EXSR      TESTB3
     C                   GOTO      START3
     C*
     C     SLUTT         TAG
     C                   SETON                                        LR
     C                   RETURN
     C*
     C***********************************************
     C     TESTB1        BEGSR
     C***********************************************
      * 27 ON = FRITTSTÅENDE VEDLIKEHOLD (SOM DEL AV SAD-MODUL)
      * 27 OFF= ORDINÆR SYSPED (KUNDEN MÅ OGSÅ FINNES I LØSN.1 - KUNDF)
      * 28 ON = TILLATT Å OPPRETTE "ADRESSEKUNDE"
      * 29 ON = ADRESSEKUNDE ER I FERD MED Å BLI OPPRETTET/VEDLIKEHOLDT
     C   27              MOVE      *ZEROS        FORETN
N09  C   27              MOVE      *BLANKS       SELGER
     C                   MOVE      WSKNR         KUNDNR
N07  C     *IN28         IFEQ      '1'
N07  C* NY ADR.KUNDE....
N07  C     *IN06         IFEQ      '1'
N07  C                   SETON                                        29
N07  C                   SETON                                        31         = NY
N07  C                   MOVE      *ZEROS        WSKNR
N07  C                   MOVE      *ZEROS        FORETN
N09  C                   MOVE      *BLANKS       SELGER
N07  C                   GOTO      UTHENT
N07  C                   ELSE
S12  C*          WSKNR     COMP FIAKMI               29  29
S12  C*  29      WSKNR     COMP FIAKMA                 2929
N12  C     WSKNR         COMP      FIKUFR                             29  29
N12  C   29WSKNR         COMP      FIKUTI                               2929
N07  C                   END
N07  C                   END
N07  C* HVIS VEDLIKEHOLD AV ADR.KUNDE....
N07  C     *IN29         IFEQ      '1'
N07  C     KUND1K        CHAIN(N)  CUNDL01                            31         SKAL FINNES
N07  C     KUND1K        CHAIN(N)  KUNDL01                            33         SKAL IKKE!!
N07  C   31              SETON                                        99
N07  C  N33              SETON                                        99
N07  C   99              MOVE      'SPK0001'     MSGNR
     C   99
N07  CANN33              MOVE      'JOV0996'     MSGNR
N07  C                   ELSE
N07  C* VEDLIKEHOLD AV "VANLIG" KUNDE.( SENET I SAD ELLER SYSPED...)
     C     KUND1K        CHAIN(N)  CUNDL01                            31
     C  N31
     CANN27KUND1K        CHAIN(N)  KUNDL01                            31
     C   31
     CANN27              SETON                                        99
     C   99              MOVE      'SPK0001'     MSGNR
N07  C                   END
     C   99              SETON                                        30
     C   99              GOTO      SLTB1
     C*
     C  N31              DO
     C                   MOVE      KNAVN         WSNAK
     C                   MOVE      SFAKT         WSSAMG
     C                   MOVE      ADR1          WSAD1
     C                   MOVE      ADR2          WSAD2
     C                   MOVE      POSTNR        WSPNR
     C                   MOVE      ADR3          WSAD3
     C                   MOVE      KPERS         WSKPNR
     C                   MOVE      TLF           WSTLF
     C                   MOVE      SYLAND        WSLAND
     C                   MOVE      SONAVN        WSSØNA
     C                   MOVE      VALKOD        WSVK
     C                   MOVE      DKUND         WSDKUN
     C                   MOVE      FMOT          WSFMNR
N06  C                   MOVE      AKNRKU        WSAKNR
N06  C                   MOVE      SYEPOS        WSEPOS
     C                   MOVE      SYREGN        WSREGN
     C                   MOVE      SYKONT        WSKONT
     C                   MOVE      SYFR02        WSFR02
N17  C                   MOVEL     SYFR04        WSSECU
     C                   MOVE      SYLIKV        WSLIKV
     C                   MOVE      SYOPDT        WSOPDT
     C                   MOVE      SYMINU        WSMINU
     C                   MOVE      SYUTLP        WSUTLP
     C                   MOVE      SYFR03        WSFR03
     C                   MOVE      TFAXNR        WSFAXN
S15  C*          SYPOGE    IFEQ *BLANKS
S15  C*                    MOVE *BLANKS   WSPOGE
     C                   MOVEL     POSTNU        WSPOGE
S15  C*                    ELSE
S15  C*                    MOVE SYPOGE    WSPOGE
S15  C*                    ENDIF
     C                   TESTN                   SYFORE               31
     C   31SYFORE        COMP      *ZEROS                             3131
     C   31              MOVE      SYFORE        WSFORE
     C  N27              MOVE      FORETN        WSFORE
N09  C  N27              MOVE      SELGER        WSSELG
     C                   MOVE      '0'           *IN31
      * Finnes samlef. profil / avd.liste???? Sett indikator..
     C     KUNDNR        CHAIN     CUSAPR                             35
     C     KUNDNR        CHAIN     CUSAAV                             36
     C                   END
      ** NY POST
N07  C     UTHENT        TAG
     C   31              DO
N07  C                   MOVE      'A'           AKTKOD
     C                   MOVEA     '11'          *IN(35)
     C                   MOVE      *BLANKS       WSNAK
     C                   MOVE      SFAKT         WSSAMG
     C                   MOVE      *BLANKS       WSAD1
     C                   MOVE      *BLANKS       WSAD2
     C                   MOVE      *ZEROS        WSPNR
     C                   MOVE      *BLANKS       WSAD3
     C                   MOVE      *BLANKS       WSKPNR
     C                   MOVE      *BLANKS       WSTLF
     C                   MOVE      *BLANKS       WSLAND
     C                   MOVE      *BLANKS       WSSØNA
     C                   MOVE      *BLANKS       WSVK
     C                   MOVE      *ZEROS        WSFMNR
     C                   MOVE      *ZEROS        WSREGN
     C                   MOVE      *ZEROS        WSKONT
     C                   MOVE      *BLANKS       WSFR02
N17  C                   MOVE      *BLANKS       WSSECU
     C                   MOVE      *BLANKS       WSLIKV
     C                   MOVE      *BLANKS       WSOPDT
     C                   MOVE      *ZEROS        WSMINU
     C                   MOVE      *ZEROS        WSUTLP
     C                   MOVE      *BLANKS       WSFAXN
     C                   MOVE      *BLANKS       WSPOGE
     C                   MOVE      *ZEROS        WSFORE
     C                   END
     C*
     C     SLTB1         ENDSR
     C*
     C***********************************************
     C     HENTAD        BEGSR
     C***********************************************
     C     VADRK         CHAIN     VADR                               33
     C  N33              DO
     C                   UPDATE    VADRR
     C                   MOVE      VADRNA        W2NAV
     C                   MOVE      VADRN1        W2AD1V
     C                   MOVE      VADRN2        W2AD2V
     C                   MOVEL     VADRN3        W2AD3V
     C                   END
     C   33              DO
     C                   MOVE      *BLANKS       W2NAV
     C                   MOVE      *BLANKS       W2AD1V
     C                   MOVE      *BLANKS       W2AD2V
     C                   MOVE      *BLANKS       W2AD3V
     C                   END
     C*
     C                   ENDSR
     C*
     C***********************************************
     C     TESTB2        BEGSR
     C***********************************************
     C     WSNAK         COMP      *BLANKS                                97
     C   97              SETON                                        30
     C   97              MOVE      'SPN0015'     MSGNR
     C   97              GOTO      SLTB2
     C*
     C* TEST AV POSTSTED/ZIP-KODE
     C*
N01  C     ZIPCOD        IFEQ      'J'
N01  C                   MOVE      WSPOGE        WSZIP
N01  C     WSPNR         IFNE      0
N01  C                   MOVE      *BLANKS       WSZIP
N01  C                   MOVEL     WSPNR         WSZIP
N01  C                   END
N01  C     WSZIP         IFEQ      *BLANKS
N01  C                   SETON                                        9030
N01  C   90              MOVE      'SHU0529'     MSGNR
N01  C   90              GOTO      SLTB2
N01  C                   END
N01  C     KEYZIP        CHAIN     STED2D2                            90
N01  C   90              SETON                                        30
N01  C   90              MOVE      'SHU0529'     MSGNR
N01  C   90              GOTO      SLTB2
N01  C                   MOVEL     ST2NVN        WSAD3
N01  C                   END
     C     WSAD3         COMP      *BLANKS                                96
     C   96              SETON                                        30
     C   96              MOVE      'SPA0022'     MSGNR
     C   96              GOTO      SLTB2
     C*
     C     WSSØNA        COMP      *BLANKS                                95
     C   95              SETON                                        30
     C   95              MOVE      'SPS0034'     MSGNR
     C   95              GOTO      SLTB2
     C*
     C     WSVK          IFNE      *BLANKS
     C     VALU1K        CHAIN     VALUL01                            94
     C   94              SETON                                        30
     C   94              MOVE      'SPV0001'     MSGNR
     C   94              GOTO      SLTB2
     C                   END
     C*
     C* TESTER AVTALEKUNDE
     C*
N06  C                   MOVE      *BLANKS       AVNAVN
N06  C     WSAKNR        IFNE      0
N06  C                   MOVE      SFAKTK        SFAKGM            1
N06  C                   MOVE      WSAKNR        KUNDNR
N06  C                   SETOFF                                       89
N06  C  N27KUND1K        CHAIN(N)  KUNDL01                            89
N06  C  N89KUND1K        CHAIN(N)  CUNDL01                            89
N06  C  N89              MOVE      KNAVN         AVNAVN
N06  C   89              SETON                                        30
N06  C   89              MOVE      'SPK0053'     MSGNR
N06  C   89              GOTO      SLTB2
N06  C                   MOVE      SFAKGM        SFAKTK
N06  C                   END
     C*
     C*
     C* TESTER FAKTURAMOTTAGER
     C*
N06  C                   MOVE      *BLANKS       FMNAVN
     C     WSFMNR        IFNE      0
N02  C                   MOVE      SFAKTK        SFAKGM            1
     C                   MOVE      WSFMNR        KUNDNR
     C                   SETOFF                                       93
     C  N27KUND1K        CHAIN(N)  KUNDL01                            93
     C  N93KUND1K        CHAIN(N)  CUNDL01                            93
N06  C  N93              MOVE      KNAVN         FMNAVN
     C   93              SETON                                        30
     C   93              MOVE      'SPK0031'     MSGNR
     C   93              GOTO      SLTB2
N02  C                   MOVE      SFAKGM        SFAKTK
     C                   END
     C*
     C     WSLIKV        IFNE      *BLANKS
     C     KODLIK        CHAIN     KODTLIK                            92
     C   92              SETON                                        30
     C   92              MOVE      'SPL0012'     MSGNR
     C                   END
     C  N27SFAKTK        IFEQ      'J'
     C     WSSAMG        IFEQ      ' '
     C                   SETON                                        9130
     C                   END
     C                   ELSE
     C     WSSAMG        IFNE      ' '
     C                   SETON                                        9130
     C                   END
     C                   END
     C   91              MOVE      'SHU0025'     MSGNR
     C*
     C     SLTB2         ENDSR
     C*
     C***********************************************
     C     OPDKUN        BEGSR
     C***********************************************
N07   * HVIS ADRESSE-KUNDE OG 0 I NR- HENT NESTE
N07  C     *IN29         IFEQ      '1'
N07  C     WSKNR         ANDEQ     *ZEROS
S12  C*                    CALL 'VCUADNR'
S12  C*                    PARM           FIFIRM
S12  C*                    PARM           FIAKMI
S12  C*                    PARM           FIAKMA
S12  C*                    PARM           WSKNR
N12  C     FIFIRM        CHAIN     FIRKU                              31
N12  C     *IN31         IFEQ      '0'
N12  C     FIKUNE        ANDLE     FIKUTI
N12  C                   MOVE      FIKUNE        WSKNR
N12  C                   ADD       1             FIKUNE
N12  C                   UPDATE    FIRKUR
N12  C                   END
N07  C                   END
     C                   MOVE      WSKNR         KUNDNR
     C                   SETOFF                                       31
S07  C*       N27KUND1K    CHAINKUNDL01              31
N10  C     FICI2         IFEQ      'J'
     C  N29
N10  CANN27KUND1K        CHAIN     CI2KUN                             37           CI2000
N10  C                   END
     C  N29
N07  CANN27KUND1K        CHAIN     KUNDL01                            31
     C  N31KUND1K        CHAIN     CUNDL01                            31
     C*
     C  N31              DO
     C                   MOVE      WSNAK         KNAVN
     C                   MOVE      WSAD1         ADR1
     C                   MOVE      WSAD2         ADR2
     C                   MOVE      WSPNR         POSTNR
     C                   MOVE      WSAD3         ADR3
     C                   MOVE      WSKPNR        KPERS
     C                   MOVE      WSTLF         TLF
     C                   MOVE      WSLAND        SYLAND
     C                   MOVE      WSSØNA        SONAVN
     C                   MOVE      WSVK          VALKOD
     C                   MOVE      WSDKUN        DKUND
     C                   MOVE      WSFMNR        FMOT
N06  C                   MOVE      WSAKNR        AKNRKU
N06  C                   MOVE      WSEPOS        SYEPOS
     C                   MOVE      WSREGN        SYREGN
     C                   MOVE      WSKONT        SYKONT
     C                   MOVE      WSFR02        SYFR02
N17  C                   MOVEL     WSSECU        SYFR04
     C                   MOVE      WSLIKV        SYLIKV
     C                   MOVE      WSOPDT        SYOPDT
     C                   MOVE      WSMINU        SYMINU
     C                   MOVE      WSUTLP        SYUTLP
     C                   MOVE      WSFR03        SYFR03
     C                   MOVE      WSFAXN        TFAXNR
     C                   MOVE      WSPOGE        SYPOGE
     C                   MOVEL     WSPOGE        POSTNU
     C                   MOVEL     WSFORE        SYRG
N09  C**                   MOVELWSFORE    SYSELG
N09JOC                   MOVEL     WSSELG        SYSELG
     C                   MOVEL     WSFORE        FORETN
N09  C                   MOVEL     WSSELG        SELGER
     C                   END
     C   31              DO
     C                   MOVE      WSKNR         KUNDNR
     C                   MOVE      FIFIRM        FIRMA
     C                   MOVE      WSNAK         KNAVN
     C                   MOVE      WSAD1         ADR1
     C                   MOVE      WSAD2         ADR2
     C                   MOVE      WSPNR         POSTNR
     C                   MOVE      WSAD3         ADR3
     C                   MOVE      WSKPNR        KPERS
     C                   MOVE      WSTLF         TLF
     C                   MOVE      WSLAND        SYLAND
     C                   MOVE      WSSØNA        SONAVN
     C                   MOVE      WSVK          VALKOD
     C                   MOVE      WSDKUN        DKUND
     C                   MOVE      WSFMNR        FMOT
N06  C                   MOVE      WSAKNR        AKNRKU
N06  C                   MOVE      WSEPOS        SYEPOS
     C                   MOVE      WSREGN        SYREGN
     C                   MOVE      WSKONT        SYKONT
     C                   MOVE      WSFR02        SYFR02
N17  C                   MOVEL     WSSECU        SYFR04
     C                   MOVE      WSLIKV        SYLIKV
     C                   MOVE      WSOPDT        SYOPDT
     C                   MOVE      WSMINU        SYMINU
     C                   MOVE      WSUTLP        SYUTLP
     C                   MOVE      WSFR03        SYFR03
     C                   MOVE      WSFAXN        TFAXNR
     C                   MOVE      WSPOGE        SYPOGE
     C                   MOVEL     WSPOGE        POSTNU
     C                   MOVEL     WSFORE        SYRG
N09  C                   MOVEL     WSSELG        SYSELG
     C                   MOVEL     WSFORE        FORETN
N09  C                   MOVEL     WSSELG        SELGER
     C                   END
N07  C     *IN29         IFEQ      '0'
     C  N31
     CANN27              UPDATE    KUNDR
     C   31
     CANN27              WRITE     KUNDR
N07  C                   ELSE
N07  C                   MOVE      'I'           AKTKOD
N07  C                   END
     C                   MOVE      WSSAMG        SFAKT
     C  N31              UPDATE    CUNDR
     C   31              WRITE     CUNDR
N03  C                   EXSR      CUNDCA
     C                   SETOFF                                       31
      * LEGG UT LOGGPOST I CI2000-OPPDATERINGSFIL
N10  C     FICI2         IFEQ      'J'
N10  C     VADRK         CHAIN(N)  VADR                               38
N10  C     *IN38         IFEQ      '1'
N10  C                   MOVE      *BLANKS       VADRNA
N10  C                   MOVE      *BLANKS       VADRN1
N10  C                   MOVE      *BLANKS       VADRN2
N10  C                   MOVE      *BLANKS       VADRN3
N10  C                   END
N10  C   37              MOVE      XNDKO1        ENDKO1
N10  C   37              MOVE      *BLANKS       ENDKO2
S11  C*  37                WRITECI2KUNR
S11  C* N37                UPDATCI2KUNR
     C   37
     CANN27
N11  CANN29              WRITE     CI2KUNR
     C  N37
     CANN27
N11  CANN29              UPDATE    CI2KUNR
N10  C                   END
     C*
     C                   ENDSR
     C*
     C***********************************************
     C     TESTB3        BEGSR
     C***********************************************
     C     W2NAV         COMP      *BLANKS                                98
     C   98              SETON                                        30
     C   98              MOVE      'SPN0014'     MSGNR
     C   98              GOTO      SLTB3
     C*
     C     W2AD3V        COMP      *BLANKS                                97
     C   97              SETON                                        30
     C   97              MOVE      'SPA0019'     MSGNR
     C   97              GOTO      SLTB3
     C*
     C     VADRK         CHAIN     VADR                               33
     C                   MOVE      W2NAV         VADRNA
     C                   MOVE      W2AD1V        VADRN1
     C                   MOVE      W2AD2V        VADRN2
     C                   MOVE      W2AD3V        VADRN3
     C   33              DO
     C                   MOVE      'A'           AKTKOD
     C                   MOVE      '00000'       JOURNR
     C                   MOVE      FIFIRM        FIRMA
     C                   MOVE      WSKNR         KUNDNR
     C                   Z-ADD     1             VADRNR
     C                   END
     C   33              WRITE     VADRR
     C  N33              UPDATE    VADRR
     C*
     C     SLTB3         ENDSR
     C*
     C***********************************************
     C     SØKUNR        BEGSR
     C***********************************************
     C                   MOVE      *BLANKS       USØKKN           30
     C                   CALL      'SOEKKUN'
     C                   PARM                    WSKNR
     C                   PARM                    FIFIRM
     C                   PARM                    USØKKN           30
     C*
     C                   ENDSR
     C*
     C***********************************************
     C     FRITXT        BEGSR
     C***********************************************
     C                   MOVE      'KUNDER: '    XTXT              8
     C                   Z-ADD     1             UFLAGG            1 0
     C                   MOVE      'V'           DELSY             1
     C                   CALL      'FRITXTSK'
     C                   PARM                    FIFIRM
     C                   PARM                    WSKNR
     C                   PARM                    XTXT
     C                   PARM                    UFLAGG
     C                   PARM                    DELSY
     C*
     C                   ENDSR
     C*
     C***********************************************
     C     INIT          BEGSR
     C***********************************************
N01  C     KEYZIP        KLIST
N01  C                   KFLD                    WSLAND
N01  C                   KFLD                    WSZIP             9
     C     KODLIK        KLIST
     C                   KFLD                    XLIUNI
     C                   KFLD                    WSLIKV
     C     KUND1K        KLIST
     C                   KFLD                    FIFIRM
     C                   KFLD                    KUNDNR
     C     VADRK         KLIST
     C                   KFLD                    FIFIRM
     C                   KFLD                    WSKNR
     C                   KFLD                    XVADNR
     C     VALU1K        KLIST
     C                   KFLD                    FIFIRM
     C                   KFLD                    WSVK
     C*
     C     *ENTRY        PLIST
     C                   PARM                    UIN01             1
     C                   PARM                    UFIRM             2
     C                   PARM                    CUNDNR            8
     C                   Z-ADD     0             KUNDNR
     C     CUNDNR        IFNE      *BLANKS
     C                   MOVE      'J'           DIREKT            1
     C                   MOVE      CUNDNR        KUNDNR
     C                   END
     C     UIN01         COMP      '1'                                    27
     C*
     C                   MOVE      'LIKO'        XLIUNI            4
E08  C                   Z-ADD     1             XVADNR            5 0
     C                   MOVE      *BLANKS       SYRG
N09  C                   MOVE      *BLANKS       SYSELG
     C*
     C                   MOVE      *BLANKS       FIFIRM
     C     FIFIRM        SETLL     FIRM                               33
     C                   READ      FIRM                                   33
     C*
     C     UFIRM         IFNE      *BLANKS
     C     UFIRM         ANDNE     FIFIRM
     C                   SETON                                        LR
     C                   RETURN
     C                   END
N07  C* KUNDENR OMRÅDE FOR RENE ADRESSEKUNDENR
N07  C*(I FØRSTE OMGANG KUN HARDKODET. SENERE BØR DET INN I FIRM )
N07  C*(OBS!!!!  NÅR EN LEGGER DET OVER TIL FIRM MÅ EN GJØRE SAMME
N07  C*          ENDRING I FIXCUN2...
N07  C*          DET SAMME GJELDER SELVSAGT VED KUNDESPESIAL!!!!!)
N07  C*(DERSOM VERDI ER GITT, ER DET TILLATT (OG F6 VISES...)    )
N07  C                   SETOFF                                       2829
S12  C*                    Z-ADD90000001  FIAKMI  80       MINIM
S12  C*                    Z-ADD90999999  FIAKMA  80       MAXIM
N12  C     FIFIRM        CHAIN(N)  FIRKU                              33
N12  C     FIKUFR        COMP      *ZEROS                             2828
      *
N10   * J/N FOR OM NOTES, CI2000 SALGSSYSTEM ER INSTALLERT
N10   * HARDKODET I FØRSTE OMGANG
N10  C                   MOVE      'J'           FICI2             1
N10  C                   MOVE      ' '           XNDKO1            1            HOVED..     .
     C*
     C                   ENDSR
     C*
     C***********************************************
S14  C*          SOKZIP    BEGSR
N14  C     SOKDTA        BEGSR
     C***********************************************
     C*
     C*SØK PÅ ZIP
     C*
N14  C     LINNBR        IFEQ      9
N14  C     POSNBR        ANDGE     32
N14  C     POSNBR        ANDLE     40
     C                   MOVE      *BLANKS       UNVN
     C                   CALL      'SYFI10N'
     C                   PARM                    WSSDFF            9
     C                   PARM                    UNVN             30
     C                   PARM                    WSLAND
     C     WSLAND        IFEQ      'NO'
     C                   MOVEL     WSSDFF        WSPNR
     C                   MOVE      *BLANKS       WSPOGE
     C                   ELSE
     C                   MOVE      WSSDFF        WSPOGE
     C                   MOVE      *ZEROS        WSPNR
     C                   END
     C     UNVN          IFNE      *BLANKS
     C                   MOVEL     UNVN          WSAD3
     C                   END
N14  C                   GOTO      SLSOK
N14  C                   END
N14  C*
     C*
     C*SØK PÅ LIKVIDITETSKODER
     C*
N14  C     LINNBR        IFEQ      19
N14  C     POSNBR        ANDEQ     70
N14  C                   CALL      'SYFT19'
N14  C                   GOTO      SLSOK
N14  C                   END
N14  C*
N14  C*SØK PÅ FRITEKSTKODE
N14  C*
N14  C     LINNBR        IFEQ      21
N14  C     POSNBR        ANDEQ     70
N14  C                   CALL      'SYFI10I'
N14  C                   PARM                    WSFR03
N14  C                   GOTO      SLSOK
N14  C                   END
      *
      *
N14  C                   MOVE      'DIV1037'     MSGNR
N14  C                   SETON                                        30
     C*
S14  C*                    ENDSR
N14  C     SLSOK         ENDSR
N03  C***********************************************
N03  C     CUNDCA        BEGSR
N03  C***********************************************
N03   * ADD POST I CUNDC HVIS MANGLER
N03  C     KUND1K        SETLL     CUNDC01                                51
N03  C     *IN51         IFEQ      *OFF
N03  C                   MOVEL     FIFIRM        CFIRMA
N03  C                   Z-ADD     KUNDNR        CCOMPN
N03  C                   MOVEL     KPERS         CCONTA
N03  C     TFAXNR        IFNE      *BLANKS
N03  C                   MOVEL     TFAXNR        CFAX
N03  C                   ELSE
N03  C                   MOVEL     TLF           CFAX
N03  C                   ENDIF
N03  C                   WRITE     CUNDCR
N03  C                   ENDIF
N03  C                   ENDSR
N03  C***********************************************
N03  C     CUNDCV        BEGSR
N03  C***********************************************
N03   * ADD POST I CUNDC HVIS MANGLER
N03  C                   EXSR      CUNDCA
N03   *
N03  C                   CALL      'VCUNDCR'
N03  C                   PARM                    FIFIRM
N03  C                   PARM                    WSKNR
N13  C                   PARM                    URRN             10 0
N13  C                   PARM                    UEMFA             1
N13  C                   PARM                    UCONTA           30
N03  C                   ENDSR
