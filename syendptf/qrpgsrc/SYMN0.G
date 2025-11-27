********************************************************************
      *
CRTPG+*  CRTPGM SYSPED/SYMN0 MODULE(*LIBL/SYMN0 *LIBL/INCGI)
CRTPGM*        ACTGRP(CGI) AUT(*USE)
      *
********************************************************************
      * RETTINGER I DETTE PROGRAM:
PTFnr:*Sek Sig Vers  Beskrivelse...........................
""""""*"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
10XXX * 01 YBC PTF10 ENDGELSK BESKRIVELSE
      *              BIAKT=L ER ENDRET TIL Å TESTE AUTORISASJON
      * 02 JOV PTF10 Ved misslukket pålogging MEN OK USER HENT LIBL/LOGO MM ('AVSLUTT')
      *              Klargjør for enkel spesial-tilpasn. av avvikende HTML ved FLERFIRMA(ASP)
      * 03 JOV PTF10 Nye AKTKOD på produkt: T=Kun TomCat / B=Begge / A(ogV)=Kun esped som før
      *%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      * 04 JOV PTF11 BRUKERID inneholder -LOGON = start-url for å hent logo i flerfirmamiljø..
      *%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      * 05 JOV PTF11 LANGT passord / ikke avsløre HVA som er feil ved pålogging
      * 06
      * 07 JOV PTF12 Call syge15C kan tidvis feile - byttet ut med TIME
      *              Chan av BRIDF for update er flyttet til etter ussspc
********************************************************************
      *********************************************************************
      *  Hovedprogram for verifisering av pålogging                       *
      *  BLANK i PASSORD er anonym pålogging / 0 i kundenr                *
      *********************************************************************
      *  After compiling this RPG MODULE,
      *  create the related program with the following command:
      *
      *********************************************************************
      /copy SYSPEDS/qrpgsrcpy,hspecs
      /copy SYSPEDS/qrpgsrcpy,hspecsbnd
      *********************************************************************
     FBRIDF     UF   E           K DISK    USROPN
     FBRPRF     IF   E           K DISK    USROPN
     FBRPARF    IF   E           K DISK    USROPN
      *--------------------------------------------------------------------
      * Variables common to all CGIs
      *--------------------------------------------------------------------
      /copy SYSPEDS/qrpgsrcpy,prototypeb
      /copy SYSPEDS/qrpgsrcpy,usec
      /copy SYSPEDS/qrpgsrcpy,variables3
      *
      * Varible for
     D lstbrd          s              1
     D BRUKERID        S             10
     D PASSORD         S             10
N05  D PASSORDL        S             70
N02  D FRAFIR          S             10
     D XSPRÅK          s              2
     D XBPPRD          S            512
     D XXCMD           S            128
     D XPGM            S             50    DIM(10)
     D*FEILMELDING     S             70
     D FEILMELDING     S            150
      * State related variables
     D State           ds                  based(StateP)
     D  UBRID                        10
     D  UINNDT                        8
     D  UINNTM                        6
      * User space variables
     D UsrSpcName      s             10
     D UsrSpcLib       c                   'SYCGIUSP'
      * Message ID for CrtUsrSpc
     D MsgId           s              7

     D                 DS
     D  WTIME                  1     14  0
     D  WTID                   1      6  0
     D  WDD                    7      8  0
     D  WMM                    9     10  0
     D  WÅÅ                   11     14  0
     D                 DS
     D  BIDTF                  1      8  0
     D  BIDTFÅ                 1      4  0
     D  BIDTFM                 5      6  0
     D  BIDTFD                 7      8  0
     D                 DS
     D  BIDTV                  1      8  0
     D  BIDTVÅ                 1      4  0
     D  BIDTVM                 5      6  0
     D  BIDTVD                 7      8  0
     D                 DS
     D  BPPRD2                 1    128
     D  BPPRD2A                1      6
     D  BPPRD2B                7    128
     D                 DS
     D  LLPAVRDA               1     50
     D  PAT                    1     50    DIM(50)
     D                 DS
     D  PAVRDA                 1     50
     D  PAVRDA_01_10           1     10
     D  PAVRDA_11_50          11     50
     D                 DS
     D  P2                     1     14
     D  P2T                    1     14    DIM(14)
     D  P25                    1      1
     D  P26                    1      2
     D  P27                    1      3
     D  P28                    1      4
     D  P29                    1      5
     D  P210                   1      6
     D  P211                   1      7
     D  P212                   1      8
     D  P213                   1      9
     D                 DS
     D  XPTXT                  1     50
     D  XPT                    1     50    DIM(50)
     D  XPT01                  1      1
     D  XPT02                  1      2
     D  XPT03                  1      3
     D  XPT04                  1      4
     D  XPT05                  1      5
     D  XPT06                  1      6
     D  XPT07                  1      7
     D  XPT08                  1      8
     D  XPT09                  1      9
     D  XPT10                  1     10
     D  XPT11                  1     11
     D  XPT12                  1     12
      *
      *--------------------------------------------------------------------
      * Other variables
      *--------------------------------------------------------------------
