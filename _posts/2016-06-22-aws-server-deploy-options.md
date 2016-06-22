---
layout: post
title: "AWS server deployment options"
excerpt: "Pick which crew of robots to build your servers"
tags: [AWS, EC2, cloud, automation]
image:
# feature: pic data center slice 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622043/8b1f9cce-0584-11e6-8b9f-4b6db5bb6e37.jpg
  credit:
  creditlink:
comments: true
---
<a href="https://wilsonmar.github.io/aws-server-deploy-options/">https://wilsonmar.github.io/aws-server-deploy-options</a>

<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This tutorial describes the options AWS provides to automate setup of multi-stage (dev+QA+prod) enterprise environments within EC2.

The options:

   * <a href="#ManualConfig">Manually configure</a> the various components using the
   <a target="_blank" href="http://aws.amazon.com/"> AWS Management Console at
      http://aws.amazon.com/</a> on internet browsers.
    See [my AWS On-boarding](/aws-onboarding/) for a tutorial on the AWS Management Console and Consoles on mobile devices.

   * <a href="#Beanstalk">Elastic Beanstalk</a> for developers to quickly bring up standard server configurations with no SSH capability.

   * <a href="#Opsworks">Opsworks</a> "configuration as code service" which sets up servers by
   running <strong>Chef</strong> recipies obtained from a Chef Cookbook repository.

   * <a href="#CF">CloudFormation</a> for sysadmins to create JSON template files which configure ALL AWS services.

   * Value-added services outside Amazon, such as <a target="_blank" href="https://www.hashicorp.com/#products">
   Terraform (and licensed Atlas) from Hashicorp</a>.

   <amp-img width="651" height="356" alt="hashicorp atlas 2014-12-08-at-10-09-am.png"
layout="responsive" src="https://cloud.githubusercontent.com/assets/300046/16084480/3664cfcc-32d6-11e6-91a2-f3bffad430b8.png"></amp-img>


All these follow an "idempotent" approach of specifying what is desired rather than specific sequences of actions.

<hr />

<a name="ManualConfig"></a>

## Manually configure component services #

Each environment within AWS for enterprise use requires several services.
Here is the sequence of dependencies:

   0. VPN
   0. <a href="#VPC">VPC</a>
   0. <a href="#NAT">NAT</a>

   0. <a href="#DNS">DNS</a>
   0. <a href="#ELB">ELB</a>

   0. <a href="#MapRegionAMI">AMI</a> by Region, with Auto-scale

<hr />

<a name="Beanstalk"></a>

## Elastic Beanstalk #

<a target="_blank" title="By Amazon Web Services LLC [CC BY-SA 3.0 (http://creativecommons.org/licenses/by-sa/3.0)], via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File%3AAWS_Simple_Icons_Compute_AWSElasticBeanstalk.svg"><img align="right" width="100" height="100" alt="AWS Simple Icons Compute AWSElasticBeanstalk" src="https://upload.wikimedia.org/wikipedia/commons/8/8f/AWS_Simple_Icons_Compute_AWSElasticBeanstalk.svg"/></a>

Before doing this, setup default
VPC, subnets, and Security Groups.

0. <a target="_blank" href="https://us-west-2.console.aws.amazon.com/elasticbeanstalk/home?region=us-west-2#/gettingStarted">
   Services > Compute > Beanstalk</a>

   NOTE: You can't SSH into individual servers.

0. Specify an <strong>Application Name</strong>.

   PROTIP: Define a convention that applies to apps, such as a project, feature, and version number, such as
   PS1-bean2-node-v01.

   PROTIP: Include in the name a code for the platform being used.

0. Select a <strong>Platform</strong>.

   <amp-img width="305" height="227" alt="aws beanstalk platforms 2016-06-04 610x454"
layout="responsive" src="https://cloud.githubusercontent.com/assets/300046/15802811/6295c404-2a7d-11e6-8a6c-a446a0058732.png"></amp-img>

0. Click <strong>Configure more options</strong>.

   Beanstalk is considered a "Platform-as-a-Service" (PaaS),
   that does the "heavy lifting" to get infrastructure online,
   with load balancing, autoscaling, and health monitoring.

   The Virtual Machine is for the Platform chosen in the previous step.

   The <strong>Low cost</strong> configuration preset is the default.

   In the Scaling section, the Environment type is <strong>single instance</strong>.

