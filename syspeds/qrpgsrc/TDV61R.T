     H DEBUG(*YES)
     FCPFL01    IF   E           K DISK                                         Rådata
     FFSA01L    IF   E           K DISK                                         FSA Joinfilel
      * Init av parametere, kun eksempel untatt WRECN, denne skal alltid settes til 0 før ext. call
     C                   EVAL      WWAUTI='11712345675'
     C                   EVAL      WWUSER='SYSTEMA'
     C                   EVAL      URECN=*ZEROS
     C                   CALL      'TDV61R'
     C                   PARM                    WWAUTI           11
     C                   PARM                    WWUSER           17
     C                   PARM                    URECN             9
     C                   MOVE      URECN         WRECN             9 0
      * Hvis parameter WRECN er lik 0 var søket misslykket.
      * Hvis uformatert ønskes leses kun filen CPFL01 med key=WRECN   (READE)

     C                   EVAL      *IN51=*OFF
     C     WRECN         SETLL     CPFL01
     C     WRECN         READE     CPFL01
     C     *IN51         DOWEQ     *OFF

      *
      * Her legger du HTML logikken din
      *
     C                   DUMP

     C     WRECN         READE     CPFL01
     C                   ENDDO

      * Hvis formatert ønskes leses filen FSA01L med key=WRECN   (READE)
      * OBS ! mange ulike recordformater, spørr meg så får du informasjon (CB)

     C                   EVAL      *IN51=*OFF
     C     WRECN         SETLL     FSA01L
     C     WRECN         READE     FSA01L
     C     *IN51         DOWEQ     *OFF

      *
      * Her legger du HTML logikken din
      *
     C                   DUMP

     C     WRECN         READE     FSA01L
     C                   ENDDO

      * slutt på pgm
     C     ENDPGM        TAG
     C                   MOVE      *ON           *INLR
