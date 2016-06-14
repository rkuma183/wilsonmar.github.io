---
layout: post
title: "Cloud Regions"
excerpt: "Who is where"
tags: [cloud, regions]
image:
# microsoft-azure-1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/15276333/2337c55e-1aa2-11e6-9ed1-a1a84ac84e95.jpg
  credit: Jim O'Neil
  creditlink: https://blogs.msdn.microsoft.com/jimoneil/2012/09/21/windows-azure-interactive-feature-map/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />
{% include _toc.html %}

Here's a multi-vendor comparison of regions.

* <a href="#Amazon">Amazon</a>
* <a href="#Azure">Azure</a>
* Google Cloud Compute
* Rackspace

TODO: Provide an interactive comparison.

Each region is a separate geographic area.

Each region within Amazon contains multiple, isolated <strong>Availability Zones</strong>.

<hr />

<a name="AzureRegions"></a>

## Amazon Regions #

0. Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/.

0. From the navigation bar, view the options in the region selector.

   | Code | Name |
   | ---- | ---- |
   | us-east-1 | US East (N. Virginia) |
   | us-west-1 | US West (N. California) |
   | us-west-2 | US West (Oregon) |
   | eu-west-1 | EU (Ireland) |
   | eu-central-1 | EU (Frankfurt) |
   | ap-northeast-1 | Asia Pacific (Tokyo) |
   | ap-northeast-2 | Asia Pacific (Seoul) |
   | ap-southeast-1 Asia Pacific (Singapore) |
   | ap-southeast-2 | Asia Pacific (Sydney) |
   | sa-east-1 | South America (São Paulo) |

   Amazon charges for network traffic between availability zones.

   Amazon's AWS GovCloud (US) and China (Beijing) cannot be specified.

0. Availability Zones under each region are listed on the <strong>Status</strong> by
   service under each <strong>continent</strong> at
   <a target="_blank" href="http://status.aws.amazon.com/">
   status.aws.amazon.com</a>

   Additional End-point locations.

See <a target="_blank" href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html">
Amazon's User Guide on Regions and availability zones</a>.

<a name="AzureRegions"></a>

## Microsoft Azure Cloud Regions #

Not all <a target="_blank" href="https://azure.microsoft.com/en-us/regions/#services">
services are available</a> in all regions.

<a target="_blank" href="https://azure.microsoft.com/en-us/regions/">
Regions</a> with locations, rearranged by continent:

<table>
<tr>
   <th align="left" width="40%"> Region </th>
   <th align="left" width="20%"> Location </th>
   <th align="left" width="20%"> API </th>
   </tr>

<tr><td> Canada Central </td><td> Toronto
	</td><td> - </td></tr>
<tr><td> Canada East </td><td> Quebec City
	</td><td> - </td></tr>

<tr><td> West US </td><td> California
	</td><td> Y </td></tr>
<tr><td> Central US </td><td> Iowa
	</td><td> Y </td></tr>
<tr><td> East US </td><td> Virginia
	</td><td> Y </td></tr>
<tr><td> East US 2 </td><td> Virginia
	</td><td> Y </td></tr>
<tr><td> North Central US </td><td> Illinois
	</td><td> Y </td></tr>
<tr><td> South Central US </td><td> Texas
	</td><td> Y </td></tr>
<tr><td> Brazil South </td><td> Sao Paolo
	</td><td> Y </td></tr>

<tr><td> North Europe </td><td> Ireland
	</td><td> Y </td></tr>
<tr><td> West Europe </td><td> Netherlands
	</td><td> Y </td></tr>
<tr><td> Germany Central </td><td> Frankfurt
	</td><td> - </td></tr>
<tr><td> Germany Northeast </td><td> Magdeburg
	</td><td> - </td></tr>

<tr><td> Japan East </td><td> Tokyo, Saitama
	</td><td> Y </td></tr>
<tr><td> Japan West </td><td> Osaka
	</td><td> Y </td></tr>
<tr><td> Southeast Asia </td><td> Singapore
	</td><td> Y </td></tr>
<tr><td> East Asia </td><td> Hong Kong
	</td><td> Y </td></tr>

<tr><td> Australia East </td><td> New South Wales
	</td><td> - </td></tr>
<tr><td> Australia Southeast </td><td> Victoria
	</td><td> - </td></tr>

<tr><td> Central India </td><td> Pune
	</td><td> - </td></tr>
<tr><td> South India </td><td> Chennai
	</td><td> - </td></tr>
<tr><td> West India </td><td> Mumbai
	</td><td> - </td></tr>

<tr><td> China North </td><td> Beijing
	</td><td> - </td></tr>
<tr><td> China East </td><td> Shanghai
	</td><td> - </td></tr>
</table>

Two regions for the US Government are in Virginia.
http://bit.ly/msgovt

See https://www.microsoft.com/en-us/server-cloud/cloud-os/global-datacenters.aspx
