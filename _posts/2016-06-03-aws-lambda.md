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

This tutorial provides a deep dive into creating and using AWS Lambda.
This is a hands-on guided tour. 
Take one step at a time and we point out PROTIPs and notes along the way.

0. Use an internet browser to get on the AWS Console at <a target="_blank" href="http://aws.amazon.com/">
   http://aws.amazon.com</a>

0. Click Sign In to the Console.

   <a target="_blank" href="https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2">
   https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2</a>

   NOTE: AWS Lambda acts like a giant single server.
   But you get to pick which Availability Zone.


0. Select Services from the top menu.

   <amp-img width="650" alt="lambda services 2016-06-03 959x124" src="https://cloud.githubusercontent.com/assets/300046/15784793/5d0342ee-2971-11e6-97e0-a4ac79fe7818.jpg"></amp-img>

   COMMENT: Compute services are at the top of the list among all Amazon services because it's the hottest thing right now (June 2016).

0. <a target="_blank" href="https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2">
   Select Lambda from among Compute services</a>.

   If no Lambda functions have been created, you will see a "Get Started Now" button.

   If custom Lambda functions have been created on your account, you'll see a list of those functions.

   No worries about achieving massive scale.
   Addition of enough machines to handle load are taken care of by Amazon people behind the scenes.

   BTW, in case you're worried about vendor lock-in, know that Amazon is not the only ones who can run lambdas.
   <a target="_blank" href="https://www.iron.io/platform/ironworker/">
   Iron.io IronWorker</a> 
   runs Lambas on your own servers if you feel nostalgic for power cords on physical servers.

   Amazon calls Lambda a "compute service" because programmers write code as discrete API 
   handler functions responding to 
   <strong>events</strong> such as an image being uploaded into S3.

   <a name="Pricing"></a>

   #### Pricing #

   NOTE: Amazon currently does not charge for code storage.

0. On a new browser tab, click<br />
   <a target="_blank" href="http://aws.amazon.com/lambda/">
   http://aws.amazon.com/lambda/</a>, the home page for Amazon's Lambda service.

0. Click <a target="_blank" href="http://aws.amazon.com/lambda/pricing">
   http://aws.amazon.com/lambda/pricing</a>

   It says the first million requests are free. That's 20 cents you'll save each month.

   For now, the first 400,000 GB-seconds (x 1024 = 409,600,000 MB-seconds) are free. 

   If you run only 128 MB Lambdas, you can make one request every 1.23 seconds during a 30-day month, for free.
   (409,600,000 / 128 = 3,200,000 / 30 days / 24 hours / 60 minutes / 60 seconds = 1.23 )

   QUESTION: What is the date that free allocations flip to the next month? On the 1st?

   NOTE: Lambda functions created (and sitting around with no activity) incure no charges.

   NOTE: How much each Lambda request consumes in memory time is described in
   <a href="#CloudWatch">CloudWatch below</a>.


## Hello World Lambda function from Blueprint #

0. Alt-Click the black question mark at the upper-right corner for a new window or tab containing 
   <a target="_blank" href="https://docs.aws.amazon.com/lambda/latest/dg/get-started-create-function.html">
   a tutorial on the basic steps to get to "Hello World" output on the Console</a>.

0. Click "Create a Lambda Function".

0. Among Blueprint of pre-defined function code:

   PROTIP: If you're going to use a Blueprint, highlight its name and
   copy it to your Clipboard so your can paste it into the function name.

0. Page forward to click on the name "Hello World" Node.js function.

0. Construct a function name.

   An example:

   <pre>
   learn1-hello-world-node43-v01
   </pre>

   PROTIP: Prefix the function with the project and use case.
   Include in the name the language and version (such as node43 for Node.js 4.3).
   Specify a version number (v01).
   Use dashes instead of spaces.

   Function names must contain only letters, numbers, hyphens, or underscores.


   ### Role #

0. Scroll down beyond the script to the Role selection.

   ### Save and Test #

0. Click Next.

0. Review, then click Create function.

0. Click Test.

   ### Test Data #

