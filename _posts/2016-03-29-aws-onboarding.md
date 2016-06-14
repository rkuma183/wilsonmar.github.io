---
layout: post
title: "AWS On-boarding"
excerpt: "You'll like it here"
tags: [AWS, EC2, cloud, on-boarding]
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

There are several ways to get entry to work within AWS:

0. <a href="#AWSConsole">Manually on a browser AWS Management Console</a>
0. Elastic Beanstalk
0. CloudFront
0. <a href="#CLI">Command line</a>
0. Automated using Ansible

### Tutorials #

Tutorials in Amazon's Qwiklabs use the manual approach,
so it's presented here to provide notes.


<a name="AWSConsole"></a>

## AWS Management Console

0. Use an internet browser to get on the AWS Console at <a target="_blank" href="http://aws.amazon.com/">
   http://aws.amazon.com/</a> on web browsers. For mobile devices:


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

   The AWS Management Console
   is now used for <strong>manual review</strong> of one
   Availability Zone at a time.

### Set icon bar with your favorite services #

0. There are several ways to select a service.
  One is clicking the icon in the gallery.

0. Copy the public DNS to clipboard, for example:

    ec2-11-22-33-444-compute-1.amazonaws.com

0. Download the PEM/PPK.

## Services and Categories #

* <a target="_blank" href="http://aspenroo.com/challenge-me.php">
   Memorize what each service belongs in which category (drag and drop)</a>

## Automation coming #

In enterprises today, servers are built by
scripts and configuration files
generated from templates.
This is so the build process can be debugged
and changed slightly through the lifecycle from test to prod.

Instead of clicking and typing, server administrators work with
template files in JSON format for Cloud Formation to process.

The next step up is to use Atlas
which generates  
JSON files based on information typed into their web Consoles.


<a name="CLI"></a>

## AWS CLI #

The <a href="#CLI">command line interface</a>
is used by programs rather than the manual Console.

These inputs to generators (and the generator code)
are saved in version control systems like Git.

To install AWS CLI:

   <tt><strong>
   brew update<br />
   brew install awscli
   </strong></tt>

To get what version you have:

   <tt><strong>
   aws \-\-version
   </strong></tt>

   Sample response (June 4, 2016):

   <pre>
   aws-cli/1.10.34 Python/2.7.10 Darwin/15.4.0 botocore/1.4.24
   </pre>

   Notice Python 2.7 is being used, not Python 3.
   <a target="_blank" href="https://github.com/boto/botocore">
   The Python package botocore on GitHub</a>
   provides a low-level foundation for AWS CLI software.

To enable bash completion for aws commands:

   <tt><strong>
   echo 'complete -C aws_completer aws' >> ~/.bashrc
   </strong></tt>

To configure <a target="_blank" href="https://console.aws.amazon.com/iam/home?#home">IAM</a>:

   <tt><strong>
   aws configure
   </strong></tt>

   The default region name is `us-west-2`.

   The default output format is `json`.

For a list of commands:

   <tt><strong>
   aws command help
   </strong></tt>

See http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-using.html

## Social #

* <a target="_blank" href="https://www.reddit.com/r/aws/">
  Reddit</a>

## Rock Stars #

* <a target="_blank" href="https://aws.amazon.com/blogs/aws/">
  AWS Blog</a> by Chief Evangelist Jeff Barr
  <a target="_blank" href="https://www.twitter.com/@jeffbarr/">@jeffbarr</a>

* <a target="_blank" href="https://twitter.com/search?q=%23aws&src=typd">
  #AWS Twitter hash-tag</a>

Yan Kurniawan

* <a target="_blank" href="https://leanpub.com/ansible-for-aws">
   Ansible for AWS book</a> 280 pages for minimum $30 published on 2016-01-15 by Yan Kurniawan living in Sydney, Australia
    #ansible4aws.

* <a target="_blank" href="https://github.com/yankurniawan/ansible-for-aws">
    https://github.com/yankurniawan/ansible-for-aws</a>

* https://console.aws.amazon.com/ec2/home

* https://aws.amazon.com/powershell  
   for Windows</a>

   Get-AWSCredentials -ListProfiles

* 	http://www.lynda.com/AWS-tutorials/Amazon-Web-Services-Essential-Training/

* http://joconner.com/

## AWS Training #

	http://www.pluralsight.com/courses/aws-certified-sysops-admin-associate

	https://scotch.io/tutorials/deploying-a-mean-app-to-amazon-ec2-part-1

	https://scotch.io/tutorials/deploying-a-mean-app-to-amazon-ec2-part-2


	https://www.aws.training/home?courseid=8&language=en-US&src=web_en_course-developing&view=table



## Git #

   Git-History

   Invoke-History 13



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

0.
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

## Diagrams #

<a target="_blank" href="https://www.processon.com/">
ProcessOn.com</a>
provides a free on-line tool to draw diagrams such as
<a target="_blank" href="https://www.processon.com/view/56e785b1e4b05387d0391d33">
this</a>

Amazon provides icons in a sample PowerPoint file you cut and paste,
or you can download a zip containing icon .png and .svg files.


## People #

* Matt Wood, @mza, Product Strategy @ Amazon Web Services


## More on Amazon #

This is one of a series on Amazon:

{% include aws_links.html %}
