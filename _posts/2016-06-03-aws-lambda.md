---
layout: post
title: "AWS Lamba"
excerpt: "In like a lamb, roaring like a lion"
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

This tutorial takes a deep dive into creating and using AWS Lambda.
This takes a hands-on approach. Take one step and we have PROTIPs and notes along the way.

0. Get on the AWS Console at <a target="_blank" href="http://aws.amazon.com/">
   http://aws.amazon.com/</a>.

   * <a target="_blank" href="http://www.amazon.com/AWS-Mobile-LLC-Console/dp/B00ATSN730">
   On Google Android mobile phones</a>

   * <a target="_blank" href="https://itunes.apple.com/us/app/aws-console/id580990573?mt=8">
   on Apple iPhones and iPads</a>

   Sign up for an account with your credit card if you don't already have one.

   Once you sign-in, your AWS Console is tied to a particular <a href="#AvailabilityZone">
   Availability Zone</a>, such as "us-west-2":

   <a target="_blank" href="https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2">
   https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2</a>

   NOTE: Baking different zones into Console URLs makes for more direct connections and removes issues from using a single URL/DNS.

0. <a target="_blank" href="https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2">
   On the AWS Console, select Services, select Lambda from among Compute services such as EC2</a>.

   Compute services are at the top of the list among all Amazon services because it's the hottest thing right now (June 2016).

   <amp-img width="650" alt="lambda services 2016-06-03 959x124" src="https://cloud.githubusercontent.com/assets/300046/15784793/5d0342ee-2971-11e6-97e0-a4ac79fe7818.jpg"></amp-img>

   AWS Lambda acts like a giant single server that processes API requests.

   So no worries about massive scale.
   Addition of enough machines to handle load are taken care of by Amazon people behind the scenes.

   BTW, in case you're worried about vendor lock-in, know that Amazon is not the only ones who can run lambdas.
   <a target="_blank" href="https://www.iron.io/">iron.io</a> runs Lambas on your own servers if you feel nostalgic for power cords on physical servers.

   Amazon calls Lambda a "compute service" because programmers write code as discrete API 
   handlers responding to 
   <strong>events</strong> such as an image being uploaded.

   <a name="Pricing"></a>

   #### Pricing #

0. Click Learn About link to http://aws.amazon.com/lambda/

0. Click Pricing for http://aws.amazon.com/lambda/pricing 

   It says the first million requests are free. That's 20 cents you've saved.

   The first 400,000 GB-seconds are free. If your lambda consumes a massive 1,536 MB (1 GB) every second while it runs, 
   you'll have 266,667 GB-seconds to play for free each month. That's (266,667 / 60 seconds / 60 minutes ) 
   74 hours of continuous processing per month.

   NOTE: Lambda functions created (and sitting around with no activity) incure no charges.

   QUESTION: How to tell how much each lambda request consumes in memory.

## Tutorial: Create Event Source S3 #

   The <a target="_blank" href="https://qwiklabs.com/focuses/preview/2369">
   Introduction to AWS Lambda course in qwiklabs.com</a> 
   provides step-by-step instruction on creating an Lambda Event Source triggered 
   by an upload to S3 bucket.

0. Open another tab on your browser to create a bucket in 
   <a target="_blank" href="https://console.aws.amazon.com/s3/home?region=us-west-2#">
   S3</a> with a name such as "lambdabkt001".

   WARNING: Bucket names must be unique among all S3 users.

   <a name="Regions"></a>

   TUTORIAL NOTE: All links on this page are for Oregon region us-west-2.
   <amp-img width="273" height="259" alt="lambda regions 2016-06-03 " src="https://cloud.githubusercontent.com/assets/300046/15779042/53daf6d6-2957-11e6-8420-140090d9f799.jpg"></amp-img>

   For now, no logging, versioning, replication, tags, etc. for the bucket.

   #### Create Lambda Function #

0. <a target="_blank" href="https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2#/create?step=1">
   On the AWS Console, select Services, select Lambda, click Get Started Now</a>

0. Click the <strong>All languages</strong> drop-down.

   Inside the Lambda "server" are Node JS, Python, and JVM run-times that run "lambda programs".
   
   The specific version is listed: Node.JS 0.10, Node.JS 4.3, Python 2.7.

0. If you want to run Java, click Skip.  QUESTION: Where's Java blueprints?

   Alternately, to use, for example, blueprint "s3-get-object",
   type "s3" in the Filter field to select a <strong>blueprint</strong> (sample configurations of event sources and Lambda functions).

   <a name="EventSources"></a>

0. S3 is the default among event sources:

   <amp-img width="468" height="252" alt="lambda event sources 2016-06-03 " src="https://cloud.githubusercontent.com/assets/300046/15777674/6e6822e8-294e-11e6-93e3-cb3d7188fb88.jpg"></amp-img>

