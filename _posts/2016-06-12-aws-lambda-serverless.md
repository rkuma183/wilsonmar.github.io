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

The term "serverless" describes an <strong>architectural style</strong> 
where developers shift concerned about the hardware and its ability to scale to AWS Lambda.

<a target="_blank" href="https://www.linkedin.com/in/andrew-baird-2bb7324a">
Andrew Baird</a>, AWS Solutions Architect, 
<a target="_blank" href="https://www.youtube.com/watch?v=O2GQRC0sVA8&t=5m22s">
listed all the questions that developers DON'T have to graple with
in his March 2016 webinar "Getting Started with Serverless Architectures"</a>.

   "There are tools and entire industries whose entire value proposition are about answering just one of these."


The name "serverless" has been co-opted by enprepreneur 
<a target="_blank" href="https://twitter.com/austencollins">
@austencollins</a>
who started the Serverless company.
Social media around the company and its repos on GitHub.

   * <a target="_blank" href="https://github.com/serverless.io/">
   github.com/serverless</a> account's repos.
   * <a target="_blank" href="https://github.com/serverless.io/">
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

<a name="FrameworkStructure"></a>

## Framework Structure #

The serverless framework save developers' time by standarizing the structure of folders and files.

   <pre>
s-project.json // Project file (JSON or YAML)
s-resources-cf.json  // CloudFormation template
s-templates.json // Config templates and variables
admin.env        // AWS Profiles (gitignored)
_meta            // Metadata (gitignored)
function1        // A function
  |__event.json
  |__handler.js
  |__s-function.json
   </pre>

The serverless framework provides the Node.js coding to read these files.

A key differentiator with the Serverless Framework is that infrastructure is defined as code in one project. 

Components are deployed per stage, allowing developers to easily deploy separate prod, test and dev environments.

Within the folder for each function is a <strong>s-function.json</strong> file containing metadata.

When the framework is created for a project, a .gitignore file is created with other files
to specify private and temporary work files that should not be publicly uploaded to GitHub.

The project metadata contains CloudFormation outputs and user variables. These are used in the function configurations. However, due to the sensitive nature of these variables, the metadata is gitignored by default.

The Serverless Meta Sync plugin can help with this by storing a project’s metadata in S3. 
However, this is not mentioned in the Serverless docs leaving many people confused.

<a id="IAM"></a>

## Get Permissions #

Since 

aws-lambda-node-js-programming


http://stackoverflow.com/questions/37779324/how-to-troubleshoot-serverless-iam-permissions



## Serverless Command-line #

Lambda functions can be defined from a command-line using the Serverless framework (formerly JAWS).

https://www.youtube.com/watch?v=fXZzVzptkeo
AWS May 2016 Webinar Series - Deep Dive on Serverless Web Applications

http://abalone0204.github.io/2016/05/22/serverless-simple-crud/

Install serverless-framework 

   npm install -g serverless

Austen Collins created the Serverless Framework

http://justserverless.com/blog/your-first-serverless-application/


<a target="_blank" href="http://justserverless.com/blog/nanoservices-microservices-monolith-serverless-architectures-by-example/">
Phillip muens (@pmmuens)
github.com/pmuens

handlers that compress or transform objects as they are uploaded to Amazon S3, 


<a target="_blank" href="https://medium.com/@johncmckim/serverless-framework-the-good-parts-9d84e5a02467#.yxruhhlna">
Serverless Framework: The Good Parts</a>
by John McKim 
@johncmckim  


## More on Serverless #

This is one of a series on Serverless computing

{% include serverless_links.html %}
