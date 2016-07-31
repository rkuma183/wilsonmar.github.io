---
layout: post
title: "AWS DevOps"
excerpt: "Developer Operations for you"
tags: [AWS, EC2, cloud, on-boarding]
image:
# feature: pic data center slice 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622043/8b1f9cce-0584-11e6-8b9f-4b6db5bb6e37.jpg
  credit:
  creditlink:
comments: true
---
<a target="_blank" href="https://wilsonmar.github.io/aws-onboarding/">
https://wilsonmar.github.io/aws-onboarding/</a>

<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This tutorial focuses on continuous integration and deployment.

<hr />

<a name="CodeDeploy"></a>

## CodeCommit, CodePipeline, Code Deploy #

### Setup instances #

0. In IAM Service, create Role "codedeploy".

0. Create CDInstanceRole

0. In Compute EC2 service, launch Amazon Linux, t2.micro, 2 instances, using the role created above.
   In Advanced Details, paste script from https://gist.github.com/mikepfeiffer/4d9386afdcceaf29493a

   EC2 UserData script to install <strong>CodeDeploy agent</strong>:

   <pre>
   #!/bin/bash
   yum install -y aws-cli
   cd /home/ec2-user/
   aws s3 cp 's3://aws-codedeploy-us-east-1/latest/codedeploy-agent.noarch.rpm' . --region us-east-1
   yum -y install codedeploy-agent.noarch.rpm
   </pre>

   CUSTOMIZE folder, region mentionedtwice.

0. Tag instances with name "Dev" for Development.
0. Add a Security Group Role for HTTP. No SSH.

### AWS CodeDeploy Setup #

0. <a target="_blank" href="https://us-west-2.console.aws.amazon.com/codedeploy/home?region=us-west-2#/first-run/welcome">
   Got to AWS CodeDeploy service, Get Started Now</a>.
0. Custom deployment.
0. Specify an Application Name and Deployment Group Name according to your organization's naming standards.
0. Select Tag Type "Amazon EC2" value "Dev" specified for 2 instances in a step above.
0. Deployment Config - AllAtOnce (instead of Half at a time).
0. No Triggers.
0. Select a Service Role ARN defined in a prior step. Create Application.

   The Console provides code to deploy from a S3 bucket.

### AWS CodePipeline #

0. <a target="_blank" href="https://us-west-2.console.aws.amazon.com/codepipeline/home?region=us-west-2#/create/Name">
  Go to AWS CodePipeline service, Get Started</a>.
0. Specify a Pipeline name according to your organization's naming standards. ("Pipeline1")
0. Select Source Provider: GitHub (NOT Amazon S3). Click Connect to GitHub.
0. Select a Repository and Branch from the GitHub account authenticated.
0. Select Deployment provider AWS CodeDeploy (NOT AWS Elastic Beanstalk).
0. Supply AWS CodeDeploy Application Name and Deployment group from earlier.
0. Do not define Build Stage (until we have a build).
0. Create Service Role using default name "AWS-CodePipeline-Service". View Policy Document to review Actions allowed the role:
0. Review Pipeline summary.

### View app deployed #

0. In EC2, get the Public DNS address (such as "ec2-11-222-177-132-us-west-2-compute.amazonaws.com").
0. Paste URL in an internet browser.

   It should respond with "Congratualations".

### Make Change #

0. Commit.
0. Detect a change.
0. View app deployed again.


0. Create a Deployment Group or Autoscaling Group
0. CodePipeline


0. appspec.yml file in the root folder in source code repo

   <pre>
version: 0.0
os: linux
files:
  - source: /index.html
    destination: /var/www/html/
hooks:
  BeforeInstall:
    - location: scripts/install_dependencies
      timeout: 300
      runas: root
    - location: scripts/start_server
      timeout: 300
      runas: root
  ApplicationStop:
    - location: scripts/stop_server
      timeout: 300
      runas: root
   </pre>


0. For sample application, it's just a single index.html file containing CSS, no JavaScript.

   https://github.com/mikepfeiffer/aws-codedeploy-linux/blob/master/index.html

0. Install dependencies

   <pre>
   #!/bin/bash
   yum install -y httpd
   </pre>

0. Start server

   <pre>
   #!/bin/bash
   service httpd start
   </pre>

0. Stop server:

   <pre>
   #!/bin/bash
   isExistApp = `pgrep httpd`
   if [[ -n  $isExistApp ]]; then
       service httpd stop        
   fi
   </pre>

using AWS Code Services

CodeDeploy agent in EC2 Deploy Group

* Amazon Route 53 globomantics.com

* https://github.com/mikepfeiffer/PowerShell


## AMIs #

<a target="_blank" href="https://github.com/Netflix/aminator/">
Netflix/aminator</a> open-sourced their Python tool for creating EBS-backed AMIs.
It's described in <a target="_blank" href="http://techblog.netflix.com/2013/03/ami-creation-with-aminator.html">
this blog from 2013</a>.

   "We knew that application startup latency would be very important, especially during scale-up operations."

Building a server from installers in S3
can be time-consuming because it take so much I/O.

To save time, their strategy is to create a <strong>Base AMI</strong>
by taking a snapshot of the root volume
and make it available as an EBS volume that can be used to launch an EC2 instance.

This is simpler than Packer from Hashicorp.

## More on Amazon #

This is one of a series on Amazon:

{% include aws_links.html %}



## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
