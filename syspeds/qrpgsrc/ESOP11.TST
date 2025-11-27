      *********************************************************************
      * PROGRAM BEHANDLER INPUT FRA SYMN1 OG VISER LISTE
      *
      *  CRTPGM SYSPED/ESOP11 MODULE(*LIBL/ESOP11 *LIBL/ESOP13
      *        *LIBL/CHECKUSR *LIBL/INCGI) ACTGRP(CGI) AUT(*USE)
********************************************************************
      * RETTINGER I DETTE PROGRAM:
PTFnr:*Sek Sig Vers  Beskrivelse...........................
""""""*"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
10XXX * 01 YBC PTF10 IKKE SETT AVDLING FORAN HEREFF
10XXX * 02 YBC PTF10 PARAMETERSTYRT OM OPPDRAG DIREKT INN PRODUKSJON
10XXX * 03 YBC PTF10 ARBEIDSGIVER KAN VÆRE EN ANNEN EN SELV
10015 * 04 YBC PTF10 OPPDATER T & T
10XXX * 05 YBC PTF10 FEILRETTING PÅ ENDRING 03
10XXX * 06 jov PTF10 DFT LABTY / labletype er Z=Zebra
10XXX * 07 YBC PTF10 KONVERTER SÆR-TEGN
********************************************************************
      *
      *********************************************************************
      * MAIN PROGRAM FLOW
      *********************************************************************
      /copy syspeds/qrpgsrcpy,hspecs
      /copy syspeds/qrpgsrcpy,hspecsbnd
     FZEADL05   UF   E           K DISK    USROPN
     Fzreetxt1  UF A E           K DISK    USROPN
     Fzrisol01  UF   E           K DISK    USROPN
     Fzokufm1   UF A E           K DISK    USROPN
N04  FZTRACKF   O  A E             DISK    USROPN
     FCUNDL01   IF   E           K DISK    USROPN
     FBRIDF     UF   E           K DISK    USROPN
     FBRPARF    if   e           k disk    usropn
     FFIRM      if   e           k disk    usropn
     FWRKCGI    O  A E             DISK    usropn
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
     D UsrSpcName      s             10
     D WSUSER          S             10
     D WSNA            S             30
     D WSREFF          S             17
     D XXSEND          S             10
     D XXslett         S              1
     D AVVKNR          S              8
     D AVVKNRN         S              8  0
     D ErrTxt          S            500
     D GrpNr           s              8
     D Sndnr           S             20
     D A               S              1    DIM(15)
     D PGM             C                   CONST('SYSPED/CHECKUSR')
      * Other
     D FraLk           s              2
     D TilLk           s              2
      *Array for fri-tekster
     D                 DS
     D  TEXT                   1   6300
     D  TX                     1   6300    DIM(6300)
     D                 DS
     D  TXT1                   1   6300
     D  TX1                    1   6300    DIM(90)
     D                 DS
     D  TXT2                   1   6300
     D  TX2                    1   6300    DIM(90)
     D                 DS
     D  TXT3                   1   6300
     D  TX3                    1   6300    DIM(90)
     D                 DS
     D  FTX                    1     70
     D  FT                     1     70    DIM(70)
