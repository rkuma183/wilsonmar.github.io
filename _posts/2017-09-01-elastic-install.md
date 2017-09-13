---
layout: post
title: "Elastic Stack Installation"
excerpt: "Here are several ways to get it up and running quickly"
tags: [ELK, ecosystem]
shorturl: "https://goo.gl/"
filename: "elk-install.md"
image:
  feature: https://cloud.githubusercontent.com/assets/300046/14583248/4b20c578-03d9-11e6-8f7a-c860b666bc73.jpg
  credit: Wall Street Journal
  creditlink: http://graphics.wsj.com/job-market-tracker/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This page describes the different options to get going with an Elastic Stack of your own.

First of all, each component of the Elastic Stack are typically on a different set of servers:

   * Beats components are installed on servers being monitored.
   * Logstash servers should ideally be near the same subnet as servers being monitored.
   * ElasticSearch database nodes (usually a cluster of them) can be in the same or different data centers than servers being monitored.
   * Kibana servers would be near those who request visualizations
   <br /><br />

<hr />

## Versions for download

<a target="_blank" href="https://www.elastic.co/downloads/elasticsearch">
https://www.elastic.co/downloads/elasticsearch</a><br />
presents the lastest version from Elastic.co.

| Version | Date             | File type | Zip Bytes | Unzipped |
| ------- | ---------------: | --------- | ----====- | -------- |
| 5.6.0 | September 11, 2017 | elasticsearch-5.6.0.zip | 33,783,880 | 37,913,726 |
| 5.5.3 |       May 15, 2017 | elasticsearch-5.5.3.zip | 33,517,299 | - |
| 5.0.0 |   October 26, 2016 | elasticsearch-5.6.0.zip | 32,218,000 | - |

Notice several images are available:

   * .ZIP
   * .TAR for generic Linux
   * .DEB for Debian
   * .RPM for Ruby
   * .MSI for Windows

Only one previous back release is available.

The folder unzipped contains these folders:

   <pre>
|-- bin     = executables and shell scripts 
|-- config  = settings to tweak
|-- lib     = library jar files for Java
|-- modules = jar files and properties for optional modules
`-- plugins = empty
   </pre>

The config folder contains settings to tweak: 
`log4j2.properties`, and <strong>elasticsearch.yml</strong>,

0. On Windows 64-bit machines, edit the `jvm.options` file to add the stack size for Java (under `-Xmx2g`):

   `-Xss1m`



## Ways to setup

A) <a href="#ElasticFromAmazon">Run on Amazon's Elastic Service</a>. This is a quick way.
   
B) <a href="#Docker">Use a Docker image</a>.

C) <a href="#LocalDownload">Download installer from GitHub on a virtual server</a>.


<hr />

<a name="ElasticFromAmazon"></a>

## Elastic from Amazon

Amazon announced its ElastiSearch Service offering October 1st 2015. See:
<a target="_blank" href="https://aws.amazon.com/blogs/aws/new-amazon-elasticsearch-service/">
https://aws.amazon.com/blogs/aws/new-amazon-elasticsearch-service/</a>

After a month working with it, http://kirankoduru.github.io/elasticsearch/moving-from-aws-elasticsearch-service.html
identified reasons why he got away from it:

  * AWS is not supported by Elastic Support.

  * AWS does not include Shield, the Elastic commercial security plugin that handles RBAC of cluster and indexes.

  * AWS controls the <strong>elasticsearch.yml</strong> file containing settings to tweak. The AWS elasticsearch service makes sure everything works perfectly.

  * AWS's service does not consume credits companies accumulate volume discounts for Amazon usage.

  * AWS does not provide a selection of region, which may cause some latency. 

  * AWS's services uses an older version of Elasticsearch, such as 1.5 when version 2.0 is available directly from Elastic.co. This is important for those who don't want to miss out on those bug fixes and shiny new feature releases.

  * AWS's IAM policies are the only way to configure access to its Elasticsearch service.
    That is a good way to secure inbound connections. 
    But some prefer using security groups.

  * AWS turns off dynamic scripting and does not allow script upload into the scripts directory.

  * AWS performs backups only after receiving an email to AWS support rather than allowing the elasticsearch-aws-cloud plugin to configure s3 repositories from the elasticsearch service dashboard.

The ironic thing is that Elastic's own Found service is run on AWS.'

With that said, let's try it out anyway:


<a id="Install"></a>

### AWS Install Steps</a>

Below are the steps I took to create a public instance within AWS.

1. Use Firefox to get in <a target="_blank" href="http://aws.amazon.com/ec2/">
   EC2 dashboard at http://aws.amazon.com/ec2/</a>

0. Select a region appropriate to you. 

   CAUTION: If you intend on creating an image for the Marketplace, you must use US Northern Virginia (us-east-1).

  The default for examples on this page is US-West-2, which is in Oregon.

0. Scroll down to the bottom of the Analytics section to click on the Elasticsearch Service link. 

  ```