0. Event Type "Object Created (All)" rather than specific action:

   <amp-img width="600" height="178" alt="lambda event type 2016-06-03" src="https://cloud.githubusercontent.com/assets/300046/15778056/072ce58e-2951-11e6-8eec-43766a136525.jpg"></amp-img>

0. Click Next. For now, no file prefix or suffix specification.

   ### Configure function #

   The default Description is supplied from the blueprint.

   <a name="Runtimes"></a>

0. Select "Node.j2 4.3" for Runtime

   <amp-img width="380" height="161" alt="lambda runtimes 2016-06-03" src="https://cloud.githubusercontent.com/assets/300046/15778339/c5db0258-2952-11e6-8ac0-5b641024f760.jpg"></amp-img>

   Sample code for the language version selected appears. NOTE: Yes, that's 2006:

   <pre>
   let aws = require('aws-sdk');
   let s3 = new aws.S3({ apiVersion: '2006-03-01' });
   </pre>

   Alternately:

   * If you selected <strong>Edit code inline</strong>, paste code copied from a Gist or GitHub.
   * If you selected Upload a ZIP file, navigate to the file on your machine. 

     WARNING: Each upload is limited to under 50 MB (compressed). 

   * If you selected Upload a file from Amazon S3, paste in the bucket ID.

   PROTIP: Install the AWS Eclipse plugin to author and deploy Lambda functions for Java and Node.js.

   NOTE: The file holding the code is <strong>index.js</strong>.

0. Leave Handler as "index.handler".

0. The <strong>Execution role</strong> defines the permissions.

   <amp-img width="359" height="248" alt="lambda roles 2016-06-03" src="https://cloud.githubusercontent.com/assets/300046/15778512/eaf94314-2953-11e6-9306-10755458fbee.jpg"></amp-img>

   * If you are usign S3, select * S3 execution role.
   * If you select Basic execution role:

0. Click View Policy Document. An example:

   <pre>
   {
   "Version": "2012-10-17",
   "Statement": [
     {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*"
     }
    ]
   }
   </pre>

0. Click Allow in the IAM window opened for you to accept the role name suggested.

0. PROTIP: Start with 128 MB of memory (the lowest), and increase it later.

0. Set Timeout to 5 seconds.

0. No VPC during tutorial runs. Click Next.

0. Click Enable event source until testing has occurred. Click Create function.

## Test Trigger #

### Test Trigger S3 #

0. Switch back to the S3 tab.
0. Click on the bucket link.
0. Click Upload tab.
0. Click Add Files.
0. Select any file from your local machine's hard drive.
0. Click Start Upload.

   Done.

### Test Trigger Custom #

0. In the Lambda Functions screen, select <strong>Actions</strong> since Test should not be clicked until it's configured.

   <amp-img width="264" height="207" alt="lambda test actions 2016-06-03" src="https://cloud.githubusercontent.com/assets/300046/15787037/1c0e00e2-297d-11e6-8933-c3ed031e6768.jpg"></amp-img>

0. The default data that appears is from the Hello World sample event template. But there are others:

   <amp-img width="603" alt="lambda test sample 2016-06-03" src="https://cloud.githubusercontent.com/assets/300046/15787217/3f884c66-297e-11e6-9e54-9c821cecc4a2.jpg"></amp-img>

0. If your function does not use test data, save an empty set of JSON curly braces:

   <pre>
   { }
   </pre>

0. Click Test. Scroll to the bottom of the screen to see the Execution result.



## Use CloudWatch #

0. In Lambda > Functions, click on the function's name ("S3Function").
0. Click the <strong>Monitoring</strong> tab.

   <a name="MonitoringGraphs"></a>

   <amp-img width="600" alt="lambda onitoring screens 2016-06-03 1340x313" src="https://cloud.githubusercontent.com/assets/300046/15787783/66061b72-2981-11e6-88d0-ef06f298451f.jpg"></amp-img>

0. PROTIP: Mouse over a point on a line for more detail.

   * **Invocation count** measures the number of times a function has been invoked and billed
   (in response to an event or API call). This includes both successful and failed invocations, but not throttled attempts.

   * **Invocation duration** measures the elasped wall clock time from when the function code starts executing
   (as a result of an invocation) to when it stops executing. This is used in billing, rounded up to the nearest 100 milliseconds.
   The maximum data point value possible is the function timeout configuration.

   * **Invocation errors** measure the number of invocations that failed due to some error.
   Failed invocations may trigger a retry attempt that succeeds:

      * Handling exceptions such as context.fail(error).
      * Unhandled exceptions causing the code to exit the function since it can't handle the error.
      * Out of memory exceptions
      * Timeouts
      * Permission errors

   * **Throttled invocations** measures the number of Lambda functon invocation attempts not executed because
   the customer concurrent limit has been reached for the period (error 429).

   NOTE: AWS Lambda only sends non-zero value metrics to CloudWatch.

