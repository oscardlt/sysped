             PGM        PARM(&MBR)
             DCL        VAR(&MBR) TYPE(*CHAR) LEN(16)
             DCL        VAR(&FIL) TYPE(*CHAR) LEN(70)

             CHGVAR     VAR(&FIL) VALUE('/SYEDIHNDK/EDISE/' *CAT &MBR +
                          *TCAT '.xml')
             CTOPCF     FIL(XMLTILP) LIB(QTEMP) STMF(&FIL)
             MONMSG     MSGID(CPF0000)
             CHGAUT     OBJ(&FIL) USER(*PUBLIC) DTAAUT(*RWX) +
                          OBJAUT(*ALL)
             MONMSG     MSGID(CPF0000)
             DLTF       FILE(QTEMP/XMLTILP)

/*           CALL       PGM(EDIFRAEDF/NCXMLSCLEA)    */

             ENDPGM
