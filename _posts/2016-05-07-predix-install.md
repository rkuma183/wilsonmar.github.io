---
layout: post
title: "Predix install"
excerpt: "Setup Machine Learning for the Industrial Internet"
tags: [ML, GE]
image:
# feature: pic white robots woman 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622167/45abd918-0585-11e6-8537-a58e0b55e3ec.jpg
  credit: Cyberconstruct.be
  creditlink: http://cyberconstruct.be/2015/02/digital-job-crafting/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This article refines instructions to <strong>install</strong>
Predix, GE's brand name for their "Industrial Internet" which 
incorporates Machine Learning, Data Science, and Artificial Intelligence.

Options to install the <a href="#Components">various components</a>:

0. <a href="#CloudFoundary">Hosting in the Cloud Foundry cloud</a>
0. <a href="#LocalInstall">Local install</a>
0. <a href="#Devbox">Devbox with pre-built virtual machines</a>


The technical components according to 
<a target="_blank" href="https://www.predix.io/resources/training">
https://www.predix.io/resources/training</a>

<hr />

<a name="#Components"></a>

## Components #

Collaboration:

   * GIT, SVN, Pair Programming*, 
   * Environment Portability*, 
   * Multiple Sandbox Environments*

IDE / Editors:

   * STS/Eclipse <a href="#Spring">Spring framework</a>
   * Atom, 
   * <a target="_blank" href="http://bfwiki.tellefsen.net/index.php/Installing_Bluefish">Bluefish</a>
   * OpenOffice for spreadsheets
   * PGAdmin3 1.20.0

Front End:

   * Bower, NodeJS, Grunt, 
   * Firefox, Chromium browsers
   * <a href="#OpenJPA">Apache OpenJPA persistence</a>


Back End:

   * Cloud Foundry CLI, User Authentication and Authorization CLI, 
   * Java, 
   * Maven, 
   * Ruby, 
   * [Python](/python-on-apple-mac-osx/)
   * RabbitMQ Message Queue

Database:

   * PostgreSql 9.3 and psql utilities, 
   * Couchdb

Big Data:

   * Anaconda distribution of Python (Pandas, Scipy, Numpy, and sklearn)

Predix:

   * Predix Machine 16.x, 
   * Predix demo


<a name="#LocalInstall"></a>

## Local install #

Use the script at<br />
<a target="_blank" href="https://github.com/PredixDev/local-setup">
https://github.com/PredixDev/local-setup</a>



<a name="#Devbox"></a>

## Devbox #

If you're running on a Oracle/Red Hat Linux System

https://www.predix.io/resources/tutorials

<a target="_blank" href="https://www.predix.io/services/other-resources/devbox.html">
https://www.predix.io/services/other-resources/devbox.html</a>:

<hr />

<a name="Eclipse"></a>

### Eclipse STS IDE #

<a target="_blank" href="https://www.predix.io/resources/tutorials/journey.html#1607">
This</a>
advises the use of STS 

0. Use an interest browser to the STS website.
0. Select a download site to begin download. Wait for the file to download.
0. Unzip
0. In Finder, navigate inside the folder, such as:

   ~/Documents/workspace-sts-3.8.0.RELEASE

   This contains the server.

0. Move and/or rename the folder according to your organization's standards.

0. In Finder navigate to /Applications.
0. Move (drag and drop) STS.app to /Applications.
0. Open STS by double-clicking the icon.
0. Click Open icon for first-time confirmation.
0. Specify your workspace.



## STS (Spring Tools Suite) #

<a target="_blank" href="https://marketplace.eclipse.org/content/spring-tool-suite-sts-eclipse">
Included with STS</a> (Spring Tools Suite)
is the developer edition of Pivotal tc Server, 
the drop-in replacement for Apache Tomcat that’s optimized for Spring.

The Spring Insight console, tc Server Developer Edition, 
provides a graphical real-time view of application performance metrics that lets developers identify and diagnose problems from their desktops.


<a name="Spring"></a>

## Spring framework

<a target="_blank" href="https://spring.io/guides/">
https://spring.io/guides</a>

The framework is based on the Java Spring framework,
which many now consider "heavy".

This is surprising considering most others in their industry
have gone to Python or React.

QUESTION: Why Spring and not Node or Python or React?

