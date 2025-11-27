      *********************************************************************
      *
CRTPG+*  CRTPGM SYSPED/ESARKF2 MODULE(*LIBL/ESARKF2
CRTPGM*        *LIBL/CHECKUSR *LIBL/INCGI) ACTGRP(CGI) AUT(*USE)
      *
      *********************************************************************
      * MAIN PROGRAM FLOW
      *********************************************************************
      /copy syspeds/qrpgsrcpy,hspecs
      /copy syspeds/qrpgsrcpy,hspecsbnd
     FBRIDF     UF   E           K DISK    USROPN
     FBRPARF    IF   E           K DISK    USROPN
     FCUNDL01   IF   E           K DISK    USROPN
     FHeadf     IF   E           K DISK    usropn
     FFain      IF   E           K DISK    usropn
     FFak8      IF   E           K DISK    usropn
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
     D OddEven         s             10
     D lng             s              2
     D BckGnd          s             10
     D UsrSpcName      s             10
     D WSUSER          S             10
     D WSNA            S             30
     D U_name          S             10
     D FakNr           s              7
     D FakNrN          s              7  0
     D Kunr2           s              8
     D Kunr2N          s              8  0
      *
     D MOMS            s             11  2
     D GMWKEY2         s             30
     D AntOpd          s              5  0
     D BRUBelF         s             11  2
     D BRUBelN         s             11  2
     D BRUBelM         s             11  2
     D BRUBelB         s             11  2
     D BRUKLL          s              9  0
     D BRUVKT          s             11  0
     D BRUM3           s             11  3
     D BRULM           s             11  2
     D BRUFVKT         s             11  0
     D DREF            s             35
      *
     D ANTSND          s              5  0
     D MaxSN           s              5
     D MaxSND          s              5  0
     D ANTRCD          s              5  0
     D MaxRC           s              5
     D MaxRCD          s              5  0
     D PGM             C                   CONST('SYSPED/CHECKUSR')
     D Spaces          s             12a   inz('&nbsp;&nbsp;')
     D TITLE           C                   CONST('Vis faktura mm.')
     D TITLEEN         C                   CONST('Display invoice.')
     D IfsMultIndicators...
     d                 ds
     D  NoErrors                       n
     D  NameTooLong                    n
     D  NotAccessible                  n
     D  NoFilesUsable                  n
     D  DupSections                    n
     D  FileIsEmpty                    n
      *
     D                 DS
     D  Wdata                  1    220
     D  FIAVD                  1      4  0
     D  FIOPD                  5     11  0
     D  BELF                  13     27  2
     D  BELN                  28     42  2
     D  BELM                  43     57  2
     D  BELB                  58     72  2
     D  DTKEY                 95    102
     D  DRKEY                103    137
     D  VRKEY                138    153
     D  AVKEY                154    168
     D  MOKEY                169    183
     D  ASKEY                184    198
     D  MSKEY                199    213
     D                 DS
     D  VREF                   1     16
     D  HEAVD                  1      4  0
     D  HEAVDa                 1      4
     D  STREK1                 5      5
     D  HEOPD                  6     12  0
     D  HEOPDa                 6     12
     D  STREK2                13     13
     D  HESG                  14     16
     D                 DS
     D  HENAS                  1     30
     D  AVSEND                 1     15
     D                 DS
     D  HEADS3                 1     30
     D  AVSTED                 1     15
     D                 DS
     D  HENAK                  1     30
     D  MOTT                   1     15
     D                 DS
     D  HEADK3                 1     30
     D  MOSTED                 1     15
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
      *
      * Set output skeleton html member name
     C                   exsr      SetSkl
      *------------------                                                   ******
      * Write HTML sections
      *
      * 1-Section /$top
     C                   exsr      SetTop
     C                   callp     wrtsection('stdtop')
     C                   callp     wrtsection('top')
      * 4-Sections /$tablerow
      *
     C                   EXSR      HENTFL
      *
     C                   callp     updHTMLvar('ANTSND':
     C                             %trim(%editc(ANTSND:'3')))
     C                   callp     updHTMLvar('MaxSnd':
     C                             %trim(%editc(MaxSnd:'3')))
     C                   callp     updHTMLvar('ANTRCD':
     C                             %trim(%editc(ANTRCD:'3')))
     C                   callp     updHTMLvar('MaxRcd':
     C                             %trim(%editc(MaxRcd:'3')))
     C                   callp     updhtmlvar('runtime':
     C                             %trim(%editw(sec:'     0 .   ')))
      *
     C                   callp     wrtsection('bot')
     C                   callp     wrtsection('stdbot')
      *
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
     C                   eval      lng     = zhbgetvar('lng')
     C                   eval      BckGnd  = zhbgetvar('bckgnd')
     C                   EVAL      WSUSER  = zhbgetvar('USER')
     C                   EVAL      WSNA    = zhbgetvar('WSNA')
     C                   EVAL      UsrSpcName  = zhbgetvar('UsrSpcName')
      *
     C                   eval      FAKNR    = zhbgetvar('FAKNR')
     C                   eval      FAKNRN   = c2n2(FAKNR)
     C                   eval      KUNR2    = zhbgetvar('KUNR2')
     C                   eval      KUNR2N   = c2n2(KUNR2)
      * Eksternt pålogget via access list..- Overstyrer parameter USERID
     C                   eval      U_Name   = getenv('REMOTE_USER':
     C                             qusec)
     C     U_Name        IFNE      *BLANKS
     C                   eval      WSUSER   = uppify(U_Name)
     C                   END
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
     C                   callp     updHTMLvar('ROWHEAD':RowHead)
     C                   callp     updHTMLvar('LogoImg':LogoImg)
      * Color for text, background, links, visited links, active links
     C                   callp     updhtmlvar('TXTCOLOR':'black')
     C                   callp     updhtmlvar('BOLD':' ')
     C                   callp     updhtmlvar('BGCOLOR':BIFARG)
     C                   callp     updhtmlvar('LINK':'0000FF')
     C                   callp     updhtmlvar('VLINK':'FF0000')
     C                   callp     updhtmlvar('ALINK':'00FF00')
     C                   IF        XSPRÅK = 'EN'
     C                   callp     updhtmlvar('TITLE':TITLEEN)
     C                   ELSE
     C                   callp     updhtmlvar('TITLE':TITLE)
     C                   END
      * hvis *I*=Intern bruker - finn kunde via egen param (etter 20102007 parm XINTERN)
     c                   Move      BIBESK        TSTINTERN         3
     C     TSTINTERN     Ifeq      '*I*'
     C                   move      'J'           XINTERN
     C                   end
     C     XINTERN       Ifeq      'J'
     C     KUNR2n        ANDNE     *zeros
     c                   move      KUNR2N        BIKUNR
     C     CUNDL01K      CHAIN     Cundl01                            33
     c                   end
      *
     C                   callp     updHTMLvar('USER':WSUSER)
     C                   callp     updHtmlVar('UsrSpcName':UsrSpcName)
     C                   callp     updHTMLvar('BESK':BIBESK)
     C                   callp     updHtmlVar('KUNDE':
     C                             %trim(%editc(BIKUNR:'Z')))
     C                   callp     updHTMLvar('KNAVN':KNAVN)
     C                   callp     updHtmlVar('WSNA':KNAVN)
      * Søkeparam
     C                   callp     updHTMLvar('FAKNR':FAKNR)
     C                   callp     updHTMLvar('Kunr2':Kunr2)
      *
     C                   endsr
      *=====================================================================******
      *  Set output variables for section /$tablerow (table row)
      *=====================================================================******
     C     SetTabRow     begsr
      *
     C     HeaKey        CHAIN     HEADF                              33
     C   33              CLEAR                   HEADFR
     C                   EVAL      DREF = HERFA
     C                   callp     updHTMLvar('DREF':DREF)
     C                   callp     updHTMLvar('VREF':VREF)
     C                   callp     updHTMLvar('avd':heavda)
     C                   callp     updHTMLvar('opd':heopda)
     C                   callp     updHTMLvar('TUR':
     C                             %trim(%editc(HEPRO:'Z')))
     C                   callp     updHTMLvar('DATO':
     C                             %trim(%editw(HEDTOP:'    .  .  ')))
     C                   callp     updhtmlvar('AVSEND':AVSEND)
     C                   callp     updhtmlvar('AVSTED':AVSTED)
     C                   callp     updhtmlvar('MOTT':MOTT)
     C                   callp     updhtmlvar('MOSTED':MOSTED)
     C                   callp     updHTMLvar('KLL':
     C                             %trim(%editc(HENT:'Z')))
     C                   callp     updhtmlvar('VBESK':HEVS1)
     C                   callp     updHTMLvar('VKT':
     C                             %trim(%editc(HEVKT:'Z')))
     C                   callp     updHTMLvar('M3':
     C                             %trim(%editc(HEM3:'3')))
     C                   callp     updHTMLvar('LM':
     C                             %trim(%editc(HELM:'3')))
     C                   callp     updHTMLvar('FVKT':
     C                             %trim(%editc(HEFBV:'Z')))
      * Beløp
     C                   callp     updHTMLvar('BELF':
     C                             %trim(%editc(BELF:'J')))
     C                   callp     updHTMLvar('BELN':
     C                             %trim(%editc(BELN:'J')))
     C                   callp     updHTMLvar('BELM':
     C                             %trim(%editc(BELM:'J')))
     C                   callp     updHTMLvar('BELB':
     C                             %trim(%editc(BELB:'J')))
      * Ta vare på mulige resorteringsfelt
     C                   Eval      DRKEY = DREF
     C                   Eval      VRKEY = VREF
     C                   MOVEL     HEDTOP        DTKEY
     C                   Eval      AVKEY = AVSEND
     C                   Eval      MOKEY = MOTT
     C                   Eval      ASKEY = AVSTED
     C                   Eval      MSKEY = MOSTED
      *
     C                   endsr
      *=====================================================================
      *  Set variable data for section /$brurow
      *=====================================================================
     C     SetBruRow     begsr
     C                   callp     updHTMLvar('ANTOPD':
     C                             %trim(%editc(ANTOPD:'Z')))
     C                   callp     updHTMLvar('BRUKLL':
     C                             %trim(%editc(BRUKLL:'Z')))
     C                   callp     updHTMLvar('BRUVKT':
     C                             %trim(%editc(BRUVKT:'Z')))
     C                   callp     updHTMLvar('BRUM3':
     C                             %trim(%editc(BRUM3:'3')))
     C                   callp     updHTMLvar('BRULM':
     C                             %trim(%editc(BRULM:'3')))
     C                   callp     updHTMLvar('BRUFVKT':
     C                             %trim(%editc(BRUFVKT:'Z')))
     C                   callp     updHTMLvar('BRUBELF':
     C                             %trim(%editc(BRUBELF:'J')))
     C                   callp     updHTMLvar('BRUBELN':
     C                             %trim(%editc(BRUBELN:'J')))
     C                   callp     updHTMLvar('BRUBELM':
     C                             %trim(%editc(BRUBELM:'J')))
     C                   callp     updHTMLvar('BRUBELB':
     C                             %trim(%editc(BRUBELB:'J')))
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
     C*  Select a Recd
      *=====================================================================******
     C     RecordSlt     begsr
     C                   move      'N'           selected          1
      *
     C     FAKKEY        SETLL     FAK8
     C     FAKKEY        READE     FAK8                                   33
     c  N33FAKDA         COMP      'K'                                    33
     c  N33FAKDA         COMP      'D'                                    33
     c  N33FAOPKO        COMP      'D'                                    33
     c                   IF        *IN33 = *OFF
      * Blank i Wkey2 gir samme sortering som fysisk faktura (som FAIN)
     c*                  eval      wkey2   = *Blanks
     C                   exsr      FaktBEL
     C                   move      'Y'           selected
     c                   END
      *
     C     RecordSltX    tag
     C                   endsr
      ***********************************************
     C     FaktBEL       BEGSR
      ***********************************************
     C                   MOVE      *ZEROS        BELF
     C                   MOVE      *ZEROS        BELN
     C                   MOVE      *ZEROS        BELM
     C                   MOVE      *ZEROS        BELB
     C     FAKKEY        SETLL     FAK8
     C     FAKKEY        READE     FAK8                                   33
     C     *in33         DOWEQ     '0'
     c     FAKDA         cabeq     'K'           NEXTFA
     c     FAKDA         cabeq     'D'           NEXTFA
     c     FAOPKO        cabeq     'D'           NEXTFA
     C                   ADD       FABELN        BELN
     C                   ADD       FABELN        BELB
     C     FAVK          IFEQ      'FRA'
     C                   ADD       FABELN        BELF
     C                   END
     C     FAKDM         IFEQ      'J'
     C     FABELN        MULT      0,25          MOMS
     c                   ELSE
     C                   MOVE      *ZEROS        MOMS
     c                   end
     C                   ADD       MOMS          BELM
     C                   ADD       MOMS          BELB
     C     NEXTFA        TAG
     C     FAKKEY        READE     FAK8                                   33
     c                   end
      *
     c                   endsr
      *
      *=====================================================================******
      * Set html output skeleton member before its read into memory
      *=====================================================================******
     C     SetSkl        begsr
      *------------------
      * Set html output skeleton member
     C                   IF        XSPRÅK = 'EN'
     C                   eval      IfsMultIndicators = gethtmlifsmult(
     C                             '/syspeddev/html/Header/eSpedTop.html -
     C                             /syspeddev/html/ESARKF2EN.html -
     C                             /syspeddev/html/Footer/eSpedBot.html':
     C                             '/CGITAG/')
     C                   ELSE
     C                   eval      IfsMultIndicators = gethtmlifsmult(
     C                             '/syspeddev/html/Header/eSpedTop.html -
     C                             /syspeddev/html/ESARKF2.html -
     C                             /syspeddev/html/Footer/eSpedBot.html':
     C                             '/CGITAG/')
     C                   END
      *
     C                   endsr
      *=====================================================================******
      * HENT ORDRE
      *=====================================================================******
     C     HENTFL        BEGSR
      *
     C                   Move      *zeros        AntSnd
     C                   Move      *zeros        AntRcd
     C     MaxSnd        IFEQ      *ZEROS
     C                   Z-add     1000          MaxSnd
     C                   END
     C     MaxRcd        IFEQ      *ZEROS
     C                   Z-add     5000          MaxRcd
     C                   END
      *
     C     FAKNRN        SETLL     FAIN
     c     FAKNRN        Reade     FAIN                                   35
      *
     C     *in35         doweq     '0'
     C                   Add       1             AntRcd
     C     AntRcd        CabGe     MaxRcd        SLHENTPL
      *
     C                   exsr      RecordSlt
      *
     C     selected      ifeq      'Y'
      *
     C*    WKey2         ifne      GMWkey2
     C*                  exsr      SetBruRow
     C*                  callp     wrtsection('brudrow')
     C*                  EXSR      NULLBRU
     C*                  END
      *
     C                   exsr      SetTabRow
     C                   callp     wrtsection('row')
     C                   Add       1             AntSnd
     C     AntSnd        CabGe     MaxSnd        SLHENTPL
     C                   endif
      *
     C                   EXSR      ADDBRU
     C*                  eval      GMWkey2  = Wkey2
      *
     c     FAKNRN        Reade     FAIN                                   35
     C                   ENDDO                                                  *hival
      *
     C                   exsr      SetBruRow
     C                   callp     wrtsection('brudrow')
      *
     C     SLHENTPL      ENDSR
      *
      *=====================================================================
      * ADDER bruddsummer
      *=====================================================================
     C     ADDBRU        begsr
     c                   add       1             AntOpd
     c                   add       BelF          BruBelF
     c                   add       BelN          BruBelN
     c                   add       BelM          BruBelM
     c                   add       BelB          BruBelB
     c                   add       HENT          BruKLL
     c                   add       HEVKT         BruVKT
     c                   add       HEM3          BruM3
     c                   add       HELM          BruLM
     c                   add       HEFBV         BruFVKT
     C                   ENDSR
      *=====================================================================
      * Nullstill hjelpevariabler for bruddsummer
      *=====================================================================
     C     NULLBRU       begsr
     c                   move      *zeros        AntOpd
     c                   move      *zeros        BruBelF
     c                   move      *zeros        BruBelN
     c                   move      *zeros        BruBelM
     c                   move      *zeros        BruBelB
     c                   move      *zeros        BruKLL
     c                   move      *zeros        BruVKT
     c                   move      *zeros        BruM3
     c                   move      *zeros        BruLM
     c                   move      *zeros        BruFVKT
     C                   ENDSR
      *
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
OddEv *
     C                   open      BRPARF                               50
     C                   OPEN      CUNDL01
     C                   OPEN      HEADF
     C                   OPEN      FAIN
     C                   OPEN      FAK8
      *
     C     HeaKey        KLIST
     C                   KFLD                    FIAVD
     C                   KFLD                    FIOPD
     C     FakKey        KLIST
     C                   KFLD                    FIAVD
     C                   KFLD                    FIOPD
     C                   KFLD                    FAKNRN
     C     CUNDL01K      klist
     C                   kfld                    BIFIRM
     C                   kfld                    BIKUNR
      *
     C     CUNDL01K      CHAIN     CUNDL01                            50
bhr   * Spesialvri for å kunne deme uten å avsløre kundenavn
bhr  c                   MOVEL     WSUSER        tstjov            4
bhr  c     tstjov        ifeq      'JOVO'
bhr  c                   eval      KNAVN  = 'Jan Ottar Valderhaug'
bhr  c                   end
      *
     C                   endsr
      *=====================================================================******
      *  AVSLUTT
      *=====================================================================******
     C     EXIT          begsr
     C                   close     BRPARF
     C                   CLOSE     HEADF
     C                   CLOSE     FAIN
     C                   CLOSE     FAK8
     C                   close     CUNDL01
     C                   eval      *inlr = *on
      *
     C                   endsr
      *
