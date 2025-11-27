      *********************************************************************
      * PROGRAM VISE AKTUELL SAKER
      *
      *  CRTPGM SYSPED/EISO21 MODULE(*LIBL/EISO21
      *        *LIBL/CHECKUSR *LIBL/INCGI) ACTGRP(CGI) AUT(*USE)
********************************************************************
      * RETTINGER I DETTE PROGRAM:
PTFnr:*Sek Sig Vers  Beskrivelse...........................
""""""*"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
10XXX * 01 YBC PTF10 MAX AVVIKETS ART ER ENDRET FRA 60 TIL 200
10XXX * 02 YBC PTF10 NYE TEST PÅ DATO
********************************************************************
      *
      *********************************************************************
      * MAIN PROGRAM FLOW
      *********************************************************************
      /copy syspeds/qrpgsrcpy,hspecs
      /copy syspeds/qrpgsrcpy,hspecsbnd
     FBRIDF     UF   E           K DISK    USROPN
     FBRPARF    IF   E           K DISK    USROPN
     FHEADDT    IF   E           K DISK    USROPN
     FISOFL1    IF   E           K DISK    USROPN
     FISOFL6    IF   E           K DISK    USROPN
     F                                     RENAME(ISOFR:ISOFR6)
     FISOKDA    IF   E           K DISK    USROPN
     FISOKDP    IF   E           K DISK    USROPN
     FISOKDT    IF   E           K DISK    USROPN
     FTRACKL01  IF   E           K DISK    USROPN
     FWRKCGISS  UF A E           K DISK    usropn
      *--------------------------------------------------------------------
      * Prototype defintions and standard system API error structure
      *--------------------------------------------------------------------
      /copy syspeds/qrpgsrcpy,prototypeb
      /copy syspeds/qrpgsrcpy,usec
      *--------------------------------------------------------------------
      * Variables common to CGI programs
      *--------------------------------------------------------------------
      /copy syspeds/qrpgsrcpy,variables3
      *--------------------------------------------------------------------
     D OddEven         s             10
      * Variables received from the input string
     D lng             s              2
     D BckGnd          s             10
     D lstbrd          s              1
     D UsrSpcName      s             10
     D WSUSER          S             10
     D WINT            s              6
     D WSAAR           S              4
     D WBAAR           S              4  0
     D WSMNF           S              2
     D WBMNF           S              2  0
     D WSMNT           S              2
     D WBMNT           S              2  0
     D XPKTPRO         S              5  2
     D FMELDNR         S              2
     D FEILMELDING     S             80
     D PGM             C                   CONST('SYSPED/CHECKUSR')
      * Variables received from the input string
     D Lib             s             10
     D Fn              s             10
     D Mbr             s             10
     D FEIL01          C                   CONST('Oppgitt årstall er ugyldig.')
     D FEIL02          C                   CONST('Fra måned er ugyldig.')
     D FEIL03          C                   CONST('Til måned er ugyldig.')
     D FEIL04          C                   CONST('Til måned kan ikke være -
     D                                     tidligere enn fr måned.')
     D                 DS
     D  WKEY2                  1    256
     D  WUNIK                  1      3
     D                 DS
     D  WDATA                  1   1024
     D  WSENT                  1      1
     D  WDATO1                 2      9
     D  WDATO2                10     17
     D  WTURNR                18     25
     D  WANTOPD               26     32  0
     D  WANTDIR               33     39  0
     D  WANTISOP               1      5  0
     D  WANTOPDP               6     10  0
     D  TPT                   11    160  0 DIM(30)
     D  TAA                  161    460  0 DIM(60)
     D  TAP                  461    960  0 DIM(100)
     D                 DS
     D  KDPT                   1    150    DIM(30)
     D  KDPTV                  1    150
     D                 DS
S01  D* KDAA                   1    600    DIM(60)
S01  D* KDAAV                  1    600
N01  D  KDAA                   1   2000    DIM(200)
N01  D  KDAAV                  1   2000
     D                 DS
     D  KDAP                   1    500    DIM(100)
     D  KDAPV                  1    500
     D                 DS
     D  ISFPTAA                1     10
     D  ISFPFO                 1      5
     D  ISFAVA                 6     10
     D                 DS
     D  XXKEY                  1    256
     D  XXMOD                  1      1
     D  XXLK                   2      3
     D  XXUNIK                 1      3
     D  XXDT                   4     11  0
     D  XXBILN                12     20
     D  XXLPKT                 1      3
     D  XXLPANT1               4     10  0
     D  XXLPANT2              11     17  0
     D  XXSAKST                1      3
     D  XXMND                  4      5
     D                 DS
     D  XXKEY2                 1    256
     D  XXUNIK2                1      3
     D  XXMND2                 4      5
     D                 DS
     D  XXKEY6                 1    256
     D  XXUNIK6                1      3
     D  XXMND6                 4      5
     D                 DS
     D  HEDTOP                 1      8  0
     D  HEDTOPÅ                1      4  0
     D  HEDTOPM                5      6  0
     D  HEDTOPD                7      8  0
     D                 DS
     D  ISFRDA                 1      8  0
     D  ISFRDAÅ                1      4  0
     D  ISFRDAM                5      6  0
     D  ISFRDAD                7      8  0
     D                 DS
     D  XDATOS                 1      8  0
     D  XDTÅS                  1      4  0
     D  XDTMS                  5      6  0
     D  XDTDS                  7      8  0
     D                 DS
     D  XDATOE                 1      8  0
     D  XDTÅE                  1      4  0
     D  XDTME                  5      6  0
     D  XDTDE                  7      8  0
     D                 DS
     D  XLOSDT                 1      8  0
     D  XLOSDTÅ                1      4  0
     D  XLOSDTM                5      6  0
     D  XLOSDTD                7      8  0
     D                 DS
     D  XLEVDT                 1      8  0
     D  XLEVDTÅ                1      4  0
     D  XLEVDTM                5      6  0
     D  XLEVDTD                7      8  0
     D                 DS
     D  XDATO                  1      6  0
     D  XDATOD                 1      2  0
     D  XDATOM                 3      4  0
     D  XDATOÅ                 5      6  0
      *
      *--------------------------------------------------------------------
      * Prolog common to CGI programs
      * -Receive input from the remote browser
      *--------------------------------------------------------------------
      /copy syspeds/qrpgsrcpy,prolog3
      *=====================================================================******
      * MAIN PROCESS LINE
      *=====================================================================******
      * Get program start time for calculating execution time
     C                   time                    timedata1
      * Parse input
     C                   exsr      Parse
      *
     C                   EXSR      INIT
      *
     C                   EXSR      SRTEST
     C                   IF        FMELDNR <> *BLANKS
     C                   exsr      SetSkl
     C                   callp     gethtml(fn:lib:mbr:'/CGITAG/')
     C                   exsr      RtvEnvVar
     C                   exsr      SetTop
     C                   callp     wrtsection('all')
     C                   GOTO      SLUTT
     C                   END
     C
      *
     C                   EXSR      SRSTAT
      *
      * Set output skeleton html member name
     C                   exsr      SetSkl
      * Read skeleton output html, etc.
     C                   callp     gethtml(fn:lib:mbr:'/CGITAG/')
      * Retrieve environment variables
     C                   exsr      RtvEnvVar
      *------------------                                                   ******
      * Write HTML sections
      *
      * 1-Section /$top
     C                   exsr      SetTop
     C                   callp     wrtsection('top')
      *
      * 3-Section /$tablestr
     C                   exsr      SetTabStr
     C                   callp     wrtsection('tablestr')
      * 4-Sections /$tablerow
      *
     C     WINTEG        SETLL     WRKCGISS
     C     WINTEG        READE(N)  WRKCGISS                               50
      *
     C                   MOVE      *BLANKS       XXUNIK
     C                   MOVE      *ZEROS        XXANT1            5 0
     C                   MOVE      *ZEROS        XXANT2            5 0
     C                   MOVE      *ZEROS        XXANT3            5 0
     C                   MOVE      *ZEROS        XXANT4            5 0
     C                   Z-ADD     0             XANTOPD           7 0
     C                   Z-ADD     0             XANTDIR           7 0
     C                   z-add     0             bseq              5 0
     C                   DOW       *IN50 = *OFF
     C                   IF        WUNIK = '990'
      *
     C                   IF        XXKEY <> *BLANKS
     C                   ADD       1             bseq
     C                   exsr      SetTabRow
     C                   callp     wrtsection('tablerow')
     C                   END
     C                   LEAVE
      *
     C                   ELSE
      *
     C                   IF        ((WUNIK >= 'I  ') AND (WUNIK <= 'I99'))
     C                   IF        ((WUNIK <> XXUNIK) AND (XXUNIK <> *BLANKS))
     C                   ADD       1             bseq
     C                   exsr      SetTabRow
     C                   callp     wrtsection('tablerow')
     C                   MOVE      *ZEROS        XXANT1
     C                   MOVE      *ZEROS        XXANT2
     C                   MOVE      *ZEROS        XXANT3
     C                   MOVE      *ZEROS        XXANT4
     C                   Z-ADD     0             XANTOPD
     C                   Z-ADD     0             XANTDIR
     C                   END
     C                   ADD       1             XXANT1
     C                   IF        WSENT = 'J'
     C                   ADD       1             XXANT2
     C                   END
     C                   IF        WANTDIR = *ZEROS
     C                   ADD       1             XXANT3
     C                   IF        WSENT = 'J'
     C                   ADD       1             XXANT4
     C                   END
     C                   END
     C                   ADD       WANTOPD       XANTOPD
     C                   ADD       WANTDIR       XANTDIR
     C                   MOVEL     WKEY2         XXUNIK
     C                   END
      *
     C                   END
      *
     C*                  DELETE    WRKCGISR
     C     WINTEG        READE(N)  WRKCGISS                               50
     C                   ENDDO                                                  *hival
      *
     C                   IF        WUNIK = '990'
     C                   IF        XXLPANT1 = 0
     C                   EVAL      XPKTPRO = 0
     C                   ELSE
     C                   EVAL      XPKTPRO = (XXLPANT1 - XXLPANT2) /
     C                             XXLPANT1 * 100
     C                   END
     C                   callp     updHTMLvar('WSANTOPD':
     C                             %trim(%editc(XXLPANT1:'Z')))
     C                   callp     updHTMLvar('WSANTSENT':
     C                             %trim(%editc(XXLPANT2:'Z')))
     C                   callp     updHTMLvar('WSPKTPRO':
     C                             %trim(%editc(XPKTPRO:'L')))
     C                   END
      *
      * 5-Section /$tableend
     C                   callp     wrtsection('tableend')
      *
      * VIS ISO-STATISTIKK PR MÅNED
     C                   callp     wrtsection('tabl2str')
      * 4-Sections /$tablerow
      *
     C                   EVAL      XXKEY2 = '991'
     C     WRKCGIK2      SETLL     WRKCGISS
     C     WINTEG        READE(N)  WRKCGISS                               50
     C  N50WUNIK         COMP      '991'                              5050
      *
     C                   DOW       *IN50 = *OFF
     C                   exsr      SetTabRow2
     C                   callp     wrtsection('tabl2row')
      *
     C*                  DELETE    WRKCGISR
     C     WINTEG        READE(N)  WRKCGISS                               50
     C  N50WUNIK         COMP      '991'                              5050
     C                   ENDDO                                                  *hival
      * VIS ISO-STATISTIKK PR MÅNED
     C                   callp     wrtsection('tabl6str')
      * 4-Sections /$tablerow
      *
     C     WRKCGIK6      SETLL     WRKCGISS
     C     WINTEG        READE(N)  WRKCGISS                               50
     C  N50WUNIK         COMP      '996'                              5050
      *
     C                   DOW       *IN50 = *OFF
     C                   exsr      SetTabRow6
     C                   callp     wrtsection('tabl6row')
      *
     C     WINTEG        READE(N)  WRKCGISS                               50
     C  N50WUNIK         COMP      '996'                              5050
     C                   ENDDO                                                  *hival
      *
      *
      * 5a-Section /$foundsome
     C                   exsr      SetFndSome
     C                   callp     wrtsection('foundsome2')
      * 6-Section /$endhtml
     C     endhtml       tag
     C                   exsr      SetEnd
     C     SLUTT         tag
     C                   callp     wrtsection('endhtml')
      * Do not delete the call to wrtsection with section name *fini.  It is needed
      * to ensure that all output html that has been buffered gets output.
     C                   callp     wrtsection('*fini')
     C                   EXSR      EXIT
     C                   return
      *
      *=====================================================================******
      * Parse input
      *=====================================================================******
     C     Parse         begsr
     C                   eval      lng     = zhbgetvar('lng')
     C                   eval      BckGnd  = zhbgetvar('bckgnd')
     C                   eval      lstbrd  = zhbgetvar('lstbrd')
     C                   EVAL      WSUSER  = zhbgetvar('USER')
     C                   EVAL      UsrSpcName  = zhbgetvar('UsrSpcName')
      *
     C                   EVAL      WSAAR   = zhbgetvar('WSAAR')
     C                   EVAL      WBAAR   = c2n2(WSAAR)
     C                   EVAL      WSMNF   = zhbgetvar('WSMNF')
     C                   EVAL      WBMNF   = c2n2(WSMNF)
     C                   EVAL      WSMNT   = zhbgetvar('WSMNT')
     C                   EVAL      WBMNT   = c2n2(WSMNT)
     C                   EVAL      WINT    = zhbgetvar('WINTEG')
     C                   EVAL      WINTEG  = c2n2(WINT)
      *
     C                   endsr
      *
      *////////////////////////////////////////////////////////////
     C     SRTEST        BEGSR
      *////////////////////////////////////////////////////////////
      *
     C                   IF        WBAAR > WDTÅ
     C                   MOVEL     FEIL01        FEILMELDING
     C                   MOVE      '01'          FMELDNR
     C                   GOTO      SLTST
     C                   END
      *
     C                   IF        ((WBMNF > 12) OR (WBMNF < 1))
     C                   MOVEL     FEIL02        FEILMELDING
     C                   MOVE      '02'          FMELDNR
     C                   GOTO      SLTST
     C                   END
      *
     C                   IF        ((WBMNT > 12) OR (WBMNT < 1))
     C                   MOVEL     FEIL03        FEILMELDING
     C                   MOVE      '03'          FMELDNR
     C                   GOTO      SLTST
     C                   END
      *
     C                   IF        WBMNT < WBMNF
     C                   MOVEL     FEIL04        FEILMELDING
     C                   MOVE      '04'          FMELDNR
     C                   GOTO      SLTST
     C                   END
      *
     C     SLTST         ENDSR
      *
      *=====================================================================******
      *  Set output variables for section /$top
      *  (search criteria)
      *=====================================================================******
     C     SetTop        begsr
      * Repeat national language for the next invocation
     C                   callp     updhtmlvar('LNG':lng:
     C                             InitHTMLVars)
OddEvC                   callp     updHTMLvar('ROWHEAD':RowHead)
OddEvC                   callp     updHTMLvar('LogoImg':LogoImg)
      * Color for text, background, links, visited links, active links
     C                   callp     updhtmlvar('TXTCOLOR':'black')
     C                   callp     updhtmlvar('BOLD':' ')
     C                   callp     updhtmlvar('BGCOLOR':BIFARG)
     C                   callp     updhtmlvar('LINK':'0000FF')
     C                   callp     updhtmlvar('VLINK':'FF0000')
     C                   callp     updhtmlvar('ALINK':'00FF00')
      * KUNDE
     C                   callp     updhtmlvar('WSNA':BIBESK)
BODY C                   callp     updhtmlvar('BODYCLASS':'class='+BIFARG)
     C                   callp     updhtmlvar('USER':WSUSER)
     C                   callp     updHtmlVar('UsrSpcName':UsrSpcName)
     C                   callp     updHTMLvar('sdato':
     C                             %trim(%editw(BIDTV:'    .  .  ')))
     C                   callp     updHTMLvar('stid':
     C                             %trim(%editw(BITIDV:'  .  .  ')))
      *
     C                   callp     updHTMLvar('WSAAR':WSAAR)
     C                   callp     updHTMLvar('WSMNF':WSMNF)
     C                   callp     updHTMLvar('WSMNT':WSMNT)
     C                   callp     updHTMLvar('WINTEG':
     C                             %trim(%editc(WINTEG:'Z')))
     C                   callp     updhtmlvar('FMELDNR':FMELDNR)
     C                   callp     updhtmlvar('FEILMELDING':FEILMELDING)
      *
     C                   endsr
      *
      *=====================================================================******
      *  Set output variables for section /$tablestr (table start)
      *=====================================================================******
     C     SetTabStr     begsr
     C     lstbrd        ifeq      'Y'
     C                   callp     updhtmlvar('LB':'0')
     C                   else
     C                   callp     updhtmlvar('LB':'1')
     C                   endif
      *
     C                   endsr
      *
      *=====================================================================******
      *  Set output variables for section /$tablerow (table row)
      *=====================================================================******
     C     SetTabRow     begsr
      * odde/partalls-linjer i alternativ skyggelegging/bakgrunnsfarge
     c     OddEven       IFEQ      ODD
     c                   eval      OddEven = EVEN
     c                   else
     c                   eval      OddEven = ODD
     c                   end
     C                   callp     updHTMLvar('ODDEVEN':OddEven)
     c* Sequence of this Recd (numeric, converted to char)
     C                   move      bseq          bseqchar          5
     C                   callp     updhtmlvar('SEQ':bseqchar)
     C                   callp     updhtmlvar('XXLK':XXLK)
     C                   callp     updhtmlvar('XXMOD':XXMOD)
     C                   callp     updhtmlvar('XXANT1':
     C                             %trim(%editc(XXANT1:'Z')))
     C                   callp     updhtmlvar('XXANT2':
     C                             %trim(%editc(XXANT2:'Z')))
     C                   IF        XXANT1 = 0
     C                   Z-ADD     100           XXPROS            5 2
     C                   ELSE
     C                   EVAL(H)   XXPROS = (XXANT1 - XXANT2) / XXANT1 * 100
     C                   END
     C                   callp     updhtmlvar('XXPROS':
     C                             %trim(%editc(XXPROS:'L')))
     C                   SELECT
     C                   WHEN      XXPROS < 90
     C                   callp     updhtmlvar('XXFARGE':'BGCOLOR="#FF6427"')
     C                   WHEN      XXPROS < 95
     C                   callp     updhtmlvar('XXFARGE':'BGCOLOR="#FFD700"')
     C                   OTHER
     C                   callp     updhtmlvar('XXFARGE':'BGCOLOR="#00FF7F"')
     C                   ENDSL
     C                   callp     updhtmlvar('XXANTOPD':
     C                             %trim(%editc(XANTOPD:'Z')))
     C                   callp     updhtmlvar('XXANTDIR':
     C                             %trim(%editc(XANTDIR:'Z')))
     C                   callp     updhtmlvar('XXANT3':
     C                             %trim(%editc(XXANT3:'Z')))
     C                   callp     updhtmlvar('XXANT4':
     C                             %trim(%editc(XXANT4:'Z')))
     C                   IF        XXANT3 = 0
     C                   Z-ADD     100           XXPROS2           5 2
     C                   ELSE
     C                   EVAL(H)   XXPROS2 = (XXANT3 - XXANT4) / XXANT3 * 100
     C                   END
     C                   callp     updhtmlvar('XXPROS2':
     C                             %trim(%editc(XXPROS2:'L')))
     C                   SELECT
     C                   WHEN      XXPROS2 < 90
     C                   callp     updhtmlvar('XXFARGE2':'BGCOLOR="#FF6427"')
     C                   WHEN      XXPROS2 < 95
     C                   callp     updhtmlvar('XXFARGE2':'BGCOLOR="#FFD700"')
     C                   OTHER
     C                   callp     updhtmlvar('XXFARGE2':'BGCOLOR="#00FF7F"')
     C                   ENDSL
      *
     C                   endsr
      *
      *=====================================================================******
      *  Set output variables for section /$tablerow (table row)
      *=====================================================================******
     C     SetTabRow2    begsr
      * odde/partalls-linjer i alternativ skyggelegging/bakgrunnsfarge
     c     OddEven       IFEQ      ODD
     c                   eval      OddEven = EVEN
     c                   else
     c                   eval      OddEven = ODD
     c                   end
     C                   callp     updHTMLvar('ODDEVEN':OddEven)
      *
     c* Sequence of this Recd (numeric, converted to char)
     C                   EVAL      XXKEY = WKEY2
     C                   callp     updhtmlvar('XXMND':XXMND)
     C                   callp     updhtmlvar('XXANTISOP':
     C                             %trim(%editc(WANTISOP:'Z')))
     C                   callp     updhtmlvar('XXANTOPDP':
     C                             %trim(%editc(WANTOPDP:'Z')))
     C                   EVAL(H)   XXPROS = WANTISOP / WANTOPDP * 100
     C                   callp     updhtmlvar('XXPROS':
     C                             %trim(%editc(XXPROS:'L')))
     C                   SELECT
     C                   WHEN      XXPROS > 1,5
     C                   callp     updhtmlvar('XXFARGE':'BGCOLOR="#FF6427"')
     C                   WHEN      XXPROS > 1
     C                   callp     updhtmlvar('XXFARGE':'BGCOLOR="#FFD700"')
     C                   OTHER
     C                   callp     updhtmlvar('XXFARGE':'BGCOLOR="#00FF7F"')
     C                   ENDSL
      *
     C                   endsr
      *
      *=====================================================================******
      *  Set output variables for section /$tablerow (table row)
      *=====================================================================******
     C     SetTabRow6    begsr
      * odde/partalls-linjer i alternativ skyggelegging/bakgrunnsfarge
     c     OddEven       IFEQ      ODD
     c                   eval      OddEven = EVEN
     c                   else
     c                   eval      OddEven = ODD
     c                   end
     C                   callp     updHTMLvar('ODDEVEN':OddEven)
      *
     c* Sequence of this Recd (numeric, converted to char)
     C                   EVAL      XXKEY = WKEY2
     C                   callp     updhtmlvar('XXMND':XXMND)
     C                   callp     updhtmlvar('XXANTISOP':
     C                             %trim(%editc(WANTISOP:'Z')))
      *
     C                   endsr
      *
      *=====================================================================******
      *  Set output variables for section /$foundsome (some Recds were found)
      *=====================================================================******
     C     SetFndSome    begsr
      * Repeat background color
     C                   callp     updhtmlvar('BCKGND':bckgnd)
      *
     C                   endsr
      *=====================================================================******
      *  Set output variables for section /$endhtml
      *=====================================================================******
     C     SetEnd        begsr
      * Server protocol
     C                   callp     updhtmlvar('PROTOCOL':S_Protocol)
      * Compute run time
     C                   time                    timedata2
     C     timedata2     subdur    timedata1     ms:*ms
     C                   eval      sec = ms / 1000000
     C                   callp     updhtmlvar('runtime':
     C                             %trim(%editw(sec:'     0 .   ')))
      *
     C                   endsr
      *=====================================================================******
      * STATISTIKK
      *=====================================================================******
     C     SRSTAT        BEGSR
      *
      * KLARGJØR KODER FOR ISO
     C                   MOVE      *BLANKS       KDPTV
     C                   MOVE      *ZEROS        XN                5 0
     C     *LOVAL        SETLL     ISOKDT
     C                   READ      ISOKDT                                 33
     C                   DOW       *IN33 = *OFF
     C                   ADD       1             XN
     C                   MOVE      TKODE         KDPT(XN)
     C                   READ      ISOKDT                                 33
     C                   ENDDO
     C                   MOVE      *BLANKS       KDAAV
     C                   MOVE      *ZEROS        XN
     C     *LOVAL        SETLL     ISOKDA
     C                   READ      ISOKDA                                 33
     C                   DOW       *IN33 = *OFF
     C                   ADD       1             XN
     C                   MOVEL     APKD          KDAA(XN)
     C                   MOVE      AKODE         KDAA(XN)
     C                   READ      ISOKDA                                 33
     C                   ENDDO
     C                   MOVE      *BLANKS       KDAPV
     C                   MOVE      *ZEROS        XN
     C     *LOVAL        SETLL     ISOKDP
     C                   READ      ISOKDP                                 33
     C                   DOW       *IN33 = *OFF
     C                   ADD       1             XN
     C                   MOVE      PKODE         KDAP(XN)
     C                   READ      ISOKDP                                 33
     C                   ENDDO
      *
      * TØMME GAMLE DATA
     C     WINTEG        SETLL     WRKCGISS
     C     WINTEG        READE     WRKCGISS                               50
     C                   DOW       *IN50 = *OFF
     C                   DELETE    WRKCGISR
     C     WINTEG        READE     WRKCGISS                               50
     C                   ENDDO
     C                   MOVE      *ZEROS        XN                5 0
      *
      *
     C                   MOVE      WBAAR         XDTÅS
     C                   MOVE      WBMNF         XDTMS
     C                   Z-ADD     1             XDTDS
     C                   MOVE      WBAAR         XDTÅE
     C                   MOVE      WBMNT         XDTME
     C                   Z-ADD     31            XDTDE
     C                   Z-ADD     0             XANTOPD           7 0
     C                   Z-ADD     0             XANTSENT          7 0
      *
     C     XDATOS        SETLL     HEADDT
     C                   READ      HEADDT                                 50
     C  N50XDATOE        COMP      HEDTOP                               50
      *
     C                   DOW       *IN50 = *OFF
      *
     C                   IF        HEST <> 'S'
      *
     C                   SELECT
     C                   WHEN      (((HEUR = 'A') OR
     C                               (HEUR = 'C')) OR
     C                               (HEUR = 'F'))
     C                   MOVE      'I'           XXMOD
     C                   WHEN      (((HEUR = 'B') OR
     C                               (HEUR = 'D')) OR
     C                               (HEUR = 'G'))
     C                   MOVE      'E'           XXMOD
     C                   OTHER
     C                   IF        HELKA = 'NO'
     C                   MOVE      'E'           XXMOD
     C                   ELSE
     C                   MOVE      'I'           XXMOD
     C                   END
     C                   ENDSL
      *
     C                   MOVE      HELKA         XXLK
     C                   MOVE      HEDTOP        XXDT
     C                   MOVE      HEHAWB        XXBILN
N02   * HENT STARTDATO
N02  C     TRACKL01K     SETLL     TRACKL01
N02  C     TRACKL01K     READE     TRACKL01                               50
N02  C                   DOW       *IN50 = *OFF
N02  C                   IF        TTACTI = 'ED1'
N02  C                   MOVE      TTDATE        XXDT
N02  C                   MOVE      TTDATE        HEDTOP
N02  C                   LEAVE
N02  C                   END
N02  C     TRACKL01K     READE     TRACKL01                               50
N02  C                   ENDDO
      *
     C     WRKCGIK       CHAIN     WRKCGISS                           33
      *
     C                   MOVE      'J'           XSENT             1
     C                   MOVE      *ZEROS        XLOSDT            8 0
     C     TRACKL01K     SETLL     TRACKL01
     C     TRACKL01K     READE     TRACKL01                               50
     C                   DOW       *IN50 = *OFF
     C                   IF        ((TTACTI = 'LOP') OR (TTACTI = 'TEI'))
     C                   IF        TTDATE <= HEDTOP
     C                   MOVE      'N'           XSENT
     C                   END
     C                   MOVE      TTDATE        XLOSDT
     C                   LEAVE
     C                   END
     C     TRACKL01K     READE     TRACKL01                               50
     C                   ENDDO
     C   50              MOVE      99999999      TTDATE
      *
     C                   IF        *IN33
     C                   MOVE      XXKEY         WKEY2
     C                   EVAL      WSENT  = XSENT
     C                   MOVE      HEPRO         WTURNR
     C                   MOVE      HEDTOP        WDATO1
     C                   MOVE      TTDATE        WDATO2
     C                   Z-ADD     1             WANTOPD
     C                   IF        HESDL = 'DIREKTEKJØRT'
     C                   Z-ADD     1             WANTDIR
     C                   ELSE
     C                   Z-ADD     0             WANTDIR
     C                   END
     C                   WRITE     WRKCGISR
     C                   ELSE
     C                   IF        WSENT <> 'N'
     C                   EVAL      WSENT  = XSENT
     C                   MOVE      TTDATE        WDATO2
     C                   END
     C                   ADD       1             WANTOPD
     C                   IF        HESDL = 'DIREKTEKJØRT'
     C                   ADD       1             WANTDIR
     C                   END
     C                   UPDATE    WRKCGISR
     C                   END
      *
      * BEREGN LEVERINGSPUNKTLIGHET
     C                   IF        ((XLOSDT > 0) AND (XXMOD = 'I'))
     C                   MOVE      XLOSDTD       XDATOD
     C                   MOVE      XLOSDTM       XDATOM
     C                   MOVE      XLOSDTÅ       XDATOÅ
     C                   Z-ADD     1             UANTDG            3 0
     C                   CALL      'SYFA20B'
     C                   PARM      XDATO         UINNDT            6 0
     C                   PARM                    UANTDG
     C     XDATO         PARM                    UUTDT             6 0
     C                   MOVE      XDATOD        XLEVDTD
     C                   MOVE      XDATOM        XLEVDTM
     C     2000          ADD       XDATOÅ        XLEVDTÅ
      *
     C                   MOVE      'J'           XSENT             1
     C     TRACKL01K     SETLL     TRACKL01
     C     TRACKL01K     READE     TRACKL01                               50
     C                   DOW       *IN50 = *OFF
     C                   SELECT
     C                   WHEN      ((TTACTI = 'ED9') AND (TTDATE <= XLEVDT))
     C                   MOVEL     TTTEXT        XAN03             3
     C                   IF        ((((XAN03 = '012') OR
     C                                (XAN03 = '066')) OR
     C                                (XAN03 = '070')) OR
     C                                (XAN03 = '091'))
     C                   MOVE      'N'           XSENT
     C                   LEAVE
     C                   END
     C                   WHEN      ((TTACTI = 'POD') AND (TTDATE <= XLEVDT))
     C                   MOVE      'N'           XSENT
     C                   LEAVE
     C                   ENDSL
     C     TRACKL01K     READE     TRACKL01                               50
     C                   ENDDO
      *
     C                   ADD       1             XANTOPD
     C                   IF        XSENT = 'J'
     C                   ADD       1             XANTSENT
     C                   END
     C                   END
      *
      * STATISTIKK OM ANTALL ISO-SAKER
     C                   IF        XXMOD = 'I'
      *
     C                   MOVE      HEDTOPM       XXMND2
     C     WRKCGIK2      CHAIN     WRKCGISS                           33
     C                   IF        *IN33
     C                   Z-ADD     1             WANTOPDP
     C                   Z-ADD     0             WANTISOP
     C                   MOVE      *ZEROS        TPT
     C                   MOVE      *ZEROS        TAA
     C                   MOVE      *ZEROS        TAP
     C                   ELSE
     C                   ADD       1             WANTOPDP
     C                   END
     C     ISOFL1K       CHAIN     ISOFL1                             34
     C                   DOW       *IN34 = *OFF
     C                   ADD       1             WANTISOP
     C     1             DO        30            XN
     C                   IF        ISFPFO = KDPT(XN)
     C                   ADD       1             TPT(XN)
     C                   LEAVE
     C                   END
     C                   ENDDO
S01  C*    1             DO        60            XN
N01  C     1             DO        200           XN
     C                   IF        ISFPTAA = KDAA(XN)
     C                   ADD       1             TAA(XN)
     C                   GOTO      SJEKKANS
     C                   END
     C                   ENDDO
     C                   MOVE      ISFAVA        ISFPTAA2         10
S01  C*    1             DO        60            XN
N01  C     1             DO        200           XN
     C                   IF        ISFPTAA2 = KDAA(XN)
     C                   ADD       1             TAA(XN)
     C                   LEAVE
     C                   END
     C                   ENDDO
     C     SJEKKANS      TAG
     C     1             DO        100           XN
     C                   IF        ISFANS = KDAP(XN)
     C                   ADD       1             TAP(XN)
     C                   LEAVE
     C                   END
     C                   ENDDO
     C     ISOFL1K       READE     ISOFL1                                 34
     C                   ENDDO
     C                   IF        *IN33
     C                   EVAL      WKEY2 = XXKEY2
     C                   WRITE     WRKCGISR
     C                   ELSE
     C                   UPDATE    WRKCGISR
     C                   END
      *
     C                   END
      *
      *
     C                   END
      *
     C                   READ      HEADDT                                 50
     C  N50XDATOE        COMP      HEDTOP                               50
     C                   END
      *
      * ----------------------------------------------------
      * STATISTIKK OM ANTALL ISO-SAKER
     C     XDATOS        SETLL     ISOFL6
     C                   READ      ISOFL6                                 50
     C  N50XDATOE        COMP      ISFRDA                               50
      *
     C                   DOW       *IN50 = *OFF
      *
     C                   MOVE      ISFRDAM       XXMND6
     C     WRKCGIK6      CHAIN     WRKCGISS                           33
     C                   IF        *IN33
     C                   Z-ADD     0             WANTISOP
     C                   MOVE      *ZEROS        TPT
     C                   MOVE      *ZEROS        TAA
     C                   MOVE      *ZEROS        TAP
     C                   END
     C                   ADD       1             WANTISOP
     C     1             DO        30            XN
     C                   IF        ISFPFO = KDPT(XN)
     C                   ADD       1             TPT(XN)
     C                   LEAVE
     C                   END
     C                   ENDDO
S01  C*    1             DO        60            XN
N01  C     1             DO        200           XN
     C                   IF        ISFPTAA = KDAA(XN)
     C                   ADD       1             TAA(XN)
     C                   GOTO      SJEKKANS2
     C                   END
     C                   ENDDO
     C                   MOVE      ISFAVA        ISFPTAA2         10
S01  C*    1             DO        60            XN
N01  C     1             DO        200           XN
     C                   IF        ISFPTAA2 = KDAA(XN)
     C                   ADD       1             TAA(XN)
     C                   LEAVE
     C                   END
     C                   ENDDO
     C     SJEKKANS2     TAG
     C     1             DO        100           XN
     C                   IF        ISFANS = KDAP(XN)
     C                   ADD       1             TAP(XN)
     C                   LEAVE
     C                   END
     C                   ENDDO
     C                   IF        *IN33
     C                   EVAL      WKEY2 = XXKEY6
     C                   WRITE     WRKCGISR
     C                   ELSE
     C                   UPDATE    WRKCGISR
     C                   END
      *
     C                   READ      ISOFL6                                 50
     C  N50XDATOE        COMP      ISFRDA                               50
     C                   ENDDO
      * ----------------------------------------------------
      *
      *
     C                   EVAL      XXKEY = *BLANKS
     C                   EVAL      WDATA = *BLANKS
     C                   EVAL      XXLPKT = '990'
     C                   EVAL      XXLPANT1 = XANTOPD
     C                   EVAL      XXLPANT2 = XANTSENT
     C                   MOVE      XXKEY         WKEY2
     C                   WRITE     WRKCGISR
      *
     C                   ENDSR
      *
      *=====================================================================******
      * Set html output skeleton member before its read into memory
      *=====================================================================******
     C     SetSkl        begsr
      *------------------
      * Set html output skeleton member
     C                   eval      lng = uppify(lng)
      * "HTMLSRC  " er dft = NORSK, ved å trykke på FLAGGET i inng.
      * kan dette endre stil "HTMLSRCXX" avh. av støttede språk
     C                   eval      Lib = '*LIBL'
     C                   eval      Fn  = 'HTMLSRC' + lng
     C                   IF        FMELDNR = *BLANKS
     C                   eval      Mbr = 'EISO21'
     C                   ELSE
     C                   eval      Mbr = 'EISO20'
     C                   END
     C*                  CAT       XSPRÅK:0      MBR
      *
     C                   endsr
      *=====================================================================******
      *  Retrieve environment variables
      *=====================================================================******
     C     RtvEnvVar     begsr
      * Use getenvp to get this server's protocol and name
     C                   eval      S_Protocol =getenv('SERVER_PROTOCOL':
     C                             qusec)
     C                   eval      S_Name     =getenv('SERVER_NAME':
     C                             qusec)
      *
     C                   endsr
      *=====================================================================******
      *  INITIER
      *=====================================================================******
     C     INIT          begsr
     C                   OPEN      BRIDF
     C     WSUSER        CHAIN(N)  BRIDF                              50
     C* En "standardvariant" libl: call bound (INCGI=*MODULE) med parameter.
     C     BILIBL        ifeq      *blanks
     C                   callb     'INCGI'
     C                   parm                    BISTDL
     C                   else
     C* Helt egen bibl.liste satt på user - normal CALL (BILIBL er "*pgm")
     C                   call      BILIBL
     C                   end
      *
     C                   EXSR      TSTUSER
      *
OddEv * hent Parametre som går igjen i mange prog:
OddEv *      Odd/Even/Rowhead-farger,Logobilde,Språk,Intern/Ekstern bruker,  mm
OddEvc                   call      'ESGETPAR'
OddEvc                   parm                    BIBRID
OddEvc                   parm                    BIFIRM
OddEvc                   parm                    BIKUNR
OddEvc                   parm                    BIKNG
OddEvc                   parm                    RowHead          10
OddEvc                   parm                    Odd              10
OddEvc                   parm                    Even             10
OddEvc                   parm                    LogoImg          50
OddEvc                   parm                    XSPRÅK            2
OddEvc                   parm                    XINTERN           1
OddEvc                   parm                    ParmDS1        1024
OddEvc                   parm                    ParmDS2        1024
OddEvc                   parm                    ParmDS3        1024
      *
     C                   open      BRPARF                               50
     C                   open      HEADDT                               50
     C                   open      ISOFL1                               50
     C                   open      ISOFL6                               50
     C                   open      ISOKDA                               50
     C                   open      ISOKDP                               50
     C                   open      ISOKDT                               50
     C                   open      TRACKL01                             50
     C                   OPEN      WRKCGISS
      *
     C     TRACKL01K     klist
     C                   kfld                    HEAVD
     C                   kfld                    HEOPD
     C     ISOFL1K       klist
     C                   kfld                    HEAVD
     C                   kfld                    HEOPD
     C     WRKCGIK       klist
     C                   kfld                    WINTEG
     C                   kfld                    XXKEY
     C     WRKCGIK2      klist
     C                   kfld                    WINTEG
     C                   kfld                    XXKEY2          256
     C                   EVAL      XXKEY2 = '991'
     C     WRKCGIK6      klist
     C                   kfld                    WINTEG
     C                   kfld                    XXKEY6
     C                   EVAL      XXKEY6 = '996'
     C     BRPARFK       klist
     C                   kfld                    PABRID
     C                   kfld                    PAKUNR
     C                   kfld                    PAID
     C     WrkKey        KLIST
     C                   KFLD                    WINTEG
     C                   KFLD                    WKey2
      * Hent random integer som del 1 av unik key i workfile
     C     winteg        ifeq      *zeros
     C                   eval      WINTEG   = random(1:999999)
     C                   move      WINTEG        WINT
     C                   end
      *
     C                   CALL      'SYGE15C'
     C                   PARM                    WDT               8
     C                   PARM                    WTM               6
     C                   MOVEL     WDT           WDTÅ              4 0
     c                   MOVE      *BLANKS       XXKEY
     C                   MOVE      *BLANKS       WKEY2
     C                   MOVE      *BLANKS       WDATA
      *
     C                   endsr
      *
      *////////////////////////////////////////////////////////////
     C     TSTUSER       BEGSR
      *////////////////////////////////////////////////////////////
      /copy syspeds/qrpgsrcpy,tstuser
      *
     C                   endsr
      *
      *=====================================================================******
      *  AVSLUTT
      *=====================================================================******
     C     EXIT          begsr
     C                   close     BRPARF
     C                   close     BRIDF
     C                   close     HEADDT
     C                   close     ISOFL1
     C                   close     ISOFL6
     C                   close     ISOKDA
     C                   close     ISOKDP
     C                   close     ISOKDT
     C                   close     TRACKL01
     C                   close     WRKCGISS
     C                   eval      *inlr = *on
      *
     C                   endsr
      *
