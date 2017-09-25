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

## Competitors to Terraform

<a target="_blank" href="https://blog.gruntwork.io/why-we-use-terraform-and-not-chef-puppet-ansible-saltstack-or-cloudformation-7989dad2865c#.63ls7fpkq">NOTE</a>: Other IAC (Infrastructure as Code) tools include Chef, Puppet, Ansible, SaltStack, AWS CloudFormation.

https://www.terraform.io/intro/index.html


## Competitors to Terraform

<a target="_blank" href="https://blog.gruntwork.io/why-we-use-terraform-and-not-chef-puppet-ansible-saltstack-or-cloudformation-7989dad2865c#.63ls7fpkq">NOTE</a> Other IAC tools include Chef, Puppet, Ansible, SaltStack, AWS CloudFormation.

<table border="1" cellpadding="4" cellspacing="0">
<tr valign="bottom"><th> &nbsp; </th><th> CloudFormation </th><th> Terraform </th></tr>
<tr><td> Configuration format </td><td> JSON </td><td> <a href="#HCL">HCL JSON</a> </td></tr>
<tr><td> State management </td><td> JSON </td><td> <a href="#HCL">HCL JSON</a> </td></tr>
<tr><td> <a href="#Providers">Providers</a> support </td><td> AWS only </td><td> AWS, GCE, Azure (20+) </td></tr>
<tr><td> Execution control </td><td> No </td><td> Yes </td></tr>
<tr><td> Iterations </td><td> No </td><td> Yes </td></tr>
<tr><td> Manage already created resources </td><td> No </td><td> Yes (hard) </td></tr>
<tr><td> Failure handling </td><td> Optional rollback </td><td> Fix &amp; retry </td></tr>
<tr><td> Open Source contributions? </td><td> No </td><td> Yes (GitHub issues) </td></tr>
<tr><td> Logical comparisons </td><td> No </td><td> Limited </td></tr>
<tr><td> <a href="#Modules">Extensible Modules</a> </td><td> No </td><td> Yes </td></tr>
</table>

Terraform also provides execution control, iterations, and (perhaps most of all) management of resources already created (desired state configuration) over several cloud providers (not just AWS).


## Installation #

### Install on MacOS

In a Terminal window:

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

   PROTIP: Terraform is written in the [Go language](/golang/), so there is no JVM to download as well.  ["Read all about it here"](/golang/).

0. Proceed to <a href="#ScriptInit">Get sample Terraform scripts</a>.


### Install on Windows

1. In a Run command window as Administrator.
2. Install Chocolatey cmd:
3. Install Terraform using Chocolatey:

   <tt><strong>choco install terraform -y
   </strong></tt>

   The response at time of writing:

   <pre>
Chocolatey v0.10.8
Installing the following packages:
terraform
By installing you accept licenses for the packages.
Progress: Downloading terraform 0.10.6... 100%
&nbsp;
terraform v0.10.6 [Approved]
terraform package files install completed. Performing other installation steps.
The package terraform wants to run 'chocolateyInstall.ps1'.
Note: If you don't run this script, the installation will fail.
Note: To confirm automatically next time, use '-y' or consider:
choco feature enable -n allowGlobalConfirmation
Do you want to run the script?([Y]es/[N]o/[P]rint): y
&nbsp;
Removing old terraform plugins
Downloading terraform 64 bit
  from 'https://releases.hashicorp.com/terraform/0.10.6/terraform_0.10.6_windows_amd64.zip'
Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\terraform\0.10.6\terraform_0.10.6_windows_amd64.zip (12.89 MB).
Download of terraform_0.10.6_windows_amd64.zip (12.89 MB) completed.
Hashes match.
Extracting C:\Users\vagrant\AppData\Local\Temp\chocolatey\terraform\0.10.6\terraform_0.10.6_windows_amd64.zip to C:\ProgramData\chocolatey\lib\terraform\tools...
C:\ProgramData\chocolatey\lib\terraform\tools
 ShimGen has successfully created a shim for terraform.exe
 The install of terraform was successful.
  Software installed to 'C:\ProgramData\chocolatey\lib\terraform\tools'
&nbsp;
Chocolatey installed 1/1 packages.
 See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    </pre>   


<a name="ScriptInit"></a>

## Sample Terraform scripts

   Sample scripts have been prepared by several helpful people.

   The sample scripts referenced by this tutorial contain moustache variable mark-up so that you can generate a set for your organization.

   https://www.terraform.io/docs/providers/azurerm/r/virtual_machine_scale_set.html

1. Install a Git client if you haven't already.
0. Create or navigate to a container folder where new repositories are added. For example:

   `~/gits/terraform/gruntwork-io`

