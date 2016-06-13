---
layout: post
title: "AWS Lambda Serverless"
excerpt: "JavaScript for the masses"
tags: [node, javascript, apple, mac, setup]
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

This tutorial provides a deep dive into creating and using Node.js functions in AWS Lambda.
This is a hands-on guided tour. 
Take one step at a time and we point out PROTIPs and notes along the way.

Topics:

* provided libraries ('aws-sdk')
* custom libraries

* Input S3
* Input DynamoDB
* Machine Learning
* IoT

   <pre>
var AWS = require('aws-sdk');
var s3 = new AWS.S3();

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


