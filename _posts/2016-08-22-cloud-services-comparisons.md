---
layout: post
title: "Cloud services comparisons"
excerpt: "Take my cloud ... please"
tags: [Cloud, comparison]
comments: true
image: # pic-black-bkg-white-cloud_1920x1200
  feature: https://cloud.githubusercontent.com/assets/300046/15269257/8104a824-19b6-11e6-9c42-014bf608009a.jpg
  credit: Theme Bin
  creditlink: http://www.themebin.com/hd-wallpapers/wandering-clouds-hd-wallpaper/
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

<img class="img-right" align="right"
alt="cloud platforms black icons 300x330-300-58kb.jpg" width="300" height="330" src="https://cloud.githubusercontent.com/assets/300046/17864330/e4dbabc0-685a-11e6-84e5-361c5fc8c28d.jpg">

This page houses my random collection of information about comparing the various cloud services platforms:
Amazon AWS vs.
IBM Softlayer vs. 
Google Compute Cloud vs.
Microsoft Azure vs. 
Rackspace vs. Oracle, SalesForce Heroku, SkyTap, etc.

Multi-cloud vendors include <a target="_blank" href="https://github.com/cloudfoundry/bosh">CloudFoundry</a>, Hashicorp Terraform.

EDITOR's NOTE: This is not a complete treatment. 
Additional information will be added over time.