S05   *
S05   * Konstanter  Norsk (engelsk lenger nede..)
S05  D*FMELDING1       C                   CONST('Tastet bruker-id fin-
S05  D*                                    nes ikke.')
S05  D*FMELDING2       C                   CONST('Tastet bruker-id er -
S05  D*                                    deaktivert av systemoperatø-
S05  D*                                    r ')
S05  D*FMELDING3       C                   CONST('Tastet bruker-id er -
S05  D*                                    deaktivert p.g.a. for mang -
S05  D*                                    e feilaktige på loggingsfor-
S05  D*                                    søk. Kontakt systemoperatør-
S05  D*                                    ')
S05  D*FMELDING4       C                   CONST('Tastet passord er fe-
S05  D*                                    il. Prøv igjen (max 4 feil -
S05  D*                                    på rad tillates!)')
S05   * Konstanter  engelsk  (FMELDING.. -> FMELDeNG..)
S05  D*FMELDeNG1       C                   CONST('Keyed USERID does no-
S05  D*                                    t exist.')
S05  D*FMELDeNG2       C                   CONST('Keyed USERID is deac-
S05  D*                                    tivated by system operator')
S05  D*FMELDeNG3       C                   CONST('Keyed USERID is deac-
S05  D*                                    tivated due to too many err-
S05  D*                                    onous logon attempts. Conta-
S05  D*                                    ct system administrator')
S05  D*FMELDeNG4       C                   CONST('Keyed PASSWORD is wr-
S05  D*                                    ong. Try again (maximum 4 c-
S05  D*                                    onsecutive errors allowed!)')
N05  D NowTimeISO      s               z
N05  D TmpTimeISO      s               z
N05  D TmpDt20N        s             20  0
N05  D DifMin          s             11  0
N05  D WAITMIN         S             11  0
N05  D RESTMIN         S             11  0
N05  D                 DS
N05  D TmpTs                   1     14  0
N05  D   TmpDt                 1      8  0
N05  D   TmpTid                9     14  0

      * For xlate mellom Upper Case og Lower Case
     D UC              C                   CONST('ABCDEFGHIJKLMNOPQRST-
     D                                     UVWXYZÆØÅ')
     D LC              C                   CONST('abcdefghijklmnopqrst-
     D                                     uvwxyzæøå')
      *=====================================================================
      * MAIN PROCESS LINE
      *=====================================================================
      * Get program start time for calculating execution time
     C                   time                    timedata1
      * Override database files
     C                   EVAL      RC = DOCMD('OVRDBF FILE(BRIDF) +
     C                             TOFILE(*LIBL/BRIDF) SECURE(*YES)')
      * Åpne fil
     C                   OPEN      BRIDF
      * Get input
     C                   EVAL      NBRVARS =
     C                             zhbgetinput(savedquerystring:qusec)
      * Bruker-id
     C                   EVAL      BRUKERID = zhbgetvar('BRUKERID')
      * Passord
     C                   EVAL      PASSORD = zhbgetvar('PASSORD')
     C                   EVAL      PASSORDL= zhbgetvar('PASSORD')
N02   * visse ASP/FLER-firma har avvikende påloggingsbilde -
N02   *  første 'passive html' AxxSYMN/AxxSYMNEN og SYMNB/SYMNBEN vil da kunne ha spesiell layout
N02   *  I SÅ FALL hardkod HIDDEN param FRAFIR i AxxSYMN og AxxSYMNEN (der xx gjerne er firmakode)
N02  C                   EVAL      FRAFIR  = zhbgetvar('FRAFIR')
      * språk fra engelsk påloggingsside (kun ved feil pålogging)
      * ellers hentes det fra user-ID
     C                   EVAL      XSPRÅK  = zhbgetvar('SPR')
      * Convert to uppercase
     C                   eval      BRUKERID = uppify(BRUKERID)
     C                   eval      PASSORD  = uppify(PASSORD)
      * Test innlogging
s07  C*    BRUKERID      CHAIN     BRIDF                              30
N07  C     BRUKERID      CHAIN(N)  BRIDF                              30
      * BLANK I PASSORD - ANONYM PÅLOGGING - ALLTID OK..- blank input/forenkler videre tester
     C     *IN30         IFEQ      '0'
     C     BIPO          ANDEQ     *BLANKS
N05  C     BIPOL         ANDEQ     *BLANKS
     C                   MOVE      *BLANKS       PASSORD
     C                   END
N04   * dersom User inneholder -LOGON : dummy i starturl for å hente rett logo i flerfirmamiljø
N04  C     '-LOGON'      scan      BRUKERID                               35
N04  C   35              move      'Y'           Logo_LOGON        1
     C                   SELECT
N04  C                   WHEN      Logo_LOGON = 'Y'
N04  C                   MOVEL     '.'           FEILMELDING
     C                   WHEN      BRUKERID = 'AVSLUTT'
     C                   MOVEL     '.'           FEILMELDING
     C                   EVAL      BRUKERID = PASSORD
S07  C*    BRUKERID      CHAIN     BRIDF                              30
S07  C*                  MOVE      *ZEROS        BIANTF
S07  C*                  MOVE      ' '           BIINN
N05  C                   ENDSL
N05   *
N05   * videre tester vedr pålogging er gjort helt om
N05  C*                  WHEN      *IN30 = *ON
N05  C*    XSPRÅK        Ifeq      'EN'
N05  C*                  MOVEL     FMELDeNG1     FEILMELDING
N05  c*                  else
N05  C*                  MOVEL     FMELDING1     FEILMELDING
N05  c*                  end
N05  C*                  WHEN      BIAKT <> 'A'
N05  C*    XSPRÅK        Ifeq      'EN'
N05  C*                  MOVEL     FMELDeNG2     FEILMELDING
N05  c*                  else
N05  C*                  MOVEL     FMELDING2     FEILMELDING
N05  c*                  end
N05  C*                  MOVE      ' '           BIINN
N05  C*                  WHEN      BIANTF >  4
N05  C*    XSPRÅK        Ifeq      'EN'
N05  C*                  MOVEL     FMELDeNG3     FEILMELDING
N05  c*                  else
N05  C*                  MOVEL     FMELDING3     FEILMELDING
N05  c*                  end
N05  C*                  MOVE      ' '           BIINN
N05  C*                  WHEN      BIPO   <> PASSORD
N05  C*    XSPRÅK        Ifeq      'EN'
N05  C*                  MOVEL     FMELDeNG4     FEILMELDING
N05  c*                  else
N05  C*                  MOVEL     FMELDING4     FEILMELDING
N05  c*                  end
N05  C*                  MOVE      ' '           BIINN
N05  C*                  EXSR      UpdateFeil
N05  c*                  other
N05  C*                  MOVE      *BLANKS       FEILMELDING
N05  C*                  ENDSL
N05
N05   * Userid/passord - IKKE avslør HVA som er feil
N05  c                   if        FEILMELDING=*blanks
N05   *
N05  c                   MOVE      'J'           UsrPwOK           1
N05  C                   if        *in30=*on                                    Ugyldig user
N05  c                   MOVE      'N'           UsrPwOK
N05  c                   else
N05   ** User ok / test passord
N05TM * begge oppgitt - må stemme med ETT - midlretidig
N05TMc                   if        BIPO<>*blanks and BIPOL<>*blanks
N05TMc                   If        BIPO<>PASSORD and BIPOL<>PASSORDL            Ugyldig passord
N05TMc                   MOVE      'N'           UsrPwOK
N05TMc                   endif
N05TMc                   else
N05   * kun ett oppgitt bruk det
N05  c                   if        BIPOL<>*blanks and BIPOL<>PASSORDL
N05  c                   MOVE      'N'           UsrPwOK
N05  c                   else
N05  c                   if        BIPO<>PASSORD
N05  c                   MOVE      'N'           UsrPwOK
N05  c                   endif
N05  c                   endif
N05tmc                   endif
N05  c                   endif
N05   *
N05  c                   IF        UsrPwOK = 'N'
N05   *         User rett/passord feil - oppdater ant / tid
N05  c                   If        *in30=*off
N05  C                   EXSR      UpdateFeil
N05  c                   endif
N05  c                   If        XSPRÅK='EN'
N05  c                   eval      FEILMELDING='Incorrect userId or password'
N05  c                   else
N05  c                   eval      FEILMELDING='Feil brukerId eller passord'
N05  c                   endif
N05  c                   endif
N05   *
N05  c                   endif
N05
N05   * VELLYKKET - MEN nylig DEAKTIVERT - Varsel om å vente xx min
N05   *             BIDTF / BITIDF = DATO/TID SISTE FEIL - HVIS MER ENN XX MIN SIDEN - ok
N05  c                   if        FEILMELDING=*blanks
N05  C                   if        BIANTF >  5
N05  c                   eval      Waitmin = 5
N05  c                   EVAL      TmpDt = BIDTF
N05  c                   EVAL      TmpTid= BITIDF
N05  c                   move      *zeros        TmpDt20N
N05  c                   movel     TmpTs         TmpDt20N
N05  c                   eval      TmpTimeISO = %timestamp(TmpDt20N)
N05  c                   time                    NowTimeISO
N05  c                   eval      DifMin=%diff(NowTimeISO : TmpTimeISO :
N05  c                                          *Minutes)
N05  c                   if        DifMin < Waitmin
N05  c                   eval      RestMin = Waitmin - DifMin
N05  c                   if        RestMin <= 0
N05  c                   eval      RestMin = 1
N05  c                   endif
N05  c                   If        XSPRÅK='EN'
N05  c                   eval      FEILMELDING='Too many inncorrect '
N05  c                             + 'logon attempts. Please waite '
N05  c                             + %trim(%editc(RestMin:'Z'))+ 'minutes.'
N05  c                   else
N05  c                   eval      FEILMELDING='For mange ugyldige '
N05  c                             + 'påloggingsforsøk. Vennligst vent '
N05  c                             + %trim(%editc(RestMin:'Z'))+ ' minutt.'
N05  c                   endif
N05  c                   endif
N05  c                   endif
N05  c                   endif
N05   *
      * Noe feil - vis feilmelding / nytt forsøk ELLERS last neste HTML..
     C     FEILMELDING   IFNE      *BLANKS
N04  C     FEILMELDING   IFEQ      '.'
N04  C                   MOVE      *blanks       FEILMELDING
N04  C                   END
     C                   EXSR      LoadHtmlFeil
     C                   ELSE
     C                   EXSR      LoadHtmlMnu
     C                   END
      *
N07  C     BRUKERID      CHAIN     BRIDF                              30
N07  C                   IF        FEILMELDING<>*blanks
N07  C                   MOVE      FeilDt        BIDTF
N07  C                   MOVE      FeilTid       BITIDF
N07  C                   else
N07   * Null ut antall misslykkede forsøk, ved ett riktig.
N07  C                   MOVE      *ZEROS        BIANTF
N07  C                   MOVE      *ZEROS        BIDTF
N07  C                   MOVE      *ZEROS        BITIDF
N07  C                   MOVE      'I'           BIINN
N07  C                   TIME                    WTIME
N07  C                   MOVE      WTID          BITIDV
N07  C                   MOVE      WÅÅ           BIDTVÅ
N07  C                   MOVE      WMM           BIDTVM
N07  C                   MOVE      WDD           BIDTVD
N07  C                   MOVE      WTID          BITIDF
N07  C                   MOVE      WÅÅ           BIDTFÅ
N07  C                   MOVE      WMM           BIDTFM
N07  C                   MOVE      WDD           BIDTFD
N07  C                   endif
     C  N30              UPDATE    BRIDFR
      *
      * Lukk fil
     C                   CLOSE     BRIDF
      * Quit
     C                   exsr      Exit
      *=====================================================================
      * Close output html and quit
      *=====================================================================
     C     Exit          begsr
      * Do not delete the call to wrtsection with section name *fini.  It is needed
      * to ensure that all output html that has been buffered gets output.
     C                   callp     wrtsection('*fini')
      * Quit
     C                   MOVE      *ON           *INLR
     C                   return
     C                   endsr
      *=====================================================================
      * (Aktiv) Bruker har gitt feil passord - add 1 til antall ganger
      * Mer en xx feil - må RESETTES av operatør
      *=====================================================================
     C     UpdateFeil    begsr
N06  C                   IF        BIANTF < 9
     C                   ADD       1             BIANTF
N06  C                   ENDIF
     C                   TIME                    WTIME
     C                   MOVE      WTID          BITIDF
     C                   MOVE      WÅÅ           BIDTFÅ
     C                   MOVE      WMM           BIDTFM
     C                   MOVE      WDD           BIDTFD
N07  C                   MOVE      BIDTF         FeilDt            8 0
N07  C                   MOVE      BITIDF        FeilTid           6 0
     C                   endsr
      *=====================================================================
      * Noe feil ved bruker ID
      *=====================================================================
     C     LoadHtmlFeil  begsr
N02  c* feil - men ikke feil USER-ID (f.eks ved AVSLUTT= hent libl/image
N02  c     *in30         ifeq      *off
N02  C     BILIBL        ifeq      *blanks
N02  C                   callb     'INCGI'
N02  C                   parm                    BISTDL
N02  C                   else
N02  C* Helt egen bibl.liste satt på user - normal CALL (BILIBL er "*pg
N02  C                   call      BILIBL
N02  C                   end
N02   * hent Parametre som går igjen i mange prog:
N02   *      Odd/Even/Rowhead-farger,Logobilde,Språk,Intern/Ekstern bruker,  mm
N02  c                   call      'ESGETPAR'
N02  c                   parm                    BIBRID
N02  c                   parm                    BIFIRM
N02  c                   parm                    BIKUNR
N02  c                   parm                    BIKNG
N02  c                   parm                    RowHead          10
N02  c                   parm                    Odd              10
N02  c                   parm                    Even             10
N02  c                   parm                    LogoImg          50
N02  c                   parm                    XSPRÅK            2
N02  c                   parm                    XINTERN           1
N02  c                   parm                    ParmDS1        1024
N02  c                   parm                    ParmDS2        1024
N02  c                   parm                    ParmDS3        1024
N02  c     FRAFIR        ifne      *blanks
N02  c                   eval      FRAFIR = 'A'+BIFIRM
N02  c                   endif
N02  c                   endif
      ** VED FLERFIRMA - TA HØYDE FOR AT GITTE FIRMA KAN HA EGNE HTML-ER
N02  c                   select
N02   * Her legges spesialer for firma som har avvikende pålogging
N02  c     FRAFIR        wheneq    'Axx'
N02EXC*    XSPRÅK        Ifeq      'EN'
N02EXC*                  callp     gethtml('HTMLSRC':
N02EXC*                            '*LIBL':
N02EXC*                            'AxxSYMNBEN':'/CGITAG/')
N02EXc*                  else
N02EXC*                  callp     gethtml('HTMLSRC':
N02EXC*                            '*LIBL':
N02EXC*                            'AxxSYMNB':'/CGITAG/')
N02EXc*                  end
     c                   other
     C     XSPRÅK        Ifeq      'EN'
     C                   callp     gethtml('HTMLSRC':
     C                             '*LIBL':
     C                             'SYMNBEN':'/CGITAG/')
     c                   else
     C                   callp     gethtml('HTMLSRC':
     C                             '*LIBL':
     C                             'SYMNB':'/CGITAG/')
     c                   end
N02  c                   endsl
N02  C                   callp     updHTMLvar('LogoImg':LogoImg)
N02  C                   callp     updhtmlvar('BODYCLASS':'class='+BIFARG)
     C                   callp     updHTMLvar('FEILTXT':FEILMELDING)
     C                   callp     wrtsection('all')
     C                   endsr
      *=====================================================================
      * Bruker har oppgitt riktig bruker-id og passord
      *=====================================================================
     C     LoadHtmlMnu   begsr
     C* En "standardvariant" libl: call bound (INCGI=*MODULE) med param
     C     BILIBL        ifeq      *blanks
     C                   callb     'INCGI'
     C                   parm                    BISTDL
     C                   else
     C* Helt egen bibl.liste satt på user - normal CALL (BILIBL er "*pg
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
      *
     C                   OPEN      BRPRF
     C                   OPEN      BRPARF
     C     BRPARFK       klist
     C                   kfld                    BIBRID
     C                   kfld                    PAKUNR
     C                   kfld                    PAID
     C                   MOVEL     'SPRÅK'       PAID
     C     BRPARFK       chain     BRPARF                             33
     C                   IF        (*IN33 OR (PAVRDA <> 'EN'))
     C                   MOVE      *BLANKS       XSPRÅK
     C                   ELSE
     C                   MOVE      'EN'          XSPRÅK
     C                   END
      *
     C                   MOVEL     'KUNPG'       PAID
     C                   MOVE      *ZEROS        XN                3 0
     C     BRPARFK       chain     BRPARF                             33
     C                   DOW       *IN33 = *OFF
     C                   ADD       1             XN
     C     LC:UC         XLATE     PAVRDA        PAVRDA
     C                   EVAL      XPGM(XN) = PAVRDA
     C     BRPARFK       READE     BRPARF                                 33
     C                   ENDDO
      * Retrieve environment variables
     C                   exsr      RtvEnvVar
      *
     C     XSPRÅK        Ifeq      'EN'
     C                   callp     gethtml('HTMLSRC':
     C                             '*LIBL':
     C                             'SYMN1EN':'/CGITAG/')
     C                   else
     C                   callp     gethtml('HTMLSRC':
     C                             '*LIBL':
     C                             'SYMN1':'/CGITAG/')
     C                   end
      *
     C                   callp     updhtmlvar('TXTCOLOR':'black')
     C                   callp     updhtmlvar('BOLD':' ')
     C                   callp     updhtmlvar('BGCOLOR':BIFARG)
     C                   callp     updhtmlvar('LINK':'0000FF')
     C                   callp     updhtmlvar('VLINK':'FF0000')
     C                   callp     updhtmlvar('ALINK':'00FF00')
      *
      * Ta med variabler fra USER-ID
OddEvC                   callp     updHTMLvar('ROWHEAD':RowHead)
OddEvC                   callp     updHTMLvar('LogoImg':LogoImg)
BODY C                   callp     updhtmlvar('BODYCLASS':'class='+BIFARG)
     C                   callp     updHTMLvar('user':BIBRID)
     C                   callp     updHTMLvar('WSNA':BIBESK)
     C                   callp     updHTMLvar('kunr':
     C                             %trim(%editc(BIKUNR:'Z')))
     C                   callp     updHTMLvar('sdato':
     C                             %trim(%editw(BIDTV:'    .  .  ')))
     C                   callp     updHTMLvar('stid':
     C                             %trim(%editw(BITIDV:'  .  .  ')))
     C                   eval      UsrSpcName= CrtUsrSpc(
     C                               UsrSpcLib : StateP : MsgID : '*ALL')
     C                   callp     updHtmlVar('UsrSpcName':UsrSpcName)
      *
     C                   callp     wrtsection('top')
      *
     C                   exsr      SetTabStr
     C                   callp     wrtsection('tablestr')
N07   * kall på syge15C kan tidvis feile (midt mellom chain/upfdate av BRIDF --> Recordlock)
N07  C*                  CALL      'SYGE15C'
N07  C*                  PARM                    UINNDT
N07  C*                  PARM                    UINNTM
N07   * Bruker sikrere TIME - låner dato for vellykket innlogg for å formidle Userspace / UINNDT
N07  C                   TIME                    WTIME
N07  C                   MOVE      WÅÅ           BIDTVÅ
N07  C                   MOVE      WMM           BIDTVM
N07  C                   MOVE      WDD           BIDTVD
N07  C                   MOVE      BIDTV         UINNDT
N07  C                   MOVE      WTID          UINNTM
     C                   MOVE      BIBRID        UBRID
      *
     C                   MOVE      *ZEROS        XGMLLIN           3 0
     C     BIKUNR        SETLL     BRPRF
     C     STMNU01       TAG
     C     BIKUNR        READE     BRPRF                                  50
      *
     C  N50              IF        BPAKT = 'V'
     C                   EXSR      TESTPGM
     C   33              GOTO      STMNU01
     C                   END
      *
     C  N50              IF        XPGM(1) <> *BLANKS
     C                   EXSR      TESTPGM2
     C   33              GOTO      STMNU01
     C                   END
      *
     C     *IN50         IFEQ      '1'
      * Ingen menypkt på kundenivå / gruppe er ikke utfylt
     c     BIKNG         cabeq     *zeros        Ingenpkt
     C                   MOVE      'J'           XGRP              1
     C     BIKNG         SETLL     BRPRF
     C     STMNU02       TAG
     C     BIKNG         READE     BRPRF                                  50
      *
     C  N50              IF        BPAKT = 'V'
     C                   EXSR      TESTPGM
     C   33              GOTO      STMNU02
     C                   END
      *
     C  N50              IF        XPGM(1) <> *BLANKS
     C                   EXSR      TESTPGM2
     C   33              GOTO      STMNU02
     C                   END
      *
     C                   END
      *
     C     *IN50         DOWEQ     '0'
     C     BPAKT         IFEQ      'A'                                          A=Aktiv i Esped
N03  C     BPAKT         OREQ      'B'                                          B=begge Esped/Tomcat
     C     BIBRID        OREQ      'YBCOS'
     C     XGMLLIN       IFNE      0
     C     XGMLLIN       ANDNE     BPLIN
     C                   callp     wrtsection('tablerowny')
     C                   END
     C                   MOVE      BPLIN         XGMLLIN
     C                   exsr      SetTabRow
     C                   callp     wrtsection('tablerow')
     C                   END
     C     STMNU03       TAG
     C     XGRP          IFEQ      'J'
     C     BIKNG         READE     BRPRF                                  50
     C                   ELSE
     C     BIKUNR        READE     BRPRF                                  50
     C                   END
     C  N50              IF        BPAKT = 'V'
     C                   EXSR      TESTPGM
     C   33              GOTO      STMNU03
     C                   END
      *
     C  N50              IF        XPGM(1) <> *BLANKS
     C                   EXSR      TESTPGM2
     C   33              GOTO      STMNU03
     C                   END
      *
     C  N50              ENDDO                                                  *hival
      *
     C     IngenPkt      tag
     C                   callp     wrtsection('tableend')
      *
     C                   callp     wrtsection('foundsome')
     c                   exsr      switchSR
     C                   callp     wrtsection('foundsome2')
     C                   exsr      SetEnd
     C                   callp     wrtsection('endhtml')
      *
      * Null ut antall misslykkede forsøk, ved ett riktig.
S07  C*                  MOVE      *ZEROS        BIANTF
S07  C*                  MOVE      *ZEROS        BIDTF
S07  C*                  MOVE      *ZEROS        BITIDF
S07  C*                  MOVE      'I'           BIINN
S07  C*                  TIME                    WTIME
S07  C*                  MOVE      WTID          BITIDV
S07  C*                  MOVE      WÅÅ           BIDTVÅ
S07  C*                  MOVE      WMM           BIDTVM
S07  C*                  MOVE      WDD           BIDTVD
S07  C*                  MOVE      WTID          BITIDF
S07  C*                  MOVE      WÅÅ           BIDTFÅ
S07  C*                  MOVE      WMM           BIDTFM
S07  C*                  MOVE      WDD           BIDTFD
     C                   CLOSE     BRPRF
     C                   CLOSE     BRPARF
     C                   endsr
      *****************************************************
     C     SWITCHSR      begsr
      *****************************************************
      * Hvis det finnes minst en Multi-ID-parameter (SwitchTo-user) så vis pulldown
      * (DERSOM SWITCH USER VELGES så utføres test,framhenting av passord mm av ESUSR -
      *  se javascript DoSwitch i html SYMN1 - ved uatorisert/uriktig kall på ESUSR
      *  resulterer det i en redusert visning av SYMN1 switcuser-pulldowne OG feilmelding.
      *  Ved OK kall på ESUSR vil variabel SWITCHOK=Y trigge javascript DoSwitch )
     c                   move      'MLTID'       PAID
     C     BRPARFK       setll     BRPARF
     C     BRPARFK       reade     BRPARF                                 40
     C     *in40         cabeq     '1'           UtSwitch
     C                   callp     wrtsection('switchtop')
     C     *in40         doweq     '0'
     C                   callp     updhtmlvar('ID':PAVRDA_01_10)
     C                   callp     updhtmlvar('IDTEXT':PAVRDA_11_50)
     C                   callp     wrtsection('switchrow')
     C     BRPARFK       reade     BRPARF                                 40
     C                   enddo
      *
     C                   callp     updhtmlvar('FEILTXT'  :' ')
     C                   callp     updhtmlvar('SWITCHTO' :' ')
     C                   callp     updhtmlvar('SWITCHPW' :' ')
      *
     C                   callp     wrtsection('switchbot')
     C     UtSwitch      endsr
      *=====================================================================******
      *  TEST OM PROGRAM SKAL BRUKES
      *=====================================================================******
     C     TESTPGM       begsr
     C                   MOVE      'LLPGM'       PAID
     C     BRPARFK       CHAIN     BRPARF                             33
     C                   IF        *IN33 = *OFF
     C                   EVAL      LLPAVRDA = uppify(PAVRDA)
     C                   EVAL      BPPRD  = uppify(BPPRD)
     C                   EVAL      BPPRD2 = uppify(BPPRD2)
     C                   Z-ADD     1             XN                3 0
     C     STTEST01      TAG
     C                   DO        50
     C                   IF        PAT(XN) <> *BLANKS
     C                   LEAVE
     C                   END
     C                   ADD       1             XN
     C                   IF        XN > 50
     C                   LEAVE
     C                   END
     C                   ENDDO
     C                   IF        PAT(XN) = *BLANKS
     C                   MOVE      *ON           *IN33
     C                   GOTO      SLTEST
     C                   END
      *
      * HENT PROGRAMNAVN
     C                   Z-ADD     1             XN3               3 0
     C                   MOVE      *BLANKS       P2
     C                   DO        14
     C                   MOVE      PAT(XN)       P2T(XN3)
     C                   ADD       1             XN
     C                   IF        XN > 50
     C                   LEAVE
     C                   END
     C                   IF        PAT(XN) = *BLANKS
     C                   LEAVE
     C                   END
     C                   ADD       1             XN3
     C                   ENDDO
      *
      * TEST OM PROGRAM FINNES
     C                   SELECT
     C                   WHEN      XN3 < 5
     C                   MOVE      *OFF          *IN34
     C                   WHEN      XN3 = 5
     C     P25           SCAN      BPPRD                                  34
     C  N34P25           SCAN      BPPRD2                                 34
     C                   WHEN      XN3 = 6
     C     P26           SCAN      BPPRD                                  34
     C  N34P26           SCAN      BPPRD2                                 34
     C                   WHEN      XN3 = 7
     C     P27           SCAN      BPPRD                                  34
     C  N34P27           SCAN      BPPRD2                                 34
     C                   WHEN      XN3 = 8
     C     P28           SCAN      BPPRD                                  34
     C  N34P28           SCAN      BPPRD2                                 34
     C                   WHEN      XN3 = 9
     C     P29           SCAN      BPPRD                                  34
     C  N34P29           SCAN      BPPRD2                                 34
     C                   WHEN      XN3 = 10
     C     P29           SCAN      BPPRD                                  34
     C  N34P29           SCAN      BPPRD2                                 34
     C                   WHEN      XN3 = 11
     C     P29           SCAN      BPPRD                                  34
     C  N34P29           SCAN      BPPRD2                                 34
     C                   WHEN      XN3 = 12
     C     P29           SCAN      BPPRD                                  34
     C  N34P29           SCAN      BPPRD2                                 34
     C                   WHEN      XN3 = 13
     C     P29           SCAN      BPPRD                                  34
     C  N34P29           SCAN      BPPRD2                                 34
     C                   OTHER
     C     P2            SCAN      BPPRD                                  34
     C  N34P2            SCAN      BPPRD2                                 34
     C                   ENDSL
     C  N34              GOTO      STTEST01
     C                   MOVE      'A'           BPAKT
      *
     C                   END
      *
     C     SLTEST        ENDSR
      *
      *=====================================================================******
      *  TEST OM PROGRAM SOM KUN BRUKES
      *=====================================================================******
     C     TESTPGM2      begsr
     C                   EVAL      *IN33 = *OFF
     C     1             DO        10            XN                             1<-B
     C                   IF        XPGM(XN) = *BLANKS                            2<-B
     C                   EVAL      *IN33 = *ON
     C                   GOTO      SLTEST2
     C                   ELSE                                                    2
      *
     C                   MOVE      XPGM(XN)      XPTXT
     C                   Z-ADD     50            XN2               3 0
     C                   DOW       XN2 > 0                                        3<-B
     C                   IF        XPT(XN2) <> *BLANKS                             4<-B
     C                   LEAVE
     C                   END                                                       4<-E
     C                   SUB       1             XN2
     C                   ENDDO                                                    3<-E
      *
      * TEST OM PROGRAM FINNES
     C     LC:UC         XLATE     BPPRD         BPPRD
     C                   SELECT                                                   3<-B
     C                   WHEN      XN2 = 1
     C     XPT01         SCAN      BPPRD                                  34
     C                   WHEN      XN2 = 2
     C     XPT02         SCAN      BPPRD                                  34
     C                   WHEN      XN2 = 3
     C     XPT03         SCAN      BPPRD                                  34
     C                   WHEN      XN2 = 4
     C     XPT04         SCAN      BPPRD                                  34
     C                   WHEN      XN2 = 5
     C     XPT05         SCAN      BPPRD                                  34
     C                   WHEN      XN2 = 6
     C     XPT06         SCAN      BPPRD                                  34
     C                   WHEN      XN2 = 7
     C     XPT07         SCAN      BPPRD                                  34
     C                   WHEN      XN2 = 8
     C     XPT08         SCAN      BPPRD                                  34
     C                   WHEN      XN2 = 9
     C     XPT09         SCAN      BPPRD                                  34
     C                   WHEN      XN2 = 10
     C     XPT10         SCAN      BPPRD                                  34
     C                   WHEN      XN2 = 11
     C     XPT11         SCAN      BPPRD                                  34
     C                   WHEN      XN2 = 12
     C     XPT12         SCAN      BPPRD                                  34
     C                   OTHER
     C                   EVAL      *IN34 = *OFF
     C                   ENDSL
     C   34              GOTO      SLTEST2                                        3<-E
      *
     C                   END                                                     2<-E
      *
     C                   ENDDO                                                  1<-E
      *
     C     SLTEST2       ENDSR
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
      *=====================================================================******
      *  Set output variables for section /$tablerow (table row)
      *=====================================================================******
     C     SetTabRow     begsr
     c* Sequence of this Recd (numeric, converted to char)
     C*                  CAT       BIBRID:0      BPPRD
     C*                  callp     updhtmlvar('BPPRD':BPPRD)
      * TEST OM USER ER OPPGITT.
     C     *like         DEFINE    BPPRD         BPPRDTmp
     C                   EVAL      BPPRDTmp = uppify(BPPRD)
     C     'USER='       SCAN      BPPRDTmp                               45
      *
     C                   MOVE      *BLANKS       XBPPRD
     C                   MOVEL     BPPRD         XBPPRD
     C     *IN45         IFEQ      *ON
     C                   CAT       BIBRID:0      XBPPRD
     C                   CAT       '&UsrSpcNam':0XBPPRD
     C                   CAT       'e=':0        XBPPRD
     C                   CAT       UsrSpcName:0  XBPPRD
     C                   END
     C     BpPrd2A       Ifeq      '&Time='
     c     BpPrd2A       Oreq      '&TIME='
     c     BpPrd2A       Oreq      '&time='
     C                   CAT       BPPRD2A:0     XBPPRD
     C                   Movel     Timedata1     TimeStamp        26
     C                   CAT       TimeStamp:0   XBPPRD
     C                   CAT       BPPRD2B:0     XBPPRD
     c                   else
     C                   CAT       BPPRD2:0      XBPPRD
     c                   end
     C                   callp     updhtmlvar('BPPRD':XBPPRD)
     C                   callp     updhtmlvar('BPBILD':BPBILD)
N01  C                   IF        ((XSPRÅK = 'EN') AND (BPTXTE <> *BLANKS))
N01  C                   callp     updhtmlvar('BPTXT':BPTXTE)
N01  C                   ELSE
     C                   callp     updhtmlvar('BPTXT':BPTXT)
N01  C                   END
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
      *  Set output variables for section /$endhtml
      *=====================================================================******
     C     SetEnd        begsr
      * Kun ved menykall fra switcheprog ESUSR vil SWITCHOK være Y , ALDRI FRA SYMN0 )
     C                   callp     updhtmlvar('SWITCHOK' :' ')
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
