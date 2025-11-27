      *********************************************************************
      * PROGRAM BEHANDLER INPUT FRA SS001 OG VISER ORDRE
      *
CRTPG+*  CRTPGM SYSPED/SS002 MODULE(*LIBL/SS002
CRTPGM*        *LIBL/CHECKUSR *LIBL/INCGI) ACTGRP(CGI) AUT(*USE)
      *
      *
      *********************************************************************
      * MAIN PROGRAM FLOW
      *********************************************************************
      /copy syspeds/qrpgsrcpy,hspecs
      /copy syspeds/qrpgsrcpy,hspecsbnd
     FWSSORF    UF A E           K DISK    USROPN
     FWSSORL01  IF   E           K DISK    USROPN
     F                                     RENAME(WSSORFR:WSSORFR01)
     FWSSORL02  IF   E           K DISK    USROPN
     F                                     RENAME(WSSORFR:WSSORFR02)
     FWSSORL03  IF   E           K DISK    USROPN
     F                                     RENAME(WSSORFR:WSSORFR03)
     FWSSORL04  IF   E           K DISK    USROPN
     F                                     RENAME(WSSORFR:WSSORFR04)
     FWSSORL05  IF   E           K DISK    USROPN
     F                                     RENAME(WSSORFR:WSSORFR05)
     FWSSORL06  IF   E           K DISK    USROPN
     F                                     RENAME(WSSORFR:WSSORFR06)
     FWSSORL07  IF   E           K DISK    USROPN
     F                                     RENAME(WSSORFR:WSSORFR07)
     FGSSORF    IF   E           K DISK    USROPN
     FGSSORL12  IF   E           K DISK    USROPN
     F                                     RENAME(GSSORFR:GSSORFR12)
     FGSSORL13  IF   E           K DISK    USROPN
     F                                     RENAME(GSSORFR:GSSORFR13)
     FGSSPOF    IF   E           K DISK    USROPN
     FGSSPOl01  IF   E           K DISK    USROPN
     F                                     RENAME(GSSPOFR:GSSPOFR01)
     FGSSPAF    IF   E           K DISK    USROPN
     FGSSTRF    IF   E           K DISK    USROPN
     FWRKCGI    UF a E           K DISK    USROPN
     FHEADF     IF   E           K DISK    USROPN
     FCDBOAT    IF   E           K DISK    USROPN
     FKOFAST    IF   E           K DISK    USROPN
     FBRPARF    IF   E           k disk    usropn
     FBRIDF     UF   E           K DISK    USROPN
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
      * Variables received from the input string
     D lng             s              2
     D BckGnd          s             10
     D UsrSpcName      s             10
     D WSUSER          S             10
     D WINT            S              6
     D WSNA            S             30
     D WSKDB           S              5
     D WSSTD           S              5
     D WSST            S              1
     D WSST_I          S              1
     D W2ST            S             30
     D WSCON           S             20
     D WSVEN           S             20    varying
     D WSCONT          S             20
     D WSSORT          S              1
     D WSSORT_I        S              1
     D W2SORT          S             30
     D WSONO           S              7
     D WSTNO           S             11
     D CLRWF           S              1
     D RDATF           S             10
     D RDATFN          S              8  0
     D RDATT           S             10
     D RDATTN          S              8  0
     D SDATF           S             10
     D SDATFN          S              8  0
     D SDATT           S             10
     D SDATTN          S              8  0
     D TXTCOL          S             10
     D lstbrd          s              1
     D GrpNr           s              8
     D PGM             C                   CONST('SYSPED/CHECKUSR')
      * Variables received from the input string
      * and converted to numeric
     D zeros           s             15a   inz('000000000000000')
     D NIER            s             20A   INZ('99999999999999999999')
     D l1              s              3s 0
     D l2              s              3s 0
      * Number of records matching search criteria
     DRecordCnt        s              5S 0
      *
     D Lib             s             10
     D Fn              s             10
     D Mbr             s             10
      *
     D ItemCount       s             10i 0
     D i               s             10i 0
     D Spaces          s             12a   inz('&nbsp;&nbsp;')
     D                 DS
     D  ORTNO                  1     11  0
     D  HEAVD                  1      4  0
     D  HEOPD                  5     11  0
     D                 DS
     D  HEGN                   1     15
     D  HEGN04                 1      4
     D  HEGN03                 5      7
     D  HEGN08                 8     15
     D  HEGN515                5     15
     D                 DS
     D  DataDs                 1    220
     D  POCONO                 1     20
     D  ORLC                  25     29
     D  ORSNM                 31     60
     D  ORDTL                 63     70  0
     D  ORSTAT                72    101
     D  ORCLI                103    107  0
     D  ORWT                 111    117  1
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
     C                   CALLB     PGM
     C                   PARM                    BIBRID
     C                   PARM                    UsrSpcName
     C                   PARM                    UINN              1
     C                   IF        UINN = 'N'
     C                   GOTO      SLUTT
     C                   END
     C     WSUSER        CHAIN     BRIDF                              50
     C                   CALL      'SYGE15C'
     C                   PARM                    WDT               8
     C                   PARM                    WTM               6
     C                   MOVE      WDT           BIDTF
     C                   MOVE      WTM           BITIDF
     C                   UPDATE    BRIDFR
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
      *------------------                                                   ******
      *------------------                                                   ******
      * Go to the last Recd already shown (1. time = from top)
     C     CLRWF         IFNE      'P'
     C                   exsr      GotoRecord
     C                   end
      *------------------                                                   ******
      * Write HTML sections
      * 2a-Section /$0found
     C     XRRN          IFEQ      9999999
     C                   callp     wrtsection('0found')
     C                   goto      endhtml
     C                   endif
      * 3-Section /$tablestr
     C                   exsr      SetTabStr
     C                   callp     wrtsection('tablestr')
      * Kun oppdatering av PICK - vis liste som før (uten å hente nye inn i w-fil)
     C     CLRWF         CABeq     'P'           StartVis
      * 4-Sections /$tablerow
     C                   MOVE      'N'           XNESTE            1
     C                   ADD       1             XRRN
     C                   MOVE      XRRN          WRRN
     C                   MOVE      WSUSER        WRUSER
     C                   IF        XRRN = 1
     C                   MOVE      'J'           XOK               1
     C                   ELSE
     C                   MOVE      'N'           XOK
     C                   END
      *
     C                   SELECT
     C                   WHEN      WSCON <> *BLANKS
     C     WSCON         SETLL     GSSPOL01
     C     STRLES01      TAG
     C                   READ      GSSPOL01                               50
     C  N50WSCONT        COMP      POCONO                               50
     C  N50POONO         CHAIN     GSSORF                               50
     C  N50              IF        WSKDB = 'ALL'
     C     ORCNO         CABNE     BIKUNR        STRLES01
     C                   ELSE
     C     ORBCD         CABNE     WSKDB         STRLES01
     C                   END
     C  N50WSSTD         IFNE      'ALL'
     C     ORLC          CABNE     WSSTD         STRLES01
     C                   END
     C                   WHEN      WSKDB = 'ALL'
     C     BIKUNR        SETLL     GSSORL13
     C     STRLES011     TAG
     C     BIKUNR        READE     GSSORL13                               50
     C  N50              IF        WSSTD <> 'ALL'
     C     ORLC          CABNE     WSSTD         STRLES011
     C                   END
     C                   WHEN      WSSTD <> 'ALL'
     C     GSSOR12K      SETLL     GSSORL12
     C     GSSOR12K      READE     GSSORL12                               50
     C                   OTHER
     C     WSKDB         SETLL     GSSORL12
     C     WSKDB         READE     GSSORL12                               50
     C                   ENDSL
      *
     C     *IN50         DOWEQ     '0'
      * TEST STATUS
     C     ORST          CABEQ     'D'           LESNESTE
      * TEST leverandør
     C     wsven         ifne      *blanks
     C     wsven         SCAN      ORSNM                                  34
     c     *IN34         CaBEQ     *OFF          LESNESTE
     c                   end
      * Rec dato fra/til
     C     RDATFN        IFNE      *ZEROS
     C     ORDTL         ANDLT     RDATFN
     C                   GOTO      LESNESTE
     C                   END
     C     RDATTN        IFNE      *ZEROS
     C     ORDTL         ANDGT     RDATTN
     C                   GOTO      LESNESTE
     C                   END
      *
     C                   SELECT
     C                   WHEN      ((WSST = '0') OR                             IN STOCK
     C                              (WSST = 'A'))                               IN STOCK (PARTIAL)
     C     ORST          CABLT     '0'           LESNESTE
     C     ORST          CABGT     '2'           LESNESTE
     C                   WHEN      WSST = 'B'                                   SHIPPED
     C     ORST          CABLT     '2'           LESNESTE
     C                   WHEN      WSST = 'C'                                   KUN IN WORK
     C     ORST          CABLT     '1'           LESNESTE
     C     ORST          CABGT     '2'           LESNESTE
     C                   WHEN      WSST = 'P'                                   PRE-REGISTRATIONS
     C     ORST          CABNE     'P'           LESNESTE
     C                   ENDSL
      * HENT ORDRE
     C                   IF        WSCON = *BLANKS
     C     ORONO         SETLL     GSSPOF
     C     ORONO         READE     GSSPOF                                 33
     C   33              GOTO      LESNESTE
     C                   END
      * TEST DELLEVERING
     C     ORONO         CHAIN     GSSPAF                             33
     C                   IF        *IN33
     C                   MOVE      'C'           PAPKD
     C                   MOVE      *BLANKS       PATXT1
     C                   MOVE      *BLANKS       PATXT2
     C                   MOVE      *BLANKS       PATXT3
     C                   MOVE      *BLANKS       PATXT4
     C                   MOVE      *BLANKS       PATXT5
     C                   END
     C                   IF        WSST = 'A'
     C     PAPKD         CABEQ     'C'           LESNESTE
     C                   END
      *
     C     ORTNO         CHAIN     GSSTRF                             33
     C   33              MOVE      *ZEROS        TRDTS
      * SHI dato fra/til
     C     SDATFN        IFNE      *ZEROS
     C     TRDTS         ANDLT     SDATFN
     C                   GOTO      LESNESTE
     C                   END
     C     SDATTN        IFNE      *ZEROS
     C     TRDTS         ANDGT     SDATTN
     C                   GOTO      LESNESTE
     C                   END
     C     HEADFK        CHAIN     HEADF                              33
     C   33              MOVE      *BLANKS       HEGN
      *
     C                   ADD       1             XANTREC           5 0
     C                   ADD       1             WRRN                     50
     C                   WRITE     WSSORFR
     C                   IF        XANTREC = 1000
     C                   MOVE      'J'           XNESTE
     C                   GOTO      STARTVIS
     C                   END
      *
     C     LESNESTE      TAG
     C                   SELECT
     C                   WHEN      WSCON <> *BLANKS
     C     STRLES02      TAG
     C                   READ      GSSPOL01                               50
     C  N50WSCONT        COMP      POCONO                               50
     C  N50POONO         CHAIN     GSSORF                               50
     C  N50              IF        WSKDB = 'ALL'
     C     ORCNO         CABNE     BIKUNR        STRLES02
     C                   ELSE
     C     ORBCD         CABNE     WSKDB         STRLES02
     C                   END
     C  N50WSSTD         IFNE      'ALL'
     C     ORLC          CABNE     WSSTD         STRLES02
     C                   END
     C                   WHEN      WSKDB = 'ALL'
     C     STRLES021     TAG
     C     BIKUNR        READE     GSSORL13                               50
     C  N50              IF        WSSTD <> 'ALL'
     C     ORLC          CABNE     WSSTD         STRLES021
     C                   END
     C                   WHEN      WSSTD <> 'ALL'
     C     GSSOR12K      READE     GSSORL12                               50
     C                   OTHER
     C     WSKDB         READE     GSSORL12                               50
     C                   ENDSL
     C  N50              ENDDO
      *
      * FERDIG Å FYLLE OPP WORKFILE
      *    LES / VIS POSTER BASERT PÅ W-FIL
      *
     C     STARTVIS      TAG
     C                   z-add     0             bseq              5 0
     C                   SELECT
     C                   WHEN      ((WSCON <> *BLANKS) OR (WSSORT = 'P'))
     C     WSUSER        SETLL     WSSORL01
     C     WSUSER        READE     WSSORL01                               50
     C                   WHEN      WSSORT = 'O'
     C     WSUSER        SETLL     WSSORL02
     C     WSUSER        READE     WSSORL02                               50
     C                   WHEN      WSSORT = 'L'
     C     WSUSER        SETLL     WSSORL03
     C     WSUSER        READE     WSSORL03                               50
     C                   WHEN      WSSORT = 'V'
     C     WSUSER        SETLL     WSSORL04
     C     WSUSER        READE     WSSORL04                               50
     C                   WHEN      WSSORT = 'R'
     C     WSUSER        SETLL     WSSORL05
     C     WSUSER        READE     WSSORL05                               50
     C                   WHEN      WSSORT = 'S'
     C     WSUSER        SETLL     WSSORL06
     C     WSUSER        READE     WSSORL06                               50
     C                   WHEN      WSSORT = 'A'
     C     WSUSER        SETLL     WSSORL07
     C     WSUSER        READE     WSSORL07                               50
     C                   OTHER
     C     WSSORFK       SETLL     WSSORF
     C     WSUSER        READE(N)  WSSORF                                 50
     C                   ENDSL
     C     *in50         doweq     '0'
     C                   IF        WRRN >= XRRN
     C                   eval      bseq=bseq + 1
     C                   exsr      SetTabRow
     C                   callp     wrtsection('tablerow')
     C                   END
     C                   SELECT
     C                   WHEN      ((WSCON <> *BLANKS) OR (WSSORT = 'P'))
     C     WSUSER        READE     WSSORL01                               50
     C                   WHEN      WSSORT = 'O'
     C     WSUSER        READE     WSSORL02                               50
     C                   WHEN      WSSORT = 'L'
     C     WSUSER        READE     WSSORL03                               50
     C                   WHEN      WSSORT = 'V'
     C     WSUSER        READE     WSSORL04                               50
     C                   WHEN      WSSORT = 'R'
     C     WSUSER        READE     WSSORL05                               50
     C                   WHEN      WSSORT = 'S'
     C     WSUSER        READE     WSSORL06                               50
     C                   WHEN      WSSORT = 'A'
     C     WSUSER        READE     WSSORL07                               50
     C                   OTHER
     C     WSUSER        READE(N)  WSSORF                                 50
     C                   ENDSL
     C  N50              ENDDO                                                  *hival
      *
      * 5-Section /$tableend
     C                   callp     wrtsection('tableend')
      *
      * 5a-Section /$foundsome
     C     WRRN          IFLT      9999999
     C                   exsr      SetFndSome
     C                   IF        XNESTE = 'J'
     C                   callp     wrtsection('foundsome')
     C                   ELSE
     C                   callp     wrtsection('foundsome2')
     C                   END
     C                   endif
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
      *=====================================================================******
      * Parse input
      *=====================================================================******
     C     Parse         begsr
     C                   MOVE      'N'           XFEIL             1
     C                   eval      lng     = zhbgetvar('lng')
     C                   eval      BckGnd  = zhbgetvar('bckgnd')
     C                   eval      lstbrd  = zhbgetvar('lstbrd')
     C                   EVAL      WSUSER  = zhbgetvar('USER')
     C                   EVAL      WINT    = zhbgetvar('WINT')
     C                   eval      WINTEG  = c2n2(WINT)
     C                   EVAL      UsrSpcName  = zhbgetvar('UsrSpcName')
     C                   EVAL      WSNA    = zhbgetvar('WSNA')
     C                   EVAL      WSKDB   = zhbgetvar('WSKDB')
     C                   EVAL      WSSTD   = zhbgetvar('WSSTD')
     C                   EVAL      WSST    = zhbgetvar('WSST')
     C                   EVAL      WSST_I  = zhbgetvar('WSST')
     C                   EVAL      WSCON   = zhbgetvar('WSCON')
     C                   EVAL      WSCON   = uppify(WSCON)
     C                   EVAL      WSVEN   = zhbgetvar('WSVEN')
     C                   EVAL      WSVEN   = uppify(WSVEN)
     C                   EVAL      WSCONT  = WSCON
     C                   IF        WSCON <> *BLANKS
     C                   EVAL      WSST = '*'
     C                   END
     C                   CAT       NIER:0        WSCONT
     C                   EVAL      WSSORT_I= zhbgetvar('WSSORT')
     C                   IF        WSCON   = *BLANKS
     C                   EVAL      WSSORT  = zhbgetvar('WSSORT')
     C                   ELSE
     C                   EVAL      WSSORT  = 'P'
     C                   END
     C                   EVAL      CLRWF   = zhbgetvar('CLRWF')
     C                   eval      RDATF   = zhbgetvar('RDATF')
     C                   eval      RDATFN  = c2n2(RDATF)
     C                   eval      RDATT   = zhbgetvar('RDATT')
     C                   eval      RDATTN  = c2n2(RDATT)
     C                   eval      SDATF   = zhbgetvar('SDATF')
     C                   eval      SDATFN  = c2n2(SDATF)
     C                   eval      SDATT   = zhbgetvar('SDATT')
     C                   eval      SDATTN  = c2n2(SDATT)
      *
     C                   endsr
      *=====================================================================******
      *  Set output variables for section /$top
      *  (search criteria)
      *=====================================================================******
     C     SetTop        begsr
      * Repeat national language for the next invocation
     C                   callp     updhtmlvar('LNG':lng:
     C                             InitHTMLVars)
      * Color for text, background, links, visited links, active links
     C                   callp     updhtmlvar('TXTCOLOR':'black')
     C                   callp     updhtmlvar('BOLD':' ')
     C                   callp     updhtmlvar('BGCOLOR':BIFARG)
     C                   callp     updhtmlvar('LINK':'0000FF')
     C                   callp     updhtmlvar('VLINK':'FF0000')
     C                   callp     updhtmlvar('ALINK':'00FF00')
     C                   callp     updhtmlvar('WSNA':WSNA)
