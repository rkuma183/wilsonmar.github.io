---
layout: post
title: "API Management Evaluation"
excerpt: "How to manage APIs?"
tags: [devops]
image:
# feature: pic-brown-horses-running-forward-1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14724047/445df2f0-07d1-11e6-9c26-782291fe2b47.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

The different aspects of this decision:

0. <a href="#TotalPoints">Total points for each choice</a> (the recommendation: winners and losers)
0. <a href="#Importance"> Relative Importance of each criteria</a>
0. <a href="#Ratings">Ratings for each choice</a>
0. <a href="#Criteria">Criteria</a>
0. <a href="#VariationAmongRaters">Variation among raters</a>

## Technical Background

<img align="right" width="652" height="316" src="https://cloud.githubusercontent.com/assets/300046/14916299/fdbb3b36-0dd5-11e6-9fed-ed4c6576200e.png">
<!-- 887x430 -->

The diagram for Amazon's API Gateway summarizes the challenge:

* Calls come from a variety of sources (mobile and IoT apps, AJAX websites, services from customer servers)
* Traffic comes through public cellular and internet networks
* Load balancing is necessary to distribute load across many servers.
* Caching is important for speed.

<a name="TotalPoints"></a>

## Total points for each option
The vendors and their product, ranked by total points averaged among raters:

STATUS: This is a draft for formatting.

0. <a target="_blank" href="https://www.mulesoft.com/">Mulesoft</a> CloudHub
0. <a target="_blank" href="https://aws.amazon.com/api-gateway/">Amazon's API Gateway</a>
0. <a target="_blank" href="http://apigee.com/about/products/predictive-analytics">Apigee</a> Edge Microgateway + hosting
0. Microsoft Service Fabric (in GA April 2016)
0. <a target="_blank" href="http://www.mashery.com/">Intel (acquired Mashery)</a>
0. CA (acquired Layer 7)
0. Tibco CloudBus
0. Mashape
0. Oracle
0. Software AG
0. IBM (3Scale)
0. Google Kubernetes
0. Akana (formerly SOA Software)
0. Axway (acquired Vordel)
0. WSO2
0. Accenture
0. HP (focused on large media and telcos)
0. Torry Harris

Forrester, in their April 2015 report, classified the vendors this way:
<img width="689" height="408" alt="api vendors in forrester 2015" src="https://cloud.githubusercontent.com/assets/300046/14916539/6c5fe680-0dd7-11e6-9149-6b803194e134.png"><!-- 1378x862 -->

Forrester also illustrated the history of offerings with this timeline:
<img width="673" height="361" alt="api vendors timeline forrester 2015" src="https://cloud.githubusercontent.com/assets/300046/14916784/c64211cc-0dd8-11e6-900c-864e6e4db92c.png"><!-- 1346x744 -->

&nbsp;
<a href="#Importance"></a>

## Importance of each criteria

<img align="right" width="383" height="301" src="https://cloud.githubusercontent.com/assets/300046/14914831/086b982e-0dcb-11e6-9859-9c5d67f8a31d.png">
<!-- 766x602 -->

This radar polar chart visually illustrates the relative importance of 
each criteria we used to evaluate options.

If everything has the same importance, no trade-offs are considered. 

These represent extent of risk and effort, and cost savings or earnings.

Semi-transparent layers are used so both layers can be seen clearly.


<a name="Criteria"></a>

## Criteria Items

Each of these are a risk and an aspect of cost/benefit.

   How does it save time and money, reduce risk, or earn more revenue?

   How do "bells and whistles" benefit?


### Initial Cost

   * Lower up-front cost is important for some.
   * 3scale, Apigee, and WSO2 have options for no-cost, unlimited duration use of their API management solutions (though support is typically limited or unavailable).
   * Amazon API Gateway has a free tier for one million API calls per month for up to 12 months.

### Cost over time

   * API calls by the million received depend on location of servers:
   <a target="_blank" href="https://aws.amazon.com/api-gateway/pricing/">Amazon charges</a>:

   | Locale    | per million |
   | US        | $3.50 | 
   | Ireland   | $3.50 |
   | Frankfurt | $3.70 |
   | Asia Pac. | $4.25 |

   * Data transfer out to internet.  Amazon:

   | Volume     | per TB |
   |    0-10 TB | $0.120 | 
   |   11-40 TB | $0.085 | 
   |  41-100 TB | $0.082 | 
   | 101-350 TB | $0.080 | 

### Style / Ease of Use

   * The hipness of UI - default layouts inviting, clean, etc.
   * Familiarity 