0. Select from Sample event template. The default is always "Hello World"
   (even if you're not using the Hello World function).

0. Click Save and test.

   The first invocation is a pop-up **Input test event**.
   This can later be obtained by Actions > Configure test event.

   QUESTION: Minmification of script?

   ### Log review #

   Notice that output from the initial `console.log('Loading function');` 
   does not appear in the run Log Output.

0. Click "Click here" to open a new tab to view CloudWatch log group.

0. Click on a log stream item.  Notice the 'Loading function' there.

0. Click on the Lambda Management Console to return.

0. Add a console.log line at the end of the script:

   <pre>
   console.log('Ending Loading function');
   </pre>

0. Run again and view the CloudWatch log.

   Notice the "Ending Loading function" is not shown at the bottom.

   QUESTION: Why?

<pre>
'use strict';
console.log('Loading function');

exports.handler = (event, context, callback) => {
    //console.log('Received event:', JSON.stringify(event, null, 2));
    console.log('value1 =', event.key1);
    console.log('value2 =', event.key2);
    console.log('value3 =', event.key3);
    callback(null, event.key1);  // Echo back the first key value
    // callback('Something went wrong');
};
</pre>

   The callback is used for asynchronous behavior.


## Create Event Source S3 #

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

0. Click the <strong>All languages</strong> drop-down. The default is Node.JS 4.3.

   But also available are Java 8, Node.JS 0.10, Node.JS 4.3, Python 2.7.

   COOL: With Lambda developers don't need to provision servers and install and update JVM run-time software.
   Servers accepting Lambda requests are Node JS, Python, and JVM run-times that run Lambda functions.
   
0. If you want to use, for example, blueprint "s3-get-object",
   type "s3" in the Filter field to select a <strong>blueprint</strong> (sample configurations of event sources and Lambda functions).

   Alternately, to provide your own script, scroll down to click <strong>Skip</strong>.  

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

   If you are usign S3, select `* S3 execution role`. The asterisk (*) designates the default selection.

   Alternately, select `Basic execution role` if your function does not need to input data.

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


<a name="CloudWatch"></a>

## Use CloudWatch #

0. In Lambda > Functions, click on your function's name (such as "S3Function").
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

0. In the CloudWatch Console, click "Lambda" under the Metrics category on the left menu.



### CloudWatch Command-line Tool #
   
NOTE: CloudFront logs can also be read using command-line tool
<a target="_blank" href="https://github.com/jorgebastida/awslogs">awslogs</a>.


<a name="CreateLambda"></a>

## Create Lambda function with no input data #

0. In an internet browser go to <a target="_blank" href="https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2#/functions">
   Services > Compute > Lambda<br />
   https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2#/functions</a>

0. [Create an Amazon Lambda function](/aws-lambda/) to work with if you haven't already.
0. Click on the name of a Lambda function to expose using an API endpoint.

   Notice a set of numbers and letters (such as tsdwtdl0r1) has been assigned next to your Lambda name.

0. Click the API endpoints tab.
0. Click Add API endpoint.
0. Select API Gateway in the pop-up dialog.

   QUESTION: Why is this necessary if there is only one choice?

0. Change the Resource Name (such as `/faq`) to define part of the URL path.
0. The initial Method must be GET.
0. Change Deployment stage to `test`.
0. Select Open for Security (no tracking by access key or authentication with IAM).

   The screen before clicking.

   <amp-img width="400" alt="lambda api endpoint summary 2016-06-03 400x356" src="https://cloud.githubusercontent.com/assets/300046/15801299/019fc322-2a4e-11e6-96cb-86e863aa4adc.jpg"></amp-img>

0. Click Submit to have a URL assigned, such as:

   https://tsdwtdl0r1.execute-api.us-west-2.amazonaws.com/prod/faq

## Serverless Command-line #

Lambda functions can be defined from a command-line using the Serverless framework (formerly JAWS).

https://www.youtube.com/watch?v=fXZzVzptkeo
AWS May 2016 Webinar Series - Deep Dive on Serverless Web Applications

http://abalone0204.github.io/2016/05/22/serverless-simple-crud/

Install serverless-framework 

   npm install -g serverless

Austen Collins created the Serverless Framework

http://justserverless.com/blog/your-first-serverless-application/

http://serverlessconf.io/

http://justserverless.com/blog/nanoservices-microservices-monolith-serverless-architectures-by-example/
Phillip muens
@pmmuens
github.com/pmuens
https://gumroad.com/l/learn-serverless-book

handlers that compress or transform objects as they are uploaded to Amazon S3, 

https://gitter.im/serverless/serverless


## Dynamo DB #

To build mobile back-ends that retrieve and transform data from Amazon DynamoDB:

https://github.com/abalone0204/serverless-demo-with-dynamodb-node

https://www.youtube.com/watch?v=TuGyyTXPQ-U
1 How to use AWS API Gateway to expose AWS DynamoDB database backend
by mattua

* https://www.youtube.com/watch?v=XByPxb_VvpY
   AWS re:Invent 2015 | (DEV303) Practical DynamoDB Programming in Java
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

## Kenesis Streams #

## Resources:

* http://codurance.com/2016/05/11/aws-lambdas/

* https://www.npmjs.com/package/aws-lambda-toolkit

* https://www.youtube.com/watch?v=fXZzVzptkeo

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

* The <a target="_blank" href="https://www.w3.org/TR/REC-html40/sgml/entities.html">
HTML 4 character entity references</a> for the Greek capital and small letter lambda are "&#923;" and "&#955;". 
* The Unicode numbers for lambda are U+039B and U+03BB.

## Rock Stars #

* Tim Wagner, General Manager of AWS Lambda at Amazon, 
   Apr 10, 2015:
   <amp-youtube data-videoid="copO_JQQsBs" layout="responsive" width="480" height="270"></amp-youtube>
  
  Lambda was launched publicly November, 2015.
  Can run 100 Lambdas at the same time by default.
  Added Sychronous (Request/Response).

* Ajay Nair @ajaynairthinks Lead Product Manager for AWS Lambda

* Michael LaFrenier @MLaFrecruiter Talent Sourcer and Executive Recruiter for Amazon Web Services

* http://russmatney.com/techsposure/what-i-am-using-aws-lambda-for/
gif-to-mp4
create-timelapse
file-to-png
pngs-to-mp4
mp4s-to-timelapse
upload-to-vimeo

## More on Amazon #

This is one of a series on Amazon:

{% include aws_links.html %}
