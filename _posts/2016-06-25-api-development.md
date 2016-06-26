---
layout: post
filename: swagger
title: "API Development Ecosystem with Swagger"
excerpt: "It does your job. And helps others to do your job."
tags: [API, swagger, generation]
image:
# pic-blue-city-abu-dhabi-skyscrapers-1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/15269473/c8311bfa-19bc-11e6-890c-06abc511ef39.jpg
  credit: Tian Xinqi
  creditlink: http://www.tianxinqi.com/news/Above80swgpuwnk
comments: true
shorturl: https://goo.gl/wojj1R
---
<i>{{ page.excerpt }}</i>

<hr />

{% include _toc.html %}

This tutorial is about creating the elements of a full ecosystem for the 
<strong>development</strong> of programming for Application Programming Interfaces.

<amp-youtube data-videoid="HjTjXpfdf60" layout="responsive" width="480" height="270">
</amp-youtube>
In this 3 minute video, click "CC" to toggle Closed Captioning text.

We want <strong>developers</strong> to create <strong>client apps</strong> to access
<strong>API services</strong>.

But first developers need to find (discover) that the API exists,
perhaps from a <strong>galleries of available APIs</strong>
such as <a target="_blank" href="https://apis.guru/">apis.guru</a>.

It's helpful for a gallery to provide results from static
<strong>quality scans</strong> evaulating the machine-readable
<strong>interface specs</strong> of the API.

There are several competing API specification formats (such as RAML, WADL, and Swagger).
But <strong>Swagger</strong> seems to be the most popular at this time.

<strong>Documentation</strong> about the API helps not only
for the API to be discovered from the public galleries,
but also for developers to more quickly appreciate the intricacies of that API.

What's even better than reading documentation 
is to interact live with a sample <strong>demonstration</strong> app
so developers and potential users can really grasp the value of the services exposed. 

It helps to have enough <strong>sample data</strong> so
sample <strong>test automation scripts</strong> have the test coverage needed
to give assurance that all features really work, and work quickly, even under load. 

Many developers now also like having a <strong>mock server</strong> running locally
so they can work anywhere with a stable end-point, even while off the network.
Many have found this shortens development cycles by reducing the need to wait for others to
achieve stability in dependent modules.

All this is what makes up a "full" API offering.

<amp-img width="650" height="262" alt="api-overview-v04-complete-650x262-69"
src="https://cloud.githubusercontent.com/assets/300046/16357990/923eafda-3ac3-11e6-9ee7-2648bd8b91d6.jpg">
</amp-img>

<hr />

It takes <strong>effort</strong> 
to create docs, demo, test, and mock server code.

That is why many have begun writing automated generation of such code.

But ideally, the <strong>logic</strong> used to generate this code 
would be based on both the interface specifications and 
<strong>wisdom</strong> culled from analysis of the 
<strong>metadata</strong> gleaned from the pattern of growth in data over time. 

More sophisticated variation of <strong>data values</strong> in generated code
is now the frontier.
Such data include values and statistics from both historical points in time 
and projections plus predictions of values expected in the future.

With apps of enterprise scope and complexity,
<strong>manual</strong> coding of the client and server code-base by human developers
can seem repetitive and be error-prone, therefore taking more time and 
be more expensive than what could be.

So instead of manually defining interface specs,
we can <a href="#SpecGen">generate those specs</a> from the 
<strong>code base</strong> 
by marking up server code with 
<a href="#SpecMarkup">comments</a>
recognizeble by a <strong>parser such as Doxegen</strong>.

Programs are getting more mature at reading specs to 
<strong>generate programming code</strong>
in various programming languages.

Being able to generate code from specs can cut time to market
and encourage reusability of code.

To ensure quality in generated code, community agreement on a strong set of
<strong>rules</strong> used to drive quality scans of specifications 
can not just boost confidence, but also 
provide a differentiator for community collaboration.

<a name="Diagram"></a>

