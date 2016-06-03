---
layout: post
title: "API Management by Amazon API Gateway"
excerpt: "Microservices"
tags: [API, devops, evaluation, Amazon]
image:
# pic easter island single statue 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/15209671/b796b60c-17ef-11e6-8561-07a7b012ebb8.jpg
  credit: Exodux Travels
  creditlink: http://www.exodustravels.com/chile-holidays/discover/discover-chile/aae-84441#gallery
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

Microsoft on Azure is one of several [API management/governance vendors I evaluated](/api-management-evaluation/).

To see for yourself, go through the 35-minute self-paced lab <a target="_blank" href="https://qwiklabs.com/focuses/preview/2380">
Introduction to Amazon API Gateway</a>.
In the lab, you create a simple FAQ microservice. The microservice returns a JSON object containing a random question and answer pair using an API Gateway endpoint that invokes a Lambda function. So students should take the prerequisite lab "Introduction to AWS Lambda" before taking this lab.

According to <a target="_blank" href="https://aws.amazon.com/api-gateway/details/">
https://aws.amazon.com/api-gateway/details</a>
Amazon's API Gateway "is a fully managed service that makes it easy for developers to create, publish, maintain, monitor, and secure APIs at any scale".

* Deploy an API to multiple stages, allowing easy differential between development, test, production, as well as versioning
* Connect custom domains to an API

* Define models to help standardize API request and response transformations
* Transform the body and headers of incoming and outgoing API requests to match backend systems

* Control API access via Amazon Identity and Access Management
* Create and apply API keys for third-party development
* Enable Amazon CloudWatch integration for API monitoring
* Cache API responses via Amazon CloudFront for faster response times


Each "resource", such as "api.mysite.com/questions" is a single microservice within a system.

Each "method" is the combination of a resource path and an HTTP verb such as GET, POST, DELETE, etc.

## Create Lambda function #



## More on API Microservices #

This is one of a series:

{% include api_links.html %}
