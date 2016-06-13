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

* ES5 vs ES6 "fatties" and functional programming constructs?
* provided libraries ('aws-sdk')
* custom libraries

* Input S3
* Input DynamoDB
* Machine Learning
* IoT




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


## GitHub #

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