<amp-img width="650" height="286" alt="api-ecosystem-v05-650x286-63.jpg"
src="https://cloud.githubusercontent.com/assets/300046/16362210/3ee9af22-3b65-11e6-8caa-f7571da06386.jpg">
</amp-img>

<hr />

## What is Swagger? #

Swagger Core is a **Description Language (DL)** for REST APIs. It provides:

  * a blueprint of layout,
  * a contract,
  * metadata, and
  * human-readable documentation.

The goal of Swagger is to define a standard, language-agnostic interface to REST APIs which allows both humans and computers to discover and understand the capabilities of the service without access to source code, documentation, or through network traffic inspection. When properly defined via Swagger, a consumer can understand and interact with the remote service with a minimal amount of implementation logic.

In other words, Swagger's objective is to be a complete framework for
describing, producing, consuming, and visualizing RESTful web services
for developers to fully program clients calling them.

Swagger removes the guesswork in calling the service.
This enables <a href="swagger-codegen.md">Swagger CodeGen</a>
to generate client code for different programming languages.

Swagger removes a barrier to enterprise adoption of REST API
by making a larger number of REST APIs governable, shareable, and human-readeable.<a href="#[1]">[1]</a>

<a name="Who"></a>

## Who built Swagger?

Swagger originated from folks at Wordnik.com (the on-line English dictionary)
by Reverb Technologies (helloreverb.com)
which was absorbed by <a target="_blank" href="https://inform.com/company.html/">Inform.com</a>, now
a part of <a target="_blank" href="https://www.mongodb.com/customers/reverb-technologies">
MongoDB</a>.
   The old URL <a target="_blank" ref="nofollow" href="http://github.com/wordnik/swagger-core/wiki">
   http://github.com/wordnik/swagger-core/wiki</a>
   now redirects to <a target="_blank" href="https://github.com/swagger-api/swagger-core/wiki">
   http://github.com/wordnik/swagger-core/wiki</a>.

<a target="_blank" href="http://www.programmableweb.com/news/smartbear-picks-swagger-api-project/2015/03/26">
On March, 2015</a>,
the testing company SmartBear acquired from Reverb the <a target="_blank" href="https://www.swagger.io/">
swagger.io</a> website
and <a target="_blank" href="https://www.swaggerhub.com/">
SwaggerHub.com</a>
which provides an instance of swagger on a free platform for teams to collaborate on and coordinate across the entire workflow of an API’s lifecycle.
SwaggerHub includes connectors for GitHub, DockerHub, and Ready! API.
The site leverages a centralized definition to enable teams to work together to iteratively design, build, document, and manage an API.


## The spec #

On January 1, 2016, the <a target="_blank" href="https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md">
Swagger Specification at version 2.0</a> was transferred to the Open API Initiative (OAI),
and renamed to the OpenAPI Specification. To avoid confusion, many now refer to the spec as
"Swagger (OpenAPI) 2.0".

<a target="_blank" href="https://github.com/swagger-api">
https://github.com/swagger-api</a> is the group maintaining

 * swagger-core
 * swagger-spec
 * swagger-ui
 * swagger-codegen


PROTIP: Many prefer the
<a target="_blank" href="http://openapi-specification-visual-documentation.apihandyman.io">
visual spec at http://openapi-specification-visual-documentation.apihandyman.io</a>
(on Chrome browser)
by Arnaud Lauret, the API Handyman.


<a name="SpecMarkup"></a>

## Spec Markup in Code #

One of the best free tutorials on defining a Swagger spec
<a target="_blank" href="https://apihandyman.io/writing-openapi-swagger-specification-tutorial-part-1-introduction/">
begins with this introduction</a>
also by Arnaud Lauret, the API Handyman.

There are on-line Swagger spec editors at:

   * <a target="_blank" href="http://editor.swagger.io/">
    http://editor.swagger.io</a>

   * <a target="_blank" href="https://swaggerhub.com/api/wilsonmar/PetStore/1.0.0">
    https://swaggerhub.com/api</a>

   * <a target="_blank" href="https://help.apiary.io/tools/apiary-editor/>
    Apiary Editor</a>


