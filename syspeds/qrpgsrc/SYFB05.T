     H DFTACTGRP(*NO) BNDDIR('HTTPAPI')

     FFRSTTG    IF   E           K DISK
     FQSYSPRT   O    F  132        PRINTER OFLIND(*INOF)

      /copy qrpglesrc,httpapi_h
      /copy qrpglesrc,ifsio_h

     D Incoming        PR
     D   userdata                      *   value
     D   depth                       10I 0 value
     D   name                      1024A   varying const
     D   path                     24576A   varying const
     D   value                    32767A   varying const
     D   Attrs                         *   dim(32767)
     D                                     const options(*varsize)

     D msg             s             50A
     D rc              s             10I 0
     D url             s          32767A   varying
     D PrintLine       s            132A
     D filename        s             45A   varying
     D Enc             s                   like(HTTP_URL_ENCODER)
     D result          s             50A
     D wait            s              1A

     D                 DS
     D  BRUBEL                 1     13  2
     D  BRUBELA                1     11
     D                 DS
     D  NETBEL                 1     13  2
     D  NETBELA                1     11
     D                 DS
     D  TGNA                   1     25
     D  TGNA1                  1      8
     D  TGNA2                 16     25
     D                 DS
     D  TGEK                   1     15
     D  TGEK1                  6     12

     C                   EXSR      INIT

     C     *LOVAL        SETLL     FRSTTG
     C                   READ      FRSTTG                                 33
     C                   IF        *IN33
     C                   MOVE      *ON           *INLR
     C                   RETURN
     C                   END
      *
     C                   MOVEL     '0668'        UPNF              4
     C                   MOVEL     '6800'        UPNT              4
     C                   MOVEL     TGNA1         UKNT              7
     C                   MOVEL     TGEK1         XAVSID            7
     C                   Z-ADD     15            XVKT              9 0
     C                   Z-ADD     1             XNT               7 0
     C                   Z-ADD     6             XDM3              7 0
     C                   MOVE      *BLANKS       XBSC             20
     C                   IF        XNT = 1
     C                   EVAL      XBSC = 'Groupage'
     C                   ELSE
     C                   EVAL      XBSC = 'PartLoad'
     C                   END
     C                   MOVE      *BLANKS       XUSRID           20
     C                   EVAL      XUSRID = TGEK
     C                   MOVE      TGNA2         XPASWRD          10
     C                   MOVE      *ZEROS        BRUBEL
     C                   MOVE      *ZEROS        NETBEL

      /free

        *inlr = *on;

        // ****************************************************
        //  Bygg parametrene...
        //  System iNetwork to a temporary file in the IFS
        // ****************************************************
          Enc = http_url_encoder_new();

          http_url_encoder_addvar_s(Enc : 'Action'
                                        : 'get');
          http_url_encoder_addvar_s(Enc : 'Type'
                                        : 'RequestForQuote');
          http_url_encoder_addvar_s(Enc : 'TermsOfDelivery.TODConditionCode'
                                        : 'DDP');
          http_url_encoder_addvar_s(Enc : 'Consignor.PartyID'
                                        : %TRIM(TGEK1));
          http_url_encoder_addvar_s(Enc : 'Consignee.PartyID'
                                        : '');
          http_url_encoder_addvar_s(Enc : 'Consignor.PostalCode'
                                        : %TRIM(UPNF));
          http_url_encoder_addvar_s(Enc : 'Consignee.PostalCode'
                                        : %TRIM(UPNT));
          http_url_encoder_addvar_s(Enc : 'Consignment.TotalGrossWeight'
                                        : %TRIM(%EDITC(XVKT:'Z')));
          http_url_encoder_addvar_s(Enc : 'Consignment.TotalVolume'
                                        : %TRIM(%EDITC(XDM3:'Z')));
          http_url_encoder_addvar_s(Enc : 'Consignment.NumberOfPackages'
                                        : %TRIM(%EDITC(XNT:'Z')));
          http_url_encoder_addvar_s(Enc : 'Consignment.BasicServiceCode'
                                        : %TRIM(XBSC));
          http_url_encoder_addvar_s(Enc : 'Username'
                                        : %TRIM(XUSRID));
          http_url_encoder_addvar_s(Enc : 'Password'
                                        : %TRIM(XPASWRD));

        // ****************************************************
        //  Sett sammen URL/parametre
        // ****************************************************
          url = 'http://www.tollpost.no/XMLServer/handler?'
               + http_url_encoder_getstr(Enc);

        // ****************************************************
        //  Definer tempor{r til tempor{r IFS fil, KJ@R URLen som en GET
        // ****************************************************
        filename = http_tempfile() + '.xml';
        rc = http_url_get( url : filename );
        if (rc <> 1);
           PrintLine = http_error();
           except;
           unlink(filename);
        // uflagg = '1';
           return;
        endif;

        // ****************************************************
        //   parse the XML from the temp file.  (hopp ut ved feil)
        // ****************************************************

        if (http_parse_xml_stmf( filename
                               : HTTP_XML_CALC
                               : *null
                               : %paddr(Incoming)
                               : *null ) < 0 );
           PrintLine = http_error();
           except;
           unlink(filename);
        // uflagg = '1';
           return;
        endif;

        // ****************************************************
        //  Slett responsfila
        // ****************************************************
           unlink(filename);
           result = 'Brutto: ' +%trim(%editc(BruBel:'J'))
                  + '  Netto: '+%trim(%editc(NetBel:'J'));
           dsply result ' ' wait;
        // UNETBL = NETBELA;
        // UBRTBL = BRUBELA;
        // uflagg = '0';
           return;

      /end-free

      ***********************************************
     C     INIT          BEGSR
      ***********************************************
      *
     C                   ENDSR
      *

     OQSYSPRT   E
     O                       PrintLine          132


      *
      *  The DEPTH parameter indicates the nesting depth of the
      *  element received.  In the above example, the "item" tag
      *  would be found at depth=3, since it's inside the "rss"
      *  and "channel" tags.
      *
      *  The NAME parameter is the name of the XML element that
      *  has been received.  It might be something like "channel"
      *  or "title" or "link".
      *
      *  Note that in the above example, there are two different
      *  depths that have "title" and "link".  They are featured
      *  inside the "channel" tag, and also inside the "item" tag.
      *  the "path" parameter will help us sort that out.
      *
      *  The PATH indicates the elements that the current element
      *  is found inside. So, the channel title is found when the
      *  path is "/rss/channel" and the name of the element is "title".
      *  the article titles, however, have a path of "/rss/channel/item"
      *  and a name of "title".
      *
      *  The VALUE parameter gives us the text that's inside that
      *  element.
      *+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     P Incoming        B
     D Incoming        PI
     D   userdata                      *   value
     D   depth                       10I 0 value
     D   name                      1024A   varying const
     D   path                     24576A   varying const
     D   value                    32767A   varying const
     D   attrs                         *   dim(32767)
     D                                     const options(*varsize)

     D count           s             10I 0
     D attrname        s            100A   varying
     D attrval         s            100A   varying
      /free

            select;
            when name = 'GrossAmount';
               BruBel  = BruBel + %float(value);
            when name = 'NetAmount';
               NetBel  = NetBel + %float(value);
            endsl;

      /end-free
     P                 E
