---
layout: post
title: "Build load-balanced servers in AWS EC2 using CloudFormation"
excerpt: "This is where computers are"
tags: [AWS, EC2, cloud]
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

This tutorial describes the automated setup of multi-stage (dev+QA+prod) enterprise environments within EC2,
with servers running different operating systems,
including a
<a href="#BastionHost">bastion host</a>,
going through an <a href="#ELB">ELB</a>
into a <a href="#VPC">VPC</a>
spanning several regions.

CURRENTLY UNDER CONSTRUCTION

There are several ways to automate server setup:

   * Manually on the <a target="_blank" href="http://aws.amazon.com/"> AWS Management Console at
      http://aws.amazon.com/</a> on web browsers.
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

## Component services #

Each environment within AWS for enterprise use requires several services:

   * <a href="#AWSConsole">AWS Management Console</a>
   * <a href="#VPC">VPC</a>
   * <a href="#NAT">NAT</a>
   * <a href="#MapRegionAMI">AMI</a> by Region, with Auto-scale
   * <a href="#ELB">ELB</a>

   Diagram from <a target="_blank" href="http://blog.flux7.com/blogs/aws/vpc-best-configuration-practices">Flux7</a>:
   <amp-img width="700" height="265" alt="fig vpc flux7 700x265.jpg"
layout="responsive" src="https://cloud.githubusercontent.com/assets/300046/16153177/725a7dbe-3462-11e6-9406-33d0d98414a0.jpg"></amp-img>

PROTIP: Use separate VPC for production and development use.


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
0. Select Specify an Amazon S3 template URL.
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


<a name="AZ"></a>

### Availability zones #

Unlike the Console web page,
which shows the current Availability Zone in the upper right corner,
within CLI you use a command:

    <pre><strong>
    ec2-metadata -z
    </strong></pre>

<a name="BastionHost"></a>

## Bastion host #



<a name="MapRegionAMI"></a>

### Mapping of AMIs by Region #

Images of what is in a server containing all the software.

Each AMI is created by taking a snapshot
of what has been configured on a server.

In CF static mapping for key "AWSRegionArch2AMI",
each AMI value is specific to a unique region key:

{% highlight text %}
    "AWSRegionArch2AMI" : {
      "us-east-1"      : {"64" : "ami-f619c29f", "Amazon Linux":"ami-8fcee4e5", "Ubuntu":"ami-fce3c696"},
      "us-west-2"      : {"64" : "ami-52ff7262"},
      "us-west-1"      : {"64" : "ami-3bcc9e7e"},
      "eu-west-1"      : {"64" : "ami-e5e2d991"},
      "ap-southeast-1" : {"64" : "ami-02eb9350"},
      "ap-southeast-2" : {"64" : "ami-ab990e91"},
      "ap-northeast-1" : {"64" : "ami-14d86d15"},
      "sa-east-1"      : {"64" : "ami-0039e61d"}
    }
{% endhighlight %}


<a name="Mappings"></a>

### Mapping of Instance Types #

Within the Console, the type of machine are Instance Types.

In a CF JSON file, instance types are defined in Mappings:

