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


## TL;DR - The biggest difference

* If you write in C# on .NET, Azure is the most mature for you even though Google is trying.
* If you're looking for any job in cloud, go for AWS because of its current <a href="#marketshare">market share</a>.
* For large loads, Google offers the fast fiber that doesn't limit what large machines can achieve.
* AWS has matched Azure pricing, and also per-minute billing.
* IBM has bare-metal machines, if that's your thing.
* Google's SSD drives are expensive.
* One cloud may cover a particular country, if you need to have that to do business there (such as Google in Belgium).

EDITOR's NOTE: This is not a complete treatment. 
Additional information will be added over time.

<a target="_blank" href="http://cloudcomparison.rightscale.com/">
<img alt="cloud-compare-364x172" src="https://user-images.githubusercontent.com/300046/31053622-f49c9f86-a65e-11e7-9fa8-c6f367b1beb2.png">
http://cloudcomparison.rightscale.com</a> presents all the details well. <a target="_blank" href="http://docs.rightscale.com/ca/cloud_comp/">DOCS</a> 
So here I'm adding additional commentary here.

## Additionally...

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

<a name="marketshare"></a>

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