https://us-west-2.console.aws.amazon.com/es/home?region=us-west-2#
  ```

0. If you want to use a different region, click on "Oregon" (or another) at the upper right corner.
  
0. Clicking on the <a target="_blank" href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-gsg.html">
   Getting Starte Guide</a> opens a new window tab.

0. Click on the blue **Get Started** button.

0. PROTIP: When specifying **domain**, keep to lower case characters and perhaps a number at the end for versioning.
   For example:
 
  ```
  test1
  ```

0. For **Instance type**, since I don't have much data yet during experimentation, 
  I use Free Tier eligible **t2.micro.elasticsearch**.

0. Hover over the (i) icon to the right of **Enable dedicated master**. It says:
   "We recommend that you allocate at least three dedicated master nodes for each production Elastisearch domain."

  I leave blank anyways during experimentation.

0. Hover over the (i) icon to the right of **Enable zone awareness**. It says:
   "Distributes nodes across two Availability Zones..."

0. For Storage, I select EBS with 10 GB of General Purpose (SSD) drives.

  PROTIP: Free tier users gets up to 10 gigabytes of Magnetic or SSD-Backed EBS storage at no charge
  for up to 750 hours per month.

0. After clicking Next, for access policy I select "Allow open access to the domain"
   so anyone can upload documents.

  The version in the file is of AWS access code API version:
  
  ```
  "Version": "2012-10-17",
  ```
  
0. Click Next.
0. Confirm and create. It takes several minutes for Domain status to go from Loading to Ready.
   Below is a sample screen after provisioning:

  <img alt="screen shot 2015-10-13 at 8 31 10 am" src="https://cloud.githubusercontent.com/assets/300046/10459540/d9dc2a2e-7184-11e5-9cbd-d78ac15fb296.png">

  These sample links are no longer active, of course.
  But when it was for me, clicking on https://search-test1-da54anmy3esch22sskcuukwf6i.us-west-2.es.amazonaws.com/
  got me this:
  
  ```
  {
  "status" : 200,
  "name" : "Ikthalon",
  "cluster_name" : "495629083449:test1",
  "version" : {
    "number" : "1.5.2",
    "build_hash" : "62ff9868b4c8a0c45860bebb259e21980778ab1c",
    "build_timestamp" : "2015-04-27T09:21:06Z",
    "build_snapshot" : false,
    "lucene_version" : "4.10.4"
  },
  "tagline" : "You Know, for Search"
}
  ```
  
  Instead of the web UI,
  <a target="_blank" href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-gsg-create-domain.html">
  use AWS ES CLI</a>.
  
0. Click on the Kibana link, such as:
 
  ```
  https://search-test1-da54anmy3esch22sskcuukwf6i.us-west-2.es.amazonaws.com/_plugin/kibana/
  ```
  
  <img alt="screen shot 2015-10-13 at 9 42 48 am" src="https://cloud.githubusercontent.com/assets/300046/10461630/12096628-718f-11e5-808b-5b3e2eee0751.png">
  
0. To make use of the instance using Python in my Mac terminal window:
 
  ```
  pip install elasticsearch
  ```
  
0. For more about using Python for Elastisearch, this article (from November 2014):
  
  http://bitquabit.com/post/having-fun-python-and-elasticsearch-part-1/


<hr />

<a name="Docker"></a>

## Use Docker images

WARNING: Prior Docker images for Elastic servers on Docker hub (https://hub.docker.com/_/elasticsearch/) have been deprecated.

1. Install Docker.

   See https://docs.docker.com/docker-for-mac/

2. Run the Docker daemon.

0. Retrieve the official Docker image for Elastic server <strong>for a specific release</strong>:

   <tt><strong>docker pull docker.elastic.co/elasticsearch/elasticsearch:5.6.0
   </strong></tt>

   NOTE: Source code for it can be found on GitHub at<br />
   https://github.com/elastic/elasticsearch-docker/tree/5.6

   ### max_memory_account

   <a target="_blank" href="https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html">
   DOC</a>

0. Before running in production mode, which 

   ### Run in dev mode

0. Run in development mode (on a different port if you prefer):

   <tt><strong>docker run -p 9200:9200 -e "http.host=0.0.0.0" -e "transport.host=127.0.0.1" docker.elastic.co/elasticsearch/elasticsearch:5.6.0
   </strong></tt>

   
   NOTE: The image is built with X-Pack and uses centos:7 as the base image. 


<hr />

<a name="LocalDownload"></a>

## Download installer from GitHub on your local machine

### Pre-requisites

1. Instantiate an Ubunto server image.

0. Verify the Linux operating system:

   <tt><strong>cat /etc/issue.net; ifconfig
   </strong></tt>

0. Get IP address assigned, to later put in the elasticsearch.yml file:

   <tt><strong>ifconfig
   </strong></tt>

0. Install the Java runtime:

   <tt><strong>apt-get install openjdk-8-jre-headless && 
   java -version
   </strong></tt>

   ### Get Elasticsearch

0. Make a folder:

   <tt><strong>mkdir pkg
   </strong></tt>

0. QUESTION: Identify the version you want to use.

0. Download Debian package from Elastic:

   <tt><strong>wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.0.deb
   </strong></tt>

   PROTIP: RPM and Debian packages are available. Satellite versions from the OS
   ES.co does not recommend apt-get which may be older than those directly from Elastic.co.

0. De-package:

   <tt><strong>dpkg -i elasticsearch-5.6.0.deb
   </strong></tt>



   <a name="elasticsearch.yml"></a>

   ### Configure defaults

0. PROTIP: Some copy over the file with one from your own GitHub repository.

0. Edit using the nano text editor:

   <tt><strong>nano /etc/elasticsearch/elasticsearch.yml
   </strong></tt>

0. Remove the # to change `cluster.name: ` to yours.
0. Make the `node.name` the same.
0. Uncomment `network.host` to the IP address of the server.
0. Save and exit the text editor.

   ### Memory maps

   PROTIP: Elasticsearch makes extensive use of memory maps. So give it the maximum.

   On a Linux server:

   <tt><strong>sysctl -w vm.max_map_count=262144
   </strong</tt>

0. Start:

   <tt><strong>service elasticsearch start
   </strong></tt>

   Alternately, on a Windows machine:

   <tt><strong>.\elasticsearch-service.bat install Elasticsearch
   </strong></tt>

0. Verify access using a headless API call to its port, for example:

   <tt><strong>curl http://192.168.0.12:9200
   </strong></tt>

   On Windows, bring up PowerShell and:

   <tt><strong>Invoke-WebRequest -Uri http://192.168.0.12:9200
   </strong></tt>

   The response should be JSON reflecting its most recent build metadata.

0. Make it come up after a reboot. On Linux:

   <tt><strong>systemctl enable elasticsearch
   </strong></tt>






<hr />

## Various Random Notes 

Upgrade checker for those upgrading from 1.x.

0. Download
0. Unzip
0. Use a text editor to edit elasticsearch.yml.
0. Delete the # comment for each line. Settings are in the form of key, then a colon, then a value.

0. echo $JVM_HOME

   See http://www.mkyong.com/java/how-to-set-java_home-environment-variable-on-mac-os-x/

0. If you downloaded to the Download folder and double-clicked to unzip there:

  ```
