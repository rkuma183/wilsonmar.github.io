---
layout: post
title: "AWS Lamba Serverless"
excerpt: "An invisible server for the masses"
tags: [node, serverless]
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

It's assumed that you're already familiar with
[the Serverless framework](/serverless/)


<a target="_blank" href="https://techcrunch.com/2016/09/01/serverless-is-the-new-multitenancy/">
Multitenancy</a>
"not only allowed for higher gross margins, it made it viable to serve small and medium businesses with world-class software  —  at a profit."


0. Create an Amazon Web Services account.

   ### Create a "serverless-admin" user 

   This is used to do work under an AWS account Administrator Access policy.

1. Login to your AWS account
2. Go to the **Identity & Access Management (IAM)** page
3. Click on **Users**
4. Click on **Create New Users**
5. Enter *serverless-admin* and click **Create**
6. Click on **Download Credentials** to download the .csv file with the AWS credentials
7. Click **Users** on the left
8. Click on the *serverless-admin* user
9. Go to the **Permissions** tab
10. Click **Attach Policy** and select the **Administrator Access**
11. Click on **Attach Policy**

   ### Python

0. Install Python

0. Install AWS CLI per https://docs.aws.amazon.com/cli/latest/userguide/installing.html

   <tt><strong>
   pip install --upgrade --user awscli
   </strong></pre>

   The --upgrade option tells pip to upgrade any requirements that are already installed. 

   The --user option tells pip to install the program to a subdirectory of your user directory to avoid modifying libraries used by your operating sytem.

0. Verify:

   <tt><strong>
   aws --version
   </strong></pre>

0. To uninstall:

   pip uninstall awscli

0. Obtain AWS Access Key ID

   https://github.com/pmuens/serverless-book/blob/master/04-setup/02-cloud-provider-setup.md

   <pre>
   aws configure
   </pre>



## Resources #

* <a target="_blank" href="https://cloudacademy.com/webinars/aws-lambda-advanced-coding-session-22/">
  video: Advanced Coding Session</a>
  and
  <a target="_blank" href="http://www.slideshare.net/AlexCasalboni/aws-lambda-advanced-coding-session/1">
  slides</a>
  (API Gateway authentication use cases, Amazon Kinesis Streams, Amazon Cognito and AWS CloudFormation)
  by Alex Casalboni of CloudAcademy.
   <a target="_blank" href="https://gist.github.com/alexcasalboni/b045542bbd77b9d0bdac2db939575eec/">
  repo</a>


## Social #

@AWSLambda

\#AWSLambda

@lambda_conf

@lambdatips


## More on Serverless #

This is one of a series on Serverless computing

{% include serverless_links.html %}