![cloud-compare-364x172](https://user-images.githubusercontent.com/300046/31053622-f49c9f86-a65e-11e7-9fa8-c6f367b1beb2.png)
at <a target="_blank" href="http://cloudcomparison.rightscale.com/">http://cloudcomparison.rightscale.com</a>
presents all the details well. <a target="_blank" href="http://docs.rightscale.com/ca/cloud_comp/">DOCS</a> 
So here I'm adding additional commentary here.


## TL;DR - The biggest difference

* For large loads, Google offers the fast fiber that may limit large machines can achieve on other clouds.
* AWS has matched Azure pricing, and also per-minute billing.
* IBM has bare-metal machines, if that's your thing.
* Google's SSD drives are expensive.
* One cloud may cover a particular country, if you need to have that to do business there (such as Google in Belgium).

## Table

Factor | AWS EC2 | Azure |
:----- | :--- | :----- |
Initial appearance | 2006 | 2010 |
Granularity of billing | per hour | per minute |
Entrepreneurial Discount | - | BizSpark |
# Data centers | 24 | 100 |
# zones | 33 | 100 |
Largest server | <a target="_blank" href="https://goo.gl/64UcCb">x1.32xlarge</a> | G: |
Largest # cores | 128 | 32 |
Largest RAM GB | 1,952 GB | 448 GB |


### Pricing #

Even though cloud vendors provide a great deal of transparency to how they price their services,
there are so many variables to what affects the final bill that the only accurate way is to
actually run services.

<ul>
<li><a target="_blank" href="https://azure.microsoft.com/en-us/pricing/calculator/">Microsoft's Azure Pricing Calculator</a></li>
<li><a target="_blank" href="http://calculator.s3.amazonaws.com/index.html">Amazon's AWS Pricing Calculator</a></li>
</ul>

<a target="_blank" href="http://www.zdnet.com/article/public-cloud-computing-vendors-a-look-at-strengths-weaknesses-big-picture/">
Cowan analysis May 2016</a> (using 1.0 as average among vendors) rated Amazon 1.37 (above avarge) in prices (most expensive).
Microsoft was rated the leader in price and APIs, but the lowest in support.

   <amp-img width="770" height="446" alt="cloud comparison table zdnet 2016-770x446-9.jpg"
layout="responsive" src="https://cloud.githubusercontent.com/assets/300046/15745884/5b980e2a-2891-11e6-9dc5-22f06137e56a.jpg"></amp-img>

   QUESTION: Is the comparison based on <strong>spot instances</strong> in AWS,
   which are of low cost because they can be taken away at any moment
   by someone who outbids.


## Market share #

Different surveys contradict each other.

Here is one:

   <amp-img layout="responsive" alt="cloud chart iaas market share 2015-529x488-c22.jpg" width="529" height="488" 
   src="https://cloud.githubusercontent.com/assets/300046/16921114/778410d8-4ccd-11e6-9bb8-faf3cd75a449.jpg">
   </amp-img>


## Operating Systems in the cloud #

As of May 2016, Azure works with SUSE and Oracle,
but not Red Hat Enterprise Linux (RHEL).

Amazon provides software to host whatever os is put into images.
But its free server images are based on 
CentOS.


## Links to service brand names #

<table valign="top" border="1" cellspacing="0" cellpadding="4">
<thead>
<tr valign="bottom">
<th align="left"><br /></th><th align="left">Microsoft Azure</th><th align="left">Amazon Web Services (AWS) docs</th></tr>
</thead><tbody>
<tr valign="top" class="tblOdd"><th align="left">Data center geography</th>
    <td><a target="_blank" href="http://azure.microsoft.com/en-us/regions/">Azure Regions</a></td>
    <td><a target="_blank" href="http://aws.amazon.com/about-aws/global-infrastructure/">global infrastructure</a></td>
    </tr>
<tr valign="top" class="tblEven"><th align="left">Compute Services</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/virtual-machines/">Virtual Machines (VMs)</a>
</td><td><a target="_blank" href="http://aws.amazon.com/ec2/">EC2 (Elastic Compute Cloud)</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left"><br /></th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/cloud-services/">Cloud Services</a>
<br /><a target="_blank" href="http://azure.microsoft.com/en-us/services/websites/">Azure Websites and Apps</a>
<br /></td><td><a target="_blank" href="http://aws.amazon.com/elasticbeanstalk/">ElasticBeanstalk</a></td></tr>
<tr valign="top" class="tblEven"><th align="left"><br /></th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/visual-studio-online/">Azure Visual Studio Online</a></td><td>None</td></tr>
<tr valign="top" class="tblEven"><th align="left">Container Support</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/documentation/articles/virtual-machines-docker-vm-extension/#Docker-and-Linux-Containers">Docker Virtual Machine Extension (how to)</a></td><td><a target="_blank" href="http://aws.amazon.com/ecs/">EC2 Container Service (Preview)<br /></a></td></tr>
<tr valign="top" class="tblOdd"><th align="left">Scaling Options</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/documentation/articles/cloud-services-how-to-scale/">Azure Autoscale (how to)</a></td><td><a target="_blank" href="http://aws.amazon.com/autoscaling/">AutoScaling</a></td></tr>
<tr valign="top" class="tblEven"><th align="left">Analytics/Hadoop Options</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/hdinsight/">HDInsight (Hadoop)</a></td><td><a target="_blank" href="http://aws.amazon.com/elasticmapreduce/">Elastic MapReduce (EMR)</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left">Government Services</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/features/gov/">Azure Government</a></td><td><a target="_blank" href="http://aws.amazon.com/govcloud-us/">GovCloud</a></td></tr>
<tr valign="top" class="tblEven"><th align="left">App/Desktop Services</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/remoteapp/">Azure RemoteApp</a></td><td><a target="_blank" href="http://aws.amazon.com/workspaces/">WorkSpaces</a><br /><a target="_blank" href="http://aws.amazon.com/appstream/">Amazon AppStream</a><br /></td></tr>
<tr valign="top" class="tblOdd"><th align="left">Storage Options</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/documentation/services/storage/">Azure Storage (Blobs, Tables, Queues, Files)</a></td><td><a target="_blank" href="http://aws.amazon.com/s3/">S3 (SimpleStorage)</a></td></tr>
<tr valign="top" class="tblEven"><th align="left">Block Storage</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/documentation/articles/storage-dotnet-how-to-use-blobs/">Azure Blob Storage (how to)</a></td><td><a target="_blank" href="http://aws.amazon.com/ebs/">Elastic Block Storage (EBS)</a></td></tr>
<!--
<tr valign="top" class="tblOdd"><th align="left">Hybrid Cloud Storage</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/storsimple/">StorSimple</a></td><td>None</td></tr>
<tr valign="top" class="tblEven"><th align="left">Backup Options</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/backup/">Azure Backup</a></td><td><a target="_blank" href="http://aws.amazon.com/glacier/">Glacier</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left">Storage Services</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/documentation/articles/storage-import-export-service/">Azure Import Export (how to)</a></td><td><a target="_blank" href="http://aws.amazon.com/importexport/">ImportExport</a></td></tr>
<tr valign="top" class="tblEven"><th align="left"><br /></th><td><a target="_blank" href="http://azure.microsoft.com/en-us/documentation/articles/storage-dotnet-how-to-use-files/">Azure File Storage (how to)</a></td><td><a target="_blank" href="http://aws.amazon.com/storagegateway/">StorageGateway</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left"><br /></th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/site-recovery/">Azure Site Recovery</a></td><td>None</td></tr>
<tr valign="top" class="tblEven"><th align="left">Content Delivery Network (CDN )</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/cdn/">Azure CDN</a><
/td><td><a target="_blank" href="http://aws.amazon.com/cloudfront/">CloudFront</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left">Database Options</th><td rowspan="1"><a target="_blank" href="http://azure.microsoft.com/en-us/services/sql-database/">Azure SQL Database</a>
</td><td><a target="_blank" href="http://aws.amazon.com/rds/">RDS (Relational Database Service)</a>
<br /><a target="_blank" href="http://azure.microsoft.com/en-us/documentation/articles/storage-import-export-service/">Redshift</a><br />
</td></tr>
<tr valign="top" class="tblEven"><th align="left">NoSQL Database Options</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/documentdb/">Azure DocumentDB</a>
</td><td><a target="_blank" href="http://aws.amazon.com/dynamodb/">DynamoDB</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left"><br /></th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/cache/">Azure Managed Cache (Redis Cache)</a>
</td><td><a target="_blank" href="http://aws.amazon.com/elasticache/">ElasticCache</a></td></tr>
<tr valign="top" class="tblEven"><th align="left">Data Orchestration</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/data-factory/">Azure Data Factory</a>
</td><td><a target="_blank" href="http://aws.amazon.com/datapipeline/">DataPipeline</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left">Networking Options</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/virtual-network/">Azure Virtual Network</a>
</td><td><a target="_blank" href="http://aws.amazon.com/vpc/">VPC</a></td></tr>
<tr valign="top" class="tblEven"><th align="left"><br /></th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/expressroute/">Azure ExpressRoute</a></td><td><a target="_blank" href="http://aws.amazon.com/directconnect/">AWS Direct Connect</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left"><br /></th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/traffic-manager/">Azure Traffic Manager</a></td><td><a target="_blank" href="http://aws.amazon.com/route53/">Amazon Route 53</a></td></tr>
<tr valign="top" class="tblEven"><th align="left">Load Balancing</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/documentation/articles/virtual-machines-load-balance/">Load Balancing for Azure (how to)</a>
</td><td><a target="_blank" href="http://aws.amazon.com/elasticloadbalancing/">ELB (Elastic Load Balancing)</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left">Administration &amp; Security</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/active-directory/">Azure Active Directory</a>
</td><td><a target="_blank" href="http://aws.amazon.com/directoryservice/">DirectoryService</a>
<br /><a target="_blank" href="http://aws.amazon.com/iam/">IAM (Identity and Access Management)</a><br /></td></tr>
<tr valign="top" class="tblOdd"><th align="left">Multi-Factor Authentication<br /></th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/multi-factor-authentication/">MFA (Multi-Factor Authentication)</a>
</td><td><a target="_blank" href="http://aws.amazon.com/iam/details/mfa/">MFA (Multi-Factor Authentication)</a>
</td></tr>
<tr valign="top" class="tblEven"><th align="left">Monitoring<br /></th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/operational-insights/">Azure Operational Insights</a>
</td><td><a target="_blank" href="http://aws.amazon.com/cloudtrail/">CloudTrail</a>
</td></tr>
<tr valign="top" class="tblOdd"><th align="left"><br /></th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/application-insights/">Azure Application Insights</a>
</td><td><a target="_blank" href="http://aws.amazon.com/cloudwatch/">CloudWatch</a></td></tr>
<tr valign="top" class="tblEven"><th align="left"><br /></th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/event-hubs/">Azure Event Hubs</a>
</td><td>None<br /></td></tr>
<tr valign="top" class="tblOdd"><th align="left">Messaging</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/notification-hubs/">Azure Notification Hubs</a>
</td><td><a target="_blank" href="http://aws.amazon.com/sns/">SNS (Simple Notification Service)</a></td></tr>
<tr valign="top" class="tblEven"><th align="left">Encryption</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/key-vault/">Azure Key Vault</a>
</td><td><a target="_blank" href="http://aws.amazon.com/kms/">KMS (Key Management Service)</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left">Compliance</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/support/trust-center/compliance/">Azure Trust Center</a>
</td><td><a target="_blank" href="http://aws.amazon.com/cloudhsm/">CloudHSM (Hardware Security Module)</a></td></tr>
<tr valign="top" class="tblEven"><th align="left">Management Services &amp; Options</th><td><a target="_blank" href="http://azure.microsoft.com/blog/2014/11/26/azure-resource-manager-2-5-for-visual-studio/">Azure Resource Manager</a>
</td><td><a target="_blank" href="http://aws.amazon.com/cloudformation/">CloudFormation</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left">API Management</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/api-management/">Azure API Management</a>
</td><td>None</td></tr>
<tr valign="top" class="tblEven"><th align="left">Automation</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/automation/">Azure Automation</a>
</td><td><a target="_blank" href="http://aws.amazon.com/opsworks/">OpsWorks</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left"><br /></th><td rowspan="1"><a target="_blank" href="http://azure.microsoft.com/en-us/services/batch/">Azure Batch </a>
<br /><a target="_blank" href="http://azure.microsoft.com/en-us/services/service-bus/">Azure Service Bus</a>
</td><td><a href="http://aws.amazon.com/sqs/">SQS (Simple Queue Service)</a></td></tr>
<tr valign="top" class="tblEven"><th align="left"><br /></th><td>None<br />
</td><td><a target="_blank" href="http://aws.amazon.com/codedeploy/">CodeDeploy</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left"><br /></th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/scheduler/">Azure Scheduler</a>
</td><td><a target="_blank" href="http://aws.amazon.com/swf/">SWF (Simple Workflow)</a></td></tr>
<tr valign="top" class="tblEven"><th align="left">Search</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/search/">Azure Search</a>
</td><td><a target="_blank" href="http://aws.amazon.com/cloudsearch/">CloudSearch</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left">Analytics</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/stream-analytics/">Azure Stream Analytics</a>
</td><td><a target="_blank" href="http://aws.amazon.com/kinesis/">Kinesis</a></td></tr>
<tr valign="top" class="tblEven"><th align="left">Email Services</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/biztalk-services/">Azure BizTalk Services</a>
</td><td><a target="_blank" href="http://aws.amazon.com/ses/">SES (Simple Email Services)</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left">Media Services</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/media-services/">Azure Media Services</a>
</td><td><a target="_blank" href="http://aws.amazon.com/elastictranscoder/">ElasticTranscoder</a><br /><span style="text-decoration:underline;"><a target="_blank" href="http://aws.amazon.com/mobileanalytics/">MobileAnalytics</a>
<br /><a target="_blank" href="http://aws.amazon.com/cognito/">Cognitor</a><br /></span></td></tr>
<tr valign="top" class="tblEven"><th align="left">Machine Learning (ML)</th><td><a target="_blank" href="http://azure.microsoft.com/en-us/services/machine-learning/">Azure Machine Learning</a>
</td><td><a target="_blank" href="https://aws.amazon.com/machine-learning/">MachineLearning</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left">Triggers</th>
    <td><a target="_blank" href="https://azure.microsoft.com/en-us/documentation/services/app-service/logic/">Logic Apps</a></td>
    <td><a target="_blank" href="http://aws.amazon.com/lambda/">AWS Lambda</a></td>
    </tr>
<tr valign="top" class="tblEven"><th align="left"><br /></th><td>None
</td><td><a target="_blank" href="http://aws.amazon.com/config/">AWS Config</a></td></tr>
<tr valign="top" class="tblOdd"><th align="left">Billing</th><td>?
</td><td><a target="_blank" href="http://aws.amazon.com/billing/">Billing</a></td></tr>
-->
</tbody></table>

<a target="_blank" href="http://www.tomsitpro.com/articles/azure-vs-aws-cloud-comparison,2-870-2.html"> 
Credit:TomsITPro</a>

<hr />

## Resources #


<a target="_blank" href="http://resources.sdtimes.com/whitepaper-ibm-q4-2015-bluemix-ebook">
IBM Bluemix</a>

<a target="_blank" href="http://downdetector.com/status/aws-amazon-web-services">
http://downdetector.com/status/aws-amazon-web-services</a>
provides 3rd-party crowd-source status.


## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}


## More on cloud #

This is one of a series on cloud computing:

{% include cloud_links.html %}
