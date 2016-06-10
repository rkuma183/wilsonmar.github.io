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

AWS Lambda supports several languages.
Callers to Lambda functions do not differentiate the language which created the function.


## Programming model #

The full programming model for the lambdas consists of:

* Handlers
* Context Objects
* Logging 
* Exceptions

See http://docs.aws.amazon.com/lambda/latest/dg/programming-model-v2.html

Individual Lambdas cannot hold state because they are brought up and down and replicated as needed. 
Persistent state should be stored in a service that is outside the lifecycle of the lambda such as Amazon DynamoDB, S3 etc.

Lambdas save and retrieve persistent data (state) in a service outside the lifecycle of the lambda,
such as Amazon DynamoDB, S3 etc.

## 

Uploads must be no larger than 50MB (compressed). 

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

