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

To see for yourself, go through the 35-minute self-paced lab <a target="_blank" href="https://qwiklabs.com/focuses/preview/2380">
Introduction to Amazon API Gateway</a>.
In the lab, you create a simple FAQ microservice. The microservice returns a JSON object containing a random question and answer pair using an API Gateway endpoint that invokes a Lambda function. So students should take the prerequisite lab "Introduction to AWS Lambda" before taking this lab.

This is an expanded version of that lab. 
This tutorial takes a deep dive into creating and using AWS API Management.
This is a hands-on guided tour. Take one step at a time and we point out PROTIPs and notes along the way.

## High level orientation #

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


Each "resource" is a single microservice within a system, with a URL such as "https://api.mysite.com/questions".

Each "method" is the combination of a resource path and an HTTP verb such as GET, POST, DELETE, etc. in the HTTP header.

## Create Lambda function #

0. In an internet browser go to <a target="_blank" href="https://qwiklabs.com/focuses/preview/2380">
   Services > Compute > Lambda</a>
0. [Create an Amazon Lambda function](/aws-lambda/) to work with if you haven't already.
0. Click on the name of a Lambda function to expose using an API endpoint.
0. Click the API endpoints tab.
0. Click Add API endpoint.
0. Select API Gateway in the pop-up dialog.

   QUESTION: Why is this necessary if there is only one choice?

0. Change the Resource Name (such as `/faq`) to define part of the URL path.
0. The initial Method must be GET.
0. Change Deployment stage to `test`.
0. Select Open for Security (no tracking by access key or authentication with IAM).
0. Click Submit to have a URL assigned, such as:

   https://tsdwtdl0r1.execute-api.us-west-2.amazonaws.com/prod/faq

### API Gateway console #

0. In the internet browser open a new 
   to go to <a target="_blank" href="https://us-west-2.console.aws.amazon.com/apigateway/home?region=us-west-2#/apis">
   Services > Application Services > API Gateway</a>.

0. Click on the link to a API microservice you created, such as "LambdaMicroservice".
0. Click on the link to its GET method.

   Marvel at the visualization and blinking icons.

0. Click on the Test link for an explanation of conditions before clicking Test.



## More on API Microservices #

This is one of a series:

{% include api_links.html %}