These are important because human UI are needed for:

   * Developer Sign-up
   * API key assignment
   * API public/private key creation
   * Provide documentation
   * Provide code samples
   * Discussion forums to provide support
   * Send emails to update
   * Report errors by user for each account

### Coordination

   * service coordinator, (android device hits one service instead of 100 micro services)
   * Billing
   * Emails about changes   

   * Predictive analytics. Apigee illustrates their Insights service which yields a buying Propensity score salespeople use to prioritize efforts:

<img alt="apigee predictive insights" width="652" height="367" src="https://cloud.githubusercontent.com/assets/300046/14917568/fe2c91c6-0ddc-11e6-87d4-fabffe317f07.png"><!-- 668x376 -->


### Security

   Does the security mechanisms provided strong enough?

   * Transport security (TLS)
   * Authentication (passwords, two-factor cellphone)
   * Initial registration
   * Password recovery
   * KPI (public/private) certificates?
   * Identity and access management
   * Verify api keys

<a target="_blank" href="https://pages.apigee.com/eBook-API-First-Security-Dont-Build-Your-Own-Maginot-Line-conf.html">
Apigee 
uses this illustration:
<img alt="apigee security" src="https://cloud.githubusercontent.com/assets/300046/14917830/253f56a8-0dde-11e6-9446-18a52ef1a1fb.png"></a>
<!-- 668x376 -->


    * http://www.mashery.com/api/security prides itself on being certified on PCI, HITRUST CSF, SSAE, Safe Harbor, SOC 2, etc.


### Flexibility

   How flexible is it? Are we sacrificing too much flexibility for ease-of-setup?

   * Redirect calls to API's URIs
   * Auto-detect new services added

### Maintainability

   What maintenance is needed?

   * Manual work: Annual, monthly, weekly, daily, hourly, etc.
   * Logging (AWS CloudWatch monitoring)
   * Adding additional languages

### Scalability

   How quickly, easily, and safely can the system expand to meet capacity needs?

   * Load balancing (AWS CLoudFront)
   * DDOS (Distributed Denial of Service) attack detection and mitigation (at DNS level)
   * Traffic Throttling based on user's plan
   * Traffic Throttling for capacity limitations
   * The "Actor" model of Microsoft Service Fabric
   * Caching

### Speed

   * Cache
   * International end-points



   * Cache memory per hour.  Amazon:

   | Volume     | per hr. |
   |     0.5 TB | $0.028 | 
   |     1.6 TB | $0.054 | 
   |     6.1 TB | $0.245 | 
   |    13.5 TB | $0.290 | 
   |    28.4 TB | $0.560 | 
   |    58.2 TB | $1.100 | 
   |   118.0 TB | $2.200 | 
   |   237.0 TB | $4.400 | 

### I18N (Internationalization)

   * UI Language
   * Data centers
   * Currencies

### Availability

   * Partial deployment
   * Fault tolerance

### Support

   How well supported is it?

   This is part of the cost. Support costs money.

### Training

   How quickly and deeply can people get up to speed on the technology?

   How easy is to to learn/maintain? 

   This is a consideration of costs and risks.

   * Document generation

### Testability

   * Amazon API Gateway can generate client SDKs in a number of programming languages, including JavaScript, iOS, and Android.

   * Mock server generation
   * Test script generation

### Portability

   How easy is it to switch among competing vendors? Is there vendor lock-in?

   * Switch from Azure to AWS, other PaaS

### Vendor prospects

   What is the sentiment about the vendor?

   * History of product cancellations
   * Investment advisory financial ratings
   * Consumer ratings by JD Power
   * Glassdoor ratings by employees


<a name="Ratings"></a>

## Ratings for each criteria

![polar-chart-2](https://cloud.githubusercontent.com/assets/300046/14914539/44f83b42-0dc8-11e6-84ff-ba8c2317a808.png)



<a href="#VariationAmongRaters"></a>

## Variation among raters


## Resources

* Human factors in decisions: [Thinking, Fast and Slow](http://www.amazon.com/Thinking-Fast-Slow-Daniel-Kahneman/dp/0374275637)
  by Daniel Kahneman

* [You Are Not So Smart](http://youarenotsosmart.com/) by David McRaney

* Nate Silver's [BOOK: The Signal And The Noise](http://www.amazon.com/dp/159420411X)

* IT worst practices and "core incompetencies" are discussed on the [AntipatternZOO](http://antipatternzoo.com/)


## There's more on APIs

This page is one of a [series on APIs](/api-series.md).

{% include api_topics.html %}

