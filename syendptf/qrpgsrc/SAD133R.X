      *
      ***********************************************************
      *** PROGRAM SKAL PLUKK OPPDRAG TIL E.F. MANIFEST        ***
      *** INDIKATORER 01 - 26 KUN CMD-TASTER / ROLL TASTER    ***
      *** LEDIGE INDIKATORER 01 02 07 09-14 17-24             ***
      *** LEDIGE INDIKATORER 29 31 32       52-75 78-89       ***
      ***********************************************************
      *
     FSADH      UF   E           K DISK
     FSADH2     IF   E           K DISK    RENAME(SADHR:SADHR2)
     FSADH2B    IF   E           K DISK    RENAME(SADHR:SADHR2B)
     FSADH3     IF   E           K DISK    RENAME(SADHR:SADHR3)
     FSADH3B    IF   E           K DISK    RENAME(SADHR:SADHR3B)
     FSADH16    IF   E           K DISK    RENAME(SADHR:SADHR16)
     FSADEFCL2  IF   E           K DISK
     FSAD133D   CF   E             WORKSTN SFILE(SUBFIL:ZRECNO)
     F                                     INFDS(FBAREA)
     D FBAREA          DS
     D  WSCLOC               370    371B 0
     D  WSSUBN               378    379B 0
     D                SDS
     D  UUSR                 254    263
      *
     C                   EXSR      INIT
     C                   WRITE     NYVARE
     C                   GOTO      START6
      *
     C     START         TAG
     C                   MOVE      '1'           *IN93
     C                   WRITE     SUBCTL
     C                   MOVEA     '00'          *IN(93)
     C                   Z-ADD     *ZEROS        ZRECNO
      *_____________
      * Fyll Subfile
      *"""""""""""""
     C                   EXSR      SETKEY
     C     START1        TAG
     C                   EXSR      LESPOS
      *
     C     START2        TAG
      *
     C                   DOW       *IN94 = *OFF
     C                   ADD       1             ZRECNO
     C                   WRITE     SUBFIL
     C                   EXSR      LESPOS
     C                   ENDDO
      *
     C                   SELECT
     C                   WHEN      ZRECNO = 0
     C                   Z-ADD     5             LINNBR
     C                   Z-ADD     5             POSNBR
     C                   WHEN      ZRECNO > 19
     C                   EVAL      ZRECNO = 1
     C                   Z-ADD     6             LINNBR
     C                   Z-ADD     2             POSNBR
     C                   OTHER
     C                   Z-ADD     6             LINNBR
     C                   Z-ADD     2             POSNBR
     C                   ENDSL
      *
     C     START3        TAG
     C                   MOVEA     '11'          *IN(91)
     C                   WRITE     BUNN
     C     ZRECNO        IFEQ      0
     C                   EXFMT     NYVARE
     C                   ELSE
     C                   EXFMT     SUBCTL
     C                   END
      *
      *** AVSLUTT
     C                   MOVE      '0'           *IN30
     C                   MOVEA     '00'          *IN(98)
     C   05              GOTO      START
     C   08              DO
     C                   GOTO      START6
     C                   ENDDO
     C   12              GOTO      SLUTT
     C   20              DO
     C                   EXSR      PLKALLE
     C                   GOTO      SLUTT
     C                   ENDDO
      *
     C                   IF        W2AVD <> 0 AND W2TDN <> 0                    1<-B
      * DIREKT PLUKK
     C     SADHK         CHAIN     SADH                               33
     C                   IF        *IN33 = *OFF
     C     SADEFCL2K     CHAIN     SADEFCL2                           33
     C                   DOW       *IN33 = *OFF
     C                   IF        CLST = ' ' OR  CLST = 'C' OR CLPRO = UPRO
      * ALLEREDE ER PLUKKET TIL EN TUR
     C                   GOTO      START3
     C                   END
     C     SADEFCL2K     READE     SADEFCL2                               33
     C                   ENDDO
     C                   END
     C     START4        TAG
     C                   EXSR      PLKOPD
     C                   EVAL      W2AVD = 0
     C                   EVAL      W2TDN = 0
     C                   GOTO      START3
     C                   END                                                    1<-E
      *
     C     ZRECNO        IFNE      0
     C                   EXSR      HENT
     C                   END
     C                   GOTO      START3
      *
     C     START6        TAG
     C                   MOVE      *BLANKS       W3TRID
     C                   MOVE      *ZEROS        W3AVD
     C                   MOVE      *ZEROS        W3TDN
     C                   MOVE      *ZEROS        W3KNS
     C                   MOVE      *ZEROS        W3KNK
     C                   EXFMT     VAREL2
      *
     C   12              GOTO      START3
     C                   SELECT
     C                   WHEN      W3TRID <> *BLANKS
     C                   MOVEA     '1000'        *IN(41)
     C                   WHEN      W3KNS <> 0
     C                   MOVEA     '0100'        *IN(41)
     C                   WHEN      W3KNK <> 0
     C                   MOVEA     '0010'        *IN(41)
     C                   WHEN      W3AVD <> 0 AND W3TDN <> 0
     C                   MOVEA     '0001'        *IN(41)
     C                   OTHER
     C                   GOTO      START6
     C                   ENDSL
     C                   GOTO      START
      *
     C     SLUTT         TAG
      *
     C                   SETON                                        LR
     C                   RETURN
      *
      ***********************************************
     C     HENT          BEGSR
      ***********************************************
     C                   MOVE      *BLANKS       MSGNR
     C                   MOVEA     '000'         *IN(90)
     C                   MOVEA     '00'          *IN(98)
     C     *IN98         DOWEQ     '0'                                          1<-B
     C                   READC     SUBFIL                                 98
     C     *IN98         IFEQ      '0'                                           2<-B
     C                   SELECT                                                   3<-B
     C     WSNR          WHENEQ    1                                              3
     C                   IF        SITLL <> '*PLUKKET*'                            4<-B
     C                   MOVE      '1'           *IN99
     C                   EXSR      PLKOPD
     C                   END                                                       4<-E
     C     WSNR          WHENEQ    5                                              3
     C                   EXSR      VISOPD
     C                   ENDSL                                                    3<-E
     C                   END                                                     2<-E
     C                   ENDDO                                                  1<-E
      *
     C     SLHENT        TAG
     C   98
     CANN99              DO
     C                   MOVE      'DIV0012'     MSGNR
     C                   MOVE      '1'           *IN30
     C                   END
     C                   MOVE      '0'           *IN99
      *
     C                   ENDSR
      *
     C***********************************************
     C     PLKOPD        BEGSR
     C***********************************************
     C                   MOVE      'PLK'         XTYPE                          SPØRRING
     C                   CALL      'SAD134R'
     C                   PARM                    UPRO
     C                   PARM      SIAVD         U_AVD             4 0
     C                   PARM      SITDN         U_TDN             7 0
     C                   PARM                    XTYPE             3
     C                   PARM                    UFLAGG            1 0
      *
     C                   IF        *IN99
     C                   IF        UFLAGG = 0
     C                   EVAL      SITLL = '*PLUKKET*'
     C                   END
      *
     C  N90              MOVE      *ZEROS        WSNR
     C  N90              UPDATE    SUBFIL
     C                   END
      *
     C                   ENDSR
      *
     C***********************************************
     C     VISOPD        BEGSR
     C***********************************************
     C                   CALL      'SAD005A'
     C                   PARM      SIAVD         U_AVD             4 0
     C                   PARM      SITDN         U_TDN             7 0
     C                   PARM                    UFLAGG            1 0
      *
     C  N90              MOVE      *ZEROS        WSNR
     C  N90              UPDATE    SUBFIL
      *
     C                   ENDSR
      *
     C***********************************************
     C     PLKALLE       BEGSR
     C***********************************************
     C                   MOVE      'PLA'         XTYPE
     C                   Z-ADD     1             XRECNO            4 0
     C     XRECNO        CHAIN     SUBFIL                             33
     C                   DOW       *IN33 = *OFF                                 1<-B
     C                   CALL      'SAD134R'
     C                   PARM                    UPRO
     C                   PARM      SIAVD         U_AVD             4 0
     C                   PARM      SITDN         U_TDN             7 0
     C                   PARM                    XTYPE             3
     C                   PARM                    UFLAGG            1 0
     C                   ADD       1             XRECNO
     C     XRECNO        CHAIN     SUBFIL                             33
     C                   ENDDO
      *
     C                   ENDSR
      *
     C***********************************************
     C     SETKEY        BEGSR
     C***********************************************
     C   41W3TRID        SETLL     SADH16
     C   42              IF        W3AVD = 0
     C     SADH2BK1      SETLL     SADH2B
     C                   ELSE
     C     SADH2K1       SETLL     SADH2
     C                   END
     C   43              IF        W3AVD = 0
     C     SADH3BK1      SETLL     SADH3B
     C                   ELSE
     C     SADH3K1       SETLL     SADH3
     C                   END
     C   44SADHK1        SETLL     SADH
      *
     C                   ENDSR
      *
      ***********************************************
     C     LESPOS        BEGSR
      ***********************************************
     C     STLES         TAG
     C   41W3TRID        READE     SADH16                                 94
     C   42              IF        W3AVD = 0
     C     SADH2BK12     READE     SADH2B                                 94
     C                   ELSE
     C     SADH2K12      READE     SADH2                                  94
     C                   END
     C   43              IF        W3AVD = 0
     C     SADH3BK12     SETLL     SADH3B                                 94
     C                   ELSE
     C     SADH3K12      SETLL     SADH3                                  94
     C                   END
     C   44W3AVD         READE     SADH                                   94
      *
     C                   IF        *IN94 = *OFF                                 1<-B
     C                   IF        SIST = 'P' AND W3ST <> 'P' AND *IN41          2<-B
     C                   GOTO      STLES
     C                   END                                                     2<-E
      *
     C     SADEFCL2K     CHAIN     SADEFCL2                           33
      * ALLEREDE ER PLUKKET TIL EN TUR
     C  N33              GOTO      STLES
      *
     C                   END                                                    1<-E
      *
     C     SLLES         ENDSR
      *
     C***********************************************
     C     INIT          BEGSR
     C***********************************************
     C     SADHK         KLIST
     C                   KFLD                    W2AVD
     C                   KFLD                    W2TDN
     C     SADHK1        KLIST
     C                   KFLD                    W3AVD
     C                   KFLD                    W3TDN
     C     SADH2K1       KLIST
     C                   KFLD                    W3AVD
     C                   KFLD                    W3KNS
     C                   KFLD                    X_SIDT
     C     SADH2K12      KLIST
     C                   KFLD                    W3AVD
     C                   KFLD                    W3KNS
     C     SADH2BK1      KLIST
     C                   KFLD                    W3KNS
     C                   KFLD                    X_SIDT
     C     SADH2BK12     KLIST
     C                   KFLD                    W3KNS
     C     SADH3K1       KLIST
     C                   KFLD                    W3AVD
     C                   KFLD                    W3KNK
     C                   KFLD                    X_SIDT
     C     SADH3K12      KLIST
     C                   KFLD                    W3AVD
     C                   KFLD                    W3KNK
     C     SADH3BK1      KLIST
     C                   KFLD                    W3KNK
     C                   KFLD                    X_SIDT
     C     SADH3BK12     KLIST
     C                   KFLD                    W3KNK
     C     SADEFCL2K     KLIST
     C                   KFLD                    SIAVD
     C                   KFLD                    SITDN
      *
     C     *ENTRY        PLIST
     C                   PARM                    UAVD              4 0
     C                   PARM                    UPRO              8 0
     C                   PARM                    UUUID            36
     C                   PARM                    UFLAGG            1 0
      *
     C                   CALL      'SYGE15C'
     C                   PARM                    WDT               8
     C                   PARM                    WTM               6
     C                   MOVE      WDT           XDT               8
      * SETT DATO FOR EN MÅNED SIDEN
     C                   IF        %SUBST(WDT:5:2) = '01'
     C                   EVAL      %SUBST(XDT:5:2) = '12'
     C                   MOVE      XDT           X_SIDT            8 0
     C                   SUB       10000         X_SIDT
     C                   ELSE
     C                   MOVE      XDT           X_SIDT
     C                   SUB       100           X_SIDT
     C                   END
     C                   Z-ADD     1             W2NR
     C                   EVAL      W3ST = 'P'
      *
     C                   ENDSR
      *
