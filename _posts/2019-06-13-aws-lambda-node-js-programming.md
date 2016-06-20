---
layout: post
title: "AWS Lambda Node JavaScript Programming"
excerpt: "JavaScript for the masses"
tags: [aws, lambda, node, javascript, programming]
image:
# feature: pic orange wm_mcnaughton_sunset_runner_1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622121/097d7550-0585-11e6-9543-27d45c2487c2.jpg
  credit: William McNaughton
  creditlink:
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This tutorial provides a deep dive into coding and debugging Node JavaScript functions in AWS Lambda.
This is a hands-on guided tour.
Take one step at a time and we point out PROTIPs and notes along the way.

Topics:

* Minimal Hello World
* ES5 vs ES6 "fatties" and functional programming constructs?
* provided libraries ('aws-sdk')
* custom libraries

* Input S3
* Input DynamoDB
* Machine Learning
* IoT

* Sign strings

<hr />

## Retry loop #

A retry loop assumes that errors are transitory.

maxErrorRetry value of 0 turns off retries.

http://docs.aws.amazon.com/general/latest/gr/api-retries.html
A Java sample is provided in AWS docs.

   <pre>
var loopCounter = 0;
Loop:
   counter +1
   Do it
   if context.succeed()
      pass object up.
   else
   If context.fail()
      if count > max
         drop out
      else
         loop to retry.
   endif
end loop
   </pre>


## Libraries built-in #

Modules:

   * AWS SDK module (“ aws-sdk”)
   * AWS Lambda module (“ awslambda”)
   * DynamoDB interaction module (“ dynamodb-doc”)
   * image processing tool (“ imagemagick”)

Others require:

   <pre>
   var mymodule = require(" mymodule");
   </pre>



   ### AWS JavaScript SDK #

   http://docs.aws.amazon.com/AWSJavaScriptSDK/guide/
   provides functions to access AWS services in the browser or
   http://docs.aws.amazon.com/AWSJavaScriptSDK/guide/node-intro.html
   inside Node.js apps on the server.

   Still need to specify

   <pre>
   var AWS = require('aws-sdk');
   AWS.config.region = 'us-west-2';
   </pre>

   This locks the version as of a point in time between
   releases dated 2011-12-05 and 2012-08-10:

      <pre>
      var dynamodb = new AWS.DynamoDB({apiVersion: '2012-04-04'});
      </pre>

   To pass a parameter to a service operation:

      <pre>
      s3.getObject({Bucket: 'bucketName', Key: 'keyName'});
      </pre>

  To bind a parameter to a service operation:

         <pre>
         var s3bucket = new AWS.S3({ params: {Bucket: 'myBucket'} });
         </pre>

## Control Log verbosity #

Matthew Fuller proposes this code to enable searching of CloudWatch for “INFO” or “DEBUG” and
to adjust extent of logging, as runs in staging often require a more extensive debug level
while production runs should only expose warnings in logs.

Fuller, Matthew (2016-01-11). AWS Lambda: A Guide to Serverless Microservices (Kindle Locations 536-538).  . Kindle Edition.
It's an example of a JavaScript case statement:

   <pre>