N07  D                 DS
N07  D  XTXT801                1     80
N07  D  XT801                  1     80    DIM(80)
N07  D                 DS
N07  D  XTXT802                1     80
N07  D  XT802                  1     80    DIM(80)
     D Wpos            s              4  0
     D Gmpos           s              4  0
     D BLF             s              4  0
     D Tst700          s            700
      * Definere  hex 0D / 25 (CRLF)
     D Hex0D           c                   x'0D'
     D Hex25           c                   x'25'
      *
     D Lib             s             10
     D Fn              s             10
     D Mbr             s             10
     D ItemCount       s             10i 0
     D i               s             10i 0
     D                 DS
     D  PAVRDA                 1     50
     D  PAVRDA5                1      5
     D  PAVRDTxt               6     50
     D                 DS
     D  DataDS                 1    220
     D  WDsANT                 1      4  0
     D  WDsVKT                 5     10  0
     D  WDsM3                 11     17  3
     D  WDsLM                 18     21  2
     D  WDsREF                22     36
     D  WDsMNavn              37     66
     D  WDsMAdr1              67     96
     D  WDsMPnSt              97    126
     D  WDsSndnr             127    146
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
      * dato/tid siste vellykkede operasjon.
     C     WSUSER        CHAIN     BRIDF                              50
     C                   CALL      'SYGE15C'
     C                   PARM                    WDT               8
     C                   PARM                    WTM               6
     C                   MOVE      WDT           BIDTF
     C                   MOVE      WTM           BITIDF
     C                   UPDATE    BRIDFR
     C                   MOVE      BIBESK        WINT              3
      *
      *
      * ER DET BEDT OM PRINT AV HENTELISTE..(submit med checked i xx poster)
     C                   eval      ItemCount = ZhbGetVarCnt('HLIST')
     C     ItemCount     IFGT      *ZEROS
     C                   EXSR      HENTELISTE
     C     ErrTxt        CABEQ     *blanks       Slutt
     C                   END
      *
      * WSREFF skal være UNIK (innen åpne poster for en bruker/kunde)
      * STATUS-endring (send eller slett)
     C                   IF        WSREFF <> *BLANKS
     C                   IF        AVVKNRN <> 0
     C                   EVAL      BIKUNR=AVVKNRN
     C                   ENDIF
     C     Zead5Key      CHAIN     ZEADL05                            33
     C     *IN33         IFEQ      '0'
     C                   IF        XXSEND = 'SEND'
     C                   EXSR      SndOppd
     C                   ELSE
     C                   IF        XXSLETT = 'Y'
     C                   MOVE      'S'           HEST
     C                   END
     C                   UPDATE    HEADFR
     C                   END
     C                   END
     C                   END
      *
      * Set output skeleton html member name
     C                   exsr      SetSkl
      * Read skeleton output html, etc.
     C                   callp     gethtml(fn:lib:mbr:'/CGITAG/')
      *------------------                                                   ******
      * Write HTML sections
      *
      * 1-Section /$top
     C                   exsr      SetTop
     C                   callp     wrtsection('top')
      * 3-Section /$tablestr
     C                   callp     wrtsection('tablestr')
      * 4-Sections /$tablerow
      *
S03  C*    BIKUNR        SETLL     ZEADL05
S03  C*    BIKUNR        READE(N)  ZEADL05                                50
N03  C     XKNGIVER      SETLL     ZEADL05
N03  C     XKNGIVER      READE(N)  ZEADL05                                50
     C     *in50         doweq     '0'
N03  C                   IF        (((XKNGIVER <> BIKUNR) AND
N03  C                               (HEKNS <> BIKUNR)) AND
N03  C                               (HEKNK <> BIKUNR))
N03  C                   GOTO      XLESNESTE
N03  C                   END
     C                   exsr      SetTabRow
     C                   callp     wrtsection('tablerow')
S03  C*    BIKUNR        READE(N)  ZEADL05                                50
N03  C     XLESNESTE     TAG
N03  C     XKNGIVER      READE(N)  ZEADL05                                50
     C                   ENDDO                                                  *hival
      *
      * 5-Section /$tableend
     C                   callp     wrtsection('tableend')
      *
      * 5a-Section  type oppdrag ved New..
     C                   exsr      CrtNewTyp
      * 5b-Section  Bytt kunde
     C     WINT          IFEQ      '*I*'
     C                   callp     wrtsection('byttku')
     C                   ENDIF
      * 6-Section /$endhtml
     C     endhtml       tag
     C                   exsr      SetEnd
     C                   callp     wrtsection('endhtml')
      * Do not delete the call to wrtsection with section name *fini.  It is needed
      * to ensure that all output html that has been buffered gets output.
     C                   callp     wrtsection('*fini')
     C     SLUTT         tag
     C                   EXSR      EXIT
     C                   return
      *=====================================================================******
      * Send oppdrag inn til basen
      *=====================================================================******
     C     SndOppd       begsr
N02   *
N02  C                   MOVE      'N'           XDIREKT           1
N02  C                   IF        ((HEUR <> ' ') AND (HEAVD <> 0))
N02  C                   MOVE      'HEDIR'       PAID
N02  C     BrParKey      CHAIN     BRPARF                             33
N02  C   33KundKey       chain     BRPARF                             33
N02  C   33GrupKey       chain     BRPARF                             33
N02  C   33FirmKey       chain     BRPARF                             33
N02  C  N33              IF        ((PAVRDA = 'J') OR (PAVRDA = 'j'))
N02  C                   MOVE      'J'           XDIREKT
N02  C                   END
N02  C                   END
N02   *
     C                   MOVE      'WEB'         HESG
     C                   MOVEL     HEREFF        HERFA
