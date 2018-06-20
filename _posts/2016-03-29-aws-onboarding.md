---
layout: post
title: "AWS On-boarding"
excerpt: "You'll like it here in the cloud"
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

This tutorial focuses on getting you setup to access the AWS cloud
as a System Administrator.

<hr />

Tutorials in Amazon's Qwiklabs use the manual approach,
so it's presented here to provide notes.

   <a name="AWSConsole"></a>

   ## AWS Management Console

0. Use an internet browser to get on the AWS Console at <a target="_blank" href="http://aws.amazon.com/">
   http://aws.amazon.com/</a> on web browsers. There are apps for mobile devices:

   * <a target="_blank" href="http://www.amazon.com/AWS-Mobile-LLC-Console/dp/B00ATSN730">
   On Google Android mobile phones</a>

   * <a target="_blank" href="https://itunes.apple.com/us/app/aws-console/id580990573?mt=8">
   on Apple iPhones and iPads</a>

   <a name="Account"></a>

   ## AWS Sub-Accounts #

0. Sign-up for an AWS account using the email address of the billing administrator,
   providing your credit card.

0. Open AWS Management Console and login as the billing administrator root account.

   PROTIP: Create a sub-account to do work rather than using the account
   created for billing. 

0. Create a sub-account.

   TODO: Add steps.

0. Define <strong>group roles</strong> to permissions.

0. Grant permissions to each <strong>group</strong>.

0. Create <strong>sub-accounts</strong>.

0. Assign <strong>sub-account users</strong> to group roles.

   This sub-account will be used in the remainder of this tutorial.

   NOTE: Groups cannot be nested.

0. Create a sign-in link, such as:

   https://whatever.signin.aws.amazon.com/console

0. Delete root access.

   ## Regions #

0. Sign-in using a sub-account.

   Notice your AWS Console is tied to a particular <a href="#AvailabilityZone">
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




<a name="IAM"></a>

## IAM #

AWS Identity and Access Management (IAM) controls access to
users, groups, roles, and policies.

0. Assign permissions to make



0. List users:

   <tt><strong>
   aws iam list-users \-\-query Users[*].UserName
   </strong></tt>

0. List groups which the user belongs to :

   <tt><strong>
   aws iam list-groups-for-user \-\-username ???
   </strong></tt>



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

0. Install AWS CLI:

   <tt><strong>
   brew update<br />
   brew install awscli
   </strong></tt>

   the response I got on 20 Jun 2016:

   <pre>
   ==> Downloading https://homebrew.bintray.com/bottles/awscli-1.10.39.el_capitan.b
   ######################################################################## 100.0%
   ==> Pouring awscli-1.10.39.el_capitan.bottle.tar.gz
   ==> Caveats
   The "examples" directory has been installed to:
     /usr/local/share/awscli/examples

   Add the following to ~/.bashrc to enable bash completion:
     complete -C aws_completer aws

   Add the following to ~/.zshrc to enable zsh completion:
     source /usr/local/share/zsh/site-functions/_aws

   Before using awscli, you need to tell it about your AWS credentials.
   The easiest way to do this is to run:
     aws configure

   More information:
     https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html

   zsh completion has been installed to:
     /usr/local/share/zsh/site-functions
   ==> Summary
   🍺  /usr/local/Cellar/awscli/1.10.39: 2,778 files, 19.8M
   </pre>

0. Verify what version you have installed:

   <tt><strong>
   aws \-\-version
   </strong></tt>

   Sample response (June 4, 2016):

   <pre>
   aws-cli/1.10.38 Python/2.7.11 Darwin/15.5.0 botocore/1.4.28
   </pre>

   NOTE: Python 2.7 is being used, not Python 3.
   <a target="_blank" href="https://github.com/boto/botocore">
   The Python package botocore on GitHub</a>
   provides a low-level foundation for AWS CLI software.

0. To enable bash completion for aws commands:

   <tt><strong>
   echo 'complete -C aws_completer aws' >> ~/.bashrc
   </strong></tt>

0. To configure <a target="_blank" href="https://console.aws.amazon.com/iam/home?#home">IAM</a>:

   <tt><strong>
   aws configure
   </strong></tt>

   The default region name is `us-west-2`.

   The default output format is `json`.

0. For a list of commands:

   <tt><strong>
   aws command help
   </strong></tt>

   See http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-using.html


## Git #

   Git-History

   Invoke-History 13

## Linux AMIs #

Types of operating system AMI:

   * Amazon Linux 2014.09.2 (CentOS)
   * Red Hat Enterprise Linux 6.6 (RHEL)
   * SUSE Linux Enterprise Server 12
   * Ubuntu Server 14.04

<hr />

