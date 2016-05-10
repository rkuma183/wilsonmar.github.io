---
layout: post
title: "API Design"
excerpt: "Make it work"
tags: [API, design]
image:
  feature: https://cloud.githubusercontent.com/assets/300046/14612210/373cb4e2-0553-11e6-8a1a-4b5e1dabe181.jpg
  credit: And Beyond
  creditlink: http://www.andbeyond.com/chile/places-to-go/easter-island.htm
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />
{% include _toc.html %}

The less coupling, the better to evolve.

## Domains and Context

<img width="528" alt="api-domain-model" src="https://cloud.githubusercontent.com/assets/300046/15142196/3e09a6a8-1661-11e6-993a-88bae6ae3b40.png">

<img width="562" alt="api-domains-context" src="https://cloud.githubusercontent.com/assets/300046/15142205/46d06e70-1661-11e6-97e8-517201d7c505.png">

Above impages from slide 25 of
<a target="_blank" href="https://speakerdeck.com/olivergierke/the-revival-of-domain-driven-design-in-the-context-of-microservices?utm_content=buffer65874">
"The revival of Domain-Driven Design in the context of microservices"</a>
March 11, 2016
by Oliver Gierke
<a target="_blank" href="http://pivotal.io/event/jpmc-glasgow-tech-symposium">JPMC Tech Symposium, Glasgow</a>.


https://twitter.com/apievangelist


## Integrations

![api-roi-600x438](https://cloud.githubusercontent.com/assets/300046/15142705/7f951a4c-1663-11e6-93ad-8104b7d29274.jpg)

SMS, emails can be sent via the API from Twilio.com.
An investor in Twilio, Byron Deeter <a href="http://venturebeat.com/2013/08/31/api-economy/">said</a>:
"APIs provide the "digital glue" that empowers developers to create new software applications,
partnerships, and even new businesses. The <strong>business-to-developer</strong> market is quickly becoming one
of the fastest growing opportunities within cloud computing."

A high-quality API:

* provides high-value data and functionality that meets real needs or unlocks compelling opportunities;

* has a low integration cost because client integration is facilitated by a lucid, consistent API design, great documentation, interactive tooling, and client SDKs, all wrapped into a smooth, developer-friendly onboarding experience;

* has low operational and support overhead because it’s thoroughly tested in all aspects, and instrumented for reliability; and

* generates business value because it’s highly adopted by client developers, for all of the above reasons.

CREDIT: The above is based on 
http://blog.smartbear.com/api-testing/rapid-ml-and-ready-api-full-lifecycle-api-quality/



## Domain-Driven Design

<a target="_blank" href="https://domainlanguage.com/ddd/">
domain-driven-design</a> 
of API modeling provides a framework for interoperability:

* Identify a bounded context where we plan to provide a family of highly interoperable services. 
   
   This could be a microservices architecture; an enterprise, or an entire industry.

* Formalize key concepts and relationships as a domain model. 

   This should be natural to users, and may borrow familiar terminology and data structures from other systems well-known in that context.

* Align data representations, code, product documentation, and team communication to the domain model, forming a ubiquitous language.

https://www.wikiwand.com/en/Domain-driven_design

https://app.pluralsight.com/library/courses/domain-driven-design-fundamentals/table-of-contents
	June 2014
	by Steve Smith and Julie Lerman

<a target="_blank" href="http://rapid-api.org/rapid-ml">
RAPID-ML</a>


## References

http://www.smartfile.com/blog/3-benefits-of-api-first-design/

https://www.youtube.com/watch?v=oG2rotiGr90
	REST-Ful API Design
	by SpringDeveloper 
