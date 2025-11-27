      *
      ***********************************************************
      *** PROGRAM SKAL REGISTRERE E.F. MANIFEST (OPPDRAG)     ***
      *** INDIKATORER 01 - 26 KUN CMD-TASTER / ROLL TASTER    ***
      *** LEDIGE INDIKATORER 01-02 06-08 10 11 13-26
      *** LEDIGE INDIKATORER 27-29 31 32 34-48 50-81          ***
      ***********************************************************
      *
     FSADH      IF   E           K DISK
     FSADEFCL1  UF A E           K DISK
     FSADEFL02  IF   E           K DISK
     FTRACKF    O  A E             DISK
     FFIRM      IF   E           K DISK
     FCUNDL01   IF   E           K DISK
     FSAD134D   CF   E             WORKSTN INFDS(FBAREA)
     D                SDS
     D  UUSR                 254    263
     D FBAREA          DS
     D  WSCLOC               382    383B 0
     D  WSSUBN               378    379B 0
      *
     C                   EXSR      INIT
      *...............................................
      * BILDE-1 INNLESING AV HOVED OPPLYSNINGER AV TUR
      *'''''''''''''''''''''''''''''''''''''''''''''''
     C     START         TAG
     C                   EXFMT     BILDE01
     C                   MOVEA     '000'         *IN(97)
     C                   SETOFF                                       30
      *
      *  12 = AVBRYT, FRIGJØR E-MERKING OG GÅ UT
     C   12              GOTO      SLUTT
      *
      * ----------- T E S T   B I L D E 0 1 ----------
     C                   EXSR      TESTB1
     C   30              GOTO      START
      *
     C                   EXSR      OPDOPD
      *
     C     SLUTT         TAG
     C                   SELECT
     C                   WHEN      *IN12
     C                   EVAL      UFLAGG = 1
     C                   OTHER
     C                   EVAL      UFLAGG = 0
     C                   ENDSL
     C                   MOVE      '1'           *INLR
     C                   RETURN
      *
      ***********************************************
     C     TESTB1        BEGSR
      ***********************************************
      *
     C     WSETYP        COMP      *BLANKS                                99
     C     WSETYPT       COMP      *BLANKS                                98
     C     WSEID         COMP      *BLANKS                                97
      *
     C                   EXSR      HMSG
      *
     C                   ENDSR
      *
      ***********************************************
     C     HMSG          BEGSR
      ***********************************************
     C   99              MOVE      'YBC2094'     MSGNR
     C   99              DO
     C                   SETON                                        30
     C                   Z-ADD     5             LINNBR
     C                   Z-ADD     15            POSNBR
     C                   END
     C   98
     CANN30              DO
     C                   MOVE      'YBC2095'     MSGNR
     C                   SETON                                        30
     C                   Z-ADD     5             LINNBR
     C                   Z-ADD     38            POSNBR
     C                   END
     C   97
     CANN30              DO
     C                   MOVE      'YBC2096'     MSGNR
     C                   SETON                                        30
     C                   Z-ADD     6             LINNBR
     C                   Z-ADD     15            POSNBR
     C                   END
      *
     C                   ENDSR
      *
      ***********************************************
     C     MOVEFW        BEGSR
      ***********************************************
     C                   MOVE      UAVD          WSAVD
     C                   MOVE      UTDN          WSTDN
      *
     C                   MOVE      CLETYP        WSETYP
     C                   MOVE      CLETYPT       WSETYPT
     C                   MOVE      CLEID         WSEID
     C                   MOVE      CLESER        WSESER
      *
     C                   ENDSR
      *
      ***********************************************
     C     MOVWEF        BEGSR
      ***********************************************
     C                   MOVE      WSETYP        CLETYP
     C                   MOVE      WSETYPT       CLETYPT
     C                   MOVE      WSEID         CLEID
     C                   MOVE      WSESER        CLESER
      *
     C                   ENDSR
      *
      ***********************************************
     C     MOVSAW        BEGSR
      ***********************************************
     C                   MOVE      UAVD          WSAVD
     C                   MOVE      UTDN          WSTDN
      *
     C                   MOVE      *BLANKS       WSETYP
     C                   MOVE      *BLANKS       WSETYPT
     C                   MOVE      *BLANKS       WSEID
     C                   MOVE      *BLANKS       WSESER
      *
     C                   ENDSR
      *
      ***********************************************
     C     OPDOPD        BEGSR
      ***********************************************
      *
     C                   IF        UTYPE = 'CPY'
     C                   EVAL      *IN33 = *ON
     C                   ELSE
     C     SADEFCL1K     CHAIN     SADEFCL1                           33
     C                   END
      *
     C                   EXSR      TTSR
      *
      * FLYTTER SKJERMVARIABLE TIL FILVARIABLE
      *
     C                   EXSR      MOVWEF
      *
      * 33 ER PÅ VED NY OPD
      *
     C                   IF        *IN33                                        1<-B
     C                   EVAL      EFAVD  = UAVD
     C                   EVAL      EFPRO  = UPRO
     C                   EVAL      CLTDN  = UTDN
     C                   EVAL      CLST   = ' '
     C                   WRITE     SADEFCFR
     C                   ELSE
     C                   UPDATE    SADEFCFR
     C                   END
      *
     C                   ENDSR
      *
      ***********************************************
     C     INIT          BEGSR
      ***********************************************
     C     SADEFL02K     KLIST
     C                   KFLD                    UPRO
     C     SADEFCL1K     KLIST
     C                   KFLD                    UPRO
     C                   KFLD                    UAVD
     C                   KFLD                    UTDN
     C     SADHK         KLIST
     C                   KFLD                    UAVD
     C                   KFLD                    UTDN
      *
     C     *ENTRY        PLIST
     C                   PARM                    UPRO              8 0
     C                   PARM                    UAVD              4 0
     C                   PARM                    UTDN              7 0
     C                   PARM                    UTYPE             3
     C                   PARM                    UFLAGG            1 0
      *
     C                   CALL      'SYGE15C'
     C                   PARM                    WDT               8
     C                   PARM                    WTM               6
      *
     C     UTYPE         COMP      'DSP'                                  49
      *
     C                   SELECT
     C                   WHEN      UTYPE = 'PLK' OR UTYPE = 'PLA'
     C                   EVAL      *IN33 = *ON
     C                   WHEN      UTYPE = 'CPY'
     C     SADEFCL1K     CHAIN(N)  SADEFCL1                           33
     C                   EVAL      *IN33 = *OFF
     C                   OTHER
     C     SADEFL02K     CHAIN     SADEFL02                           33
     C     SADEFCL1K     CHAIN(N)  SADEFCL1                           33
     C                   ENDSL
     C                   IF        *IN33
     C     SADHK         CHAIN     SADH                               33
     C                   EXSR      MOVSAW
     C                   IF        UTYPE = 'PLA'
     C                   EXSR      OPDOPD
     C                   EVAL      *INLR = *ON
     C                   RETURN
     C                   END
     C                   ELSE
     C                   EXSR      MOVEFW
     C                   END
      *
     C     FIFIRM        SETLL     FIRM
     C                   READ      FIRM                                   33
      *
     C                   WRITE     WINDOWSZ
      *
     C                   ENDSR
      *
      ***********************************************
     C     TTSR          BEGSR
      ***********************************************
     C                   EVAL      TTAVD  = UAVD
     C                   EVAL      TTOPD  = UTDN
     C                   EVAL      TTTUR  = UPRO
     C                   EVAL      TTACTI = 'KMC'
     C                   MOVE      WDT           TTDATE
     C                   MOVE      TTDATE        TTDATL
     C                   MOVE      TTTIME        TTTIML
     C                   MOVE      UUSR          TTUSER
     C                   IF        *IN33
     C                   EVAL      TTTEXT = 'Oppdrag er plukket til E.F. '
     C                             + 'manifest.'
     C                   EVAL      TTTEXL = 'Oppdrag er plukket til E.F. '
     C                             + 'manifest.'
     C                   EVAL      TTEDEV = 'CRT'
     C                   ELSE
     C                   EVAL      TTTEXT = 'Info. av oppdrag i E.F. manifest '
     C                             + 'er endret.'
     C                   EVAL      TTTEXL = 'Info. av oppdrag i E.F. manifest '
     C                             + 'er endret.'
     C                   EVAL      TTEDEV = 'CHG'
     C                   END
     C                   EVAL      TTUSER = UUSR
      *
     C                   WRITE     TRACKFR
     C                   ENDSR
      *