S01  C*                  Movel     HEAVD         TMPAVD            4
S01  c*                  eval      HEREFF = TMPAVD + HERFA
     C                   CALL      'SYGE15C'
     C                   PARM                    WDT               8
     C                   PARM                    WTD               6
     C                   MOVE      WDT           HEDTR
     C                   MOVE      ' '           HEST
     C                   MOVE      ' '           HE01
      * Hent Fritekst til samlet streng max 700 lang
     C                   MOVE      *ZEROS        XN1               3 0
     C                   MOVE      *ZEROS        XN2               3 0
     C                   MOVE      *ZEROS        XN3               3 0
     C                   MOVE      *BLANKS       TEXT
     C                   MOVE      *BLANKS       TXT1
     C                   MOVE      *BLANKS       TXT2
     C                   MOVE      *BLANKS       TXT3
     C     HEUNIK        SETLL     Zreetxt1
     C     HEUNIK        Reade     Zreetxt1                               33
     C     *in33         doweq     '0'
     c     frtkod        IFEQ      'R'
     C                   ADD       1             XN1
     C                   MOVE      FRTTXT        TX1(XN1)
     c                   end
     c     frtkod        IFEQ      'G'
     C                   ADD       1             XN2
     C                   MOVE      FRTTXT        TX2(XN2)
     c                   end
     C     frtkod        IFEQ      ' '
     C                   ADD       1             XN3
     C                   MOVE      FRTTXT        TX3(XN3)
     C                   end
     c     frtkod        IFNE      'M'
     c                   delete    Freetxtr
     C                   end
     C     HEUNIK        Reade     Zreetxt1                               33
     c                   end
      *
     c                   movel     Hex0D         CrLf              2
     c                   move      Hex25         CrLf
     c                   move      HEUNIK        FRUNIK
     c                   move      HEREFF        FRREFF
     c                   move      *zeros        FRTLI
     c                   move      HEDTOP        FRTDT
      * Melding til mottaker....
     C                   IF        TXT1 <> *BLANKS
     c                   move      'R'           FRTKOD
     C                   MOVE      TXT1          TEXT
     c                   exsr      SkrivFrt
     c                   end
      * Melding til Transportør.
     C                   IF        TXT2 <> *BLANKS
     c                   move      'G'           FRTKOD
     C                   MOVE      TXT2          TEXT
     c                   exsr      SkrivFrt
     c                   end
      * Melding til Transportør.
     C                   IF        TXT3 <> *BLANKS
     C                   move      ' '           FRTKOD
     C                   MOVE      TXT3          TEXT
     C                   exsr      SkrivFrt
     C                   end
      * fix REFF i ZOKUFM
     C     HEUNIK        SETLL     Zokufm1
     C     HEUNIK        Reade     Zokufm1                                33
     C     *in33         doweq     '0'
     c                   move      HEREFF        FMREFF
     c                   update    DOKUFMR
     C     HEUNIK        Reade     Zokufm1                                33
     c                   end
      *
      * fix REFF i Zrisok
     C     HEUNIK        SETLL     zrisol01
     C     HEUNIK        Reade     zrisol01                               33
     C     *in33         doweq     '0'
     c                   move      HEDTOP        FSDTOP
     c                   move      HEREFF        FSREFF
     c                   update    FRISOKR
     C     FSKODE        IFEQ      'IFB'
     c                   eval      Sndnr  = '401' + FSSOK
     C                   end
     C     HEUNIK        Reade     zrisol01                               33
     c                   end
      *
     C                   UPDATE    Headfr
N04   *
N04  C                   EXSR      OPDLOG
      *
     C                   MOVE      HEUNIK        UUNIK             9
      *
      * E-POST TIL mailadresse registrert i bildet (XREETXT)
     C                   MOVE      '*FTXT'       UTYPE             5
     C                   CALL      'ESOP11C'
     C                   PARM                    UUNIK
     C                   PARM                    UTYPE
      *
      * E-POST TIL INTERBRUKER
     C                   MOVE      'HEUMI'       UTYPE             5
     C                   CALL      'ESOP11C'
     C                   PARM                    UUNIK
     C                   PARM                    UTYPE
      * E-POST TIL intern avhenger av oppdragstype
     C                   MOVE      'HEUMO'       UTYPE             5
     C                   CALL      'ESOP11C'
     C                   PARM                    UUNIK
     C                   PARM                    UTYPE
      *
      * E-POST TIL WEB-RBRUKER (KUNDE SOM REGISTRERER OPPDRAG)
     C                   MOVE      'HEUMS'       UTYPE             5
     C                   CALL      'ESOP11C'
     C                   PARM                    UUNIK
     C                   PARM                    UTYPE
