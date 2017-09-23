---
layout: post
title: "Terraform from Hashicorp"
excerpt: "AWS CloudFormation + DSC for many clouds"
tags: [DevOps, ecosystem]
shorturl: "https://goo.gl/"
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

This tutorial is a step-by-step hands-on introduction to use of Terraform to deploy a cluster of web servers and a load balancer on AWS and other providers (clouds).

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.

Repeatable. Versioned. Documented. Automated. Testable. Shareable.

https://www.terraform.io/intro/index.html

## Competitors to Terraform

<a target="_blank" href="https://blog.gruntwork.io/why-we-use-terraform-and-not-chef-puppet-ansible-saltstack-or-cloudformation-7989dad2865c#.63ls7fpkq">NOTE</a> Other IAC tools include Chef, Puppet, Ansible, SaltStack, AWS CloudFormation.

<table border="1" cellpadding="4" cellspacing="0">
<tr valign="bottom"><th> &nbsp; </th><th> CloudFormation </th><th> Terraform </th></tr>
<tr><td> Configuration format </td><td> JSON </td><td> HCL/JSON </td></tr>
<tr><td> State management </td><td> JSON </td><td> HCL/JSON </td></tr>
<tr><td> Execution control </td><td> No </td><td> Yes </td></tr>
<tr><td> Logical comparisons </td><td> No </td><td> Limited </td></tr>
<tr><td> Iterations </td><td> No </td><td> Yes </td></tr>
<tr><td> Manage already create resources </td><td> No </td><td> Yes (hard) </td></tr>
<tr><td> Providers support </td><td> AWS only </td><td> AWS, GCE, Azure (20+) </td></tr>
<tr><td> Failure handling </td><td> Optional rollback </td><td> Fix &amp; retry </td></tr>
<tr><td> Contribute? </td><td> No </td><td> Yes (issue 28) </td></tr>
</table>

Both CF and Terraform work with JSON, but Terraform works with HCL (Hashicorp Configuratio Language) that is both human and machine friendly. https://github.com/hashicorp/hcl and described at https://www.terraform.io/docs/configuration/syntax.html

But Terraform also provides execution control, iterations, and (perhaps most of all) management of resources already created (desired state configuration) over several cloud providers (not just AWS).


## Installation #

Release 0.6.8 (2.12.2015)

Terraform was written in Golang. ["Read all about it here"](/golang/).

On MacOS:

   <tt><strong>brew install -g terraform
   </strong></tt>

   The response at time of writing:

   <pre>
==> Downloading https://homebrew.bintray.com/bottles/terraform-0.10.6.sierra.bot
######################################################################## 100.0%
==> Pouring terraform-0.10.6.sierra.bottle.tar.gz
==> Caveats
zsh completions have been installed to:
  /usr/local/share/zsh/site-functions
==> Summary
🍺  /usr/local/Cellar/terraform/0.10.6: 7 files, 63.6MB
   </pre>   

   PROTIP: Terraform is written in the [Go language](/golang/), so there is no JVM to download as well.


0. Initialize plug-ins:

   <tt><strong>terraform init
   </strong></tt>

   Response:

   <pre>
Initializing provider plugins...
- Checking for available provider plugins on https://releases.hashicorp.com...
- Downloading plugin for provider "aws" (0.1.4)...   
&nbsp;
The following providers do not have any version constraints in configuration,
so the latest version was installed.
&nbsp;
To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.
&nbsp;
* provider.aws: version = "~> 0.1"
&nbsp;
Terraform has been successfully initialized!
&nbsp;
You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.
&nbsp;
If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
   </pre>

   ### Sample scripts

   Sample scripts have been prepared by several helpful people.

0. Create or navigate to a folder that will house new repositories. For example:

   ~/gits/terraform/gruntwork-io

0. Get a sample repo 

   <tt><strong>git clone <a target="_blank" href="https://github.com/gruntwork-io/intro-to-terraform">
   https://github.com/gruntwork-io/intro-to-terraform.git</a> \-\-depth=1 && cd intro-to-terraform
   </strong></tt>

   At time of writing:

   <pre>
Cloning into 'intro-to-terraform'...
remote: Counting objects: 12, done.
remote: Compressing objects: 100% (12/12), done.
remote: Total 12 (delta 1), reused 9 (delta 0), pack-reused 0
Unpacking objects: 100% (12/12), done.
   </pre>  

0. Navigate into:

   <tt><strong>cd single-web-server
   </strong></tt>

0. Open folder using Atom or list files:

   <tt><strong>ls -al
   </strong></tt>

   PROTIP: There should be only one <strong>main.tf</strong> per folder because Terraform commands look for that first.

   NOTE: Terraform declarative files coded end with <strong>.tf</strong> file type.

   <strong>.tfstate</strong> files (containing JSON) are autogenerated to persist the state of runs. This can also be in a Hasicorp Consul server. Terraform creates a dependency graph (specfically, a Directed Acyclic Graph).
   This is so that nodes are built in the order they are needed. 

   NOTE: State files can contain secrets.

   It also dentifies additions and deletions.

   A lock file is creaetd to prevent other Terraform instances to 

   <a target="_blank" href="https://www.terraform.io/docs/configuration/syntax.html">
   NOTE</a>: Terraform code is written in a declarative language called HCL (HashiCorp Configuration Language).

0. Edit file <strong>main.tf</strong>. Widen the screen width to avoid wrapping.

   Annotations are as in bash scripts: Single line comments start with # (pound sign).<br />
   Multi-line comments are wrapped between /* and \*/. Values can be interpolated usning syntax wrapped in ${}, such as ${var.foo}. 