> If you fell you're struggling with this. Let us help you.

<a name="SpecGen"></a>

## Spec Gen #

Swagger's focus was originally serving Node.js developers,
but additional langagues now make use of Swagger.

Generating Swagger specs from legacy code can be the most time consuming aspect.

* <a target="_blank" href="https://github.com/domaindrivendev/Swashbuckle">
   Swashbuckle</a> scans through C# WebAPI code and generates API website.

* <a href="#Doxygen">
   Doxygen</a> is the de facto standard tool for generating documentation from annotated C source code.
   format comments in code can be picked up by the scanner.

* Sandcastle

* RDoc for Ruby code

* JavaDocs generates code from comments in Java

Commentary about creating Swagger from code:

* http://www.kobashicomputing.com/generating-documentation-from-c



<a name="Doxygen"></a>

## Doxygen Gen #

0. <a target="_blank" href="http://www.stack.nl/~dimitri/doxygen/">
   Download the Doxygen UI</a>.



<a name="WebsiteGen"></a>

## Website Gen #

Several tools generate API documentation in HTML for display on websites:

* <a target="_blank" href="https://github.com/Rebilly/ReDoc">ReDoc</a>
* Microsoft Azure API Management, which charges.

* <a target="_blank" href="https://github.com/mashery/iodocs">
   Mashery's IODocs</a> is written to run on Node.js referencing a
   <a target="_blank" href="http://redis.io/download"> Redis</a> key+value storage engine.
   See <a target="_blank" href="http://jason.pureconcepts.net/2011/12/installing-node-js-npm-redis-mac-os-x/">
   installation</a>.

* The Enunciate
REST API framework is an open-source Java-based Web API framework.
It creates full HTML documentation of the services it generates, where the documentation is assembled from JavaDocs comments.

<a name="Dependencies"></a>

## Dependencies #

Swagger Core stores JAX-RS API designs in JSON files from which
Swagger UI dynamically generates beautiful HTML documentation.

Swagger makes use of Jackson,
the multi-purpose Java library for processing JSON data format.

<a target="_blank" href="http://swagger.io/swagger-core/">
Swagger-core</a> explains the use of maven build.


<a name="Endpoints"></a>

### Sample endpoint #

* <a target="_blank" href="http://petstore.swagger.io/">
petstore.swagger.io</a>
is provided for experimentation.


<a name="Format"></a>

## Format #

The standard Swagger spec doesn’t support some features.
So vendor

   * Request body examples (mock server is generating them from Schema)
https://help.apiary.io/tools/mock-server

   * Example values of HTTP headers

   * Multiple requests


<a name="Videos"></a>

## Videos #

* <a target="_blank" href="https://www.youtube.com/watch?v=8Z9qva1nv1c">
   Exposing Salesforce REST Services Using Swagger</a>

* <a target="_blank" href="https://www.youtube.com/watch?v=U_lCrFpvXyY">
   Swagger make your REST APIs accessible</a>
   Victor Trakhtenberg at DevconTLV October, 2013

* <a target="_blank" href="https://www.youtube.com/watch?v=8Z9qva1nv1c">
   Exposing Salesforce REST Services Using Swagger</a>
   by Thys Michels (@thysmichels), Software Engineer at Lending Club
   describes REST app in Java Spring MVC annotations.

* <a target="_blank" href="https://developers.helloreverb.com/swagger/">
   HelloReverb.com</a>


<a id="IRC"></a>

## IRC Chat channel

* <a target="_blank" href="http://swagger.io/irc/">
   http://swagger.io/irc</a> is provided (instead of a client),
   Swagger is on freenode.net in the #swagger channel.

* <a target="_blank" href="https://www.youtube.com/watch?v=mZ8_QgJ5mbs">
   Beautiful REST & JSON APIs video</a>
   Aug. 7, 2013
   by Les Hazelwood of StormPath | @Hazelwood