N02   *
N02  C                   IF        XDIREKT = 'J'
N02  C                   CALL      'ESOP11D'
N02  C                   PARM                    HEREFF
N02  C                   PARM                    HEUNIK
N02  C                   END
N02   *
     c                   endsr
      *=====================================================================******
      * Skriv freetekst
      *=====================================================================******
     C     SkrivFrt      begsr
     C                   z-add     1             GMPOS
     C                   z-add     1             WPOS
      * Neste linje er fram til neste CR/LF eller max 70 tegn
     c     NextCRLF      Tag
     C     CRLF          SCAN      TEXT:GMPOS    WPOS                     51
      * fant ikke flere CRLF, resten blank? Hopp ut / ellers lagre 70+70.
     C     *IN51         IFEQ      *OFF
     c                   MOVE      *BLANKS       TST700
     c                   movea     TX(GMpos)     TST700
     C     TST700        CABEQ     *BLANKS       UTSKRIV
     c                   z-add     9999          Wpos
     c                   end
      *
      * Lagre uansett fra og med start.sted
     C                   MOVEA     TX(GMPOS)     FT
      * Finn lengde på siste streng(max 70) - blank resten (fra lengde +1)
     C                   EVAL      BLF = WPOS - GMPOS + 1
     C     BLF           IFGT      70
      *(51 OFF. skal IKKE hoppe over CRLF før neste linje.)
     C                   MOVE      *OFF          *IN51
     C                   eval      wpos = GMPOS +70
     c                   end
     C     BLF           IFge      1
     C     BLF           andle     70
     C                   MOVEA     *BLANKS       FT(BLF)
     C                   END
     c                   add       1             FRTLI
     c                   Movea     FT            FRTTXT
     c                   write     freetxtr
      *
      * Finn neste start-posisjon (HVIS CRLF - hopp pver)
     C                   Z-add     WPOS          GMPOS
     C     *IN51         IFEQ      *ON
     C                   ADD       2             GMPOS
     C                   END
     C     GMPOS         CABLE     700           NEXTCRLF
     C
      *
     c     UtSKRIV       endsr
      *
      *=====================================================================******
      * Parse input
      *=====================================================================******
     C     Parse         begsr
     C                   eval      lng     = zhbgetvar('lng')
     C                   eval      BckGnd  = zhbgetvar('bckgnd')
     C                   EVAL      WSUSER  = zhbgetvar('USER')
     C                   EVAL      UsrSpcName  = zhbgetvar('UsrSpcName')
S07  C*                  EVAL      WSREFF  = zhbgetvar('HEREFF')
N07  C                   EVAL      XTXT801  = zhbgetvar('HEREFF')
N07  C                   EXSR      SRKVTTEGN2
N07  C                   EVAL      WSREFF  = XTXT802
     C                   EVAL      XXSEND  = zhbgetvar('XXSEND')
     C                   EVAL      XXslett = zhbgetvar('XXslett')
     C                   eval      AVVKNR  = zhbgetvar('AVVKNR')
     C                   eval      AVVKNRN = c2n2(AVVKNR)
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
     c     AvvKnrN       ifne      *zeros
     c                   z-add     AvvKnrN       BIKUNR
     c                   end
     C     CUNDL01K      CHAIN     CUNDL01                            33
     C                   callp     updhtmlvar('WSNA':KNAVN)
     C                   callp     updhtmlvar('USER':WSUSER)
BODY C                   callp     updhtmlvar('BODYCLASS':'class='+BIFARG)
     C                   callp     updHtmlVar('UsrSpcName':UsrSpcName)
     C                   callp     updHTMLvar('sdato':
     C                             %trim(%editw(BIDTV:'    .  .  ')))
     C                   callp     updHTMLvar('stid':
     C                             %trim(%editw(BITIDV:'  .  .  ')))
     C                   callp     updhtmlvar('AVVKNR':
     C                             %trim(%editc(AVVKNRN:'Z')))
     C                   callp     updhtmlvar('LABELTYP':LabelTyp)
     C                   callp     updhtmlvar('ERRTXT':ERRTXT)
      *
     C                   endsr
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
      *
     C                   MOVE      HEUNIK        HEUNIKA           9
     C                   callp     updhtmlvar('HEUNIK':HEUNIKA)