Maybe it's because there are more Java Spring developers unemployed than the other hotter frameworks?

Or that Spring is more "mature" as a framework since it's been around since the 90's.


## predixdev #

During register for a Predix account, 
each developer's GitHub account is granted access to 
the repository and a number of subrepositories
at

   * <a target="_blank" href="https://github.com/predixdev/">https://github.com/predixdev</a>



## <a name="CloudFoundry">Cloud Foundry cloud</a> #

https://www.vmware.com/products/vfabric-tcserver/
Cloud Foundry is by VMware Pivotal
is purchased as part of the 
<a target="_blank" href="https://www.vmware.com/products/vfabric/overview.html">
VMWare Fabric</a>
containing the "VMware vFabric tc Server".

0. At https://github.com/cloudfoundry/cli/releases
   click the "Latest Release".

0. Use Homebrew:

   <tt><strong>
   brew tap cloudfoundry/tap
   </strong></tt>

  The response (on 7 July 2016):

  <pre>
==> Tapping cloudfoundry/tap
Cloning into '/usr/local/Library/Taps/cloudfoundry/homebrew-tap'...
remote: Counting objects: 7, done.
remote: Compressing objects: 100% (6/6), done.
remote: Total 7 (delta 0), reused 3 (delta 0), pack-reused 0
Unpacking objects: 100% (7/7), done.
Checking connectivity... done.
Tapped 2 formulae (33 files, 27K)
  </pre>

0. Install Command Line Interface:

   <tt><strong>
   brew install cf-cli
   </strong></tt>

   The response:

   <pre>
==> Installing cf-cli from cloudfoundry/tap
==> Downloading https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.20.0&source=homebrew
==> Downloading from https://s3.amazonaws.com/go-cli/releases/v6.20.0/cf-cli_6.20.0_osx.tgz
######################################################################## 100.0%
🍺  /usr/local/Cellar/cf-cli/6.20.0: 2 files, 22.1M, built in 18 seconds
   </pre>

0. Verify:

   <tt><strong>
   cf help
   </strong></tt>

   The response <strong>expand the width of shell window</strong> to see:

   <pre>
NAME:
   cf - A command line tool to interact with Cloud Foundry

USAGE:
   cf [global options] command [arguments...] [command options]

VERSION:
   6.20.0+25b1961-2016-06-29
   
GETTING STARTED:
   help                                   Show help
   version                                Print the version
   login                                  Log user in
   logout                                 Log user out
   passwd                                 Change user password
   target                                 Set or view the targeted org or space

   api                                    Set or view target api url
   auth                                   Authenticate user non-interactively

APPS:
   apps                                   List all apps in the target space
   app                                    Display health and status for app

   push                                   Push a new app or sync changes to an existing app
   scale                                  Change or view the instance count, disk space limit, and memory limit for an app
   delete                                 Delete an app
   rename                                 Rename an app

   start                                  Start an app
   stop                                   Stop an app
   restart                                Restart an app
   restage                                Restage an app
   </pre>

   ### Sample app #

0. In an internet browser, explore sample apps in Cloud Foundry's sample organization:<br />
   <a target="_blank" href="https://github.com/cloudfoundry-samples/">
   https://github.com/cloudfoundry-samples</a>

   Back at the Termial:

0. Clone the sample app:

   <tt><strong>
   mkdir ~/gits/pivotal<br />
   cd ~/gits/pivotal<br />
   git clone https://github.com/cloudfoundry-samples/cf-sample-app-spring.git
   </strong></tt>

   The response:

   <pre>
Cloning into 'cf-sample-app-spring'...
remote: Counting objects: 69, done.
remote: Total 69 (delta 0), reused 0 (delta 0), pack-reused 69
Unpacking objects: 100% (69/69), done.
Checking connectivity... done.
   </pre>


0. Navigate to the repo created:

   <tt><strong>
   cd cf-sample-app-spring
   </strong></tt>

0. Sign in to PWS:

   <tt><strong>
   cf login -a https://api.run.pivotal.io
   </strong></tt>

   The response:

   <pre>
API endpoint: https://api.run.pivotal.io
Email> 
   </pre>

0. Type in your Email, then Password.

   The response:

   <pre>
API endpoint:   https://api.run.pivotal.io (API version: 2.57.0)
User:           xxx@gmail.com
No org or space targeted, use 'cf target -o ORG -s SPACE'
   </pre>
