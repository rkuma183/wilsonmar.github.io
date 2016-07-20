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

The technical components according to 
<a target="_blank" href="https://www.predix.io/resources/training">
https://www.predix.io/resources/training</a>

0. <a href="#Devbox">Devbox with pre-built virtual machines</a>
0. <a href="#LocalInstall">Local install</a> Eclipse IDE (text editor) with STS (Spring Tool Suite)
0. Java programming language
0. <a href="#Spring">Spring framework</a>
0. <a href="#OpenJPA">Apache OpenJPA persistence</a>
0. Maven build
0. <a href="#CloudFoundary">Hosting in the Cloud Foundry cloud</a>

<hr />

<a name="#Devbox"></a>

## Devbox #

If you're running on a Oracle/Red Hat Linux System

https://www.predix.io/resources/tutorials

<a target="_blank" href="https://www.predix.io/services/other-resources/devbox.html">
https://www.predix.io/services/other-resources/devbox.html</a>:

Collaboration:

   * GIT, SVN, Pair Programming*, 
   * Environment Portability*, 
   * Multiple Sandbox Environments*

IDE / Editors:

   * STS/Eclipse, 
   * Atom, 
   * <a target="_blank" href="http://bfwiki.tellefsen.net/index.php/Installing_Bluefish">Bluefish</a>
   * OpenOffice for spreadsheets
   * PGAdmin3 1.20.0

Front End:

   * Bower, NodeJS, Grunt, 
   * Firefox, Chromium browsers

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

Use the script at https://github.com/PredixDev/local-setup


<a name="Eclipse"></a>

### Eclipse STS IDE #

https://www.predix.io/resources/tutorials/journey.html#1607
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

   cd cf-sample-app-spring

0. Sign in to PWS:

   cf login -a https://api.run.pivotal.io

   ### API End-points #

   API endpoint: https://api.run.pivotal.io


   Predix Basic for individual emails:

   * https://api.system.aws-usw02-pr.ice.predix.io

   Predix Select for company names:

   * https://api.system.asv-pr.ice.predix.io

0. Type in your Email and Password.

   The response:

   <pre>
API endpoint:   https://api.run.pivotal.io (API version: 2.57.0)
User:           xxx@gmail.com
No org or space targeted, use 'cf target -o ORG -s SPACE'
   </pre>

   <a name="cfPush"></a>

0. Push the app to PWS:

   cf push

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