0. Click the <strong>Highly available</strong> configuration preset.

   Notice the Environment type changed to "loadbalancing, autoscaling" with
   Scale instance: 1-4.

   Beanstalk is free to use. You only pay for servers deployed by it.

0. Click Modify in the Notifications section and input your email address.

0. Switch temporarily to your email to confirm the subscription.

0. Since this is a tutorial, select the <strong>Low cost single instance</strong>.

0. Scroll down to click <strong>Create app</strong>.

### Beanstalk Settings #

Configuration information stored in the <strong>.ebextensions</strong> folder containing:

* a dynamodb.config

   The file contains functions definitions such as `Fn::GetOptionSetting:` with parameters.

* a options.config files.

* The <strong>.elasticbeanstalk</strong> folder ???



<hr />


<a href="Opsworks"></a>

## Opsworks Chef #

Opsworks is a higher level tool than CloudFormation,
offering more customization than Elastic Beanstalk.

0. <a target="_blank" href="https://console.aws.amazon.com/opsworks/home?region=us-west-2#">
   Services > Management Tools > Opsworks</a>

0. Click Add your first stack.

   NOTE: You cannot mix and match Windows with Linux servers.

Opsworks is called a "configuration as code service"
because it sets up servers by
running <strong>Chef</strong> recipies obtained from a Cookbook repository.

   NOTE: There is no equivalent for Puppet.

Each "layer" is a blueprint and container for instances.
(JSON) defining stacks:

* OpsWorks
* ECS
* RDS

   A different Chef recipie for each event within the lifecycle :

   * Setup
   * Configure
   * Deploy
   * Undeploy
   * Shutdown

Each server has a Chef agent installed.


<hr />

<a name="CF"></a>

## CloudFormation #

CF can span two or more Availability Zones
in a multi-subnet VPC.

   PROTIP: With such complexity, better use a JSON file
   which contains all the resource specifications.

0. In the AWS Management Console Services gallery, click
   Cloud Formation.
0. Click Create New Stack.

   NOTE: One CF template can be used to create multiple stacks.

0. In the Stack Name box, type "Lab" or other name.
0. Select Specify an <a href="#S3Template">Amazon S3 template URL</a>.
0. Paste the URL. An example is provided at:

    <pre>
    http://us-east-1-aws-training.s3.amazonaws.com/self-paced-lab-15/VPC1.json
    </pre>

    This one has additional security groups and output parameters:

    <pre>
    http://us-east-1-aws-training.s3.amazonaws.com/self-paced-lab-15/VPC2.json
    </pre>

0. Click Next.
0. On the Specify Parameters page, leave the default settings.
0. Click Next in the Options page (no Tags).
0. Click Create after reviewing.
0. Click Events tab.
0. Click Refresh occassionally.
0. On the Services menu, click VPC to see results.

To be able to delete the stack, first turn off <strong>Termination Protection</strong>:

0. Select EC2 from the Services gallery.
0. Click Instances.
0. <strong>Right-click</strong> on the running instance
   to Change Termination Protection.
0. Click Yes, Disable.
0. Now back on Cloud Formation service.
0. Select the box for the stack to be deleted.
0. Click Delete Stack.
0. Click Yes, Delete.


### CF Front Matter #

This section is based on the
<a target="_blank" href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-reference.html">
Template Reference at https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-reference.html</a>.

   All CF templates must have a version, even though it's always "2010-09-09":

{% highlight text %}
{
  "AWSTemplateFormatVersion" : "2010-09-09",
  "Description" : "Prod VPC with 4 subnets across 2 Availability Zones, and a bastion host.",
  ...
{% endhighlight %}

   PROTIP: Use #tags as  metadata in the Description to
   automate search among multiple files.

<a name="AZ"></a>

### Resources #

{% highlight text %}
"Resources": {
  "EC2Instance": {
    "Type": "AWS::EC2::Instance",
    "Properties": {
      "ImageId": "ami-bff32ccc",
      "InstanceType": "t2.nano",
      "NetworkInterfaces": [{
        "GroupSet": [{"Ref": "SecurityGroup1"}]
        "SubnetId": "..."
      }]
    }
  },
  "ElasticIP": {...},
  "SecurityGroup": {...}
}
{% endhighlight %}


## More on Amazon #

This is one of a series on Amazon:

{% include aws_links.html %}
