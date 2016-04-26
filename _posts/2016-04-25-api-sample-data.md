---
layout: post
title: "Sample API data sources"
excerpt: "No waiting for test automation"
tags: [text to speech, JavaScript, programming]
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

## Deprecated 410 Gone response

Submitting this:

    http://ws.spotify.com/search/1/album?q=fo

yields this with a 410 Gone HTTP response code:

    This API has been deprecated. Please upgrade to our new APIs: https://developer.spotify.com/web-api/migration-guide/


## Flickr API

Flickr provides an API to access images contributed by its users.

Flicker was purchased by Yahoo, which is why API keys for it are obtained through a Yahoo sign-on.

The description:

      https://www.flickr.com/services/developer

and the App Garden at:

      https://www.flickr.com/services/api/

of code using code from:

      http://code.flickr.net/

Management console:

    http://apigee.com/console/flickr


## US federal jobs

http://usasearch.howto.gov/developer/jobs.html
collects jobs posted by government at several levels (federal, state, etc.).

No API is required for access.

A sample free-form query:

   http://api.usa.gov/jobs/search.json?query=telecommute+jobs


## US Weather

http://graphical.weather.gov/xml/rest.php
provides weather prediction in XML.

A sample request:

http://graphical.weather.gov/xml/sample_products/browser_interface/ndfdXMLclient.php?lat=48.99&lon=-77.01&product=glance

Elements are described at
http://graphical.weather.gov/xml/docs/elementInputNames.php

   * product "time-series"
   * end=2016-05-01T0:00:00

BLAH: Sample code to present the information is not provided by the site.


## US Census

<a target="_blank" href="http://www.census.gov/developers">
http://www.census.gov/developers</a>
contains a wide list of data available freely.

BLAH: Even though this site is maintained by a federal organization,
not all datasets have data for the entire nation (all 50 states of the union
  and territories).

The javascript SDK for US Census Bureau data stored at
<a target="_blank" href="https://github.com/uscensusbureau/citysdk">
GitHub CitySDK</a>
and described at
<a target="_blank" href="https://uscensusbureau.github.io/citysdk">
https://uscensusbureau.github.io/citysdk</a>,
includes simple integrations to facilitate mash-up of other open datasets.

The JavaScript uses the "Module pattern" of coding that uses a "closure".

A sample end point for data from the 2010 census for all states:

```
api.census.gov/data/2010/sf1?key=...&get=P0010001,NAME=&for=state:*
```

The ... above is replaced by each user's own API key
obtained from email after registration at
<a target="_blank" href="http://api.census.gov/data/citysdk.html">
http://api.census.gov/data/citysdk.html</a>


## Other APIs

https://shkspr.mobi/blog/2014/04/wanted-simple-apis-without-authentication/
lists several.

* Ford
* GM
* Citrix
