             PGM        PARM(&MBR)
             DCL        VAR(&MBR) TYPE(*CHAR) LEN(16)
             DCL        VAR(&FIL) TYPE(*CHAR) LEN(70)

             MONMSG     MSGID(CPF0000)
             DLTF       FILE(QTEMP/XMLTILP)

             ENDPGM
