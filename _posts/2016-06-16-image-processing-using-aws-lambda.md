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


Here is a design to process files containing pictures
using AWS Lambda functions calling various 3rd party APIs.

This roadmap is designed for an agile "minimul viable product"
approach.

The advantage of doing this on AWS S3
rather than Gulp.js is that it is publicly accessible to many
more people than only those who can setup a Gulp server.

## Roadmap #

   The first three steps are described in qwikLabs:

0. Setup Lambda function to invoke upon S3 bucket file upload
0. Manually drop a file into an S3 bucket (or Amazon Drive)
0. Trigger invokes Lambda function
0. <a href="#Add2Dynamo">Add to list in DynamoDB</a>

0. Apply image recognition (extent image has nudity, etc.)
0. <a href="#UpdateDynamo">Update DynamoDB</a> with results and timings

   If acceptable, continue:

0. <a href="#DynamoTriggers">DynamoDB change triggers additional processing</a>
0. <a href="#Compress">Compress image file</a>
0. Generate thumbnail
0. Generate other sizes
0. Generate HTML in amp-img format

   Automate input:

0. Generate <a href="#PresignedS3">pre-signed S3 URLs</a>
0. Desktop website to accept drops of files to store in S3
0. Mobile app to accept upload of files to store in S3

   Add capacity management features:

0. Automate saving of multiple files into S3 by another (test) program
0. Update setup DNS across two Availability Zones
0. Setup replication of DynamoDB across availability zones

   Add auto-discovery features:

0. Scan through HTML to extract local images to convert
0. Replace image file URL in HTML
0. Commit change into GitHub

   Add management features:

0. Filter log group/stream to generate metric
0. Display metrics from DynamoDB on Tableau
0. Setup alarms on CloudWatch of metrics
0. Email once a day with metrics summary (cron)

   Add archival features:

0. <a href="#DynamoTriggers">DynamoDB change triggers additional processing</a>
0. Archive file to AWS Glacier
0. Update DynamoDB about archival and file deletion
0. Remove file from S3

   Process files in other clouds:

0. Process image files in Amazon Cloud Drive (https://www.amazon.com/clouddrive/)
0. Process image files in Dropbox
0. Process image files in Microsoft Azure
0. Process image files in Google Drive

> Let's work on these together! Contact me.

<hr />


<a name="PreSignedS3"></a>

## Pre-signed S3 URLs #

<a target="_blank" href="http://docs.aws.amazon.com/AmazonS3/latest/dev/PresignedUrlUploadObject.html">
This Amazon doc</a> notes that
normally, S3 buckets are considered private.
Permissions need to be assigned to those who want to upload.

<a target="_blank" href="http://docs.aws.amazon.com/AmazonS3/latest/dev/PresignedUrlUploadObject.html">
This Amazon doc</a> notes that
<strong>S3 URLs can be pre-signed with permissions to upload files by providing:

   * security credentials,
   * a bucket name object key,
   * the HTTP PUT method (uploading objects), and
   * an expiration date and time

BTW: Visual Studio users can manually obtain a pre-signed object URL without writing any code by using the
<a target="_blank" href="http://docs.aws.amazon.com/AWSToolkitVS/latest/UserGuide/using-s3.html">
Visual Studio AWS Explorer</a>.

   NOTE: Amazon allows pre-signed S3 URLs to be valid for only 10 minutes.

Code for pre-signing are provided in .NET, Ruby, and
<a target="_blank" href="http://docs.aws.amazon.com/AmazonS3/latest/dev/PresignedUrlUploadObjectJavaSDK.html">
Java</a>.
TODO:
<a target="_blank" href="http://docs.aws.amazon.com/lambda/latest/dg/API_GetFunction.html">
write a CreateFunction function</a> to pre-sign.
The AmazonS3.generatePresignedUrl method of the AmazonS3 class within the AWS SDK for Java.
GeneratePresignedUrlRequest class.

TODO: Embed the pre-signed S3 URL in the HTML for presentation in a webpage where visitors can drag and drop files.

But the website should ask for (and validate) email addresses.


<a name="Add2Dynamo"></a>

## Add List in Dynamo #


<a name="NudityCheck"></a>

## Nudity Check #

https://algorithmia.com/algorithms/sfw/NudityDetection
Algorithmia.com

Swagger for service:

NOTE: Does not work in black and white though.


### Training cases:

1) nude: True, confidence: 0.93
<br /> https://s3.amazonaws.com/www.isitnude.com/assets/images/sample/obama.jpg

2) nude: false, confidence: 0.95
<br /> http://www.isitnude.com.s3-website-us-east-1.amazonaws.com/assets/images/sample/young-man-by-the-sea.jpg


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
   * Method of scaling

   * ContainsNudity: true/false
   * ContainsNudityConfidence: 0 to 100%.

Other information on all AWS activity logs:

   * instance-id,
   * region,
   * availability-zone
   * environment (staging, production, etc),

Having logs outside each server makes it unnecessary to SSH into individual servers
and enables trends across servers and other attributes to be analyzed.

<a target="_blank" href="https://wblinks.com/notes/aws-tips-i-wish-id-known-before-i-started/">
This blogger says</a>:

> "If you have to SSH into your servers, then your automation has failed.
 This is both the most frightening and yet most useful thing I've learned."

* <a target="_blank" href=https://news.ycombinator.com/item?id=7173361">
Discussion on this on Hacker News</a>.


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

API Gateway has a maximum limit of 1000 RPS (requests per second),
but can be adjusted by request.

http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Streams.Lambda.html

### Alternative chaining via SNS #

An alternative is via subscription to SNS topics.

* Lambda publishes message to a SNS Topic</a>
* Other Lambdas subscribe to this topic so as soon as messages arrive in the topic, second Lambda gets executed with the message as it's input parameter.

0. <a href="#SNSChaining">Lambda publishes message to a SNS Topic</a>
0. Other Lambdas subscribe to this topic so as soon as messages arrive in the topic, second Lambda gets executed with the message as it's input parameter.


<a name="Thumbnail"></a>

## Picture generation #

Pictures need to be re-sized for:

   * 150x fixed width, height is scaled as needed
   * 50x50 scale image best into box
   * x150 fixed height, width is scaled as needed

ImageMagick is used.

PROTIP: Do image compression after resize.

<a name="Compress"></a>

## Compression service #

https://tinypng.com/developers


## Resources #

https://speakerdeck.com/michaelwittig/the-life-of-a-serverless-microservice-on-aws
Michael Wittig (@hellomichibye, mwittig@tecracer.de):

   * https://cloudonaut.io/serverless-image-resizing-at-any-scale/

   * https://github.com/michaelwittig/devopscon16-auth-service
   * https://github.com/michaelwittig/devopscon16-profile-service
   * https://github.com/michaelwittig/devopscon16-location-service

   * CodePileline/CodeCommit available in us-east-1 only (as of June 2016).

(save 39% using code ctwdevopstw) manning.com/wittig/