module.exports = function( level) {
  var levelValue = 100;
  switch (level) {
    case 'TRACE': levelValue = 0; break;
    case 'DEBUG': levelValue = 1; break;
    case 'INFO': levelValue = 2; break;
    case 'WARN': levelValue = 3; break;
    case 'ERROR': levelValue = 4; break;
    case 'FATAL': levelValue = 5; break;
    }
    // Override all logs if testing with mocha:
    if (process.argv.join(''). indexOf(' mocha') > -1) {
      levelValue = 100;
    }
    return {
      trace: function( message) {
        if (levelValue < = 0) { console.log(' TRACE: ' + message); } },
      debug: function( message) { if (levelValue < = 1) { console.log(' DEBUG: ' + message); } },
      info: function( message) { if (levelValue < = 2) { console.log(' INFO: ' + message); } },
      warn: function( message) { if (levelValue < = 3) { console.log(' WARN: ' + message); } },
      error: function( message) { if (levelValue < = 4) { console.log(' ERROR: ' + message); } },
      fatal: function( message) { if (levelValue < = 5) { console.log(' FATAL: ' + message); } }
    };
   </pre>

   PROTIP: Consider defining CloudWatch alerts based on log patterns such as an email being sent when the words “error: invalid” appears.

Un-comment

   <pre>
   console.log('Received event:', JSON.stringify(event, null, 2));
   </pre>

Save and Test

Received event: {
  "key3": "value3",
  "key2": "value2",
  "key1": "value1"
}


<a name="Authentication"></a>

## Authentication #

AWS offers its <strong>SigV4</strong> to authorize access to APIs.


### Sign API Requests #

http://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html

https://www.youtube.com/watch?v=dCv0gZLjcNY
AWS August Webinar Series - Building Serverless Backends with AWS Lambda and Amazon API Gateway 200</a>
14 Oct. 2015
is a high-level webinar
by AWS Lambda Sr. Product Manager
Vyon Nagrani


<a name="ContextObject"></a>

## Context object #

   <pre>
   exports.handler = (event, context, callback) => {
      console.log('Received event:', JSON.stringify(event, null, 2));
      console.log("context.awsRequestId: "  + context.awsRequestId);
      console.log("context.logGroupName: "  + context.logGroupName);
      console.log("context.logStreamName: " + context.logStreamName);
      console.log("context.identity: "      + context.identity);
      console.log("context.functionName: "  + context.functionName);
      callback(null, event.key1);  // Echo back the first key value
   // callback('Something went wrong');
   };
      </pre>


   <pre>
var AWS = require('aws-sdk');
var s3 = new AWS.S3();
//
exports.handler = function(event, contect){
	var params = {
	    Bucket: '[input bucket name here]',
	    Key: "[insert keyname here]",
	    Body: "[object bod]"
	};
	s3.putObject(params, function(err, data){
	    if (err) {
	        console.long(err, err.stack);
	    }else{
	        console.log(data);
	    }
	    context.done();
	} );
};
   </pre>



https://aws.amazon.com/blogs/compute/nodejs-packages-in-lambda/

<a name="GitHubAccess"></a>

## GitHub Access #

<a target="_blank" href="https://www.topcoder.com/blog/amazon-lambda-demo-tutorial/#!">
A blog dated 29 Jan. 2015</a>
by Jeff Douglas provides this code:

   <pre>
var githubapi = require("github"),
  async = require("async"),
  AWS = require('aws-sdk'),
  secrets = require('./secrets.js');
//
// the 'handler' that lambda calls to execute our code
exports.handler = function(event, context) {
//
  // config the sdk with our credentials
  // http://docs.aws.amazon.com/AWSJavaScriptSDK/guide/node-configuring.html
  AWS.config.loadFromPath('./config.json');
  //
  // variables that are populated via async calls to github
  var referenceCommitSha,
    newTreeSha, newCommitSha, code;
  //
  // s3 bucket and file info to fetch -- from event passed into handler
  var bucket = event.Records[0].s3.bucket.name;
  var file = event.Records[0].s3.object.key;
  //
  // github info
  var user = 'jeffdonthemic';
  var password = secrets.password;
  var repo = 'github-pusher';
  var commitMessage = 'Code commited from AWS Lambda!';
  //
  // apis for s3 and github
  var s3 = new AWS.S3();
  var github = new githubapi({version: "3.0.0"});
  //
  github.authenticate({
    type: "basic",
    username: user,
    password: password
  });
  //
  async.waterfall([
    //
    // get the object from s3 which is the actual code
    // that needs to be pushed to github
    function(callback){
      //
      console.log('Getting code from S3...');
      s3.getObject({Bucket: bucket, Key: file}, function(err, data) {
        if (err) console.log(err, err.stack);
        if (!err) {
          // code from s3 to commit to github
          code = data.Body.toString('utf8');
          callback(null);
        }
      });
    },
    //
    // get a reference to the master branch of the repo
    function(callback){
      //
      console.log('Getting reference...');
      github.gitdata.getReference({
        user: user,
        repo: repo,
        ref: 'heads/master'
        }, function(err, data){
         if (err) console.log(err);
         if (!err) {
           referenceCommitSha = data.object.sha;
           callback(null);
         }
      });
    },
    //
    // create a new tree with our code
    function(callback){
      //
      console.log('Creating tree...');
      var files = [];
      files.push({
        path: file,
        mode: '100644',
        type: 'blob',
        content: code
      });
      //
      github.gitdata.createTree({
        user: user,
        repo: repo,
        tree: files,
        base_tree: referenceCommitSha
      }, function(err, data){
        if (err) console.log(err);
        if (!err) {
          newTreeSha = data.sha;
          callback(null);
        }
      });
     },
    //
    // create the commit with our new code
    function(callback){
      //
      console.log('Creating commit...');
      github.gitdata.createCommit({
        user: user,
        repo: repo,
        message: commitMessage,
        tree: newTreeSha,
        parents: [referenceCommitSha]
      }, function(err, data){
        if (err) console.log(err);
        if (!err) {
          newCommitSha = data.sha;
          callback(null);
        }
      });
    },
    //
    // update the reference to point to the new commit
    function(callback){
      //
      console.log('Updating reference...');
      github.gitdata.updateReference({
        user: user,
        repo: repo,
        ref: 'heads/master',
        sha: newCommitSha,
        force: true
      }, function(err, data){
        if (err) console.log(err);
        if (!err) callback(null, 'done');
      });
     }
  //
  // optional callback for results
  ], function (err, result) {
    if (err) context.done(err, "Drat!!");
    if (!err) context.done(null, "Code successfully pushed to github.");
  });
};
   </pre>


## More on Serverless #

This is one of a series on Serverless computing

{% include serverless_links.html %}
