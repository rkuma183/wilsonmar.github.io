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

This tutorial aims to have you ending up with a serverless app running in the Amazon cloud.
We'll take it one step at a time.
I'll give you PROTIPs and notes along the way so you'll understand how we get there.

## About Serverless #

The term "serverless" describes an <strong>architectural style</strong> 
where developers shift concerned about the hardware and its ability to scale to AWS Lambda.

<a target="_blank" href="https://www.linkedin.com/in/andrew-baird-2bb7324a">
Andrew Baird</a>, AWS Solutions Architect, 
<a target="_blank" href="https://www.youtube.com/watch?v=O2GQRC0sVA8&t=5m22s">
listed all the questions that developers DON'T have to graple with
in his March 2016 webinar "Getting Started with Serverless Architectures"</a>.

> "There are tools and entire industries whose entire value proposition are about answering just one of these."

The name "serverless" has been adopted by enprepreneur 
<a target="_blank" href="https://twitter.com/austencollins">
@austencollins</a>
who built the 
<a target="_blank" https://serverless.com/">
Serverless company</a>
around its open-source
<a target="_blank" https://github.com/serverless/serverless-framework">
serverless framework on GitHub</a>,

Social media around the company and its repos on GitHub.

   * <a target="_blank" href="https://github.com/serverless/serverless">
   serverless-framework</a>
   * <a target="_blank" href="http://docs.serverless.com/v0.5.0/docs">
   Docs on serverless</a>
   * <a target="_blank" href="https://gumroad.com/l/learn-serverless-book">
   $99 Learn Serverless book</a>

   * <a target="_blank" href="https://www.serverless.io/">
   serverless.io</a> is the home page.
   * <a target="_blank" href="https://gitter.im/serverless/serverless">
   gitter.im/serverless/serverless</a> for instant chatting
   * <a target="_blank" href="http://serverlessconf.io/">serverlessconf.io</a> conferences
   * <a target="_blank" href="https://twitter.com/search?q=goserverless&src=typd">
    @GoServerless</a> Twitter account


## Serverless framework install #

0. [Install Node.js](/node-osx-install/)
   as a pre-requisite since the framework is written in Node.js.

0. Install the serverless-framework 

   <pre><strong>
   npm install -g serverless
   </strong></pre>

0. Verify version:

   <pre><strong>
   serverless -v
   </strong></pre>

   NOTE: Serverless was in Beta version 0.5.6 as of June 2016.

<a id="UpdateFramework"></a>

## Update Serverless #

   <pre><strong>
   npm update -g serverless
   </strong></pre>

   Nothing returns if you're up-to-date.

0. Get summary of commands:

   <pre><strong>
   sls
   </strong></pre>

   <pre>
 _______                             __
|   _   .-----.----.--.--.-----.----|  .-----.-----.-----.
|   |___|  -__|   _|  |  |  -__|   _|  |  -__|__ --|__ --|
|____   |_____|__|  \___/|_____|__| |__|_____|_____|_____|
|   |   |             The Serverless Application Framework
|       |                           serverless.com, v0.5.6
`-------'

Commands
* Serverless documentation: http://docs.serverless.com
* You can run commands with "serverless" or the shortcut "sls"
* Pass "--help" after any &LT;context> &LT;action> for contextual help
* Add "--debug" to any command for extra useful logs

project ........ create, init, install, remove
function ....... create, deploy, logs, remove, rollback, run
endpoint ....... deploy, remove
event .......... deploy, remove
dash ........... deploy, summary
stage .......... create, remove
region ......... create, remove
resources ...... deploy, diff, remove
plugin ......... create
variables ...... list, set, unset
   </pre>


0. Verify:

   <pre><strong>
   which serverless
   </strong></pre>

   <pre>
   /Users/mac/.npm-packages/bin/serverless
   </pre>

0. List framework folders and files:

   <pre><strong>
   cd ~/.npm-packages/bin/serverless
   </strong></pre>




<a name="FrameworkStructure"></a>

## Serverless Framework #

0. Create a folder to hold serverless projects. I like:

   <pre><strong>
   ~/gits/sls
   </strong></pre>

The serverless framework save developers' time by standarizing the structure of folders and files.

   <pre>
s-project.json       // Project file (JSON or YAML)
s-resources-cf.json  // CloudFormation template
s-templates.json     // Config templates and variables
admin.env            // AWS Profiles (gitignored)
_meta                // Metadata (gitignored)
function1            // A custom function
  |__event.json
  |__handler.js
  |__s-function.json
   </pre>

This set of project file is what developers work with.

The serverless framework that ead and process project files
is written in Node JavaScript.

A key differentiator with the Serverless Framework is that infrastructure is defined as code in one project. 

Components are deployed per stage, allowing developers to easily deploy separate prod, test and dev environments.

Within the folder for each function is a <strong>s-function.json</strong> file containing metadata.

When the framework is created for a project, a <strong>.gitignore</strong> file is created with other files
to specify private and temporary work files that should not be publicly uploaded to GitHub.

Project metadata in file 
<strong>_meta</strong> outputs and user variables used in function configurations. 
But due to the sensitive nature of these variables, the file needs to be gitignore'd by default.
A workaround is to use the 
Serverless Meta Sync plugin 
which stores project metadata in S3. 

<strong>s-resources-cf.json</strong> is a AWS CloudFormation template 
specifying security (IAM) roles, SNS email topics, DynamoDB tables, Queues, ARNs.

<strong>admin.env<strong>



## Serverless Command-line #

Lambda functions can be defined from a command-line using the Serverless framework.

AWS May 2016 Webinar Series - Deep Dive on Serverless Web Applications
   <amp-youtube data-videoid="fXZzVzptkeo" layout="responsive" width="480" height="270"></amp-youtube>

http://abalone0204.github.io/2016/05/22/serverless-simple-crud/


<a id="IAM"></a>

## Get Permissions #

Since 

aws-lambda-node-js-programming


http://stackoverflow.com/questions/37779324/how-to-troubleshoot-serverless-iam-permissions

## Resources #

Phillip muens (@pmmuens, github.com/pmuens)
has an informative blog at
<a target="_blank" href="http://justserverless.com/blog/">
JustServerless.com</a>

   * http://justserverless.com/blog/your-first-serverless-application/

   * <a target="_blank" href="http://justserverless.com/blog/nanoservices-microservices-monolith-serverless-architectures-by-example/">
   Nanoservices</a>

<a target="_blank" href="https://www.amazon.com/AWS-Lambda-Guide-Serverless-Microservices-ebook/dp/B016JOMAEE/">
AWS Lambda: A Guide to Serverless Microservices</a>
$3.99 by Matthew Fuller

AWS Lambda: Serverless Microservices Guide with Simple Instructions
by Jake Knowles


<a target="_blank" href="https://medium.com/@johncmckim/serverless-framework-the-good-parts-9d84e5a02467#.yxruhhlna">
Serverless Framework: The Good Parts</a>
by John McKim 
@johncmckim  

## Future topics #

handlers that compress or transform objects as they are uploaded to Amazon S3, 


## More on Serverless #

This is one of a series on Serverless computing

{% include serverless_links.html %}
