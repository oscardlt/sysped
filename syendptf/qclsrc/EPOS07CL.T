/* *********************************************************************   */
/*       * RETTINGER I DETTE PROGRAM:                                      */
/* PTFnr:*Sek Sig Vers  Beskrivelse..........................              */
/* """"""*"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""    */
/* 10XXX * 01 YBC PTF10 INNGÅENDE FIL                                      */
/* 10XXX * 02 YBC PTF11 MULIGHET FOR EGEN TEKST I EMNE                     */
/*%%%%%%%%%%%%%%%%%%%%%                                                    */
/* 10XXX * 03 JOV PTF12 BYGG /TEMP OM DEN IKKE FINNES                      */
/* 10XXX * 04 JOV PTF12 EPOSTF=FRA MAIL-ADRESSE (ENDRET DIREKTE I EML..)   */
/* ********************************************************************    */
/*** ENDRINGSMERKING FJERNET FOR Å GJØRE LETTLEST */
/*S01        PGM           */
/*N01*/      PGM        PARM(&QRYF)
             DCL        VAR(&PARMD) TYPE(*CHAR) LEN(1) VALUE('J')
             DCL        VAR(&PARMB) TYPE(*CHAR) LEN(161) /* PARMF  */
             DCL        VAR(&MBR) TYPE(*CHAR) LEN(10) /* MEMBER */
             DCL        VAR(&UNIK) TYPE(*CHAR) LEN(7) /* Unikkode */
             DCL        VAR(&QRYF) TYPE(*CHAR) LEN(10)
             DCL        VAR(&LIB) TYPE(*CHAR) LEN(10)
             DCL        VAR(&SEL) TYPE(*CHAR) LEN(4)
             DCL        VAR(&SDV) TYPE(*CHAR) LEN(1) VALUE('S')
             DCL        VAR(&DFN) TYPE(*CHAR) LEN(1) VALUE('N')
             DCL        VAR(&INC) TYPE(*CHAR) LEN(1) VALUE('J')
             DCL        VAR(&EPOST) TYPE(*CHAR) LEN(70)
/*N04*/      DCL        VAR(&EPOSTF) TYPE(*CHAR) LEN(70)
/* S02       DCL        VAR(&CVP1) TYPE(*CHAR) LEN(40)       */
/* N02 */    DCL        VAR(&CVP1) TYPE(*CHAR) LEN(44)
             DCL        VAR(&KODE) TYPE(*CHAR) LEN(1)
             DCL        VAR(&QUSER) TYPE(*CHAR) LEN(10)
             DCL        VAR(&QJOB) TYPE(*CHAR) LEN(10)
             DCL        VAR(&QNBR) TYPE(*CHAR) LEN(6)
             DCL        VAR(&CVP2) TYPE(*CHAR) LEN(40)
             DCL        VAR(&CVP3) TYPE(*CHAR) LEN(40)
             DCL        VAR(&CVP4) TYPE(*CHAR) LEN(40)
             DCL        VAR(&CVP5) TYPE(*CHAR) LEN(40)
             DCL        VAR(&CVP6) TYPE(*CHAR) LEN(40)
             DCL        VAR(&CVP7) TYPE(*CHAR) LEN(40)
             DCL        VAR(&CVP8) TYPE(*CHAR) LEN(40)
             DCL        VAR(&CVP9) TYPE(*CHAR) LEN(40)
             DCL        VAR(&TMPFIL) TYPE(*CHAR) LEN(7)
             DCL        VAR(&TMPF10) TYPE(*CHAR) LEN(10)
             DCL        VAR(&STMFIL) TYPE(*CHAR) LEN(50)
             DCL        VAR(&STMF) TYPE(*CHAR) LEN(15)
             DCL        VAR(&EMNE) TYPE(*CHAR) LEN(44)
             DCL        VAR(&DFNEMNE) TYPE(*CHAR) LEN(44)
             DCL        VAR(&SNDNA) TYPE(*CHAR) LEN(8)
             DCL        VAR(&SNDAD) TYPE(*CHAR) LEN(8)
             RTVJOBA    JOB(&QJOB) USER(&QUSER) NBR(&QNBR)
             CHGVAR     VAR(&UNIK) VALUE('W' *CAT &QNBR)
             ADDLIBLE   LIB(MMAIL)
             MONMSG     MSGID(CPF0000)
/*N03*/      MD         DIR('/TEMP') DTAAUT(*RWX) OBJAUT(*ALL)
/*N03*/      MONMSG     MSGID(CPF0000)
/*                         */
/* HENT EGEN INTERNETTADDR */
/*                         */
/*S05        CALL       PGM(EPOS04E) PARM(&QUSER &SNDNA &SNDAD &EPOST) */
/*N05*/      CALL       PGM(EPOS04E) PARM(&QUSER &SNDNA &SNDAD &EPOSTF)
             CALL       PGM(EPOS07) PARM(&QRYF &MBR &LIB &SEL &SDV +
                          &DFN &INC &EPOST &CVP1 &CVP2 &CVP3 &CVP4 +
                          &CVP5 &CVP6 &CVP7 &CVP8)
             IF         COND(&EPOST = '          ') THEN(GOTO +
                          CMDLBL(SLUTT))
