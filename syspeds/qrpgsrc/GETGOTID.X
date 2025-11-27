     D ORIGIN          s            256A
     D DESTIN          s            256A
     D SECONDS         s             11  0
     D RESULT          s              3
     C                   EVAL      ORIGIN ='Orshaugvegen 50, 4050 Sola'
     C                   EVAL      DESTIN ='5954 Mongstad'
     C*                  EVAL      DESTIN ='{lat: 93.107, lng: 5.075}'
     C*                  EVAL      ORIGIN ='{lat: 58.933558, lng: 5.586034}'
     C*                  EVAL      DESTIN ='{lat: 58.931354, lng: 5.584730}'
     C                   call      'GETGOTID'
     C                   parm                    ORIGIN
     C                   parm                    DESTIN
     C                   parm                    SECONDS
     C                   parm                    RESULT
     C                   eval      *inlr = *on
     C                   return
