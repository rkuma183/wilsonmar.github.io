---
layout: post
title: "Image processing using AWS Lamba actors"
excerpt: "Run one after another, independently"
tags: [AWS, EC2, lambda, cloud]
image:
# pic friends white shirts 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/16040708/8f5b3cc6-31ee-11e6-9043-15d6ba1326c7.jpg
  credit: Genius Quotes
  creditlink: http://geniusquotes.org/best-friends-forever-quotes-images-and-friends-wallpapers/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}


Here is a design on an enterprise-worthy processing of pictures several ways
using AWS Lambda functions calling various 3rd party APIs.

   The first three steps are described in qwikLabs:

0. Setup Lambda function to invoke upon S3 bucket file upload
0. Manually drop a file into an S3 bucket (or Amazon Drive)
0. Trigger invokes Lambda function.
0. <a href="#Add2Dynamo">Add to list in DynamoDB</a>

0. Apply image recognition (extent image has nudity, etc.).
0. <a href="#UpdateDynamo">Update DynamoDB</a> with results and timings.

   If acceptable, continue:

0. <a href="#DynamoTriggers">DynamoDB change triggers additional processing</a>
0. <a href="#Compress">Compress image file</a>
0. Generate thumbnail.
0. Generate other sizes.
0. Generate HTML in amp-img format.

   Add capacity management features:

0. Update setup DNS across two Availability Zones.
0. Setup replication of DynamoDB across availability zones.

   Add auto-discovery features:

0. Scan through HTML to extract local images to convert
0. Replace image file URL in HTML.
0. Commit change into GitHub.

   Add management features:

0. Filter log group/stream to generate metric.
0. Display metrics from DynamoDB on website.
0. Setup alarms on CloudWatch of metrics.
0. Email once a day with metrics summary (cron)

<hr />

<a name="Add2Dynamo"></a>

## Add List in Dynamo #


<a name="NudityCheck"></a>

## Nudity Check #

Algorithmia.com



<a name="UpdateDynamo"></a>

## Update Dynamo #

DynamoDB is a NoSQL database containing key-value pairs.

 Store in DynamoDB:

   * Picture URL
   * GUID to associate with other data

   * Date/Time of entry

   For each picture:

   * Size of picture before compression
   * Size of picture after compression
   * Width of picture
   * Height of picture

   * ContainsNudity: true/false
   * ContainsNudityConfidence: 0 to 100%.


<a name="DynamoTriggers"></a>

## Dynamo Triggers of actors #

The workflow design concern here is with so many steps,
we want to avoid a "master" program hanging around
waiting for steps to complete just to hand-off to another function.

How about we have each Lambda function kill itself after
invoking a new function to run independently,
possibly defined in another programming language.

This would also enable fine-grained management of individual functions.

See:
http://stackoverflow.com/questions/31714788/can-an-aws-lambda-function-call-another
suggested chaining function calls via SNS topics
https://mobile.awsblog.com/post/Tx1VE917Z8J4UDY/Invoking-AWS-Lambda-functions-via-Amazon-SNS

https://java.awsblog.com/post/Tx2J2LPKTTVU93H/Invoking-AWS-Lambda-Functions-from-Java

Documentation: <br />
http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Streams.Lambda.html

Guided walkthrough: <br />
https://aws.amazon.com/blogs/aws/dynamodb-update-triggers-streams-lambda-cross-region-replication-app/

CAUTION: There is a concurrent Lambda invocation limit of 100 at a time per account.

API Gateway RPS maximum limit (1000)

### Alternative chaining via SNS #

An alternative is via subscription to SNS topics.

* Lambda publishes message to a SNS Topic</a>
* Other Lambdas subscribe to this topic so as soon as messages arrive in the topic, second Lambda gets executed with the message as it's input parameter.

0. <a href="#SNSChaining">Lambda publishes message to a SNS Topic</a>
0. Other Lambdas subscribe to this topic so as soon as messages arrive in the topic, second Lambda gets executed with the message as it's input parameter.


<a name="Thumbnail"></a>

## Thumbnail generation #

ImageMagick

<a name="Compress"></a>

## Compression service #

https://tinypng.com/developers


## Resources #

https://speakerdeck.com/michaelwittig/the-life-of-a-serverless-microservice-on-aws
Michael Wittig (@hellomichibye, mwittig@tecracer.de):

   * https://github.com/michaelwittig/devopscon16-auth-service
   * https://github.com/michaelwittig/devopscon16-profile-service
   * https://github.com/michaelwittig/devopscon16-location-service

   * CodePileline/CodeCommit available in us-east-1 only (as of June 2016).

(save 39% using code ctwdevopstw) manning.com/wittig/
