     H Option( *SrcStmt ) DftActGrp( *No ) BndDir( 'QC2LE' )
      ****************************************************************************************
      * Hente-oppdrag,  Send instruksjonsmail                                                *
      ****************************************************************************************
********************************************************************
      * RETTINGER I DETTE PROGRAM:
PTFnr:*Sek Sig Vers  Beskrivelse...........................
""""""*"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
11XXX * 01 JOV PTF11 Probl (fra f.eks Toten) når mot.navn er tlfnr@esms.nu (nå TellusTalk)
11XXX * 02 sh  PTF11 variabel internbruker
********************************************************************
     FHeadf     IF   E           K DISK
     FFIRM      IF   E           K DISK
     FFIRMARC   IF   E           K DISK
n04  FSYPARL3   IF   E           K DISK
     FTRACKF    O  A E           K DISK
      *__________
      * Variabler
      *""""""""""
     D FILE_o          s               *
     D String          s            512a
     D rc              s             10i 0
     D Data            s             80a   Varying
     D Codepage        s              5a   Varying
     D CmdLine         S            512
     D CmdLen          S             15  5
     D SDATA           S           1000
     D WFilNam         S            256
      *___________
      * Konstanter
      *"""""""""""
     D LF              c                   x'25'
      *___________________________
      * IFS Stream file funksjoner
      *"""""""""""""""""""""""""""
     Dopen             Pr              *   ExtProc( '_C_IFS_fopen' )
     D                                 *   Value Options( *String )
     D                                 *   Value Options( *String )

     Dfputs            Pr            10i 0 ExtProc( '_C_IFS_fputs' )
     D                                 *   Value Options( *String )
     D                                 *   Value

     Dclose            Pr            10i 0 ExtProc( '_C_IFS_fclose' )
     D                                 *   Value
     D UP              C                   CONST('ABCDEFGHIJKLMNOPQRST-
     D                                     UVWXYZÆØÅ')
     D LO              C                   CONST('abcdefghijklmnopqrst-
     D                                     uvwxyzæøå')
     D                SDS
     D  ZUSER                254    263
      *
     D LINK            S            150
     D MailSMS         S             70
     D Emne            S             70
     D AvAd            S             50
     D AvNa            S             50
     D Madr            S             50
     D timedata1       S               z                                        z=Timestamfield
     D                 DS
     D  HXSNDN                 1     20
     D  Snd17                  4     20
      *
     C                   EXSR      INIT
      *
     C     HEAKEY        CHAIN     HEADF                              33
     C     *IN33         CABEQ     *ON           SLUTT
      *
     C                   EXSR      TTSR
     C                   EXSR      LAGSMS
      *
     C     SLUTT         TAG
     C                   MOVE      *ON           *INLR
     C                   RETURN
      *
      *
      ******************************************************************************
     C     TTSR          BEGSR
      ******************************************************************************
     C                   MOVE      HEAVD         TTAVD
     C                   MOVE      HEOPD         TTOPD
     C                   MOVE      WDT           TTDATE
     C                   MOVE      WTM           TTTIME
     C                   MOVE      WDT           TTDATL
     C                   MOVE      WTM           TTTIML
     C                   MOVE      'CMS'         TTACTI
     C                   MOVE      ZUSER         TTUSER
     c                   if        UUUSER <> *blanks
     C                   MOVE      UUUSER        TTUSER
     c                   endif
N01  c                   if        UUH_L = *blanks
N01  C                   EVAL      TTTEXT ='Link to trackingApp SMS sent to '
N01  c                                     + UUSMS
N01  C                   EVAL      TTTEXL ='Lenke til sporingsApp SMS sent til '
N01  c                                     + UUSMS
N01  c                   else
     C                   EVAL      TTTEXT ='Coll. SMS sent to '
     c                                     + UUSMS
     C                   EVAL      TTTEXL ='HenteSMS sendt til '
     c                                     + UUSMS
N01  c                   endif
     C                   MOVE      'S'           TTMANU
     C                   write     TRACKFR
      *
     C                   ENDSR
      *
      ******************************************************************************
     C     LAGSMS        BEGSR
      ******************************************************************************
      * Lag fil og set codepage (pc)
     C                   time                    Timedata1
     C                   movel     timedata1     TS26             26            må være 26 lang
     C                   movel     TS26          TS               22
      *                                                 typisk TS er nå  2012-09-08-17.39.49.73
     C                   EVAL      WFilNam ='/SYSPEDDEV/TEMP/'
     C                                     + TS + '_' + AvdOpd + '.html'
     C                   EVAL      FILE_o = open( %TrimR( WFilNam )
     C                             : 'w, codepage=850' )
     C                   EVAL      rc = close( FILE_o )
     C                   EVAL      FILE_o = open( %TrimR( WFilNam )
     C                             : 'w' )
      *
No1  C     UP:LO         XLATE     ARCPAE        ARCPAE
S01  C*                  Eval      EMNE  = 'SYSTEMA'
N01  C                   Eval      EMNE  = FIKRTN
N01  c                   if        UUH_L = *blanks
N01  C                   Eval      SDATA = 'Lenke til sporings-App for '
N01  C                                    + %trim(FIFT)
N01  c                   else
     C                   Eval      SDATA = 'Henting hos '
     C                                    + %trim(HENAS) + ' for '
     C                                    + %trim(FIFT)
N01  c                   endif
     C                   EVAL      rc = fputs(%trimr(SDATA) + LF: File_o)
     C                   EVAL      SDATA  = 'http://'
     C                             + %trim(ARCPAE) + '/sycgip/estk550.pgm'
S02  c*                            +'?user=NN&amp;t='+%trim(UUSMS)
N02  c                             +'?user='+%trim(SYVRDA)
N02  c                             +'&amp;t='+%trim(UUSMS)
n01  c                             +'&amp;snd='+%trim(SNDEVT)
s01  c*                            +'?user=NN&amp;snd='
s01  c*                            +%trim(%editc(HEAVD:'Z'))
s01  c*                            +'*'+%trim(%editc(HEOPD:'Z'))
s01  c*                            +'&amp;event=COL'
     C                   EVAL      rc = fputs(%trimr(SDATA) + LF: File_o)
      *
      * close file
     C                   EVAL      rc = close( FILE_o )
      *
     C                   EVAL      AvNa ='SMS.SYSTEMA'
     C                   EVAL      AvAd ='roger@systema.no'
     C                   EVAL      Madr =%trim(UUSMS)+'@esms.nu'
     C*                  EVAL      Madr ='janottar@systema.no'
     C                   EXSR      SENDMail
      *
     C                   ENDSR
      *
      ******************************************************************************
     C     INIT          BEGSR
      ******************************************************************************
     C     *ENTRY        PLIST
     C                   PARM                    HEAVDa            4
     C                   PARM                    HEOPDa            7
s01  C*                  PARM                    UUH_L             1
N01  C                   PARM                    UUH_L             3
     C                   PARM                    UUSMS            15
     C                   PARM                    UUUSER           10
      *
     C                   MOVE      HEAVDa        HEAVD
     C                   MOVE      HEOPDa        HEOPD
     C                   Movel     HEAVD         AvdOpd           11
     C                   Move      HEOPD         AvdOpd
     c     HeaKey        klist
     c                   kfld                    HEAVD
     c                   kfld                    HEOPD
n02  c     sypak         klist
n02  c                   kfld                    sykd              5
n02  c                   move      'ESUSR'       SYKD
n02  c     sypak         chain     SYPARL3                            33
n02  C   33              EVAL      SYVRDA = 'NN'
N01  c                   move      *blanks       SNDEVT           50
N01  c                   if        UUH_L<>*blanks
N01  c                   eval      SNDEVT = %trim(%editc(HEAVD:'Z'))
N01  c                             +'*'+%trim(%editc(HEOPD:'Z'))
N01  c                             +'&amp;event='+UUH_L
N01  c                   endif
      *
     C     *LOVAL        SETLL     FIRM
     C                   READ      FIRM                                   33
      *
     C     FIFIRM        CHAIN     FIRMARC                            33
      *
     C                   CALL      'SYGE15C'
     C                   PARM                    WDT               8
     C                   PARM                    WTM               6
     C                   ENDSR
      *
      *
      ******************************************************************************
     C     SendMail      BEGSR
      ******************************************************************************
      * Send via MMAIL
     C                   EVAL      CmdLine = 'ADDLIBLE MMAIL'
     C                   EVAL      CmdLen = %len(%trim(CmdLine))
     C                   CALL      'QCMDEXC'                            98
     C                   PARM                    CmdLine
     C                   PARM                    Cmdlen
      *
     C                   EVAL      CmdLine = 'EMLHTML SUBJECT('+ X'7D'
     C                             + %trimr(Emne) + X'7D' + ') '
     C                             + 'FROMNAME(' + X'7D'
     C                             + %trimr(AvNa) + X'7D' + ') '
     C                             + 'FROMADDR('  + X'7D'
     C                             + %trimr(AvAd) + X'7D' + ') '
     C                             + 'TO('+ X'7D'+%trimr(Madr)+ X'7D'+'/'+ X'7D'
s01  C*                            + %trimr(Madr)+ X'7D'+'/*TO) '
N01  C                             + 'TellusTalk'+ X'7D'+'/*TO) '
     C                             + 'STMF('+ X'7D'+%trimr(WFilNam)+ X'7D'+ ')'
     C                   EVAL      CmdLen = %len(%trim(CmdLine))
     C                   CALL      'QCMDEXC'                            98
     C                   PARM                    CmdLine
     C                   PARM                    Cmdlen
      *
     C                   EVAL      CmdLine = 'RMVLIBLE MMAIL'
     C                   EVAL      CmdLen = %len(%trim(CmdLine))
     C                   CALL      'QCMDEXC'                            98
     C                   PARM                    CmdLine
     C                   PARM                    Cmdlen
      *
     C                   ENDSR
      *