0. Click View logs in CloudWatch link.
0. Click a Log stream entry to see the Event Data for it.

   Notice the time stamp such as "Last modified date2016-06-03T13:23:27.021+0000" is UTC/GMT time.

0. Click the line that begins with "REPORT RequestId:" to expand it to see the amount of memory actually used.

   <pre>
   REPORT RequestId: 0ddf5949-29b1-11e6-b8de-a70c7c47033a Duration: 1.00 ms Billed Duration: 100 ms Memory Size: 128 MB Max Memory Used: 36 MB
   </pre>

   These statistics also appear in the Summary pane.

   The amount charged (Billed) is in increments of 100 milliseconds, even if the Duration is 1 ms.

   The number of Max Memory Used used can vary from one execution to another for different sizes of files handled by the function.

   QUESTION: Can the highest MB Used by the function be a metric shown in the list of functions (along with Max. memory)?

   QUESTION: Are charges for memory based on the maximum allocated or the amount actually used?
   
NOTE: CloudFront logs can also be read using command-line tool
<a target="_blank" href="https://github.com/jorgebastida/awslogs">awslogs</a>.

## Dynamo DB #

To build mobile back-ends that retrieve and transform data from Amazon DynamoDB:

https://github.com/abalone0204/serverless-demo-with-dynamodb-node

http://abalone0204.github.io/2016/05/22/serverless-simple-crud/

Install serverless-framework 

   npm install -g serverless


handlers that compress or transform objects as they are uploaded to Amazon S3, 

## Kinesis #

Server-less processing of streaming data using Amazon Kinesis.



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

## Setup #

http://docs.aws.amazon.com/lambda/latest/dg/setup.html
Setup an AWS Command-line Interface 

## Python program #

The most basic lambda in Python:

   <pre>
def lambda_handler(event, context):
  return "Hello World!"
   </pre>

The most basic lambda in Java:

   <pre>
package example;

import com.amazonaws.services.lambda.runtime.Context; 

public class Hello {
    public String lambdaHandler(String event, Context context) {
        return "Hello World!";
    }
}
   </pre>

## Social #

\#AWSLamba is the Twitter tag.

\#GoServerless

* http://docs.aws.amazon.com/lambda/latest/dg/welcome.html


## CloudFormation #

https://github.com/jorgebastida/gordon
λ Gordon is a tool to create, wire and deploy AWS Lambdas using CloudFormation.

http://gordon.readthedocs.io/en/latest/
provides examples in Java, JavaScript (for Node), and Python.

Jinja2 templates can be used to expand "moustache" variables in CloudFormation JSON:

   * stage: The name of the stage where you are applying your project.
   * aws_region: The name of the AWS_REGION where you are applying your project.
   * aws_account_id: The ID of the account that you are using to apply your project.
   * env: All available environment variables.

   See http://jinja.pocoo.org/docs/dev/templates/#filters

## Resources:

* http://codurance.com/2016/05/11/aws-lambdas/

* https://www.npmjs.com/package/aws-lambda-toolkit

@johncmckim  John McKim's Express to AWS Lambda series on Medium:

   * <a target="_blank" href="https://medium.com/@johncmckim/express-to-aws-lambda-part-1-a057096abe34#.fmuh3gr9e">
     Getting Started</a>
   * <a target="_blank" href="https://medium.com/@johncmckim/express-to-aws-lambda-part-4-22257f71385f#.hqscogos0">
   Authentication and Authorisation</a>

* https://www.npmjs.com/package/vandium
   Vandium AWS Lambda wrapper for Node.js

Justin Yoo Readify ‏@readify 

http://www.rightbrainnetworks.com/blog/aws-lambda-tutorial-playing-math-games-lambda/
May 24 2016
AWS LAMBDA TUTORIAL: PLAYING MATH GAMES WITH LAMBDA
by  David Barnett 
    Visualizing the Mandelbrot sets
     Playing Monte Carlo simulations
     Visualizing Apache Spark and Databricks

Public repos in GitHub 

   * <a target="_blank" href="https://github.com/Netflix/bless">
     BLESS from Netflix</a> is an SSH Certificate Authority that runs as a AWS Lambda function in an isolated AWS account with restricted IAM roles
     to sign short-lived ssh public keys. Written in Python.

   * http://docs.aws.amazon.com/lambda/latest/dg/current-supported-versions.html
   mentions ImageMagick for processing image files.