cd ~/Downloads/elasticsearch-2.0.0
  ```

0. Invoke

  ```
bin/elasticsearch --cluster.name=my-application --node.name=node-1 --path.repo=/
  ```

   PROTIP: From the bottom up, docs are stored in shards which live in a node.
   Each node is deployed as a physical machine or VM node.
   Multiple nodes can run within a physical machine.
   Node configurations include file path, label, network interface.
   Node default name is a random Marvel Super Hero name.
  
   On Windows -Des.node.name=

   ES balances shards around a cluster of ES nodes.

   Docs (in JSON format) from clients are routed to an index.
   An index is a container for docs (not just a list of pointers).
   Index configurations include shards, replicas, refresh rates, read only, etc.

   Once in a shard, a document remains in that shard.

   The number of fixed type shards is fixed at creation.

   A <strong>replica type shard</strong> can be changed dynamically.
   Having replicas means that 

   ES is built on top of Apache Lucene which provides index and query execution
   
   http://lucene.apache.org/solr/

   There is usually a load balancer to distribute load among nodes within a cluster.
   http. default ports 9200-9300 for API traffic.
   transport.tcp.port 9300 for long-lived connections among nodes.

   If a machine has multiple network cards, 
   ideally, use a different vlan between nodes.
   
   Java clients are hard-coded to 9300.

   ES nodes are stateless.
   ES provides no rollback capabilities like SQL servers.

   Logging is done at the cluster.

   Each node respond to API calls to set configuration, mapping, templates, aliases, and index setting.

   How many:

  ```