0.

   `vars.tf` file contains specifcation of values to variables, such as the server port (8080).

   <pre>
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default = 8080
}
    </pre>

   `outputs.tf` file 

   <pre>
output "public_ip" {
  value = "${aws_instance.example.public_ip}"
}
   </pre>

0. PROTIP: Make sure that the AWS region is what you want.

   https://www.terraform.io/docs/providers/aws/r/instance.html
   AWS provider

   NOTE: The contents of the repo were written based on Terraform 0.7.x.

0. PROTIP: If the AMI is no longer available, you will get an error message.

    <pre>ami = "ami-2d39803a"</pre>



   ### Terraform Plan

0. Have Terrform evaluate based on vars in a different (parent) folder:

   <tt><strong>terraform plan -var-file='..\terraform.tfvars'
   </strong></tt>

   A sample response:

   "&LT;computered>" means Terraform figures it out.


   * terraform.tfstate stored in S3, Atlas, Consul, etcd, HTTP


   ### Version

0. Obtain version installed:

   <tt><strong>terraform version 
   	</strong></tt>

   Alternately:

   <tt><strong>terraform \-\-version 
   	</strong></tt>

   The response at time of writing:

   <pre>
   	Terraform v0.10.6
   </pre>

   QUESTION: Pace of change?

   TODO: Update terraform

   ### AWS Configuration

export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)


   ### Command list

0. For a list of commands:

   <tt><strong>terraform 
   	</strong></tt>

   The response at time of writing:

   <pre>
Usage: terraform [--version] [--help] &LT;command> [args]
&nbsp;
The available commands for execution are listed below.
The most common, useful commands are shown first, followed by
less common or more advanced commands. If you're just getting
started with Terraform, stick with the common commands. For the
other commands, please read the help and docs before usage.
&nbsp;
Common commands:
    apply              Builds or changes infrastructure
    console            Interactive console for Terraform interpolations
    destroy            Destroy Terraform-managed infrastructure
    env                Workspace management
    fmt                Rewrites config files to canonical format
    get                Download and install modules for the configuration
    graph              Create a visual graph of Terraform resources
    import             Import existing infrastructure into Terraform
    init               Initialize a Terraform working directory
    output             Read an output from a state file
    plan               Generate and show an execution plan
    providers          Prints a tree of the providers used in the configuration
    push               Upload this Terraform module to Atlas to run
    refresh            Update local state file against real resources
    show               Inspect Terraform state or plan
    taint              Manually mark a resource for recreation
    untaint            Manually unmark a resource as tainted
    validate           Validates the Terraform files
    version            Prints the Terraform version
    workspace          Workspace management
&nbsp;
All other commands:
    debug              Debug output management (experimental)
    force-unlock       Manually unlock the terraform state
    state              Advanced state management
   </pre>

  Automating infrastructure deployment consists of:

  * Provisioning resources
  * Planning updates
  * Using source control
  * Reusing templates

  PROTIP: Terrform files are "idempotent" (repeat runs don't change anything if nothing is changed). Thus Terraform defines the "desired state configuration".

## Modules

## Deploy a single web server

## Deploy a cluster of web servers

## Deploy a load balancer

## Clean up


## Resources

   * IRC 
   * Mailing List
   * StackOverflow

* <a target="_blank" href="https://www.terraform.io/intro/getting-started/install.html">
   Official Getting Started docs at Hashicorp</a>
 focus on individual elements (i.e. resources, input variables, output variables, etc).

* <a target="_blank" href="https://www.youtube.com/watch?v=rgzzkP2L1k8">
Manage AWS infrastructure as code using Terraform</a>
talk in Norway 14 Dec 2015
by Anton Babenko
https://github.com/antonbabenko
linkedin.com/in/antonbabenko


### Video courses at Pluralsight.com:

* <a target="_blank" href="https://www.pluralsight.com/courses/terraform-getting-started">
Terraform - Getting Started (Beginner level)</a> Sep 14 2017 [3:11]
by Ned Bellavance (<a target="_blank" href="https://twitter.com/ned1313/">@ned1313</a>, <a target="_blank" href="https://www.nedinthecloud.com/">nedinthecloud</a>), MS MVP.

* <a target="_blank" href="https://www.pluralsight.com/courses/terraform-automating-aws-vsphere">
Automating AWS and vSphere with Terraform (Intermediate level)</a> Jun 12 2017[ 1:22]
by Nick Colyer
<br /><br />

### YouTube videos:

* <a target="_blank" href="https://www.youtube.com/watch?v=p2ESyuqPw1A">
Terraform w/ Lee Trout Chadev</a>

* <a target="_blank" href="https://www.youtube.com/watch?v=WdV4eYZO5Ao">
Automating Infrastructure Management with Terraform</a>
at SF CloudOps Meetup
<br /><br />

Blogs:

* <a target="_blank" href="https://blog.gruntwork.io/an-introduction-to-terraform-f17df9c6d180">
Gruntwork's Introduction</a>

http://www.terraformupandrunning.com/?ref=gruntwork-blog-comprehensive-terraform


## AWS Cloud Formation

<a target="_blank" href="http://www.slideshare.net/AntonBabenko/managing-aws-infrastructure-using-cloudformation">
Puppet, Chef, Ansible, Salt</a>
AWS API libraries Boto, Fog



   NOTE: Terraform remote configures remote state storage with Terraform.

