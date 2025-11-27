TMP   *  midletidig for test url
********************************************************************
      * RETTINGER I DETTE PROGRAM:
PTFnr:*Sek Sig Vers  Beskrivelse...........................
""""""*"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
10172 * 01 SH  PTF10 norsk text til Track and trace
      *%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
10XXX * 02 JOV PTF11 Send NORSK/Local Lang tekst, Ved TTEDEV='*LE' send Local + Engelsk
      *              OBS! Alle ESTSTT.. + SYTT01 (+ SYTT05)/SYSO02  b¯r oppdateres samtidig
********************************************************************
     FFIRM      IF   E           K DISK
     FHEADF     IF   E           K DISK
     FTRACKF    O  A E           K DISK
     Farksrc    O    E             DISK    USROPN
     F                                     RENAME(arksrc:arcdat)
     D                SDS
     D  ZJOB                 244    253
     D  ZUSER                254    263
     D  ZJOBNR               264    269  0
     D                 DS
     D  XULTID                 1     14  0
     D  XULTM                  1      6  0
     D  XULDD                  7      8  0
     D  XULMM                  9     10  0
     D  XUL≈≈                 11     14  0
     D                 DS
     D  UL≈≈                   1      4  0
     D  ULMM                   5      6  0
     D  ULDD                   7      8  0
     D  ULDT                   1      8  0
      *
      *
     D EMNE            S             70
     D POS             S             15
     C                   exsr      INIT
      *
     c     HeaKey        chain     HEADF                              35
     c     *in35         ifeq      *off
     c                   exsr      SndMail
     c                   endif
      *
     C                   MOVE      *ON           *INLR
     C                   RETURN
      *
      *
      ******************************************************************************
     C     SndMail       BEGSR
      ******************************************************************************
      *  Fyll opp sourcefil som brukes som body
     C                   open      arksrc
     c                   move      *zeros        srcseq
      *
     C                   eval      SRCDTA = 'Melding vedr. din'
     C                             + ' sending'
     c                   add       1             srcseq
     C                   WRITE     arcdat
      *
      * Hele (utfylt del av) HERFA
     C                   eval      SRCDTA ='m/ref:'+ %TRIM(HERFA)
     C                   add       1             srcseq
     C                   WRITE     arcdat
      * + max 20 av senders navn (for Â unngÂ over 160 tegn)
     C                   movel     HENAS         HENAS20          20
     C                   eval      SRCDTA ='fra '
     C                             + %TRIM(HENAS20) +':'
     C                   add       1             srcseq
     C                   WRITE     arcdat
      *
N02  C                   eval      SRCDTA = TTTEXL
N02  c                   add       1             srcseq
N02  C                   WRITE     arcdat
      *
N02  c                   if        TTEDEV = '*LE' and TTTEXT <> *blanks
     C                   eval      SRCDTA = TTTEXT
     c                   add       1             srcseq
     C                   WRITE     arcdat
N02  c                   endif
TMP   *
TMP  c                   if        heavd=80 and heopd=201447
TMP  C                   eval      SRCDTA = 'http://gw.systema.no/syspeddev/'
TMP  C                             +'tktt/?q='+%subst(HXSNDN:4:17)
TMP  c                   add       1             srcseq
TMP  C                   WRITE     arcdat
TMP  c                   endif
      *
     C                   close     arksrc
      * EMNE ='avsender' i SMSen
     C                   eval      EMNE = %TRIM(FIKRTN)
      *
     c                   movel     'W'           UUnik             7
     c                   move      ZJOBNR        UUnik
     C                   CALL      'ESTSTTSC'
     C                   PARM                    UUnik
     C                   PARM                    Emne
     C                   PARM      CMOBIL        XXSMS            15
      *
     c                   exsr      TTSR
      *
     C                   ENDSR
      *
      *
      ******************************************************************************
     C     INIT          BEGSR
      ******************************************************************************
     C     *entry        PLIST
     c                   parm                    HEAVD
     c                   parm                    HEOPD
     c                   parm                    TTACTI            3
     c                   parm                    TTDATE            8 0
     c                   parm                    TTTIME            6 0
     c                   parm                    TTDATL            8 0
     c                   parm                    TTTIML            6 0
N02  c                   parm                    TTEDEV            3
N02  c                   parm                    TTTEXL           70
     c                   parm                    TTTEXT           70
     c                   parm                    TTUSER           10
     c                   parm                    CMOBIL           15
      *
     c                   movel     TTTEXT        TMPTEXT          70
      *
     c     HeaKey        klist
     c                   kfld                    HEAVD
     c                   kfld                    HEOPD
      *
     c     *loval        setll     FIRM
     c                   read      FIRM
     C                   ENDSR
     C***********************************************
     C     TTSR          BEGSR
     C***********************************************
      *
     C                   MOVE      HEAVD         TTAVD
     C                   MOVE      HEOPD         TTOPD
     C                   TIME                    XULTID
     C                   MOVE      XULDD         ULDD
     C                   MOVE      XULMM         ULMM
     C                   MOVE      XUL≈≈         UL≈≈
     C                   MOVE      'SMS'         TTACTI
     C                   MOVE      ULDT          TTDATE
     C                   MOVE      XULTM         TTTIME
     C                   MOVE      TTDATE        TTDATL
     C                   MOVE      TTTIME        TTTIML
     C* behold orig..    MOVEL     ZUSER         TTUSER
     C                   EVAL      TTTEXT = 'SMS sent to '+ %trim(XXSMS)
     c                             + ', ' + TMPTEXT
     c                   move      '...'         TTTEXT
n01  C                   EVAL      TTTEXL = 'SMS sendt til '+ %trim(XXSMS)
n01  c                             + ', ' + TMPTEXT
n01  c                   move      '...'         TTTEXT
     C                   WRITE     TRACKFR
     C                   ENDSR