curl -XPOST 'localhost:9200/myindex/_segments'
  ```

   If ELK is used only to ingest logs:

  ```
curl -XPOST 'localhost:9200/myindex/_optimize?max_num_segments=2'
  ```

   ES is a Java app.
   Use the JDK for thread dumps, etc.


   In  the ES folder:

   * config pointed from path.config in /etc/elasticsearch

   * data pointed from path.data, avoid $ES_HOME/data

   * logs pointed from path.logs in /var/log/elasticsearch, default to $ES_HOME/logs

   * plugins pointed from path. plugins

   * scripts pointed from path.scripts

   Log rotation daily by default.

   Maxium amount of space consumed.

   ES_HEAP_SIZE sets other options for you.
  
   * Don't set above 30gb or JVM won't compress object pointers and loose addressible heap space.
   * Don't alloc more than 50% of RAM on box to ES (for OS & file system cache).
   * Don't let JVM swap out disk by setting --boottrap.mlocakall=true in command or ES YML file.


   Within Lucene, docs indexed into a temporary buffer.
   Lucene flushes docs to a segment so it can be searched.
   It contains an inverted index.
   _ refreshed every second.
   Segments are immutable (cannot be changed).
   To expunge deleted, segments are merged.

   Filters are good all the time, and re-indexing is not necessary.

   Doc Values sits in separate file on disk
   At query time there is no memory overhead but is slower.

   The elected Master node does the cluster-level configuration.
   By default all nodes are master eligible.
   A cluster can potentially be split into two sub clusters (a split brain).


   http://blog.mikemccandless.com/2011/02/visualizing-lucenes-segment-merges.html

   Usually setup 3 dedicated master nodes after 10.
   This doesn't affect performance.