S07  C*                  callp     updhtmlvar('HEREFF':HEREFF)
N07  C                   EVAL      XTXT801 = HEREFF
N07  C                   EXSR      SRKVTTEGN1
N07  C                   callp     updhtmlvar('HEREFF':XTXT802)
     C                   callp     updhtmlvar('HEDTOP':
     C                             %trim(%editw(HEDTOP:'    .  .  ')))
     C                   callp     updhtmlvar('HEGN':HEGN)
     C                   callp     updhtmlvar('HENAS':HENAS)
     C                   callp     updhtmlvar('HENAK':HENAK)
     C                   callp     updhtmlvar('HEFR':HEFR)
     C                   callp     updhtmlvar('HENT':
     C                             %trim(%editc(HENT:'Z')))
     C                   callp     updhtmlvar('HEVKT':
     C                             %trim(%editc(HEVKT:'Z')))
     C                   callp     updhtmlvar('HEM3':
     C                             %trim(%editc(HEM3:'4')))
     C                   callp     updhtmlvar('HESDF':HESDF)
     C                   callp     updhtmlvar('HESDT':HESDT)
     C                   callp     updhtmlvar('FRALK':'')
     C                   callp     updhtmlvar('TILLK':'')
     C                   select
     C     HEUR          wheneq    'H'
     C                   callp     updhtmlvar('FRALK':HELKA)
     C                   callp     updhtmlvar('TILLK':HETRI)
     C     HEUR          wheneq    'A'
     C     HEUR          oreq      'B'
     C                   callp     updhtmlvar('FRALK':HELKS)
     C                   callp     updhtmlvar('TILLK':HELKK)
     c                   endsl
     C                   callp     updhtmlvar('HERFA':HERFA)
     C                   callp     updhtmlvar('XXOK':'SEND')
     C                   callp     updhtmlvar('HEPK1':HEPK1)
     C                   callp     updhtmlvar('HEPK2':HEPK2)
     C                   callp     updhtmlvar('HEPK3':HEPK3)
     C                   callp     updhtmlvar('HEPK4':HEPK4)
     C                   callp     updhtmlvar('HEPK5':HEPK5)
      *
     C                   endsr
      *=====================================================================******
      *  Pulldown-boks for å velge type ved ved Lag ny..                    )
      *=====================================================================******
     C     CrtNewTyp     begsr
     C                   callp     wrtsection('TypSltStr')
     C                   MOVE      'HEUR '       PAID
     C     BrParKey      setll     BRPARF
     C     BrParKey      reade     BRPARF                                 40
     C     *in40         doweq     '0'
     c                   z-add     PAVRDN        XXAVD             4 0
     c                   Move      XXAVD         XXAVDA            4
     c                   Move      *blanks       SlTy              9
     c                   eval      Slty = XXAVDA + PAVRDA5
     C                   callp     updhtmlvar('SLTY':SLTY)
     C                   callp     updhtmlvar('SLTYTXT':PAVRDTxt)
     C                   callp     wrtsection('TypSltRow')
     C     BrParKey      reade     BRPARF                                 40
     C                   enddo
      *
     C                   callp     wrtsection('TypSltEnd')
      *
     C                   endsr
      *=====================================================================******
      *  Set output variables for section /$endhtml
      *=====================================================================******
     C     SetEnd        begsr
      * Compute run time
     C                   time                    timedata2
     C     timedata2     subdur    timedata1     ms:*ms
     C                   eval      sec = ms / 1000000
     C                   callp     updhtmlvar('runtime':
     C                             %trim(%editw(sec:'     0 .   ')))
      *
     C                   endsr
      *=====================================================================******
      * Set html output skeleton member before its read into memory
      *=====================================================================******
     C     SetSkl        begsr
      *------------------
      * Set html output skeleton member
     C                   eval      lng = uppify(lng)
     C                   eval      Lib = '*LIBL'
     C                   eval      Fn  = 'HTMLSRC' + lng
     C                   eval      Mbr = 'ESOP11'
     C                   CAT       XSPRÅK:0      MBR
      *
     C                   endsr
