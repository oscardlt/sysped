     D ORIGIN          s            256A
     D DESTIN          s            256A
     D SECONDS         s             11  0
     D RESULT          s              3
      *
      *   90001695  STATOIL !   6517 KRISTIANSUND N    63,107251     7,780339
      *   90001920  Swire O !   4056  TANANGER         58,936182     5,574096
      *   90002535  STATOIL !   5954 MONGSTAD          60,784832     5,075412
      *
     C*                  EVAL      ORIGIN ='Orshaugvegen 50, 4050 Sola'
     C*                  EVAL      DESTIN ='5954 Mongstad'
     C                   EVAL      ORIGIN ='63.107251,7.780339'
     C                   EVAL      DESTIN ='60.784832,5.075412'
     C                   call      'GETGOTID'
     C                   parm                    ORIGIN
     C                   parm                    DESTIN
     C                   parm                    SECONDS
     C                   parm                    RESULT
     C                   eval      *inlr = *on
     C                   return
