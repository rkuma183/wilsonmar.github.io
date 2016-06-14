---
layout: post
title: "AWS Lamba Programming"
excerpt: "Make that lion roar"
tags: [AWS, EC2, lambda, cloud]
image:
# feature: pic data center slice 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622043/8b1f9cce-0584-11e6-8b9f-4b6db5bb6e37.jpg
  credit:
  creditlink:
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This is follow-up to my [AWS Lambda introduction](/aws-lambda/) base tutorial.

0. Be at the AWS Lambda Functions page at URL such as

   https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2#/functions/learn-hello-world-node43-v01?tab=configuration

0. In the <strong>Configuration</strong> tab

   AWS Lambda initially supported only Node JavaScript when it debuted in 2014.
   Lambda now supports Python 2.7 and Java 8 as well.

   ??? Callers to Lambda functions do not differentiate the language which created the function.

   "index.handler" specifies the ???

0. Be at the AWS Lambda <strong>Code</strong> editor.

## Console



## Node.js SDK Confg #

http://docs.aws.amazon.com/AWSJavaScriptSDK/guide/node-configuring.html

Global configuration in file <strong>AWS.config</strong>.

http://docs.aws.amazon.com/AWSJavaScriptSDK/latest

## Events #

Lambdas are triggered by events, such as:

* an object in an Amazon S3 bucket has been modified
* a table was updated in Amazon DynamoDB
* a message arrived in an Amazon Kinesis stream
* a custom event was received from another app or service

Individual Lambdas cannot hold state because they are brought up and down and replicated as needed.
Persistent state should be stored in a service that is outside the lifecycle of the lambda such as Amazon DynamoDB, S3 etc.

Lambdas save and retrieve persistent data (state) in a service outside the lifecycle of the lambda,
such as Amazon DynamoDB, S3 etc.


## Programming model #

The full programming model for the lambdas consists of:

* <a href="#Handlers">Handlers</a>
* Context Objects
* Logging
* Exceptions

See http://docs.aws.amazon.com/lambda/latest/dg/programming-model-v2.html

<a name="Handlers"></a>

## Handlers #

The most basic program, in ES6 Node.js:

<pre>
exports.handler = (event, context, callback) => {
    console.log('Received event:', JSON.stringify(event, null, 2));
    console.log('value1 =', event.key1);
    console.log('value2 =', event.key2);
    console.log('value3 =', event.key3);
    callback(null, event.key1);  // Echo back the first key value
};
</pre>

   `exports.handler` defines the Lambda function.

   The name


   The callback function is a reserved function name.

YouTube video
by Jeff Douglas:
   <amp-youtube data-videoid="m7egclrPzSg" layout="responsive" width="480" height="270">
   </amp-youtube>

## GitHub #

Sample code to obtain code from GitHub is in
<a target="_blank" href="https://www.topcoder.com/blog/amazon-lambda-demo-tutorial/#!">
this Lambda demo tutorial</a>


Uploads must be no larger than 50MB (compressed).

Sample apps:

* http://todobackend.com/index.html#implementations
* Swagger Pet Store

## Saving State #

Amazon DynamoDB

Amazon S3

## Temp space #

Each Lambda function receives 500MB of non-persistent disk space in its own /tmp directory
as a scratch space on disk.



<pre>
'use strict';
/**
 * Provides a simple framework for conducting various tests of your Lambda
 * functions. Make sure to include permissions for `lambda:InvokeFunction`
 * and `dynamodb:PutItem` in your execution role!
 */
let AWS = require('aws-sdk');
let doc = require('dynamodb-doc');

let lambda = new AWS.Lambda({ apiVersion: '2015-03-31' });
let dynamo = new doc.DynamoDB();
</pre>

<pre>
// Asynchronously run a given function X times:
const asyncAll = (opts) => {
    let i = -1;
    const next = () => {
        i++;
        if (i === opts.times) {
            opts.done();
            return;
        }
        opts.fn(next, i);
    };
    next();
};
</pre>


## Script #

## Dependencies #

0. At the top of the script, add references:

   <pre>
   var async = require('async'); // asychronous
   var async = require('aws-sdk');
   var async = require('util');
   var async = require('gm') .subClass({ imageMagick: true });
   </pre>

0. Create a <strong>node_modules</strong> folder.
0. Populate it.


## Thumbnails

To make public,

   <pre>
   ACL: 'public-read'
   </pre>