/*                         */
/* UNIKE FILNAVN           */
/*                         */
             CHGVAR     VAR(&TMPFIL) VALUE('W' *CAT &QNBR)
             IF         COND(&SDV = 'S') THEN(CHGVAR VAR(&STMF) +
                          VALUE(&TMPFIL *CAT '.csv'))
             IF         COND(&SDV = 'K') THEN(CHGVAR VAR(&STMF) +
                          VALUE(&TMPFIL *CAT '.csv'))
             IF         COND(&SDV = 'T') THEN(CHGVAR VAR(&SDV) +
                          VALUE('N'))
             IF         COND(&SDV = 'N') THEN(CHGVAR VAR(&STMF) +
                          VALUE(&TMPFIL *CAT '.TXT'))
             CHGVAR     VAR(&STMFIL) VALUE('/TEMP/' *CAT &STMF)
/*                        */
/* KJØR QUERYIER UANSETT  */
/*                        */
             RUNQRY     QRY(*NONE) QRYFILE((&LIB/&QRYF &MBR)) +
                          OUTTYPE(*OUTFILE) RCDSLT(&SEL) +
                          OUTFILE(QTEMP/&TMPFIL *FIRST *RPLFILE) +
                          AUT(*ALL)
/**************************************************/
/*                                                */
/* START XLS                                      */
/*                                                */
/**************************************************/
             IF         COND(&SDV = 'X') THEN(DO)
             CALL       PGM(SYGE55XCLB) PARM(&TMPFIL &TMPFIL &EPOST &CVP1)
             RETURN
             ENDDO
             IF         COND(&SDV = 'W') THEN(DO)
             CALL       PGM(SYGE55XONL) PARM(&TMPFIL &TMPFIL)
             RETURN
             ENDDO
/**************************************************/
/*                                                */
/* START SDV,CSV                                  */
/*                                                */
/**************************************************/
             IF         COND(&SDV = 'N') THEN(GOTO CMDLBL(TXT))
/*                                                */
/* START UTEN FILBESKRIVELSE                      */
/*                                                */
             IF         COND(&INC = 'N') THEN(DO)
/*                                                */
/* START SEMIKOLON-SEPARERT                       */
/*                                                */
             IF         COND(&SDV = 'S') THEN(DO)
             CPYTOIMPF  FROMFILE(QTEMP/&TMPFIL) TOSTMF(&STMFIL) +
                          MBROPT(*REPLACE) STMFCODPAG(*PCASCII) +
                          RCDDLM(*CRLF) FLDDLM(';') DECPNT(*COMMA)
             ENDDO
/*                                                */
/* START KOMMA-SEPARERT                           */
/*                                                */
             IF         COND(&SDV = 'K') THEN(DO)
             CPYTOIMPF  FROMFILE(QTEMP/&TMPFIL) TOSTMF(&STMFIL) +
                          MBROPT(*REPLACE) STMFCODPAG(*PCASCII) +
                          RCDDLM(*CRLF) FLDDLM(',') DECPNT(*PERIOD)
             ENDDO
             ENDDO
/*                                                */
/* SLUTT UTEN FILBESKRIVELSE                      */
/*                                                */
/*                                                */
/* START MED  FILBESKRIVELSE                      */
/* EKSTRABEHANDLING HVIS FILBESKRIVELSE SKAL MED  */
/*                                                */
             IF         COND(&INC = 'J') THEN(DO)
             CHGVAR     VAR(&TMPF10) VALUE(&TMPFIL)
             CALL       PGM(SYGE28CL) PARM(&TMPF10)
/*                           */
/* KOPIERER PRINT TIL  FILEN */
/* FØRST HEADER              */
/*                           */
/*                                                */
/* START SEMIKOLON-SEPARERT                       */
/*                                                */
             IF         COND(&SDV = 'S') THEN(DO)
/*           CPYTOIMPF  FROMFILE(TMP1024) TOSTMF(&STMFIL) +
                          MBROPT(*REPLACE) STMFCODPAG(*PCASCII) +
                          RCDDLM(*CRLF) STRDLM(*NONE) FLDDLM(';') +
                          DECPNT(*COMMA) */
             CPYTOIMPF  FROMFILE(TMP4096) TOSTMF(&STMFIL) +
                          MBROPT(*REPLACE) STMFCODPAG(*PCASCII) +
                          RCDDLM(*CRLF) STRDLM(*NONE) FLDDLM(';') +
                          DECPNT(*COMMA)

             CPYTOIMPF  FROMFILE(&TMPFIL) TOSTMF(&STMFIL) +
                          MBROPT(*ADD) STMFCODPAG(*STMF) +
                          RCDDLM(*CRLF) FLDDLM(';') DECPNT(*COMMA)
                          ENDDO