0. Type in email and password (which is not reflected back to the screen):

   <pre>
Authenticating...
OK
&nbsp;
Targeted org montana
&nbsp;
Select a space (or press enter to skip):
1. development
2. joliet
&nbsp;
Space> 2
   </pre>

0. Type in the number associated with the space you want to use (based on the list):

   <pre>
Targeted space joliet
&nbsp;
API endpoint:   https://api.run.pivotal.io (API version: 2.57.0)
User:           xxx@gmail.com
Org:            montana
Space:          joliet
   </pre>



   ### API End-points #

   API endpoint: https://api.run.pivotal.io


   Predix Basic for individual emails:

   * https://api.system.aws-usw02-pr.ice.predix.io

   Predix Select for company names:

   * https://api.system.asv-pr.ice.predix.io


   ### Deploy app #

0. Deploy the app to PWS:

   <tt><strong>
   cf push
   </strong></tt>

   The response begins with:

   <pre>
Using manifest file /Users/mac/gits/pivotal/cf-sample-app-spring/manifest.yml
&nbsp;
Creating app cf-spring in org montana / space joliet as wilsonmar@gmail.com...
OK
&nbsp;
Creating <strong>route cf-spring-isomagnetic-pleiophylly.cfapps.io...</strong>
OK
&nbsp;
Binding cf-spring-isomagnetic-pleiophylly.cfapps.io to cf-spring...
OK
&nbsp;
Uploading cf-spring...
Uploading app files from: /Users/mac/gits/pivotal/cf-sample-app-spring
Uploading 1M, 44 files
Done uploading               
OK
&nbsp;
Starting app cf-spring in org montana / space joliet as xxx@gmail.com...
   </pre>

   The response ends with:

   <pre>
requested state: started
instances: 1/1
usage: 512M x 1 instances
urls: cf-spring-isomagnetic-pleiophylly.cfapps.io
last uploaded: Wed Jul 20 02:10:46 UTC 2016
stack: unknown
buildpack: java-buildpack=v3.8.1-offline-https://github.com/cloudfoundry/java-buildpack.git#29c79f2 open-jdk-like-jre=1.8.0_91-unlimited-crypto open-jdk-like-memory-calculator=2.0.2_RELEASE spring-boot-cli=1.3.5_RELEASE
&nbsp;
     state     since                    cpu    memory           disk         details
#0   running   2016-07-19 08:11:24 PM   0.0%   338.7M of 512M   155M of 1G
   </pre>

0. TODO: Change the log color.

0. <a target="_blank" href="http://pivotal.io/platform/pcf-tutorials/getting-started-with-pivotal-cloud-foundry/view-the-logs">
   View log snapshots</a>

   <tt><strong>
   cf logs cf-spring --recent
   </strong></tt>

   ### From Marketplace #

0. List the available ElephantSQL service plans in the Marketplace:

   <tt><strong>
   cf marketplace -s elephantsql
   </strong></tt>

   The response:

   <pre>
Getting service plan information for service elephantsql as wilsonmar@gmail.com...
OK
&nbsp;
service plan   description                                            free or paid
turtle         4 concurrent connections, 20MB Storage                 free
panda          20 concurrent connections, 2GB Storage                 paid
hippo          300 concurrent connections, 100 GB Storage             paid
elephant       300 concurrent connections, 1000 GB Storage, 500Mbps   paid
   </pre>

0. Create a service instance with the free plan "turtle":

   <tt><strong>
   cf create-service elephantsql turtle cf-spring-db
   </strong></tt>

   The response:

   <pre>
Creating service instance cf-spring-db in org montana / space joliet as xxx@gmail.com...
OK
   </pre>

0. Bind the newly created service to the app:

   <tt><strong>
   cf bind-service cf-spring cf-spring-db
   </strong></tt>

   NOTE: When a service is bound to an app, 
   environment variables are stored that allow the app to 
   connect to the service after a push, restage, or restart command.

   The response:

   <pre>
Binding service cf-spring-db to app cf-spring in org montana / space joliet as wilsonmar@gmail.com...
OK
TIP: Use 'cf restage cf-spring' to ensure your env variable changes take effect
   </pre>


0. Restart the app:

   <tt><strong>
   cf restart cf-spring
   </strong></tt>

   The response:

   <pre>
