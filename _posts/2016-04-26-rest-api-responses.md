---
layout: post
title: "REST API Responses"
excerpt: "Here's what I think of your request"
tags: [REST API, JavaScript, programming]
image:
# feature: pic white robots woman 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622167/45abd918-0585-11e6-8537-a58e0b55e3ec.jpg
  credit: Cyberconstruct.be
  creditlink: http://cyberconstruct.be/2015/02/digital-job-crafting/
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


## Format of response file type

Currently, three output formats are available:

* XML (such as https://www.usa.gov/api/USAGovAPI/contacts.xml/contacts)
   is now considered old-school because

* JSON (such as https://www.usa.gov/api/USAGovAPI/contacts.json/contacts)

* JSONP (such as https://www.usa.gov/api/USAGovAPI/contacts.jsonp/contacts?callback=callmemaybe). When requesting JSONP, you should include a callback parameter with the name of the callback function you would like called.

* YML

* CSV for import into Excel and other spreadsheets

* Google Sheet referenced by data processors
