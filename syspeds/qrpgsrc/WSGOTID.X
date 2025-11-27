     D ORIGIN          s            256A
     D DESTIN          s            256A
     D SECONDS         s             11  0
     D RESULT          s              3
     C                   EVAL      ORIGIN ='Orshaugvegen 50, 4050 Sola'
     C                   EVAL      DESTIN ='5954 Mongstad'
     C                   call      'ESTK12A'
     C                   parm                    ORIGIN
     C                   parm                    DESTIN
     C                   parm                    SECONDS
     C                   parm                    RESULT
     C                   eval      *inlr = *on
     C                   return