{% highlight text %}
  "Mappings" : {
    "AWSInstanceType2Arch" : {
      "m1.small"   : { "Arch" : "64" },
      "m1.medium"  : { "Arch" : "64" },
      "m1.large"   : { "Arch" : "64" },
      "m1.xlarge"  : { "Arch" : "64" },
      "m2.xlarge"  : { "Arch" : "64" },
      "m2.2xlarge" : { "Arch" : "64" },
      "m2.4xlarge" : { "Arch" : "64" },
      "m3.xlarge"  : { "Arch" : "64" },
      "m3.2xlarge" : { "Arch" : "64" },
      "c1.medium"  : { "Arch" : "64" },
      "c1.xlarge"  : { "Arch" : "64" }
    },
{% endhighlight %}

   NOTE: Nowdays, 64-bit servers are all that is being used.

   QUESTION: Why is this necessary if all the values are the same?


<a name="VPC"></a>

## VPC (Virtual Private Cloud)

VPCs are really software-defined networks (SDN).

This chapter condenses http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Introduction.html

https://console.aws.amazon.com/vpc/

For security, some servers can only make outbound calls to the internet (through the <a href="#NAT">NAT server</a>).

There is one VPC per Availability Zone.

A single Gateway serves all VPCs because that is the address
the public DNS resolves corporate host names to.

In each VPC is a public subnet and a private subnet.

In the CF JSON to define a VPC, CF automatically populates the
"VpcId" : { "Ref" : "VPC" },

{% highlight text %}
  "Resources" : {
     "VPC" : {
      "Type" : "AWS::EC2::VPC",
      "Properties" : {
        "CidrBlock" : "10.0.0.0/16"
      }
    },

    "InternetGateway" : {
      "Type" : "AWS::EC2::InternetGateway",
      "Properties" : {
      }
    },

    "AttachGateway" : {
       "Type" : "AWS::EC2::VPCGatewayAttachment",
       "Properties" : {
         "VpcId" : { "Ref" : "VPC" },
         "InternetGatewayId" : { "Ref" : "InternetGateway" }
       }
    },
{% endhighlight %}


NOTE: One annoyance of EC2 at the moment is the use of
static IP addresses in configurations.


### CIDR Subnet notation #

<a name="Octets"></a>

An example CIDR subnet looks like this:

   <pre>
   10.0.1.0/18
   </pre>

   A dot separates each of the 4 "octets".
   Each bucket can be from 1 to 253.
   Two of the values cannot be used for nodes because networks use addresses of all 0's nor all 1's for their own broadcasting.


   PROTIP: Some organizations use a convention replacing the "1" in the same above with:

   * 1 for app tier zone a, 2 for zone b
   * 51 for ELB zone a, 52 for ELB zone b
   * 11 for databases (RDS), etc.

   PROTIP: Some organizations allocate the bottom half of the 255 possibilities to private and upper half to public addresses:

   * private 10.0.1.0/24 (3rd byte < 129)
   * public 10.0.129.0/24 (3rd byte > 128)

Address ranges for private (non-routed) use (per <a target="_blank" href="http://info.internet.isi.edu/in-notes/rfc/files/rfc1918.txt">RFC 1918</a>):

   * 10.0.0.0 -> 10.255.255.255     within "Class A" addresses 1 -> 126
   * 172.16.0.0 -> 172.31.255.255   within "Class B" addresses 127 -> 191
   * 192.168.0.0 -> 192.168.255.255 within "Class C" addresses 192 -> 223

   <strong>The CIDR block for a default in VPC is always 172.31.0.0/16.</strong>

PROTIP: Carefully predict how many nodes each subnet might need.
Once assigned, AWS VPC subnet blocks can’t be modified.
If you find an established VPC is too small, you’ll need to terminate all of the instances of the VPC, delete it, and then create a new, larger VPC,
then instantiate again.

<a name="NetmaskNodes"></a>

Refer to this table of nodes for each <strong>netmask</strong> Amazon allows:

   <table border="1">
   <tr><th align="right"> # Nodes </th><th align="center"> Netmask </th><th align="left"> Subnet Mask </th></tr>
   <tr><td align="right">     14 </td><td align="center"> /28 </td><td> 255.255.255.240 </td></tr>
   <tr><td align="right">     30 </td><td align="center"> /27 </td><td> 255.255.255.224 </td></tr>
   <tr><td align="right">     62 </td><td align="center"> /26 </td><td> 255.255.255.192 </td></tr>
   <tr><td align="right">    126 </td><td align="center"> /25 </td><td> 255.255.255.128 </td></tr>
   <tr><td align="right">    254 </td><td align="center"> /24 </td><td> 255.255.255.0   </td></tr>
   <tr><td align="right">    510 </td><td align="center"> /23 </td><td> 255.255.254.0   </td></tr>
   <tr><td align="right"> 65,534 </td><td align="center"> /16 </td><td> 255.255.255.240 </td></tr>
   </table>

   For example, if all you'll need are 14 nodes, specify `/28`.
   Notice that the larger the CIDR netmask, the less hosts in the subnet.

   #### Bucket of Candies Analogy #

   If you must know why, here is my analogy (best for kinesthetic learners):
   When we say a sports star makes a "7 figure salary", we figure out what that means with a table like this:

   | Figure: |         7 |       6 |      5 |     4 |   3 |  2 |  1 |
   | ------- | --------: | ------: | -----: | ----: | --: | -: | -: |
   | Values: | 1,000,000 | 100,000 | 10,000 | 1,000 | 100 | 10 |  1 |

   Now imagine a bucket for each figure level, a different size bucket containing candies of various colors and patterns, unique one for each possible value.
   People earning 7 figures can choose from the bucket holding a million possible values.

   If we add up the values (colors) possible in the right-most 3 buckets,
   we would have 100 + 10 + 1 = 111 possibilities.

   #### Counting in Base 2 #

   Instead of the way banks use to do arithmetic (called "base 10" or decimal calculations),
   where ten $1 bills is equivalent to a 10 dollar bill,
   computers count using "base 2" or binary arithmetic using 0's and 1's.
   So each of their "buckets" have a different number of possibility values:

   | Figure:        |   8 |   7 |   6 |   5 |   4 |   3 |   2 |   1 |
   | -------------- | --: | --: | --: | --: | --: | --: | --: | --: |
   | Values:        | 254 | 128 |  64 |  32 |  16 |   8 |   4 |   2 |
   | Possibilities: | 510 | 254 | 126 |  62 |  30 |  14 |   6 |   2 |

   If we add up the values possibles in the <strong>right-most</strong> 3 buckets,
   we would have 8 + 4 + 2 = 14 possibilities.

   Look back above at <a href="#NetmaskNodes">the table of nodes</a>.
   Again, 14 possibilities.

   The buckets on the <strong>left side</strong> "buckets" are used to identify <strong>subnets</strong> managed by Amazon rather than indiviual nodes.


More on CIDR (Classless Inter-Domain Routing), aka "supernetting":

   * http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario2.html

   * VLSM (Variable Length Subnet Mask)

   * https://cloudacademy.com/amazon-web-services/amazon-vpc-networking-course/build-and-configure-a-nat-instance.html


<a name="SecGroups"></a>

## Security Groups #

SGs define which ports are open.

By default, no ports are open.

A template can have additional output parameters.

{% highlight text %}
  "SecurityGroupIngress": [{
    "CidrIp": "0.0.0.0/0",
    "FromPort": 22,
    "IpProtocol": "tcp",
    "ToPort": 22
  }]
}
{% endhighlight %}


<a name="Bastion"></a>

## Bastion Hosts

Bastion hosts are used to limit exposure to the internet, to enable sysadmins to SSH into machines.

Is many setups, bastion hosts are the only servers allowed access from the public internet.

Windows users use Putty program from:

    http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe

Public and private keys:

    * Windows users download the PPK.
    * Linux/Mac users download the PEM.


<a name="ELB"></a>

## ELB (Elastic Load Balancer)

Load balancers distribute traffic among individual nodes in a cluster.

Clients reach the load balancer via a VIP (Virtual IP) address.

Some use an address outside AWS to distribute load to other clouds (servers in private locations, in Azure, etc.)


<a name="EIP"></a>

## Elastic IPs #



<a name="ACL"></a>

## ACL #

Access Control Lists can provide more fine-grained control.

There is a spearate ACL for ingress in and egress out.

ACL use degrades performance because every packet
is inspected.


<a name="NAT"></a>

## NAT #

Instances launched into an AWS VPC aren’t directly accessible from internet, so by default are more secure.

To expose nodes to the public internet, configure NAT rules
for use with a public <a href="#VPC">VPC</a>

Network Address Translation enables servers in private subnets to communicate with the public Internet outside the farm.

An example of how NAT is configured in a CF JSON file:

{% highlight text %}
  "Parameters" : {

    "NATInstanceType" : {
      "Description" : "NAT EC2 instance type",
      "Type" : "String",
      "Default" : "m1.small",
      "AllowedValues" : [ "m1.small","m1.medium" ]
    },
{% endhighlight %}

   The "m1.small" is defined in <a href="#Mappings">Mappings</a>.

   In the CF JSON Resources section:

{% highlight text %}
    "NAT" : {
      "Type" : "AWS::EC2::Instance",
      "Properties" : {
        "InstanceType" : { "Ref" : "NATInstanceType" },
        "ImageId" : { "Fn::FindInMap" : [ "AWSRegionArch2AMI", { "Ref" : "AWS::Region" },
                      { "Fn::FindInMap" : [ "AWSInstanceType2Arch", { "Ref" : "NATInstanceType" }, "Arch" ] } ] },
        "SubnetId" : { "Ref" : "PublicSubnet1" },
        "SourceDestCheck" : "false",
        "DisableApiTermination" : "true",
        "SecurityGroupIds" : [ { "Ref" : "NATSecurityGroup" } ],
        "Tags" : [
          { "Key" : "Name", "Value" : { "Fn::Join" : ["", [
              "NAT-", { "Ref" : "VPC"} ]] } }
        ]
      }
    },

    "NATIP" : {
      "Type" : "AWS::EC2::EIP",
      "Properties" : {
        "Domain" : "vpc",
        "InstanceId" : { "Ref" : "NAT" }
      }
    },

   "NATSecurityGroup" : {
      "Type" : "AWS::EC2::SecurityGroup",
      "Properties" : {
        "GroupDescription" : "NAT Security Group",
        "VpcId" : {"Ref" : "VPC"},
        "SecurityGroupIngress" : [
          { "IpProtocol" : "-1", "FromPort" : "1", "ToPort" : "65535", "SourceSecurityGroupId" : { "Ref" : "PrivateSG" } },
          { "IpProtocol" : "icmp", "FromPort" : "-1", "ToPort" : "-1", "SourceSecurityGroupId" : { "Ref" : "PrivateSG" } }
        ]
      }
    },
{% endhighlight %}

The "EIP" is an Elastic IP to the public.

NOTE: NAT servers are physical appliances, so no SSH key pairs are
used to log into the instance.

NAT instances are a Single Point of Failure (SPOF),
so monitoring and automated replacement is needed.


<a name="VPN"></a>

## VPN (Virtual Private Network)
VPN is not an Amazon invention.

VPN secures the network between data centers.
So VPN are said to extend data centers.

The CorporateCidrIP parameter in the CF JSON Parameters section
(at the top)
is the IP address VPC allowed
inbound access.

{% highlight text %}
    "CorporateCidrIp" : {
      "Description" : "Your Company's CidrIp (to restrict traffic to be authorized ONLY from corporate office)",
      "Type" : "String",
      "Default" :  "0.0.0.0/0"
    }
{% endhighlight %}

Cidr (Classless Inter-Domain Routing) is also called "supernetting"
becuase it allows more flexible allocation of Internet Protocol (IP) addresses. Whatever.



<a name="AutoScale"></a>

## Auto-Scale

Amazon charges by the hour, even if the server was used only a few minutes.

The cooldown period to remove servers is 5 minutes
(x60 = 300 seconds).

### Auto-Scaling Config

Auto scaling launches specific AMI instances.

{% highlight html %}
as-create-launch-config
--image-id  (an Amazon Linux AMI)
--instance-type t1.micro
--key <YourKeyName>
--group <YourSecurityGroup>
--user-data-file as-bootstrap.sh
--launch-config lab-lc
{% endhighlight %}

### Create Auto Scaling Group

{% highlight html %}
as-create-auto-scaling-group
lab-as-group
--availability-zones <YourAvailabilityZone>
--launch-configuration lab-lc
--load-balancers <YourElasticLoadBalancer>
--max-size 5
--min-size 1
{% endhighlight %}

PROTIP: There is a maximum of 5 in a group being scaled.

The response is:

    ```
    OK-Created AutoScalingGroup
    ```

### Verify Auto Scaling

0. In the AWS Management Console | Services | EC2 | Instances.
0. Select instance without a name. Refresh.
0. Status Checks should say "2/2".
0. Copy the Public DNS and paste it in a browser.

   It should say CPU Load: 0%.

0. Click <strong>Generate Load</strong>.

> The condition for auto-scaling is to terminate one of the instances.

> Identify the amount of time between when the condition occurs
to when the new instance can accept and process requests.

Consider the time sequence:

   * CloudWatch aggregation makes data available (60 seconds)
   * Auto Scaling Trigger is invoked (polling every 60 seconds)
   * New instance is populated (several minutes)
   * New instance is placed in Load Balancer.


<a name="TagAutoScale"></a>

### Tag Auto Scaling Resources

0. Click the gear icon to Show/Hide columns.

<pre>
as-create-or-update-tags
--tag "id=lab-as-group, t=auto-scaling-group, k=Name, v=AS-Web-Server, p=true"
</pre>

### Create Auto Scaling Notifications

0. This uses Amazon's Simple Notification Service (SNS).
   Go to that among AWS Management Console.
0. Click Get Started.
0. Click Create Topic.
0. For Topic Name, type "lab-as-topic".

    PROTIP: Define a naming convention for topics.

0. Click Create Topic.
0. Click Create Subscription.
0. Click Email for Protocol.
0. Type an email address in the Enpoint box.

    PROTIP: Specify a <strong>group</strong> email.

0. Click Create Subscription.
0. Specify the Topic ARN.

{% highlight html %}
as-put-notification-configuration <lab-as-group>
--topic-arn <TopicARN>
--notification-types autoscaling:EC2_INSTANCE_LAUNCH, autoscaling:EC2_INSTANCE_TERMINATE
{% endhighlight %}

### Auto Scaling Policies

{% highlight html %}
as-put-scaling-policy lab-scale-up-policy
--auto-scaling-group <lab-as-group>
--adjustment=1
--type ChangeInCapacity
--cooldown 300
{% endhighlight %}

To scale down:

{% highlight html %}
as-put-scaling-policy lab-scale-down-policy
--auto-scaling-group lab-as-group "--adjustment=-1"
--type ChangeInCapacity
--cooldown 300
{% endhighlight %}


   <pre>
   as-describe-scaling-activities --show-long
   </pre>

## Rolling Updates #

The "immutable infrastructure" philosophy is one doesn't change servers, even security patches.
Instead, one substitutes old server instances with new instances --
using <strong>rolling updates</strong> of small batches.

The CloudFormation <a target="_blank" href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-updatepolicy.html">
UpdatePolicy</a> attribute for <strong>Auto Scaling Groups</strong>.

Andreas Wittig (@andreaswittig from Stuttgard, Germany,
<a target="_blank" href="https://app.pluralsight.com/library/courses/aws-automating-cloudformation">
on CodeMentor</a>)
and Michael show you:

   * <a target="_blank" href="https://cloudonaut.io/rolling-update-with-aws-cloudformation/">
   Rolling Update with AWS CloudFormation</a>

   * <a target="_blank" href="https://app.pluralsight.com/library/courses/aws-automating-cloudformation">
   "Automating AWS with CloudFormation" Pluralsight 1 hour 19 minute video course</a> released 5 Apr 2016
   refers to a hypothetical admin ("called Adam") who creates a bastion host
   as well as a WordPress app server using MySQL.

   * <a target="_blank" href="http://bit.ly/1QY1iDM">
   Amazon Web Services in Action</a> Manning book.



<a name="CloudWatch"></a>

## CloudWatch #

   CloudWatch is necessary to detect when instances need to be
   added or removed.

   The conditions can be CPU utilization percentage
   over a period of time,
   or something more elaborate.

   0. In AWS Services, select CloudWatch.
   0. Click Alarms.
   0. Create Alarm.
   0. Search for By Auto Scaling Group on the CloudWatch Metrics by Category page.
   0. Select AutoScalingGroupName "lab-as-group".
   0. Select Metric Name "CPUUtilization". Next.
   0. Type High CPU Alarm in Name box. Description.
   0. In Whenever drop-down list, select exceeds or equals >=50
   (50%) for one consecutive period.
   0. CLick + AutoScaling Action.

   PROTIP: A full set of triggers need to include all the components,
   which include memory, disk space, file handles, available ports, etc.

   <a name="CloudFront"></a>

## CloudFront #

   CloudFront is Amazon's CDN (Content Delivery Network)
   where files in S3 (Simple Storage Service)
   are spread around the world.

   Compared with Akamai, CloudFront has no minimum usage costs.

   CloudFront is among green icons for
   Management Tools in the Services gallery.

   CloudFront has one Resource Type: Distribution.


## Direct connect #

One can directly connect an on-premise network to an AWS VPC.

PROTIP: Direct connects have a set static bandwidth,
so plan accordingly.

## More on Amazon #

This is one of a series on Amazon:

{% include aws_links.html %}