N04   *////////////////////////////////////////////////////////////
N04  C     OPDLOG        BEGSR
N04   *////////////////////////////////////////////////////////////
N04   *
N04  C                   MOVE      HEAVD         TTAVD
N04  C                   MOVE      HEOPD         TTOPD
N04  C                   MOVE      WDT           TTDATE
N04  C                   MOVE      WTM           TTTIME
N04  C                   MOVE      WDT           TTDATL
N04  C                   MOVE      WTM           TTTIML
N04  C                   MOVE      'ED2'         TTACTI
N04  C                   MOVE      WSUSER        TTUSER
N04  C                   EVAL      TTTEXT = 'Incoming EDI recieved'
N04  C                   MOVE      'WEB'         TTEDEV
N04  C                   MOVE      HEUNIK        TTUNIK
N04  C                   MOVE      HEREFF        TTREFF
N04  C                   WRITE     TRACKFR
N04   *
N04  C                   ENDSR
N04   *
N07   ***********************************************
N07  C     SRKVTTEGN1    BEGSR
N07   ***********************************************
N07  C                   MOVE      X'7D'         XAPS              1
N07  C                   Z-ADD     76            XN54              3 0
N07  C                   Z-ADD     75            XN55              3 0
N07  C                   Z-ADD     74            XN56              3 0
N07  C                   Z-ADD     0             XN52              3 0
N07  C                   MOVE      *BLANKS       XTXT802
N07  C     1             DO        80            XN51              3 0
N07  C                   IF        (((((XT801(XN51) = '&') OR
N07  C                                 (XT801(XN51) = '"')) OR
N07  C                                 (XT801(XN51) = XAPS)) OR
N07  C                                 (XT801(XN51) = '<')) OR
N07  C                                 (XT801(XN51) = '>'))
N07  C                   IF        XN52 < 80
N07  C                   ADD       1             XN52
N07  C                   SELECT
N07  C                   WHEN      XT801(XN51) = '&'
N07  C                   IF        XN51 < XN55
N07  C                   MOVEA     '&amp;'       XT802(XN52)
N07  C                   ADD       4             XN52
N07  C                   ELSE
N07  C                   SUB       1             XN52
N07  C                   END
N07  C                   WHEN      XT801(XN51) = '"'
N07  C                   IF        XN51 < 75
N07  C                   MOVEA     '&quot;'      XT802(XN52)
N07  C                   ADD       5             XN52
N07  C                   ELSE
N07  C                   SUB       1             XN52
N07  C                   END
N07  C                   WHEN      XT801(XN51) = XAPS
N07  C                   IF        XN51 < XN56
N07  C                   MOVEA     '&apos;'      XT802(XN52)
N07  C                   ADD       5             XN52
N07  C                   ELSE
N07  C                   SUB       1             XN52
N07  C                   END
N07  C                   WHEN      XT801(XN51) = '>'
N07  C                   IF        XN51 < XN54
N07  C                   MOVEA     '&gt;'        XT802(XN52)
N07  C                   ADD       3             XN52
N07  C                   ELSE
N07  C                   SUB       1             XN52
N07  C                   END
N07  C                   WHEN      XT801(XN51) = '<'
N07  C                   IF        XN51 < XN54
N07  C                   MOVEA     '&lt;'        XT802(XN52)
N07  C                   ADD       3             XN52
N07  C                   ELSE
N07  C                   SUB       1             XN52
N07  C                   END
N07  C                   ENDSL
N07  C                   END
N07  C                   ELSE
N07  C                   IF        XN52 < 80
N07  C                   ADD       1             XN52
N07  C                   MOVE      XT801(XN51)   XT802(XN52)
N07  C                   ELSE
N07  C                   LEAVE
N07  C                   END
N07  C                   END
N07  C                   ENDDO
N07   *
N07  C                   ENDSR
N07   *
N07   ***********************************************
N07  C     SRKVTTEGN2    BEGSR
N07   ***********************************************
N07  C                   MOVE      X'7D'         XAPS              1
N07  C                   MOVE      *BLANKS       XTXT802
N07   *
N07  C                   Z-ADD     1             XPOS              3 0
N07  C                   DOU       *IN33 = *OFF
N07  C     '&amp;'       SCAN      XTXT801:XPOS  XPOS                     33
N07  C                   IF        *IN33
N07  C                   EVAL      XTXT802 = %SUBST(XTXT801:1:XPOS-1)
N07  C                   MOVE      '&'           XT801(XPOS)
N07  C                   ADD       5             XPOS
N07  C                   IF        XPOS < 81
N07  C                   EVAL      XTXT802 = %TRIM(XTXT802)
N07  C                             + %SUBST(XTXT801:XPOS:81-XPOS)
N07  C                   END
N07  C                   END
N07  C                   ENDDO
N07   *
N07  C                   Z-ADD     1             XPOS              3 0
N07  C                   DOU       *IN33 = *OFF
N07  C     '&quot;'      SCAN      XTXT801:XPOS  XPOS                     33
N07  C                   IF        *IN33
N07  C                   EVAL      XTXT802 = %SUBST(XTXT801:1:XPOS-1)
N07  C                   MOVE      '"'           XT801(XPOS)
N07  C                   ADD       6             XPOS
N07  C                   IF        XPOS < 81
N07  C                   EVAL      XTXT802 = %TRIM(XTXT802)
N07  C                             + %SUBST(XTXT801:XPOS:81-XPOS)
N07  C                   END
N07  C                   END
N07  C                   ENDDO
N07   *
N07  C                   Z-ADD     1             XPOS              3 0
N07  C                   DOU       *IN33 = *OFF
N07  C     '&apos;'      SCAN      XTXT801:XPOS  XPOS                     33
N07  C                   IF        *IN33
N07  C                   EVAL      XTXT802 = %SUBST(XTXT801:1:XPOS-1)
N07  C                   MOVE      XAPS          XT801(XPOS)
N07  C                   ADD       6             XPOS
N07  C                   IF        XPOS < 81
N07  C                   EVAL      XTXT802 = %TRIM(XTXT802)
N07  C                             + %SUBST(XTXT801:XPOS:81-XPOS)
N07  C                   END
N07  C                   END
N07  C                   ENDDO
N07   *
N07  C                   Z-ADD     1             XPOS              3 0
N07  C                   DOU       *IN33 = *OFF
N07  C     '&gt;'        SCAN      XTXT801:XPOS  XPOS                     33
N07  C                   IF        *IN33
N07  C                   EVAL      XTXT802 = %SUBST(XTXT801:1:XPOS-1)
N07  C                   MOVE      '>'           XT801(XPOS)
N07  C                   ADD       4             XPOS
N07  C                   IF        XPOS < 81
N07  C                   EVAL      XTXT802 = %TRIM(XTXT802)
N07  C                             + %SUBST(XTXT801:XPOS:81-XPOS)
N07  C                   END
N07  C                   END
N07  C                   ENDDO
N07   *
N07  C                   Z-ADD     1             XPOS              3 0
N07  C                   DOU       *IN33 = *OFF
N07  C     '&lt;'        SCAN      XTXT801:XPOS  XPOS                     33
N07  C                   IF        *IN33
N07  C                   EVAL      XTXT802 = %SUBST(XTXT801:1:XPOS-1)
N07  C                   MOVE      '<'           XT801(XPOS)
N07  C                   ADD       4             XPOS
N07  C                   IF        XPOS < 81
N07  C                   EVAL      XTXT802 = %TRIM(XTXT802)
N07  C                             + %SUBST(XTXT801:XPOS:81-XPOS)
N07  C                   END
N07  C                   END
N07  C                   ENDDO
N07   *
N07  C                   ENDSR
N07   *
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
     C                   open      ZEADL05                              50
     C                   open      zreetxt1
     C                   open      zokufm1
     C                   open      zrisol01