0. Get a sample repo (word-wrapped command):

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


   <a name="TerraformInit"></a>

   ### Plug-in Initialization

0. Initialize Terraform plug-ins:

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


   ### .tf files

0. Navigate into one of the folders (in the case of the example repo):

   <tt><strong>cd single-web-server
   </strong></tt>

0. Open folder using Atom or list files:

   <tt><strong>ls -al
   </strong></tt>


   ### Main.tf

   PROTIP: There should be only one <strong>main.tf</strong> per folder.

   NOTE: Terraform declarative files coded end with <strong>.tf</strong> file type.

   <strong>.tfstate</strong> files (containing JSON) are autogenerated to persist the state of runs. This can also be in a Hasicorp Consul server. Terraform creates a dependency graph (specfically, a Directed Acyclic Graph).
   This is so that nodes are built in the order they are needed. 

   NOTE: State files can contain secrets.

   It also dentifies additions and deletions.

   Terraform apply creates a dev.state.lock.info file as a way to signal to other processes to stay away while changes to the environment are underway.

0. Edit file <strong>main.tf</strong>. Widen the screen width to avoid wrapping.

   <a name="HCL"></a>

   Both CloudFormation and Terraform work with JSON, but Terraform works with HCL (Hashicorp Configuratio Language) that is both human and machine friendly. https://github.com/hashicorp/hcl and described at https://www.terraform.io/docs/configuration/syntax.html

   <a target="_blank" href="https://www.terraform.io/docs/configuration/syntax.html">
   NOTE</a>: Terraform code is written in a declarative language called HCL (HashiCorp Configuration Language). It's less verbose than JSON and more concise than YML.

   Unlike JSON and YML, HCL allows annotations as in bash scripts: Single line comments start with # (pound sign).<br />
   Multi-line comments are wrapped between /* and \*/. Values can be interpolated usning syntax wrapped in ${}, in the format of ${type.name.attribute}. Literal $ are coded by doubling up $$.

   Back-slashes specify continuation.

   HCL does not have conditional if/else logic, which is why modules are necessary.

   

   <a name="Providers"></a>

   ## Providers

   Terraform providers reference APIs. Examples are AWS, Google, Azure, Kubernetes, GitLab, DigitalOcean, Heroku, GitHub, OpenStack.

   https://github.com/terraform-providers

   https://github.com/hashicorp/terraform/tree/master/builtin/providers

   Metadata related to each provider are defined like this:

   <pre>
provider "aws" {
  alias = "NorthEast"
  region = "us-east-1"
}
   </pre>

   resource definitions specify the desired state of resources.

   Provisioners configurations are also plugins:

   Provisioner definitions define the properties of each resource, such as initialization commands. For example, this installs an nginx web server and displays a minimal HTML page:

   <pre>
provisioner "remote-exec" {
  inline = [
    "sudo yum install nginx -y",
    "sudo service nginx start",
    "echo "<html><head><title><title>NGINX server</title></head><body style=\"background-color"></body></html>"
  ]
}
   </pre>


0. PROTIP: Make sure that the AWS region is what you want.

   https://www.terraform.io/docs/providers/aws/r/instance.html
   AWS provider

   NOTE: The contents of the repo were written based on Terraform 0.7.x.

0. Variables file:

   `vars.tf` file contains specifcation of values to variables, such as the server port (8080).

   ### Defaults and lookup function

   PROTIP: Variables can be assigned multiple default values selected by a lookup function:

   <pre>
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# export AWS_DEFAULT_REGION=xx-yyyy-0
&nbsp;
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default = 8080
}
variable "amis" {
  type = "map”"
  default = {
    us-east-1 = "ami-1234"
    us-west-1 = "ami-5678"
  }
}
ami = ${lookup(var.amis, "us-east-1")}
   </pre>

   PROTIP: With AWS EC2, the us-east-1 region must be used as the basis for creating others.

   <a target="_blank" href="https://www.google.com/url?q=https%3A%2F%2Fdocs.aws.amazon.com%2FAWSEC2%2Flatest%2FUserGuide%2Flaunch-marketplace-console.html&sa=D&sntz=1&usg=AFQjCNGbWvcSfsheH4psSFED8ZF-w6mrqQ">NOTE</a>: Amazon has an approval process for making AMIs available on the public Amazon Marketplace.


   ### CIDR Subnet function

   <pre>
variable network_info {
   default = “10.0.0.0/8” #type, default, description
}
cidr_block = ${cidrsubnet(var.network_info, 8, 1)} # returns 10.1.0.0/16
cidr_block = ${cidrsubnet(var.network_info, 8, 2)} # returns 10.2.0.0/16
     </pre>


   <pre>