BODY C                   callp     updhtmlvar('BODYCLASS':'class='+BIFARG)
     C                   callp     updhtmlvar('USER':WSUSER)
     C                   callp     updhtmlvar('WINT':WINT)
     C                   callp     updHtmlVar('UsrSpcName':UsrSpcName)
     C                   callp     updHTMLvar('sdato':
     C                             %trim(%editw(BIDTV:'    .  .  ')))
     C                   callp     updHTMLvar('stid':
     C                             %trim(%editw(BITIDV:'  .  .  ')))
     C                   IF        WSCON <> *BLANKS
     C                   callp     updhtmlvar('WSKDB':'ALL')
     C                   callp     updhtmlvar('WSNAB':' ')
     C                   ELSE
     C                   callp     updhtmlvar('WSKDB':WSKDB)
     C                   callp     updhtmlvar('WSNAB':CBNAB)
     C                   END
     C                   callp     updhtmlvar('WSSTD':WSSTD)
     C                   callp     updhtmlvar('WSST':WSST_I)
     C                   callp     updhtmlvar('WSCON':WSCON)
     C                   callp     updhtmlvar('WSVEN':WSVEN)
     C     RDATFN        Ifeq      *Zeros
     C                   callp     updHTMLvar('RDATF':' ')
     c                   else
     C                   callp     updHTMLvar('RDATF':
     C                             %trim(%editw(RDATFN:'    .  .  ')))
     c                   end
     C     RDATTN        Ifeq      *Zeros
     C                   callp     updHTMLvar('RDATT':' ')
     c                   else
     C                   callp     updHTMLvar('RDATT':
     C                             %trim(%editw(RDATTN:'    .  .  ')))
     c                   end
     C     SDATFN        Ifeq      *Zeros
     C                   callp     updHTMLvar('SDATF':' ')
     c                   else
     C                   callp     updHTMLvar('SDATF':
     C                             %trim(%editw(SDATFN:'    .  .  ')))
     c                   end
     C     SDATTN        Ifeq      *Zeros
     C                   callp     updHTMLvar('SDATT':' ')
     c                   else
     C                   callp     updHTMLvar('SDATT':
     C                             %trim(%editw(SDATTN:'    .  .  ')))
     c                   end
     C                   SELECT
     C                   WHEN      WSST = '*'
     C                   EVAL      W2ST = 'ALL'
     C                   WHEN      WSST = '0'
     C                   EVAL      W2ST = 'ON STOCK'
     C                   WHEN      WSST = 'A'
     C                   EVAL      W2ST = 'ON STOCK (PARTIAL)'
     C                   WHEN      WSST = 'B'
     C                   EVAL      W2ST = 'SHIPPED'
     C                   WHEN      WSST = 'B'
     C                   EVAL      W2ST = 'IN WORK ONLY'
     C                   WHEN      WSST = 'P'
     C                   EVAL      W2ST = 'PRE-REGISTRATIONS'
     C                   END
     C                   callp     updhtmlvar('W2ST':W2ST)
     C                   SELECT
     C                   WHEN      WSSORT = 'O'
     C                   EVAL      W2SORT = 'ORDER NO.'
     C                   WHEN      WSSORT = 'P'
     C                   EVAL      W2SORT = 'PO. NO.'
     C                   WHEN      WSSORT = 'L'
     C                   EVAL      W2SORT = 'STOCK LOCATION'
     C                   WHEN      WSSORT = 'V'
     C                   EVAL      W2SORT = 'VENDOR'
     C                   WHEN      WSSORT = 'R'
     C                   EVAL      W2SORT = 'REC.DATE'
     C                   WHEN      WSSORT = 'S'
     C                   EVAL      W2SORT = 'SHIPPED DATE'
     C                   END
     C                   callp     updhtmlvar('WSSORT':WSSORT_I)
     C                   callp     updhtmlvar('W2SORT':W2SORT)
      * Kun oppdatering av PICK, Fix i WRKCGI for senere visning av liste
     C                   IF        CLRWF = 'P'
     C                   EXSR      OPDWCGI
     C                   END
     C                   move      *blanks       PickHead        100
     C                   move      *blanks       PickList        100
     C     PickOK        Ifeq      'Y'
     C     WSKDB         Andne     'ALL'
     C     WSSTD         Andne     'ALL'
      * Pick-buton som kolonnheader, (trykk på den = oppdater pick/unpick)
     C                   eval      PickHead='<INPUT TYPE="SUBMIT" '+
     C                             'VALUE="Pick">'
      * Sjekk om det finne plukkede på denne båten - vis  button for å lage liste
     C                   EXSR      TSTWCGI
     C                   end
     C                   callp     updHTMLvar('PickHead':PickHead)
     C                   callp     updHTMLvar('PickList':PickList)
     C                   callp     updHTMLvar('KEY2':XBCDLC)
      *
     C                   endsr
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
      *=====================================================================******
      *  Set output variables for section /$tablerow (table row)
      *=====================================================================******
     C     SetTabRow     begsr
     c* Sequence of this Recd (numeric, converted to char)
     C                   move      bseq          bseqchar          5
     C                   callp     updhtmlvar('SEQ':bseqchar)
     C                   callp     updhtmlvar('ORONO':
     C                             %trim(%editc(ORONO:'Z')))
     C                   MOVE      ORONO         WSONO
     C                   callp     updhtmlvar('WSONO':WSONO)
     C                   callp     updhtmlvar('POCONO':POCONO)
     C                   if        WSCON <> *BLANKS
     c                   clear                   w1cono          360
     c                   movel     pocono        w1cono
     c                   else
     C                   exsr      hentpo
     c                   end
     C                   callp     updhtmlvar('w1CONO':w1CONO)
     C                   callp     updhtmlvar('ORBCD':ORBCD)
     C                   callp     updhtmlvar('ORLC':ORLC)
     C                   MOVE      *BLANKS       ORSTAT           30
     C                   SELECT
     C                   WHEN      ORST = 'P'
     C                   EVAL      ORSTAT = 'PRE-REGISTRATIONS'
     C                   EVAL      TXTCOL = 'DEEPGREEN'
     C                   WHEN      ((ORST = '0') AND (PAPKD = 'C'))
     C                   EVAL      ORSTAT = 'IN STOCK'
     C                   EVAL      TXTCOL = 'BLACK'
     C                   WHEN      ((ORST = '0') AND (PAPKD = 'P'))
     C                   EVAL      ORSTAT = 'IN STOCK (PARTIAL)'
     C                   EVAL      TXTCOL = 'BLACK'
     C                   WHEN      ((ORST = '0') AND (PAPKD = ' '))
     C                   EVAL      ORSTAT = 'IN STOCK (PARTIAL, NOT COMPL.)'
     C                   EVAL      TXTCOL = 'PINK'
     C                   WHEN      ((ORST = '1') OR (ORST = '2'))
     C                   IF        PAPKD = 'C'
     C                   EVAL      ORSTAT = 'IN WORK'
     C                   EVAL      TXTCOL = 'GREEN'
     C                   ELSE
     C                   EVAL      ORSTAT = 'IN WORK (PARTIAL)'
     C                   EVAL      TXTCOL = 'RED'
     C                   END
     C                   WHEN      ORST > '2'
     C                   IF        PAPKD = 'C'
     C                   EVAL      ORSTAT = 'SHIPPED'
     C                   EVAL      TXTCOL = 'LILAC'
     C                   ELSE
     C                   EVAL      ORSTAT = 'SHIPPED (PARTIAL)'
     C                   EVAL      TXTCOL = 'YELLOW'
     C                   END
     C                   ENDSL
     C                   callp     updhtmlvar('TXTCOL':TXTCOL)
     C                   callp     updhtmlvar('ORSTAT':ORSTAT)
     C                   IF        ORDTL = 0
     C                   callp     updhtmlvar('ORDTL':
     C                             %trim(%editW(ORDTWL:'    .  .  ')))
     C                   ELSE
     C                   callp     updhtmlvar('ORDTL':
     C                             %trim(%editW(ORDTL:'    .  .  ')))
     C                   END
     C                   callp     updhtmlvar('ORCLI':
     C                             %trim(%editc(ORCLI:'Z')))
     C                   callp     updhtmlvar('ORWT':
     C                             %trim(%editc(ORWT:'4')))
     C                   callp     updhtmlvar('ORSNM':ORSNM)
     C                   callp     updhtmlvar('ORTNO':
     C                             %trim(%editc(ORTNO:'Z')))
     C                   MOVE      ORTNO         WSTNO
     C                   callp     updhtmlvar('WSTNO':WSTNO)
     C                   callp     updhtmlvar('ORCURC':ORCURC)
     C                   callp     updhtmlvar('ORAMT':
     C                             %trim(%editc(ORAMT:'4')))
     C                   callp     updhtmlvar('TRDTS':
     C                             %trim(%editW(TRDTS:'    .  .  ')))
     C     HEGN515       IFEQ      '00000000000'
     C                   MOVE      *BLANKS       HEGN
     C                   end
     C                   IF        HEGN04 = *BLANKS
     C                   MOVE      *BLANKS       KFKOD
     C                   MOVEL     HEGN03        KFKOD
     C     KOFASTK       CHAIN     KOFAST                             33
     C   33KOFASTK2      CHAIN     KOFAST                             33
     C                   MOVE      *BLANKS       XTXT            200
     C                   MOVE      KFTXTE        XTXTA             1
     C                   MOVE      ' '           KFTXTE
     C                   MOVEL     KFTXT         XTXT
     C                   CAT       KFTXTE:0      XTXT
     C                   MOVEL     HEGN03        KFKOD1
     C     KOFASTK1      CHAIN     KOFAST                             33
     C                   IF        *IN33 = *OFF
     C                   MOVE      KFTXTE        XTXTA             1
     C                   MOVE      ' '           KFTXTE
     C                   CAT       KFTXT:0       XTXT
     C                   CAT       KFTXTE:0      XTXT
     C                   ENDIF
     C                   IF        XTXTA = 'A'
     C                   CAT       HEGN08:0      XTXT
     C                   ENDIF
     C                   ELSE
     C     KOFASTK2      CHAIN     KOFAST                             33
     C                   MOVE      *BLANKS       XTXT
     C                   MOVEL     KFTXT         XTXT
     C                   ENDIF
     C                   callp     updhtmlvar('HEGN':HEGN)
     C                   callp     updhtmlvar('TRACKING':XTXT)
      * Plukke ordre til liste...
     C                   move      *blanks       PickDet         100
     C     PickOK        IFEQ      'Y'
     C     WSKDB         Andne     'ALL'
     C     WSSTD         Andne     'ALL'
     C                   MOVE      WSONO         WSONOA            7
     C                   EVAL      PickDet='<input type="checkbox" '+
     C                             'name="WSONOA" value="'+WSONOA+'">&nbsp;'
      *
     C                   Movel     ORBCD         XBCDLC           10
     C                   Move      ORLC          XBCDLC
     C                   eval      WKEY2    =    XBCDLC
     C                   MOVE      ORONO         WKEY2
     c     WCgiKey       Chain     WRKCGI                             33
     C     *in33         ifeq      *ON
     C                   CLEAR                   WRKCGIR
     C                   EVAL      PickDet=%trim(PickDet)+'<b> </b>'
     C                   else
     C                   EVAL      PickDet=%trim(PickDet)+'<b>X</b>'
     C                   Movel     DataDs        WData
     C                   update    WRKCGIR
     C                   end
     C                   end
     C                   callp     updHTMLvar('PickDet':PickDet)
      *
     C                   endsr
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
     C*  Go to the last Recd aleady shown
      *=====================================================================******
     C     GotoRecord    begsr
     C     WSSORFK       SETLL     WSSORF
     C     WSUSER        READPE(N) WSSORF                                 50
     C                   IF        *IN50
     C                   MOVE      *ZEROS        XRRN              7 0
     C                   MOVE      *ZEROS        XONO              7 0
     C                   ELSE
     C                   MOVE      ORONO         XONO
     C                   MOVE      WRRN          XRRN
     C                   END
      *
     C                   SELECT
     C                   WHEN      WSCON <> *BLANKS
     C     WSCON         SETLL     GSSPOL01
     C     STRLES03      TAG
     C                   READ      GSSPOL01                               50
     C  N50WSCONT        COMP      POCONO                               50
     C  N50POONO         CHAIN     GSSORF                               50
     C  N50              IF        WSKDB = 'ALL'
     C     ORCNO         CABNE     BIKUNR        STRLES03
     C                   ELSE
     C     ORBCD         CABNE     WSKDB         STRLES03
     C                   END
     C  N50WSSTD         IFNE      'ALL'
     C     ORLC          CABNE     WSSTD         STRLES03
     C                   END
     C                   WHEN      (((((WSKDB = 'ALL') AND
     C                                 (WSSTD = 'ALL')) AND
     C                                 (WSST = '*')) AND
     C                                 (SDATFN = 0)) AND
     C                                 (RDATFN = 0))
     C                   MOVE      *ON           *IN50
     C                   WHEN      WSKDB = 'ALL'
     C     BIKUNR        SETLL     GSSORL13
     C     STRLES031     TAG
     C     BIKUNR        READE     GSSORL13                               50
     C  N50              IF        WSSTD <> 'ALL'
     C     ORLC          CABNE     WSSTD         STRLES031
     C                   END
     C                   WHEN      WSSTD <> 'ALL'
     C     GSSOR12K      SETLL     GSSORL12
     C     GSSOR12K      READE     GSSORL12                               50
     C                   OTHER
     C     WSKDB         SETLL     GSSORL12
     C     WSKDB         READE     GSSORL12                               50
     C                   ENDSL
     C   50              MOVE      999999999     XRRN
      *
     C                   endsr
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
     C                   eval      Mbr = 'SS002'
      *------------------
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
     C                   CALLB     'INCGI'
     C                   PARM                    BISTDL
     C                   else
     C* Helt egen bibl.liste satt på user - normal CALL (BILIBL er "*pgm")
     C                   call      BILIBL
     C                   end
     C                   open      GSSORF                               50
     C                   open      GSSORL12                             50
     C                   open      GSSORL13                             50
     C                   open      GSSPOF                               50
     C                   open      GSSPOL01                             50
     C                   open      GSSPAF                               50
     C                   open      GSSTRF                               50
     C                   open      WSSORF                               50
     C                   open      WSSORL01                             50
     C                   open      WSSORL02                             50
     C                   open      WSSORL03                             50
     C                   open      WSSORL04                             50
     C                   open      WSSORL05                             50
     C                   open      WSSORL06                             50
     C                   open      WSSORL07                             50
     C                   open      WRKCGI
     C                   open      HEADF
     C                   OPEN      CDBOAT
     C                   OPEN      KOFAST
     C                   OPEN      BRPARF
      *
     C     WSSORFK       klist
     C                   kfld                    WSUSER
     C                   kfld                    XRRN
     C     WSSORF1K      klist
     C                   kfld                    WSUSER
     C                   kfld                    WSKDB
     C                   kfld                    WSCON
     C     GSSOR12K      klist
     C                   kfld                    WSKDB
     C                   kfld                    WSSTD
     C     WCgiKey       klist
     C                   kfld                    WINTEG
     C                   kfld                    WKEY2
     C     HEADFK        klist
     C                   kfld                    HEAVD
     C                   kfld                    HEOPD
     C     KOFASTK       klist
     C                   kfld                    KFTYP
     C                   kfld                    KFKOD
     C                   MOVEL     'WEBETRACK'   KFTYP
     C     KOFASTK1      klist
     C                   kfld                    KFTYP
     C                   kfld                    KFKOD1            5
     C                   MOVEL     '   **'       KFKOD1
     C     KOFASTK2      klist
     C                   kfld                    KFTYP
     C                   kfld                    KFKOD2            5
     C                   MOVEL     'OTHER'       KFKOD2
     C     BrParKey      klist
     C                   kfld                    PABRID
     C                   kfld                    PAKUNR
     C                   kfld                    PAID
     C                   MOVE      BIBRID        PABRID
     C                   MOVE      *zeros        PAKUNR
     C                   MOVE      'SSPLM'       PAID
     C     BrParKey      CHAIN     BRPARF                             33
     c  N33              move      'Y'           PickOK            1
      *
     C     WSKDB         CHAIN     CDBOAT                             33
      *
     C                   IF        CLRWF = 'J'
     C     WSUSER        SETLL     WSSORF
     C     WSUSER        READE     WSSORF                                 33
     C     *IN33         DOWEQ     '0'
     C                   DELETE    WSSORFR
     C     WSUSER        READE     WSSORF                                 33
     C  N33              ENDDO
     C                   END
      *
     C                   endsr
      *
      *=====================================================================******
     C     OPDWCGI       begsr
      * Checkbox ticked = legg til om den ikke finnes / fjern om den finnes
     C                   eval      ItemCount = ZhbGetVarCnt('WSONOA')
     C                   eval      i = 1
     C     i             DOWLE     ItemCount
     C                   eval      WSONOA  = ZhbGetVar('WSONOA':i)
     C                   Movel     WSKDB         XBCDLC           10
     C                   Move      WSSTD         XBCDLC
     C                   eval      WKEY2    =    XBCDLC
     C                   MOVE      WSONOA        WKEY2
     C     WCgiKey       CHAIN     WRKCGI                             33
     C   33              Write     WRKCGIR
     C  N33              Delete    WRKCGIR
     C                   eval      i = i +1
     C                   ENDDO
     C
     C                   endsr
      *=====================================================================******
     C     TSTWCGI       begsr
      * Finnes valgte poster for denne båten/lokasjonen
     C                   Movel     WSKDB         XBCDLC           10
     C                   Move      WSSTD         XBCDLC
     C                   eval      WKEY2    =    XBCDLC
     C     WCgiKey       setll     WRKCGI
     C                   Read      WRKCGI                                 33
     C                   Movel     wkey2         Wkey2_10         10
     C     *in33         Ifeq      *OFF
     c     XBCDLC        andeq     WKEY2_10
     C                   eval      PickList='<INPUT TYPE="BUTTON" ' +
     C                                      'VALUE="Print/send Pick List" '+
     C                                      'onClick="GoToPlist()">'
     C                   END
     C
     C                   endsr
      *=====================================================================******
      *  AVSLUTT
      *=====================================================================******
     C     EXIT          begsr
     C                   close     BRIDF
     C                   close     GSSORF
     C                   close     GSSORL12
     C                   close     GSSORL13
     C                   close     GSSPOF
     C                   close     GSSPOL01
     C                   close     GSSPAF
     C                   close     GSSTRF
     C                   close     WSSORF
     C                   close     WSSORL01
     C                   close     WSSORL02
     C                   close     WSSORL03
     C                   close     WSSORL04
     C                   close     WSSORL05
     C                   close     WSSORL06
     C                   close     WSSORL07
     C                   close     WRKCGI
     C                   close     HEADF
     C                   close     CDBOAT
     C                   close     KOFAST
     C                   close     BRPARF
     C                   eval      *inlr = *on
      *
     C                   endsr
      *=====================================================================******
     C     hentpo        begsr
      *
     c                   setoff                                       51
     c                   clear                   w1cono
     C     ORONO         SETLL     GSSPOF
     C     ORONO         READE     GSSPOF                                 51
     c                   movel     pocono        w1cono
     C                   if        WSCON = *BLANKS
     c     *IN51         DOWEQ     '0'
     C     ORONO         READE     GSSPOF                                 51
     C  n51w1cono        CAT       '<br>':0      w1cono
     C  n51w1cono        CAT       pocono:0      w1cono
     c  n51              enddo
     c                   endif
     c                   endsr