Stopping app cf-spring in org montana / space joliet as xxx@gmail.com...
OK
&nbsp;
Starting app cf-spring in org montana / space joliet as xxx@gmail.com...
&nbsp;
0 of 1 instances running, 1 starting
   </pre>

0. Verify the new service is bound to the app:

   <tt><strong>
   cf services
   </strong></tt>

   The response:

   <pre>
name           service       plan     bound apps   last operation
cf-spring-db   elephantsql   turtle   cf-spring    create succeeded
   </pre>


   ### Configure scaling #

0. Increase the number of app instances from one to two:

   <tt><strong>
   cf scale cf-spring -i 2
   </strong></tt>

0. Check the status of the app and verify there are two instances running:

   <tt><strong>
   cf app cf-spring
   </strong></tt>

   WARNING: Scaling your app vertically changes the disk space limit or memory limit for each app instance.

0. Increase the memory limit for each app instance:

   <tt><strong>
   cf scale cf-spring -m 1G
   </strong></tt>

0. Increase the disk limit for each app instance:

   <tt><strong>
   cf scale cf-spring -k 512M
   </strong></tt>


<hr />

0. Install uaac:

   <tt><strong>
   gem install cf-uaac
   </strong></tt>

   The response:

   <pre>
Fetching: multi_json-1.12.1.gem (100%)
Successfully installed multi_json-1.12.1
Fetching: cf-uaa-lib-3.4.0.gem (100%)
Successfully installed cf-uaa-lib-3.4.0
Fetching: highline-1.6.21.gem (100%)
Successfully installed highline-1.6.21
Fetching: eventmachine-1.0.9.1.gem (100%)
Building native extensions.  This could take a while...
Successfully installed eventmachine-1.0.9.1
Fetching: launchy-2.4.3.gem (100%)
Successfully installed launchy-2.4.3
Fetching: cookiejar-0.3.3.gem (100%)
Successfully installed cookiejar-0.3.3
Fetching: em-socksify-0.3.1.gem (100%)
Successfully installed em-socksify-0.3.1
Fetching: http_parser.rb-0.6.0.gem (100%)
Building native extensions.  This could take a while...
Successfully installed http_parser.rb-0.6.0
Fetching: em-http-request-1.1.5.gem (100%)
Successfully installed em-http-request-1.1.5
Fetching: json_pure-1.8.3.gem (100%)
Successfully installed json_pure-1.8.3
Fetching: rack-1.5.5.gem (100%)
Successfully installed rack-1.5.5
Fetching: cf-uaac-3.3.0.gem (100%)
Successfully installed cf-uaac-3.3.0
Parsing documentation for multi_json-1.12.1
Installing ri documentation for multi_json-1.12.1
Parsing documentation for cf-uaa-lib-3.4.0
Installing ri documentation for cf-uaa-lib-3.4.0
Parsing documentation for highline-1.6.21
Installing ri documentation for highline-1.6.21
Parsing documentation for eventmachine-1.0.9.1
Installing ri documentation for eventmachine-1.0.9.1
Parsing documentation for launchy-2.4.3
Installing ri documentation for launchy-2.4.3
Parsing documentation for cookiejar-0.3.3
Installing ri documentation for cookiejar-0.3.3
Parsing documentation for em-socksify-0.3.1
Installing ri documentation for em-socksify-0.3.1
Parsing documentation for http_parser.rb-0.6.0
Installing ri documentation for http_parser.rb-0.6.0
Parsing documentation for em-http-request-1.1.5
Installing ri documentation for em-http-request-1.1.5
Parsing documentation for json_pure-1.8.3
Installing ri documentation for json_pure-1.8.3
Parsing documentation for rack-1.5.5
Installing ri documentation for rack-1.5.5
Parsing documentation for cf-uaac-3.3.0
Installing ri documentation for cf-uaac-3.3.0
Done installing documentation for multi_json, cf-uaa-lib, highline, eventmachine, launchy, cookiejar, em-socksify, http_parser.rb, em-http-request, json_pure, rack, cf-uaac after 10 seconds
12 gems installed
   </pre>

0. Verify use of uaac:

   <tt><strong>
   uaac
   </strong></tt>

   The response:

   <pre>
UAA Command Line Interface