variable network_info {
   default = “10.0.0.0/8” #type, default, description
}
cidr_block = ${cidrsubnet(var.network_info, 8, 1)} # returns 10.1.0.0/16
cidr_block = ${cidrsubnet(var.network_info, 8, 2)} # returns 10.2.0.0/16
     </pre>


   ### Output

   `outputs.tf` file 

   <pre>
output "aws_elb_public_dns" {
  value = "${aws_elb.web.dns_name}"
}
output "public_ip" {
  value = "${aws_instance.example.public_ip}"
}
output "azure_rm_dns_cname" {
  value = "${azurerm_dns_cname_record.elb.id}"
}
   </pre>

0. PROTIP: If the AMI is no longer available, you will get an error message.






   NOTE: Components of Terrform are: Providers, Resources, Provisioners.

   ### AWS Configuration

export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)

   Alternatively, specify a file named `hoge` containing credentials:

   <pre>
[hoge]
aws_access_key_id = blahblahbalh
aws_secret_access_key = FugaFuga
   </pre>

   so you can pass profile name by --profile option:

   <tt><strong>terraforming s3 \-\-profile hoge
   </strong></tt>


   ### Terraform Plan

0. Have Terrform evaluate based on vars in a different (parent) folder:

   <tt><strong>terraform plan -var-file='..\terraform.tfvars' -var-file='.\Development\development.tfvars' -state='.\Development\dev.state'
   </strong></tt>

   The two dots specifies to look above the current folder.

   In this example terraform.tfvars file:

   <pre>
tenant_id = "223d"
bucket_name = "mycompany-sys1-v1"
arm_subscription_id = "???"
arm_principal = "???"
arm_passsord = "???"
aws_access_key = "insert access key here>"
aws_secret_key = "insert secret key here"
private_key_path = "C:\\MyKeys1.pem"
   </pre>

   The `private_key_path` should be a full path, containing `\\` so that the single slash is not interpreted as a special character.

   `bucket_name` must be globally unique within all of the AWS provider customers.

   ### States & Environments #

   PROTIP: Define a state file for each environment:

   * dev.state
   * uat.state
   * perftest.state
   * stage.state
   * prod.state
   <br /><br />

   A development.tfvars file:

   <pre>
environment_tag = "dev"
tenant_id = "223d"
billing_code_tag = "DEV12345"
dns_site_name = "dev-web"
dns_zone_name = "mycorp.xyz"
dns_resource_group = "DNS"
instance_count = "2"
subnet_count = "2"
   </pre>

   The production.tfvars file usually instead contain more instances and thus subnets that go through a load balancer for auto-scaling:

   <pre>
environment_tag = "prod"
tenant_id = "223d"
billing_code_tag = "PROD12345"
dns_site_name = "marketing"
dns_zone_name = "mycorp.com"
dns_resource_group = "DNS"
instance_count = "6"
subnet_count = "3"
   </pre>

   All these would use `main_config.tf` and variables.tf files that are commonly used for all environments:

   <tt><strong>
   terraform apply -state=".\develop\dev.state" -var="environment_name=development"
   </strong></tt>


   1. Generate model from logical definition (the Desired State).
   2. Load current model (preliminary source data).
   3. Refresh current state model by querying remote provider (final source state).
   4. Calculate difference from source state to target state (plan).
   5. Apply plan.

   A sample response:

   "&LT;computered>" means Terraform figures it out.


   ### Remote state

   <a target="_blank" href="https://blog.gruntwork.io/how-to-manage-terraform-state-28f5697e68fa">NOTE</a>

   terraform.tfstate can be stored in S3, Atlas, Consul, etcd, HTTP

   `terraform remote pull` obtains state.








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

   Hashicorp Atlas is a licensed solution 


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

   QUESTION: Pace of change in Terraform?

   Release 0.6.8 (2.12.2015)

   TODO: Update terraform


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


0. Define enviornment variables:

   <pre>
   TF_VAR_first_name=John terraform apply
   </pre>

0. Define Terraform variable:

   <pre>
   terraform apply -var 'first_name=John' -var 'last_name=Bunyan'
   </pre>

   Values to Terraform variables define inputs such as run-time DNS/IP addresses into Terraform modules.

   NOTE: Built-in functions:

   https://terraform.io/docs/configuration/interpolation.html

   ### Output variables #

0. Output Terraform variable:

   <pre>
