---
layout: post
title: "REST API Responses"
excerpt: "Here's what I think of your request"
tags: [API, JavaScript, programming]
image:
# feature: pic easter island clenched-fist-1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/15212221/c77ab1ba-17fc-11e6-924d-0c5d01e53522.jpg
  credit: Patty Civalleri
  creditlink: http://1take.com/photography/archaeology/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />
{% include _toc.html %}

## Response code & Location in HTTP header

2XX - valid:

      * 200 - valid
      * 202 - PUT successful

3XX - redirects

      * 302 Redirect

4XX - error

      * 404	Not Found
      * 406	The request you made is not acceptable
      * 410 Gone (deprecated)

5XX - server errors

      * 500	Requested Range Not Satisfiable


### Deprecated 410 Gone response

Submitting this:

    http://ws.spotify.com/search/1/album?q=fo

yields this with a 410 Gone HTTP response code:

    This API has been deprecated. Please upgrade to our new APIs: https://developer.spotify.com/web-api/migration-guide/


## Format of response file type

Currently, three output formats are available:

* XML (such as https://www.usa.gov/api/USAGovAPI/contacts.xml/contacts)
   is now considered old-school because

* JSON (such as https://www.usa.gov/api/USAGovAPI/contacts.json/contacts)

* JSONP (such as https://www.usa.gov/api/USAGovAPI/contacts.jsonp/contacts?callback=callmemaybe). When requesting JSONP, you should include a callback parameter with the name of the callback function you would like called.

* YML

* CSV for import into Excel and other spreadsheets

* Google Sheet referenced by data processors
