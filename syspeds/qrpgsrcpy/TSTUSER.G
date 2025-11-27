      * SJEKK OM BRUKER ER "LOVLIG PÅLOGGET"
n01   * YBC - logg dato/tid  for vellykket/missykket.
n02   * JOV - IKKE vis bilde for ny pålogging
     C     WSUSER        CHAIN(N)  BRIDF                              50
     C     *in50         IFEQ      '0'
     C                   MOVE      BIDTF         UDTF              8
     C                   MOVE      BITIDF        UTIDF             6
     C                   CALLB     PGM
     C                   PARM                    BIBRID
     C                   PARM                    UsrSpcName
     C                   PARM                    UINN              1
     C                   end
      *
N01   * LOGGING INNFØRT...
     C                   IF        *IN50 = *OFF
     C     WSUSER        CHAIN     BRIDF                              50
     C                   CALL      'SYGE15C'
     C                   PARM                    WDT               8
     C                   PARM                    WTM               6
      *
     C                   IF        UINN = 'N'
      * IKKE OK !!!
      * OPPDATER DATO FOR FEIL LOGG
     C                   MOVE      WDT           BIDTF
     C                   MOVE      WTM           BITIDF
     C                   ELSE
      * OK !!!
      * OPPDATER DATO FOR SISTE BRUK
     C                   MOVE      WDT           BIDTV
     C                   MOVE      WTM           BITIDV
     C                   END
     C                   UPDATE    BRIDFR
     C                   END
      *
      * Bruker er IKKE lovlig inne - tving avslutning / ny pålogging
     C                   IF        (UINN = 'N') OR (*IN50 = '1')
N02   * Checkusr HAR alt vist timeout-bilde  - KUN CLOSE BRIDF/*INLR GJENSTÅR
S02   * VISING AV PÅLOGG.BILDE FJERNET..
S02   *
S02  C*                  eval      lng = uppify(lng)
S02  C*                  eval      Lib = '*LIBL'
S02  C*                  eval      Fn  = 'HTMLSRC' + lng
S02  C*                  eval      Mbr = 'SYMNB'
S02  C*                  callp     gethtml(fn:lib:mbr:'/CGITAG/')
S02  C*                  move      *blanks       UserFeil         70
S02  C*                  eval      USERFEIL    = 'The session has timed '+
S02  C*                                          'OUT, or illegal program '+
S02  C*                                          'call made. Please log on.'
S02  C*                  callp     updhtmlvar('FEILMELDING':
S02  C*                            USERFEIL)
S02  C*                  callp     wrtsection('all')
S02  C*                  callp     wrtsection('*fini')
     C                   close     BRIDF
     C                   eval      *inlr = *on
     C                   return
     C                   END
      *