N04  C                   OPEN      ZTRACKF
     C                   OPEN      CUNDL01
     C                   OPEN      BRPARF
     C                   OPEN      WRKCGI
     C                   OPEN      FIRM
     C     CUNDL01K      klist
     C                   kfld                    BIFIRM
     C                   kfld                    BIKUNR
     C     ZEAD5KEY      klist
S03  C*                  kfld                    BIKUNR
N03  C                   kfld                    XKNGIVER
     C                   kfld                    WSREFF
      *
N02  c     FirmKey       klist
N02  c                   kfld                    DFTUSER          10
N02  c                   kfld                    NULLKU            8 0
N02  c                   kfld                    PAID
N02  c                   Eval      DFTUSER = '*KUNDFT*'+BIFIRM
N02  c     GrupKey       klist
N02  c                   kfld                    DFTUSER
N02  c                   kfld                    BIKNG
N02  c                   kfld                    PAID
N02  c     KundKey       klist
N02  c                   kfld                    DFTUSER
N02  c                   kfld                    BIKUNR
N02  c                   kfld                    PAID
     C     BrParKey      klist
     C                   kfld                    PABRID
     C                   kfld                    PAKUNR
     C                   kfld                    PAID
     C                   MOVE      BIBRID        PABRID
     C                   MOVE      *zeros        PAKUNR
N03   * HENT ARBEIDGIVER
N03  C                   MOVEL     'HEKN1'       PAID
N03  C     BrParKey      Chain     BRPARF                             33
N03  C   33              MOVE      BIKUNR        XKNGIVER          8 0
S05  C* N33              EVAL      XKNGIVER = BIKUNR
N05  C  N33              EVAL      XKNGIVER = PAVRDN
      * HENT SPRÅKKODE
     C                   MOVEL     'SPRÅK'       PAID
     C     BrParKey      Chain     BRPARF                             33
     C                   IF        (*IN33 OR (PAVRDA <> 'EN'))
     C                   MOVE      *BLANKS       XSPRÅK            2
     C                   ELSE
     C                   MOVE      'EN'          XSPRÅK            2
     C                   END
      * Hent labeltye (zebra/eltron) dersom det er behandling av tur
     c                   Move      *blanks       LabelTyp          1
     C                   MOVE      'LABTY'       PAID
     C     BrParKey      Chain     BRPARF                             33
     c  n33              MoveL     PAVRDA        LabelTyp
