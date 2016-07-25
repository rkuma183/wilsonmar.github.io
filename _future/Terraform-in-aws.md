Terraform on AWS

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.

terraform.io

written in Golang.

Release 0.6.8 (2.12.2015)

Community

   * IRC 
   * Mailing List
   * StackOverflow

https://www.youtube.com/watch?v=rgzzkP2L1k8
Manage AWS infrastructure as code using Terraform
talk in Norway 14 Dec 2015
by Anton Babenko
https://github.com/antonbabenko
linkedin.com/in/antonbabenko


https://www.youtube.com/watch?v=p2ESyuqPw1A
Terraform w/ Lee Trout Chadev 314 views


https://www.youtube.com/watch?v=WdV4eYZO5Ao
Automating Infrastructure Management with Terraform 
at SF CloudOps Meetup

Avialable:

AWS Cloud Formation
http://www.slideshare.net/AntonBabenko/managing-aws-infrastructure-using-cloudformation
Puppet, Chef, Ansible, Salt
AWS API libraries Boto, Fog
Transform by HashiCorp


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


