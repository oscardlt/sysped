********************************************************************
      * RETTINGER I DETTE PROGRAM:
PTFnr:*Sek Sig Vers  Beskrivelse...........................
""""""*"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
10XXX * 01 JOV PTF10 helt nye typer
********************************************************************
      * *******************************************************************
      *  Postverkets postnrfil hadde pr 03.02.2004 følgende varianter
      *
      *  AdresseType (full tekst)         AdrTYP-Key          ANTALL
      *----------------------------------------------------------------
      *  Gate/vei adresse                 Gate/vei a          1.413
      *  Kjent stedsnavn                  Kjent sted            336
      *  Postboksadresse                  Postboksad          1.755
      *  Postmottaker med eget postnr     Postmottak            168
      *  Servicebokser                    Servicebok             82
      *  Stedsnavn med postnummer         Stedsnavn           1.768
      *----------------------------------------------------------------
      *
      *  Regner i første omgang kun gitte typer for tillatte som
      *  postnr (i f.eks EDI til Posten)
      *  MEN - legger en ubrukt INNPARAMETER som gjør at en senere kan
      *        nyansere testene/bruke prog til andre formål etter behov...
      *
      *  OBS!!  I Systemas fil ligger kun en post på gitt kombinasj.
      *    postnr/AdrTyp(Key).. I Postens origanalfil ligger gjerne samme
      *    postnr drøssevis av ganger når det benyttes i ulike GATER eller
      *    på ulike postboks-nummer m.m
      *    KAN IKKE SE AT VI HAR BEHOV FOR DETTE I SYSPED....
      *   (men PONRF i løsning 1 IBMSTD inneholder alle)
      *
      * *******************************************************************
     FPONRN     IF   E           K DISK
     C*
     C     *ENTRY        PLIST
     C                   PARM                    TSTTYP            1
     C                   PARM                    POSTNR            4
     C                   PARM                    RETIND            1
     C*
     C     KEY           KLIST
     C                   KFLD                    POSTNR
     C                   KFLD                    ADRTYP           10
     C*
     c                   eval      AdrTyp = 'Stedsnavn '
     C     KEY           CHAIN     PONRN                              34
     c   34              eval      AdrTyp = 'Gate/vei a'
     C   34KEY           CHAIN     PONRN                              34
     c   34              eval      AdrTyp = 'Kjent sted'
     C   34KEY           CHAIN     PONRN                              34
     c   34              eval      AdrTyp = 'Postmottak'
     C   34KEY           CHAIN     PONRN                              34
      * fra 17.04.2013 - helt nye typer - bevarer det gamle (over ) inntil videre/bør utgå
N01  c   34              eval      AdrTyp = 'B=Både Gat'
N01  C   34KEY           CHAIN     PONRN                              34
N01  c   34              eval      AdrTyp = 'F=Flere br'
N01  C   34KEY           CHAIN     PONRN                              34
N01  c   34              eval      AdrTyp = 'G=Gateadre'
N01  C   34KEY           CHAIN     PONRN                              34
N01  c   34              eval      AdrTyp = 'K=Kunde me'
N01  C   34KEY           CHAIN     PONRN                              34
      *
     C                   MOVE      *iN34         RETIND
     C                   SETON                                        LR
     C                   RETURN
