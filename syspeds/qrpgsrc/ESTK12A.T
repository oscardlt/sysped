     H DFTACTGRP(*NO) BNDDIR('HTTPAPI')

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
     D result          s              5I 0
     D wait            s              1A
      *
     D Origins         s           1000A
     D Destinations    s           1000A
      * midlertideige for test..
     D TEXT            s             30A

     C                   EXSR      INIT
     c     Start         tag

      /free

        *inlr = *on;

        // ****************************************************
        //  Bygg parametrene...
        //  System iNetwork to a temporary file in the IFS
        // ****************************************************
          Enc = http_url_encoder_new();
          http_url_encoder_addvar_s(Enc : 'origins'
                                        : %trim(Origins));
          http_url_encoder_addvar_s(Enc : 'destinations'
                                        : %trim(Destinations));

        // ****************************************************
        //  Sett sammen URL/parametre
        // ****************************************************
          url = 'http://maps.googleapis.com/maps/api/distancematrix/xml?'
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
           return;
        endif;

        // ****************************************************
        //  Slett responsfila
        // ****************************************************
        // unlink(filename);
        // dsply result ' ' wait;
        // return;

      /end-free
      *  HER KOMMER VURDERING AV RESuLTAT / NYTT FORSØK MM...
     C*                  MOVE      xxxxx         yyyy
     C*                  xxxxx
     c*    EngangTil     ifeq      'Y'
     c*                  goto      Start
     c*                  end
     C                   SETON                                        LR
     C                   RETURN

      ***********************************************
     C     INIT          BEGSR
      ***********************************************
      * Svar ved EN origins, EN destinatins vil være EN ROW med ett element
      *    TO verdier Duration og Distance (value=verdi i sekund/meter, Text = min / km)
      *  OBS.. ved flere origins og/eller Destination vil svaret ha en row pr origin,
      *    med ett elemet pr destination)
      *  Mange til Mange-forspørsler gir mye 'meningsløse' svar (mye data som ikke brukes)
      *  men EN til mange kan være OK..
      *  - En henteadresse - x ant biler for å se hvem som er nærmest
      *       (hipp som ham om en kalkulere fra mange -> EN(h.adr) eller fra EN til mange..
      *  - en bil - forventet tid til hver gjenstående levering blir tvilsomt ....
      *    OOOOBBBSSS !! VIL DA GÅ RASKESTE VEI TIL HVER ENKELT, TAR IKKE HENSYN TIL KJØRERUTE..
      *    Eneste farbare er vel første oppslag bilens LAT/LON->første POS,
      *               deretter  tid 1.pos + 'dødtid/levering'+adr 1.pos -> addr 2.pos, osv
      /free
       //Origins = 'Lokkebergveien 12 NO|Bergstien 25 NO';
       //Destinations ='St Halvards gate 33 NO|Eiriks gate 18 NO';
         Destinations ='Eiriks gate 18 NO';
       //Origins = 'Lokkebergveien 12 NO';
       //Origins/Destinations kan også angig som Lat,Long (MERK ingen mellomrom punkt som decitegn)
         Origins = '58.914150,5.598755';
         Destinations ='5954  MONGSTAD NO';
      /end-free
      *
     C*    *ENTRY        PLIST
     C*                  PARM                    ORIGINS
     C*                  PARM                    DESTINATIONS
     C*                  PARM                    MINUTTER
     C*                  PARM                    KM
     C*                  PARM                    FRASTED
     C*                  PARM                    ETA
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
            when name = 'text';
               TEXT    = value;
            endsl;

      /end-free
     P                 E