output "loadbalancer_dns_name" {
  value = "${aws_elb.loadbalancer.dns_name}"
}
   </pre>

   ### Processing flags

   HCL can contain flags that affect processing. For example, within a resource specification, `force_destroy = true` forces the provider to delete the resource when done.


   ### Verify websites

0. The website accessible?

0. In the provider's console (EC2), verify

   ### Destroy clean up

0. Destroy instances so they don't rack up charges unproductively:

   <tt><strong>terraform destroy
   </strong></tt>

   PROTIP: Amazon charges by the hour while others charge by the minute.

0. Verify in the provider's console.


## Automation

   NOTE: Automating infrastructure deployment consists of:

   * Provisioning resources
   * Planning updates
   * Using source control
   * Reusing templates
   <br /><br />

  PROTIP: Terrform files are "idempotent" (repeat runs don't change anything if nothing is changed). Thus Terraform defines the "desired state configuration".


   <a name="modules"></a>
   
## Modules

https://github.com/terraform-community-modules

https://github.com/objectpartners/tf-modules

   <pre>
module "rancher" {
  source = "github.com/objectpartners/tf-modules//rancher/server-standalone-elb-db&ref=9b2e590"
}
   </pre>

   The double slashes separate the repo from the subdirectory.

   The ref is a commit ID 


## Plugins into Terraform

All Terraform providers are plugins - multi-process RPC (Remote Procedure Calls).

   https://github.com/hashicorp/terraform/plugin

   https://terraform.io/docs/plugins/index.html

Terraform expect plugins to follow a very specific naming convention of terraform-TYPE-NAME. For example, terraform-provider-aws, which tells Terraform that the plugin is a provider that can be referenced as "aws".

PROTIP: Establish a standard for where plugins are located:

For \*nix systems, `~/.terraformrc`

For Windows, `%APPDATA%/terraform.rc`

https://www.terraform.io/docs/internals/internal-plugins.html

PROTIP: When writing your own terraform plugin, create a new Go project in GitHub, then locally use a  directory structure:

   $GOPATH/src/github.com/USERNAME/terraform-NAME

where USERNAME is your GitHub username and NAME is the name of the plugin you're developing. This structure is what Go expects and simplifies things down the road.

Go library:

   https://github.com/hashicorp/terraform/plugi


## Resources

* IRC 

* <a target="_blank" href="https://groups.google.com/forum/#!forum/terraform-tool">Google Group terraform-tool</a>

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


### Rock Stars

James Turnbull

   * <a target="_blank" href="https://www.amazon.com/gp/product/B01MZYE7OY/">
   The Terraform Book ($8 on Kindle)</a>

Yevgeniy (Jim) Brikman (<a target="_blank" href="https://www.ybrikman.com/">ybrikman.com</a>), co-founder of DevOps as a Service Gruntwork.io :

   * <a target="_blank" href="https://blog.gruntwork.io/an-introduction-to-terraform-f17df9c6d180">
   Gruntwork's Introduction</a>

   * <a target="_blank" href="https://www.amazon.com/Terraform-Running-Writing-Infrastructure-Code-ebook/dp/B06XKHGJHP/">
   Terraform Up & Running (OReilly book $11.99 on Amazon)</a>

   * <a target="_blank" href="http://www.terraformupandrunning.com/?ref=gruntwork-blog-comprehensive-terraform">terraformupandrunning.com</a>

   <a target="_blank" href="https://blog.gruntwork.io/a-comprehensive-guide-to-terraform-b3d32832baca">
   Comprehensive Guide to Terraform</a> includes:

   1. <a target="_blank" href="https://blog.gruntwork.io/why-we-use-terraform-and-not-chef-puppet-ansible-saltstack-or-cloudformation-7989dad2865c">
   Why we use Terraform and not Chef, Puppet, Ansible, SaltStack, or CloudFormation</a>

   2. <a target="_blank" href="https://blog.gruntwork.io/how-to-manage-terraform-state-28f5697e68fa">
   How to manage Terraform state</a>

   5. <a target="_blank" href="https://blog.gruntwork.io/terraform-tips-tricks-loops-if-statements-and-gotchas-f739bbae55f9">
   Terraform tips & tricks: loops, if-statements, and gotchas</a>   


dtan4

   http://terraforming.dtan4.net/

   https://github.com/dtan4/terraforming
   is a Ruby 

## AWS Cloud Formation

<a target="_blank" href="http://www.slideshare.net/AntonBabenko/managing-aws-infrastructure-using-cloudformation">
Puppet, Chef, Ansible, Salt</a>
AWS API libraries Boto, Fog



   NOTE: Terraform remote configures remote state storage with Terraform.


## References