/*                                                */
/* START KOMMA-SEPARERT                           */
/*                                                */
             IF         COND(&SDV = 'K') THEN(DO)
/*           CPYTOIMPF  FROMFILE(TMP1024) TOSTMF(&STMFIL) +
                          MBROPT(*REPLACE) STMFCODPAG(*PCASCII) +
                          RCDDLM(*CRLF) STRDLM(*NONE) FLDDLM(',') +
                          DECPNT(*PERIOD)  */
             CPYTOIMPF  FROMFILE(TMP4096) TOSTMF(&STMFIL) +
                          MBROPT(*REPLACE) STMFCODPAG(*PCASCII) +
                          RCDDLM(*CRLF) STRDLM(*NONE) FLDDLM(',') +
                          DECPNT(*PERIOD)

             CPYTOIMPF  FROMFILE(&TMPFIL) TOSTMF(&STMFIL) +
                          MBROPT(*ADD) STMFCODPAG(*STMF) +
                          RCDDLM(*CRLF) FLDDLM(',') DECPNT(*PERIOD)
                          ENDDO
                          ENDDO
/*                                                */
/* SLUTT MED  FILBESKRIVELSE                      */
/*                                                */
/* FIX DOC-BESKRIVEØLSE = EMNE I MAIL )           */
/*                                                */
/*S03        CHGVAR     VAR(&EMNE) VALUE('ALLE poster fra fil ' *CAT +
                          &QRYF *CAT 'til .sdv-fil')   */
/*N03*/      CHGVAR     VAR(&EMNE) VALUE('ALLE poster fra fil ' *CAT +
                          &QRYF *CAT 'til .csv-fil')
/*                                                */
/* ENDRE TEKST HVIS UTVALG ER GJORT               */
/*                                                */
             IF         COND(&SEL = '*YES') THEN(CHGVAR VAR(&EMNE) +
                          VALUE('Utvalgte poster fra fil ' *CAT +
                          &QRYF *CAT 'til .csv-fil')) /*E04*/
/*N02*/      IF         COND(&CVP1 *NE +
                          '                                           -
  ') THEN(CHGVAR VAR(&EMNE) VALUE(&CVP1))
/*                                     */
/* SEND FILA SOM EPOST                 */
/*                                     */
             EMLSTMF    SUBJECT(&EMNE) FROMNAME(&QUSER) +
                          FROMADDR(&EPOSTF) TO(&EPOST/&QUSER/*TO) +
                          STMF(&STMFIL)
             GOTO       CMDLBL(FILDEF)
/*                                       */
/**************************************************/
/* START TXT-F I L                              */
/**************************************************/

/* TXT:         CPYTOIMPF  FROMFILE(QTEMP/&TMPFIL) TOSTMF(&STMFIL) +
                          MBROPT(*REPLACE) STMFCODPAG(*PCASCII) +
                          RCDDLM(*CRLF) DTAFMT(*FIXED) FLDDLM(';') +
                          DECPNT(*COMMA)  */
 TXT:        CTOPCF     FIL(&TMPFIL) LIB(QTEMP) STMF(&STMFIL) +
                          RCDLEN(1000)


/* FIX DOC-BESKRIVEØLSE = EMNE I MAIL )*/
             CHGVAR     VAR(&EMNE) VALUE('ALLE poster fra fil ' *CAT +
                          &QRYF *CAT 'til .txt-fil')
             IF         COND(&SEL = '*YES') THEN( +
             CHGVAR     VAR(&EMNE) VALUE('Utvalgte poster fra fil ' +
                           *CAT &QRYF *CAT 'til .txt-fil'))
/*N02*/      IF         COND(&CVP1 *NE +
                          '                                           -
  ') THEN(CHGVAR VAR(&EMNE) VALUE(&CVP1))
/* SEND FILA SOM EPSOT (TIL SEG SELV..)*/
             EMLSTMF    SUBJECT(&EMNE) FROMNAME(&QUSER) +
                          FROMADDR(&EPOSTF) TO(&EPOST/&QUSER/*TO) +
                          STMF(&STMFIL)
/*                                       */
/*                                                   */
/* FILDEFINISJONER I EGEN PDF                        */
/*                                                   */
FILDEF:      IF         COND(&DFN = 'J') THEN(DO)
             DLYJOB     DLY(3)
             CHGVAR     VAR(&PARMB) VALUE(&QRYF *CAT &LIB *CAT +
                          &EPOST *CAT &EPOSTF *CAT &PARMD)
             SBMJOB     CMD(CALL PGM(EPOS07CLPD) PARM(&PARMB)) +
                          JOBQ(SYJOBQNMAX)
             ENDDO
             RMVLIBLE   LIB(MMAIL)
             MONMSG     MSGID(CPF0000)
 SLUTT:      ENDPGM