## Advanced User Data #

https://gist.github.com/mikepfeiffer/

   <pre>
   </pre>

* https://aws.amazon.com/powershell  
   AWS Powershell for Windows</a>

   aws Get-AWSCredentials -ListProfiles



## Diagrams #

<a target="_blank" href="https://www.processon.com/">
ProcessOn.com</a>
provides a free on-line tool to draw diagrams such as
<a target="_blank" href="https://www.processon.com/view/56e785b1e4b05387d0391d33">
this</a>

At <a target="_blank" href="https://aws.amazon.com/architecture/icons/">
architecture/icons</a> Amazon provides a sample .PPTX (PowerPoint 2010+) file
(AWS_Simple_Icons_PPT_v16.2.22.zip). Lines used to illustrate the hierarchy:
<amp-img width="238" height="183" alt="aws simple icons-238x183-63"
layout="responsive" src="https://cloud.githubusercontent.com/assets/300046/16263922/ed4eb538-3833-11e6-8a22-b72cb8f12c32.jpg"></amp-img>
PROTIP: Use different colors for lines and text to reduce visual confusion.


You can also download a zip containing .png and .svg files of icons
(AWS_Simple_Icons_EPS-SVG_v16.2.22.zip).


## S3 Bucket names

S3 Bucket names are universally unique among all AWS customers.

So just as there are domain name squatters who register and sit on .com host names
for sale at high prices to those who actually use the names,
the administrator of root accounts for an organization should
register your organization's brand names before others get them first.



## Tutorial People #

* Matt Wood, @mza, Product Strategy @ Amazon Web Services


## Social #

* <a target="_blank" href="https://www.reddit.com/r/aws/">
  Reddit on AWS</a>

* https://console.aws.amazon.com/ec2/home


## Tutorial Rock Stars and their presentations #

Jeff Barr (<a target="_blank" href="https://www.twitter.com/@jeffbarr/">@jeffbarr</a>),
AWS Chief Evangelist
makes announcements of all new stuff at the company's
   <a target="_blank" href="https://aws.amazon.com/blogs/aws/">
  AWS Blog</a> and
  <a target="_blank" href="https://twitter.com/search?q=%23aws&src=typd">
  #AWS Twitter hash-tag</a>

Yan Kurniawan

   * <a target="_blank" href="https://leanpub.com/ansible-for-aws">
   Ansible for AWS book</a> 280 pages for minimum $30 published on 2016-01-15 by Yan Kurniawan living in Sydney, Australia
  #ansible4aws.

* <a target="_blank" href="https://github.com/yankurniawan/ansible-for-aws">
    https://github.com/yankurniawan/ansible-for-aws</a>

J O'connner:

   * http://joconner.com/

Ryan Scott Brown @ryan_sb

   * https://serverlesscode.com/post/new-ssl-tls-cert-manager-acm/


## AWS Certifications #

* <a target="_blank" href="https://aws.amazon.com/certification/certified-sysops-admin-associate/">
  $150, 80-minute AWS Certified SysOps Administrator - Associate</a>

* <a target="_blank" href="https://aws.amazon.com/certification/certified-solutions-architect-associate/">
  $150, 80-minute AWS Certified Solutions Architect - Associate</a>

* <a target="_blank" href="https://aws.amazon.com/certification/certified-developer-associate/">
  $150, 80-minute AWS Certified Developer - Associate</a>

* <a target="_blank" href="https://aws.amazon.com/certification/certified-solutions-architect-professional/">
  $300, 170 minutes AWS Certified Solutions Architect - Professional</a>

* <a target="_blank" href="https://aws.amazon.com/certification/certified-devops-engineer-professional/">
  $300, 170 minutes AWS Certified DevOps Engineer - Professional</a>


## AWS Training Resources #

* <a target="_blank" href="https://www.cloudacademy.com/">
   CloudAcademy.com</a> provides hands-on lab instances with their tutorials.

* <a target="_blank" href="http://www.lynda.com/AWS-tutorials/Amazon-Web-Services-Essential-Training/">
   Lynda.com AWS tutorials</a>

* http://www.pluralsight.com/courses/aws-certified-sysops-admin-associate

* https://scotch.io/tutorials/deploying-a-mean-app-to-amazon-ec2-part-1

* https://scotch.io/tutorials/deploying-a-mean-app-to-amazon-ec2-part-2

* https://www.aws.training/home?courseid=8&language=en-US&src=web_en_course-developing&view=table

* <a target="_blank" href="https://quizlet.com/_2dk9qd/">
   Memorize AWS Acronyms as flash cards and games on Quizlet</a>


## More on Amazon #

This is one of a series on Amazon:

{% include aws_links.html %}
