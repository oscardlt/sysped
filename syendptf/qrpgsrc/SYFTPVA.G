      * LEGGES in i WRKREGINF under:
      * Utgangspunkt:   QIBM_QTMF_SERVER_REQ     Format:   VLRQ0100
      * ADDEXITPGM PGMNBR(1) PGM(SYFTPVA/SYSPED) MLTTHDACN(*MSG) PGMDTA(277 0 ' ')
      *
     FSYFTPUF   IF   E           K DISK
     FSYFTPLG   O  A E             DISK

      * Arbetsfelt
     D  APPIDds        S              9B 0
     D  OPIDds         S              9B 0
     D  IPLENds        S              9B 0
     D  OPLENds        S              9B 0
     D  ALLOWOPds      S              9B 0

     D  APPIDIN        S              9B 0
     D  OPIDIN         S              9B 0
     D  IPLENIN        S              9B 0
     D  OPLENIN        S              9B 0
     D  ALLOWOP        S              9B 0
     D  OPINFO         S           1024
     D  SIZE           S              9B 0

     D Tstampz         S               Z
     D Tstampa         S             26

      * Parameterliste
     C     *Entry        PLIST
     C                   PARM                    APPIDIN                        ApplicatioN ID
      *                                                                       0 = FTP Client Program
      *                                                                       1 = FTP Server Program
     C                   PARM                    OPIDIN                         Operation ID
      *                                                                       0 = Initialize Session
      *                                                                       1 = Create Dir/Lib
      *                                                                       2 = Delete Dir/Lib
      *                                                                       3 = Set Current Dir
      *                                                                       4 = List Dir/Lib
      *                                                                       5 = Delete Files
      *                                                                       6 = Send Files
      *                                                                       7 = Receive Files
      *                                                                       8 = Rename Files
      *                                                                       9 = Execute CL cmd
     C                   PARM                    USRPRF           10            User Profile
     C                   PARM                    IPADDRIN         15            Remote IP Address
     C                   PARM                    IPLENIN                        Length of IP Address
     C                   PARM                    OPINFOIN       1024            Operation
     C                   PARM                    OPLENIN                        Length of Oper. Spec
      * Retur parametere
     C                   PARM                    ALLOWOP                        Allow Operation(out
      *                                                                      -1 = Never Allow
      *                                                                           (And dont bother
      *                                                                           me with this ops
      *                                                                           in this session
      *                                                                       0 = Reject Operation
      *                                                                       1 = Allow Operation
      *                                                                       2 = Always Allow Oper.
      *                                                                           (And dont bother
      *                                                                           me with this ops
      *                                                                           in this session)

     C     APPIDIN       IFEQ      1
     C                   EXSR      SERVER
     C                   ELSE
     C                   EVAL      ALLOWOP=2
     C                   ENDIF
N06  C                   TIME                    Tstampz
N06  C                   MOVEL     Tstampz       Tstampa
     C                   WRITE     SYFTPLGR
     C                   EVAL      *INLR = *ON
      *________________________________________________________________
      * Behandle alle innkommende kommandoer                  SERVER  *
      *""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
     C     SERVER        BEGSR

     C     USRPRF        CHAIN     SYFTPUF                            51
     C                   IF        *IN51=*OFF

     C                   SELECT

     C     OPIDIN        WHENEQ    1                                            Create Directory/Lib
     C                   EVAL      ALLOWOP=-1                                   Ops never allowed

     C     OPIDIN        WHENEQ    2                                            Delete Directory/Lib
     C                   IF        SYFTPUDC='J'
     C                   EVAL      ALLOWOP=1                                    Allow
     C                   ELSE
     C                   EVAL      ALLOWOP=-1                                   Ops never allowed
     C                   ENDIF

     C     OPIDIN        WHENEQ    4                                            List Directory/Lib
     C                   IF        SYFTPULI='J'
     C                   EVAL      ALLOWOP=1                                    Allow
     C                   ELSE
     C                   EVAL      ALLOWOP=-1                                   Ops never allowed
     C                   ENDIF

     C     OPIDIN        WHENEQ    5                                            Delete Files
     C                   IF        SYFTPUDF='J'
     C                   EVAL      ALLOWOP=1                                    Allow
     C                   ELSE
     C                   EVAL      ALLOWOP=-1                                   Ops never allowed
     C                   ENDIF

     C     OPIDIN        WHENEQ    6                                            Receive Files from C
     C                   IF        SYFTPUGE='J'
     C                   EVAL      ALLOWOP=1                                    Allow
     C                   ELSE
     C                   EVAL      ALLOWOP=-1                                   Ops never allowed
     C                   ENDIF

     C     OPIDIN        WHENEQ    8                                            Rename files
     C                   IF        SYFTPURN='J'
     C                   EVAL      ALLOWOP=1                                    Allow
     C                   ELSE
     C                   EVAL      ALLOWOP=-1                                   Ops never allowed
     C                   ENDIF

     C     OPIDIN        WHENEQ    9                                            Execute CL Commands
     C                   IF        SYFTPUCL='J'
     C                   EVAL      ALLOWOP=1                                    Allow
     C                   ELSE
     C                   EVAL      ALLOWOP=-1                                   Ops never allowed
     C                   ENDIF

     C     OPIDIN        WHENEQ    7                                            Send Files to Client
     C     OPIDIN        OREQ      3                                            Set Curren Dir

      * Hent katalognavn for å teste gjyldighet

     C     ' '           SCAN      SYFTPUDI      SIZE
     C                   IF        SIZE <> 1                                    Blank. alt tillat

     C                   IF        SIZE > 0
     C                   SUB       1             SIZE
     C     SIZE          SUBST(P)  OPINFOIN:1    Directory       128
     C                   ELSE
     C     128           SUBST     OPINFOIN:1    Directory       128
     C                   ENDIF

     C     Directory     IFEQ      SYFTPUDI                                     Gjyldig katalogsti
     C                   EVAL      ALLOWOP=1
     C                   ELSE
     C                   EVAL      ALLOWOP=0
     C                   ENDIF

     C                   ELSE

     C                   EVAL      ALLOWOP=1

     C                   ENDIF

     C                   ENDSL

     C                   ELSE

     C                   EVAL      ALLOWOP=2
     C                   ENDIF

     C                   ENDSR
