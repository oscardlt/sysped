             PGM
             DCL        VAR(&ZAVDF) TYPE(*CHAR) LEN(4) VALUE(0000)
             DCL        VAR(&ZAVDT) TYPE(*CHAR) LEN(4) VALUE(9999)
             DCL        VAR(&ZFLYF) TYPE(*CHAR) LEN(3) VALUE(000)
             DCL        VAR(&ZFLYT) TYPE(*CHAR) LEN(3) VALUE(999)
             DCL        VAR(&ZDTF) TYPE(*CHAR) LEN(6) VALUE(000101)
             DCL        VAR(&ZDTT) TYPE(*CHAR) LEN(6) VALUE(960403)
             OVRPRTF    FILE(SYAV05P) OUTQ(PRT02)
             CALL       PGM(SYAV05R) PARM(&ZAVDF &ZAVDT &ZFLYF +
                          &ZFLYT &ZDTF &ZDTT)
             ENDPGM
