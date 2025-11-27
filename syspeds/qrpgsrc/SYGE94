     H debug(*yes)
      *
N02  D A               S              1    DIM(26)
N02  D B               S              1    DIM(26)
     D                 DS
     D timedata1       s               z                                        z=Timestamfield
      *__________________________
      * Retreive System Date/Time
      *""""""""""""""""""""""""""
     C     *ENTRY        PLIST
     C                   PARM                    TSfull           26
     C                   PARM                    TSstrip          20
     C                   time                    Timedata1
     C                   movel     timedata1     TS26             26
     C                   movea     ts26          A
     C                   movea     *blanks       B
     c                   exsr      fix
     C                   movea     b             TSstrip
     C                   movea     a             TSfull
     c                   seton                                        lr
     c                   return
     C*********************************************************************
     C     fix           begsr
     C*********************************************************************
     c     1             do        26            nr                2 0
     c     A(NR)         ifne      '-'
     c     A(NR)         andne     '.'
     c                   add       1             n2                2 0
     c                   move      a(nr)         B(n2)
     c                   end
     c                   end
     c                   endsr
