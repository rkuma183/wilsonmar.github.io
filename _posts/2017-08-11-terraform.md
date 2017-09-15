---
layout: post
title: "Terraform from Hashicorp"
excerpt: "AWS CloudFormation + DSC for many clouds"
tags: [DevOps, ecosystem]
shorturl: "https://goo.gl/"
image:
# elk-beat-arch-1900x500-102084.jpg
  feature: https://user-images.githubusercontent.com/300046/30410257-2d3fa8b0-98c7-11e7-9467-d35837b592a2.jpg
  credit: JP Toto on Pluralsight
  creditlink: https://app.pluralsight.com/library/courses/centralized-logging-elastic-stack/table-of-contents
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.

https://www.terraform.io/intro/index.html


## AWS CloudFormation vs. Terraform

This table is unique to this webpage:

<table border="1" cellpadding="4" cellspacing="0">
<tr valign="bottom"><th> &nbsp; </th><th> CloudFormation </th><th> Terraform </th></tr>
<tr><td> Configuration format </td><td> JSON </td><td> HCL/JSON </td></tr>
<tr><td> State management </td><td> JSON </td><td> HCL/JSON </td></tr>
<tr><td> Execution control </td><td> No </td><td> Yes </td></tr>
<tr><td> Logical comparisons </td><td> No </td><td> Limited </td></tr>
<tr><td> Iterations </td><td> No </td><td> Yes </td></tr>
<tr><td> Manage already create resources </td><td> No </td><td> Yes (hard) </td></tr>
<tr><td> Providers support </td><td> AWS only </td><td> AWS, GCE, Azure (20+) </td></tr>
<tr><td> Failure handling </td><td> Optional reollback </td><td> Fix &amp; retry </td></tr>
<tr><td> Contribute? </td><td> No </td><td> Yes (issue 28) </td></tr>
</table>

Both CF and Terraform work with JSON, but Terraform works with HCL (Hashicorp Configuratio Language) that is both human and machine friendly. https://github.com/hashicorp/hcl and described at https://www.terraform.io/docs/configuration/syntax.html

But Terraform also provides execution control, iterations, and (perhaps most of all) management of resources already created (desired state configuration) over several cloud providers (not just AWS).


## Installation #

Release 0.6.8 (2.12.2015)

Terraform was written in Golang. ["Read all about it here"](/golang/).


## Configuration

Terraform remote configures remote state storage with Terraform.

   * *.tf
   * terraform.tfstate stored in S3, Atlas, Consul, etcd, HTTP


## Community #

   * IRC 
   * Mailing List
   * StackOverflow


## Resources

* <a target="_blank" href="https://www.youtube.com/watch?v=rgzzkP2L1k8">
Manage AWS infrastructure as code using Terraform</a>
talk in Norway 14 Dec 2015
by Anton Babenko
https://github.com/antonbabenko
linkedin.com/in/antonbabenko

## Videos #

* <a target="_blank" href="https://www.youtube.com/watch?v=p2ESyuqPw1A">
Terraform w/ Lee Trout Chadev</a>

* <a target="_blank" href="https://www.youtube.com/watch?v=WdV4eYZO5Ao">
Automating Infrastructure Management with Terraform</a>
at SF CloudOps Meetup


## AWS Cloud Formation

<a target="_blank" href="http://www.slideshare.net/AntonBabenko/managing-aws-infrastructure-using-cloudformation">
Puppet, Chef, Ansible, Salt</a>
AWS API libraries Boto, Fog

Transform by HashiCorp