Miscellaneous
  version                          Display version
  help [topic|command...]          Display summary or details of command or topic
  target [uaa_url]                 Display current or set new target
   </pre>

0. Install bower for front-end UI flat (non-recursive) dependencies tree:

   <tt><strong>
   npm install -g bower
   </strong></tt>

   See https://coolestguidesontheplanet.com/installingbower-on-osx/

   Verify:

   <tt><strong>
   bower --version
   </strong></tt>




## Install Predix #

See https://www.predix.io/resources/tutorials/tutorial-details.html?tutorial_id=1523

0. Create a folder (~/gits/predix) to hold repos and cd to it.

   Predix offers two samples:

   * git clone https://github.com/PredixDev/predix-microservice-cf-jsr.git
   * git clone https://github.com/PredixDev/predix-microservice-cf-spring.git

0. Create repo for JSR and cd into it:

   <tt><strong>
   git clone https://github.com/PredixDev/predix-microservice-cf-jsr.git<br />
   cd predix-microservice-cf-jsr
   </strong></tt>

   The tree of folders and files for JSR is more complex than Spring:

   <pre>
|-- COPYRIGHT.md
|-- LICENSE.md
|-- README.md
|-- config
|   `-- application.properties
|-- manifest.yml
|-- pom.xml
`-- src
    |-- main
    |   |-- java
    |   |   `-- com
    |   |       `-- ge
    |   |           `-- predix
    |   |               `-- solsvc
    |   |                   |-- boot
    |   |                   |   |-- Application.java
    |   |                   |   |-- PredixBootSecurityConfig.java
    |   |                   |   `-- service
    |   |                   |       `-- cxf
    |   |                   |           |-- ApplicationJSONProvider.java
    |   |                   |           |-- DefaultService.java
    |   |                   |           |-- DynamicService.java
    |   |                   |           `-- DynamicServiceImpl.java
    |   |                   `-- spi
    |   |                       |-- IServiceManagerService.java
    |   |                       |-- NamedCxfProperties.java
    |   |                       `-- ServiceManagerServiceImpl.java
    |   `-- resources
    |       |-- META-INF
    |       |   `-- spring
    |       |       |-- predix-microservice-cf-jsr-cxf-context.xml
    |       |       `-- predix-microservice-cf-jsr-scan-context.xml
    |       |-- application-default.properties
    |       `-- application.properties
    `-- test
        |-- java
        |   `-- com
        |       `-- ge
        |           `-- predix
        |               `-- solsvc
        |                   `-- boot
        |                       `-- HelloControllerTest.java
        `-- resources
            `-- application.properties
&nbsp;
23 directories, 21 files
   </pre>

0. Create the repo for Spring and cd into it:

   <tt><strong>
   git clone https://github.com/PredixDev/predix-microservice-cf-spring.git<br />
   cd predix-microservice-cf-spring
   </strong></tt>

   The tree of folders and files for Spring is less complex than JSR:

   <pre>
|-- COPYRIGHT.md
|-- LICENSE.md
|-- README.md
|-- config
|   `-- application.properties
|-- manifest.yml
|-- pom.xml
`-- src
    |-- main
    |   |-- java
    |   |   `-- com
    |   |       `-- ge
    |   |           `-- predix
    |   |               `-- solsvc
    |   |                   |-- boot
    |   |                   |   |-- Application.java
    |   |                   |   `-- PredixBootSecurityConfig.java
    |   |                   `-- service
    |   |                       `-- HelloController.java
    |   `-- resources
    |       |-- application-default.properties
    |       `-- application.properties
    `-- test
        `-- java
            `-- com
                `-- ge
                    `-- predix
                        `-- solsvc
                            `-- boot
                                |-- HelloControllerIT.java
                                `-- HelloControllerTest.java
18 directories, 13 files
   </pre>


## Build using Maven #

   <tt><strong>
   mvn clean package 
   </strong></tt>

   The end of a long list is like this:

   <pre>
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 02:27 min
[INFO] Finished at: 2016-07-08T08:55:47-06:00
[INFO] Final Memory: 30M/152M
[INFO] ------------------------------------------------------------------------
   </pre>


## API Setup #

https://www.youtube.com/watch?v=9SEVfK-1sCQ
Predix Intelligent Environment API Quick Start Demo


## More #

This is one of several related topics:

{% include predix_links.html %}
