---
layout: post
title: "Shift-Left Load Testing"
excerpt: "How to achieve earlier feedback"
tags: [PerfTest]
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

{% include _toc.html %}

## Monolitic History

Traditionally, when software was built using a "monolithic" architecture, 
the entire set of functionality is often not available until late during the software development lifecycle. 
So load testing occurred near when software went live in production.

This often meant that issues were discovered too late for changes to occur.

The assumption of monolithic component availability is often reflected in load tests being structured the same way.
Namely, a single script is created that does registration, login, browse, shop, buy, etc.


## RESTful Revolution 

The adoption of REST API means that pieces of the whole system can be available for performance testing earlier,
and on an on-demand basis.

![ibm-openwhisk-arch-720x168](https://cloud.githubusercontent.com/assets/300046/25739620/aa1efd38-3150-11e7-8f7f-9438274e48e4.png)


## How 

### Stress specific system components

This means that landing, registration, login, shop, buy, etc. run as stand-alone jobs to test different specialized servers.

   * The script that does just landing is used to detect network conditions over time and server availability.

   * The script that does just login is used to identify the availability and capacity of authentication services.

   * The script that does just shopping cart handling is used to identify the availability and capacity of back-end fulfillment services and payment gateways.



### Invoke externally

Enable developers and operations people to invoke and view load tests using tools they already use.

- [ ] So that a special program UI doesn't have to be accessed, have Jenkins kick-off load test runs.

- [ ] Enable developers to independently kick off load jobs push by doing a 
   <strong>git push</strong> to a branch (such as "loadtest"), using a methodology and tool they use regularly.

- [ ] Suggest command-line aliases to save developers time.

- [ ] Automate the creation of load testing scenarios and Jenkins jobs specific to components.

("Jenkins" is referenced here as a generic term for CI/CD tools that include Hudson, Bamboo, TravisCI, etc.)


### Make Access to reports effortless

- [ ] When developers independently kick off load tests on Jenkins, 
receive run results via a link in an email.
That link would provide the test run report generated.

- [ ] Automate reporting of trends from runs in an environment/tool developers are comfortable using, 
such as on Confluence or other wiki.



### Structure test code for flexibility

- [ ] Structure error handling to bypass components in error and continue to other components.
   Do not simply stop when an error is encountered.

- [ ] Structure code to be "data driven".

   Structure code to run based a list which contain flags that specify whether specific component is tested during each particular run.


### Build system tests during construction

- [ ] Build system test scripts during component development.

   This provides early feedback.



## Resources

* https://www.youtube.com/watch?v=W2Um3yss8G0
   Shift Left: What does that mean?
   by Jim Parson

* https://www.youtube.com/watch?v=XQeZ484kSeU
   How DevOps impact QA