N06  c   33              MoveL     'Z'           LabelTyp
     C                   eval      ErrTxt     = *blanks
      *
     C                   endsr
      *=====================================================================******
      *  AVSLUTT
      *=====================================================================******
     C     EXIT          begsr
     C                   close     BRIDF
     C                   close     ZEADL05
     C                   close     zreetxt1
     C                   close     zokufm1
     C                   close     zrisol01
N04  C                   close     ZTRACKF
     C                   close     CUNDL01
     C                   close     BRPARF
     C                   CLOSE     WRKCGI
     C                   CLOSE     FIRM
     C                   eval      *inlr = *on
      *
     C                   endsr

      *
      *=====================================================================******
      *  PRINT HENTELISTE
      *=====================================================================******
     C     HENTELISTE    begsr
     C     AVVKNRN       IFNE      0
     C                   EVAL      BIKUNR=AVVKNRN
     C                   ENDIF
      *
      * SJEKK AT ALLE VARSLEDE DOKUMENT ER SKREVET UT..
     C                   eval      i = 1
     C     i             DOUGT     ItemCount
     C                   eval      WSREFF  = ZhbGetVar('HLIST':i)
     C     Zead5Key      CHAIN(N)  ZEADL05                            33
     C     *IN33         IFEQ      *OFF
     C     HEPK1         IFEQ      'Y'
     C     HEPK2         OREQ      'Y'
     C     HEPK3         OREQ      'Y'
     C                   LEAVE
     c                   END
     c                   END
     C                   eval      i = i +1
     C                   ENDDO
      * Hvis i ikke er blitt større enn Itemcount så er det feil..
     C     i             IFLE      ItemCount
     C                   eval      ErrTxt     = 'En eller flere av sendingene '+
     C                             'har uutskrevne dokumenter (Y) Disse må ' +
     C                             'printes (eller kode endres) før henteli' +
     C                             'ste kan skrives.'
     c                   goto      UtHenteL
     c                   END
      *
      * OK - KJØR
      * Oppdater hver post / skriv henteliste
      * Hent random integer, WINTEG er del 1 av unik key i workfile
     c                   eval      WINTEG   = random(1:999999)
     C                   eval      i = 1
     C     i             DOUGT     ItemCount
     C                   eval      WSREFF  = ZhbGetVar('HLIST':i)
     C     Zead5Key      CHAIN     ZEADL05                            33
     C     *IN33         IFEQ      *OFF
      * 1. Send oppdraget
     C                   Exsr      SndOppd
      * 2. Skriv til wrkfile for henteliste
      * (sndnr ligger også som eget felt i DS- sort-key kan enkelt endres..)
     c                   eval      wkey2   = sndnr
     c                   eval      WDsANT    = HENT
     c                   eval      WDsVKT    = HEVKT
     c                   eval      WDsM3     = HEM3
     c                   eval      WDsLM     = HELM
     c                   eval      WDsREF    = HERFA
     c                   eval      WDsMNavn  = HENAK
     c                   eval      WDsMAdr1  = HEADK1
     c                   eval      WDsMPnSt  = HEADK3
     c                   eval      WDsSndnr  = Sndnr
     c                   eval      WData     = DataDS
     c                   write     WRKCGIR
     c                   END
      *
     C                   eval      i = i +1
     C                   ENDDO
      *
      * SKRIV LISTE
     C     CUNDL01K      CHAIN     CUNDL01                            33
     C     BIFIRM        CHAIN     FIRM
     C                   EVAL      FIRMANAV = FIFT
     C                   callb     'ESOP13'
     c                   parm                    BIBRID
     c                   parm                    UsrSpcName
     c                   parm                    BIBESK
     c                   parm                    FIRMANAV         30
     c                   parm                    WSBIL            10
     c                   parm                    KNAVN
     c                   parm                    ADR1
     c                   parm                    POSTNR
     c                   parm                    ADR3
     c                   parm                    LISTENR          20
     c                   parm                    WINTEG
      *
      *
     C     UtHenteL      TAG
      * Param WSREF blankes slik at resten av prog blir ren refresh
     c                   move      *blanks       WSREFF
     C                   endsr
      *
