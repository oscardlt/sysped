      *********************************************************************
      *
CRTPG+*  CRTPGM SYSPED/TJGE28R MODULE(*LIBL/TJGE28R *LIBL/INCGI)
CRTPGM*        ACTGRP(*NEW) AUT(*USE)
      *
      *********************************************************************
      /copy SYSPEDS/qrpgsrcpy,hspecs
      /copy SYSPEDS/qrpgsrcpy,hspecsbnd
      *********************************************************************
     FBRIDF     IF   E           K DISK    USROPN
     FHEADF     IF   E           K DISK    USROPN
     FFRISOK    IF A E           K DISK    USROPN
     F                                     PREFIX(X)
     FFRISOL03  IF   E           K DISK    USROPN
     F                                     RENAME(FRISOKR:FRISOKR3)
     FKODFRI    IF   E           K DISK    USROPN
     FCUOTI     IF   E           K DISK    USROPN
     FCUOTIG    IF   E           K DISK    USROPN
      *--------------------------------------------------------------------
      * Variables common to all CGIs
      *--------------------------------------------------------------------
      /copy SYSPEDS/qrpgsrcpy,prototypeb
      /copy SYSPEDS/qrpgsrcpy,usec
      /copy SYSPEDS/qrpgsrcpy,variables3
      *
      * Varible for
     D WSUSER          S             10
     D AVD             S              4
     D AVDN            S              4S 0
     D OPD             S              7
     D OPDN            S              7S 0
     D WA              S             15
     D Websok          S              1
     D Mxkrav          S              1
     D Krav            S              1
     D OTIKNRtmp       S              8  0
     D OTIKNR          S              8  0
     D OTIKU1          S              8  0
     D OTIKU2          S              8  0
     D OTIAVD          S              4  0
     D JSONstring      S          32000
     D Error           S            150
     D AntLest         S              9  0
      *get input-string
      /copy syspeds/qrpgsrcpy,prolog3

      * Parse input
     C                   exsr      Parse
      * Open files etc
     C                   EXSR      INIT
      * Test kunde egne frisøkeveier
     C  N50              EXSR      SJKRAV
      *
     c                   callp     gethtmlifs(
     C                             '/syspeddev/html/JSON.html':
     C                             '/CGITAG/')
     C                   callp     wrtsection('top')
      *
      * ............................................................................................
      * skriv JSON-Object start..(alltid '{' + x ant param. m/komma mellom (IKKE komma etter siste))
      * ............................................................................................
      *
      /free
        JSONstring='{'
        +'¬user¬ : ¬'+%trim(WSUSER)+'¬, '
        +'¬avd¬ : ¬'+%trim(%editc(AVDN:'Z'))+'¬, '
        +'¬opd¬ : ¬'+%trim(%editc(OPDN:'Z'))+'¬, '
        +'¬errMsg¬ : ¬'+%trim(Error)+'¬, ';
      /end-free
      * JSONfix escaper " i tekst,  for deretter å bytte ¬->"
     c                   call      'JSONFIX'
     c                   parm                    JSONstring
     C                   CALLP     updHTMLvar2('JSONstring'
     C                                         :%addr(JSONstring)
     C                                         :%len(JSONstring))
     C                   callp     wrtsection('JSONlin')
      *
      * ............................................................................................
      * Skriv JSON-LISTE Start (en liste er EN parameter(fra [ til   )
      * ............................................................................................
     c                   eval      JSONstring ='"awblinelist" : ['
     C                   CALLP     updHTMLvar2('JSONstring'
     C                                         :%addr(JSONstring)
     C                                         :%len(JSONstring))
     C                   callp     wrtsection('JSONlin')
      *
      * Liste
      *
     c*    Error         ifeq      *blanks
     c                   if        Error = *blanks
     C                             OR Error = 'Sjekk krav referanse.'
     C                             or Error = 'Minst en krav referanse mangler.'
     C                   MOVE      ' '           MXKRAV
     C                   MOVE      'N'           WEBSOK
     C     FRISOKK       SETLL     FRISOK
     C     FRISOKK       READE     FRISOK                                 55
     C                   DOW       *IN55 = *OFF
     c
     C     FSKODE        CHAIN     KODFRI                             33
     C                   EXSR      TSTKRA
     C                   IF        KRAV > MXKRAV
     C                   MOVE      KRAV          MXKRAV
     C                   END
     C*                  IF        KFSTTU = *BLANKS
     C*                  MOVE      'J'           WEBSOK
     C*                  END
     C                   Add       1             AntLest
      * ............................................................................................
      * Skriv en JSON-Array-linje pr menypunkt - komma før hvert nytt element
      * ............................................................................................
      /free
       if AntLest=1;
          JSONstring=*blanks;
          else;
          JSONstring=', ';
          endif;
       JSONstring=%trim(JSONstring)+'{'
          +'¬fsavd¬ : ¬'+%trim(%editc(xfsavd:'Z'))+'¬, '
          +'¬fsopd¬ : ¬'+%trim(%editc(xfsopd:'Z'))+'¬, '
          +'¬fskode¬ : ¬'+%trim(xfskode)+'¬, '
          +'¬fssok¬ : ¬'+%trim(xfssok)+'¬, '
          +'¬fsdokk¬ : ¬'+%trim(xfsdokk)+'¬, '
          +'¬fsdtop¬ : ¬'+%trim(%editc(fsdtop:'Z'))+'¬, '
          +'¬kfsttu¬ : ¬'+%trim(kfsttu)+'¬, '
          +'¬kfsotx¬ : ¬'+%trim(kfsotx)+'¬, '
          +'¬krav¬ : ¬'+%trim(krav)+'¬, '
          +'¬websok¬ : ¬'+%trim(websok)+'¬}';
      /end-free
     C                   call      'JSONFIX'
     C                   parm                    JSONstring
     C                   CALLP     updHTMLvar2('JSONstring'
     C                                         :%addr(JSONstring)
     C                                         :%len(JSONstring))
     C                   callp     wrtsection('JSONlin')


     C     READNEXT      TAG
     C     FRISOKK       READE     FRISOK                                 55
     C                   ENDDO
     c                   ENDIF
      * ............................................................................................
      * Skriv JSON-Liste/Array  Avslutning
      * ............................................................................................
     c                   eval      JSONstring =']'
     C                   CALLP     updHTMLvar2('JSONstring'
     C                                         :%addr(JSONstring)
     C                                         :%len(JSONstring))
     C                   callp     wrtsection('JSONlin')
      * ............................................................................................
      * Skriv JSON-string Avsluttning
      * ............................................................................................
     c                   eval      JSONstring ='}'
     C                   CALLP     updHTMLvar2('JSONstring'
     C                                         :%addr(JSONstring)
     C                                         :%len(JSONstring))
     C                   callp     wrtsection('JSONlin')

      * Quit
     C                   exsr      Exit


      *=====================================================================
      * Close output html and quit
      *=====================================================================
     C     Exit          begsr
      * Lukk fil
     C                   CLOSE     BRIDF
     C  N50              CLOSE     HEADF
     C  N50              CLOSE     FRISOK
     C  N50              CLOSE     KODFRI
     C  N50              CLOSE     CUOTI
     C  N50              CLOSE     CUOTIG

      * Do not delete the call to wrtsection with section name *fini.  It is needed
      * to ensure that all output html that has been buffered gets output.
     C                   callp     wrtsection('*fini')
      * Quit
     C                   MOVE      *ON           *INLR
     C                   return
     C                   endsr
      *
      *********************************************************
     C     Parse         Begsr
      *********************************************************
      * Get input
     C                   EVAL      WSUSER = zhbgetvar('USER')
     C                   EVAL      AVD    = zhbgetvar('AVD')
     C                   EVAL      AVDN   = c2n2(AVD)
     C                   EVAL      OPD    = zhbgetvar('OPD')
     C                   EVAL      OPDN = c2n2(OPD)
     C                   EVAL      WA     = zhbgetvar('OTIKU1')
     C                   EVAL      OTIKU1 = c2n2(WA)
     C                   EVAL      WA     = zhbgetvar('OTIKU2')
     C                   EVAL      OTIKU2 = c2n2(WA)
      *
     c                   endsr
      *
      ***********************************************
     C     TSTKRA        BEGSR
      ***********************************************
     C                   MOVE      ' '           KRAV
      * TEST OM DET ER ET KUNDEKRAV-FELT
     C                   MOVE      *zeros        OTIKNRtmp
      *
      * FØRST KUNDE 1
     C                   IF        OTIKU1 <> 0
     C                   MOVE      OTIKU1        OTIKNR
     C                   MOVE      FSAVD         OTIAVD
     C     OTIKEY        CHAIN     CUOTI                              33
     C                   IF        *IN33 = *OFF
     C                   MOVE      COKRAV        KRAV
     C                   MOVE      OTIKNR        OTIKNRtmp
     C                   ELSE
     C                   MOVE      *ZEROS        OTIAVD
     C     OTIKEY        CHAIN     CUOTI                              33
     C                   IF        *IN33 = *OFF
     C                   MOVE      COKRAV        KRAV
     C                   MOVE      OTIKNR        OTIKNRtmp
     C                   END
     C                   END
     C                   END
      *
     C* DERSOM KUNDE 2 OGSÅ HAR KODEN I LISTE... STERKERE KRAV??
      * Om kunde 1 var blank eller kunde 2 hadde sterkere krav er den den som brukes ved opt 9.
     C                   IF        OTIKU2 <> 0
     C                   MOVE      OTIKU2        OTIKNR
     C                   MOVE      FSAVD         OTIAVD
     C     OTIKEY        CHAIN     CUOTI                              33
     C                   IF        *IN33 = *OFF
     C     OTIKNRtmp     ifeq      *zeros
     C                   MOVE      OTIKNR        OTIKNRtmp
     c                   end
     C     COKRAV        IFGT      KRAV
     C                   MOVE      COKRAV        KRAV
     C                   MOVE      OTIKNR        OTIKNRtmp
     C                   END
     C                   ELSE
     C                   MOVE      *ZEROS        OTIAVD
     C     OTIKEY        CHAIN     CUOTI                              33
     C                   IF        *IN33 = *OFF
     C     OTIKNRtmp     ifeq      *zeros
     C                   MOVE      OTIKNR        OTIKNRtmp
     c                   end
     C                   IF        COKRAV > KRAV
     C                   MOVE      COKRAV        KRAV
     C                   MOVE      OTIKNR        OTIKNRtmp
     C                   END
     C                   END
     C                   END
     C                   END
      *
     C                   MOVE      OTIKNRtmp     OTIKNR
      *
     C                   ENDSR
      *
      ***********************************************
     C     SJKRAV        BEGSR
      ***********************************************
     C     HEADFK        CHAIN     HEADF                              33
      *
     C                   IF        TRSLAG = 'HO'
     C                   EVAL      X_HEAVD = HEAVD
     C                   EVAL      COKUNR  = HEKNA
     C                   MOVE      'N'           XFRISOK           1
     C     STSJKRAV      TAG
     C     CUOTIKALL     SETLL     CUOTI
     C     CUOTIKALL     READE     CUOTI                                  33
      *
     C                   DOW       *IN33 = *OFF
     C     FRISOKK2      CHAIN     FRISOK                             33
     C                   IF        *IN33
     C                   EVAL      XFSAVD  = HEAVD
     C                   EVAL      XFSOPD  = HEOPD
     C                   EVAL      XFSKODE = COKODE
     C                   EVAL      XFSSOK  = *BLANKS
     C     FSKODE        CHAIN     KODFRI                             33
     C  N33              EVAL      XFSDOKK = KFSODK
     C   33              EVAL      XFSDOKK = *BLANKS
     C                   EVAL      XFSDTOP = HEDTOP
     C                   WRITE     FRISOKR
     C                   eval      Error = 'Sjekk krav referanse.'
     C                   END
      *
     C     CUOTIKALL     READE     CUOTI                                  33
     C                   ENDDO
      *
     C                   IF        XFRISOK = 'N'
     C                   EVAL      XFRISOK = 'J'
     C                   EVAL      X_HEAVD = 0
     C                   GOTO      STSJKRAV
     C                   END
      *
      * TEST FRISØKEVEI
     C                   IF        Error = *BLANKS
     C                   EVAL      COKUNR  = HEKNA
     C                   EVAL      X_HEAVD = 0
     C     FRISOKK       SETLL     FRISOK
     C     FRISOKK       READE     FRISOK                                 33
     C                   DOW       *IN33 = *OFF
     C                   IF        XFSSOK = *BLANKS
     C     CUOTIK1       CHAIN     CUOTI                              33
     C   33CUOTIK2       CHAIN     CUOTI                              33
     C  N33              IF        COAVD = 0 OR COAVD = HEAVD
     C                   IF        COKRAV = '2'
     C                   eval      Error = 'Minst en krav referanse mangler.'
     C                   LEAVE
     C                   END
     C                   END
     C                   END
     C     FRISOKK       READE     FRISOK                                 33
     C                   ENDDO
     C                   END
      *
     C                   END
      *
     C                   ENDSR
      *
      *********************************************************
     C     INIT          Begsr
      *********************************************************
     C                   OPEN      BRIDF
      * Test innlogging
     C     WSUSER        CHAIN     BRIDF                              50
     C     BILIBL        ifeq      *blanks
     C                   callb     'INCGI'
     C                   parm                    BISTDL
     C                   else
     C                   call      BILIBL
     C                   end
      *
     C     HEADFK        KLIST
     C                   KFLD                    AVDN
     C                   KFLD                    OPDN
     C     OTIKEY        KLIST
     C                   KFLD                    BIFIRM
     C                   KFLD                    OTIKNR
     C                   KFLD                    OTIAVD
     C                   KFLD                    FSKODE
     C     FRISOKK       KLIST
     C                   KFLD                    AVDN
     C                   KFLD                    OPDN
     C     FRISOKK2      KLIST
     C                   KFLD                    AVDN
     C                   KFLD                    OPDN
     C                   KFLD                    COKODE
     C     CUOTIKALL     KLIST
     C                   KFLD                    BIFIRM
     C                   KFLD                    COKUNR
     C                   KFLD                    X_HEAVD
     C     CUOTIK1       KLIST
     C                   KFLD                    BIFIRM
     C                   KFLD                    COKUNR
     C                   KFLD                    HEAVD
     C                   KFLD                    XFSKODE
     C     CUOTIK2       KLIST
     C                   KFLD                    BIFIRM
     C                   KFLD                    COKUNR
     C                   KFLD                    X_HEAVD
     C                   KFLD                    XFSKODE
     C     *LIKE         DEFINE    HEAVD         X_HEAVD
      *
     C   50              eval      Error = 'Invalid userID'
     C  N50              OPEN      HEADF
     C  N50              OPEN      FRISOK
     C  N50              OPEN      KODFRI
     C  N50              OPEN      CUOTI
     C  N50              OPEN      CUOTIG
      * dummy for å få feltnavn som arbeids/inputvariable
     C     *IN50         IFEQ      *OFF
     C     *IN50         ANDEQ     *ON
     C                   OPEN      FRISOL03
     C                   READ      FRISOL03
     C                   ENDIF

     c                   endsr
