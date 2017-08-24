---
layout: post
title: "Cloud-Foundry"
excerpt: "The one CLI tool to rule all cloud providers"
shorturl: "https://goo.gl/yb4WGG"
modified:
tags: []
image:
# feature: pic blue black stars spin 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14621973/fe6e21a6-0583-11e6-9a94-a969a51759b6.jpg
  credit: Jeremy Thomas
  creditlink: https://www.flickr.com/photos/132218932@N03/page2
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

Here is a hands-on introduction to using Cloud Foundry (and becoming Cloud Foundry certified).

A lot of thought has gone into the sequencing of information presented so you learn the most in the least time possible.
Concepts are introduced after you take action.


## What is Cloud Foundry?

<a target="_blank" href="https://www.cloudfoundry.org/">
cloudfoundry.org</a> is the home page of 
the non-profit vendor-independent Cloud Foundry Foundation was formed by 70 vendors in January of 2015 to own the 
Cloud Foundry open source project at

   * <a target="_blank" href="https://github.com/cloudfoundry/">https://github.com/cloudfoundry</a>
   <br /><br />

<!--
Cloud Foundry is labeled a PaaS (Platform as a Service) which manages many of the details of running applications in production. 

Running an application in production uses different skills than those development teams use to write application code. 

Cloud Foundry shortens and simplifies the process of deploying applications. 
It frees teams to focus on writing applications.
Shorter deployments allow teams to ship new code quicker and more often. 

Using Cloud Foundry throughout the development process
enables teams to catch potential production problems earlier and avoid nasty surprises in production.

Cloud Foundry is a "service-based" platform,
running containers reliably and running as many as needed. 

-->

<a name="ProviderClouds"></a>

## Provider Clouds' Endpoints

> Cloud Foundry provides a vendor-agnostic layer supporting many cloud providers.

DEFINITION: A provider is a company that hosts Cloud Foundry as a service, 
then bills the client for the resources they use.
   See https://www.cloudfoundry.org/certified-platforms/

The <strong>API Endpoint</strong> of each
<a target="_blank" href="https://cloudfoundry.org/certified-platforms/">
Cloud Foundry certified provider</a>:

   * <a target="_blank" href="https://run.pivotal.io/">Pivotal Web Services at https://run.pivotal.io</a> 
   uses `<a target="_blank" href="https://api.run.pivotal.io">https://api.run.pivotal.io</a>`
   * <a target="_blank" href="http://www.ibm.com/cloud-computing/bluemix/">IBM BlueMix at ibm.com/cloud-computing/bluemix</a> 
   uses https://api.ng.bluemix.net to IBM's Watson artificial intelligence services
   * <a target="_blank" href="https://developer.swisscom.com/?sc_ad=portallink-content-en">Swisscom Application Cloud at https://developer.swisscom.com</a> 
   uses https://api.lyra-836.appcloud.swisscom.com (https://www.swisscom.ch/en/business/enterprise/offer/cloud-data-center-services/paas/application-cloud.html">*</a>)
   * <a target="_blank" href="https://hcp.sap.com/try.html">SAP Cloud Platform at https://hcp.sap.com/try.html</a> 
   uses https://api.cf.us10.hana.ondemand.com

   * Microsoft Azure
   * Google Compute Platform (GCP)
   * VMware vSphere
   * Amazon Web Services (AWS)
   * <a target="_blank" href="https://atos.net/en/solutions/application-cloud-enablement-devops/multi-cloud-application-platform">
    Atos Cloud Foundry</a>
   * Huawei Digital Transformation FusionStage (China)
   * SoftLayer
   * <a target="_blank" href="https://www.ctl.io/appfog/">Appfrog from CenturyLink at https://www.ctl.io/appfog</a> 
   * OpenStack
   * <a target="_blank" href="https://www.predix.io/registration/">GE Predix</a>
   <br /><br />

> The genius of Cloud Foundry is that a single Command Line program provides the same interface to all cloud providers.

1. Sign Up for a free trial account at one or more of the above providers.

   Cloud Foundry is a part of Pivotal, which also provides Spring Boot for Java.

   <a target="_blank" href="https://www.youtube.com/watch?v=UWeIxJcaUbQ">
   VIDEO</a> in <a target="_blank" href="https://cloudfoundry.org/get-started/">https://cloudfoundry.org/get-started</a>
   by Steve Wahl, Sr. Cloud Architect, who references <a target="_blank" href="http://docs.cloudfoundry.org/cf-cli/install-go-cli.html">
   http://docs.cloudfoundry.org/cf-cli/install-go-cli.html</a>

   
   <a name="Org"></a>

   ### Org

0. Define the org

0. Define the route, which can be randomly assigned by cf.

0. Define the app name such as "web-app".

0. Define the binding

0. Define the space "example" as ...com.


## Cloud Foundry CLI


Install cf CLI for your operating system.

   Use package managers for easy management and upgrades. 

   * http://cli.cloudfoundry.org/
   <br /><br />


#### On Debian/Unbuntu flavors of Linux

including Kubuntu:

1. Open a terminal window.
2. Add the Cloud Foundry Foundation public key and package repository to your system:

   <pre>
   wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add -
   echo "deb http://packages.cloudfoundry.org/debian stable main" | sudo tee /etc/apt/sources.list.d/cloudfoundry-cli.list
   </pre>

   This sets up the repository. From this point, you just update your local package index, and then install the cf CLI:

   <pre>
sudo apt-get update
sudo apt-get install cf-cli
   </pre>

3. <a href="#Verify">Verify</a> below.


#### On RedHat Enterprise Edition and CentOS

1. Open a terminal window.
2. Configure the Cloud Foundry Foundation package repository:

   <pre>
sudo wget -O /etc/yum.repos.d/cloudfoundry-cli.repo https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo
   </pre>

0. Install the cf CLI (which will also download and add the public key to your system):

   <tt><strong>sudo yum install cf-cli
   </strong></tt>

3. <a href="#Verify">Verify</a> below.


#### On Apple Macintosh systems

<a target="_blank" href="https://courses.edx.org/courses/course-v1:LinuxFoundationX+LFS132x+1T2017/courseware/907cc92737af402a8ef282fb998cce95/588ee5067a2c4a6d9b3cda5e0495cf33/?child=first">
VIDEO</a>:

1. Open a Terminal window.
0. Install the packaging system Homebrew (https://brew.sh) using a Ruby instance installed by default on all Macs:

   <pre>
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   </pre>

0. "Tap" the Cloud Foundry repository from within Cloud Foundry:

   <pre>
   brew tap cloudfoundry/tap
   </pre>

0. Install the Cloud Foundry CLI:

   <pre>brew install cloudfoundry/tap/cf-cli</pre>

3. <a href="#Verify">Verify</a> below.


#### On Windows

1. Open a Run command window.
2. Download and install:

   <a target="_blank" href="https://cli.run.pivotal.io/stable?release=windows64&source=github">
   https://cli.run.pivotal.io/stable?release=windows64&source=github</a>

3. <a href="#Verify">Verify</a> below.


<a name="Verify"></a>

### Verify

   `cf` is the Cloud Foundry CLI program.

   <tt><strong>cf --version</strong></tt>

   The response (on August 23, 2017):

   <pre>cf version 6.29.1+d5129d651.2017-08-17
   </pre>

   Alternately, get that number along with a list of commands you can do from the CLI:

   <tt><strong>cf help -a</strong></tt>

   <pre>
cf version 6.29.1+d5129d651.2017-08-17, Cloud Foundry command line tool
Usage: cf [global options] command [arguments...] [command options]
&nbsp;
Before getting started:
  config    login,l      target,t
  help,h    logout,lo    
&nbsp;
Application lifecycle:
  apps,a        run-task,rt    events
  push,p        logs           set-env,se
  start,st      ssh            create-app-manifest
  stop,sp       app            
  restart,rs    env,e          
  restage,rg    scale          
&nbsp;
Services integration:
  marketplace,m        create-user-provided-service,cups
  services,s           update-user-provided-service,uups
  create-service,cs    create-service-key,csk
  update-service       delete-service-key,dsk
  delete-service,ds    service-keys,sk
  service              service-key
  bind-service,bs      bind-route-service,brs
  unbind-service,us    unbind-route-service,urs
&nbsp;
Route and domain management:
  routes,r        delete-route    create-domain
  domains         map-route       
  create-route    unmap-route     
&nbsp;
Space management:
  spaces         create-space    set-space-role
  space-users    delete-space    unset-space-role
&nbsp;
Org management:
  orgs,o       set-org-role
  org-users    unset-org-role
&nbsp;
CLI plugin management:
  plugins           add-plugin-repo      repo-plugins
  install-plugin    list-plugin-repos    
&nbsp;
Commands offered by installed plugins:
&nbsp;
Global options:
  --help, -h                         Show help
  -v                                 Print API request diagnostics to stdout
&nbsp;
These are commonly used commands. Use 'cf help -a' to see all, with descriptions.
See 'cf help &LT;command>' to read about a specific command.
   </pre>


<a name="Login"></a>

## Log into Cloud Foundry

   <tt><strong>cf login</strong></tt>

   Instead of asking for your email and password again for every command,
   once logged in, Cloud Foundry generates a temporary token that the CLI can store and use 
   (typically for 24 hours).

   The <a href="#Org">Org</a>, route and space.


   ### Set Endpoint

0. To set as endpoint the Pivotal cloud:

   <tt><strong>cf api https://api.run.pivotal.io
   </strong></tt>

   The response:

   <pre>
Setting api endpoint to https://api.run.pivotal.io...
OK
&nbsp;
api endpoint:   https://api.run.pivotal.io
api version:    2.93.0
Not logged in. Use 'cf login' to log in.
   </pre>


### BOSH Mainfest.yml

A <strong>manifest.yml</strong> file defines all the pieces of its system for releases.
The file defines default values for the app defined within its folder.
For example:

   <pre>
---
applications:
- name: web-app
  memory: 32M
  disk_quota: 256M
  random-route: true
  buildpack: https://github.com/cloudfoundry/ruby-buildpack.git
   </pre>

   The default memory is one gigabyte.

   <a href="#Buildpacks">Buildpacks are ...</a> at <a target="_blank" href="https://github.com/cloudfoundry">
   https://github.com/cloudfoundry</a>

https://en.wikipedia.org/wiki/YAML

See https://bosh.io/docs/deployment-manifest.html

BOSH is a "lifecycle management" tool used to run Cloud Foundry itself.

https://github.com/cloudfoundry/bosh

BOSH is a self-referencing acronym where the "B" stands for BOSH.
The "OSH" in BOSH is from <strong>"Outer Shell"</strong>.

https://github.com/cloudfoundry/docs-bosh

BOSH is used "under the covers" of Pivotal CF to deploy and update infrastructure components. 

contents are put into a compressed folder and stored on the <strong>BOSH server</strong>.

A BOSH operator (person) writes and manages various releases built with BOSH.

BOSH deploys agent software on each part of the system, so that if one piece fails, 
the agent can quickly alert operators and perhaps even automatically repair the problem. 

You only need special permissions to add, move, or delete them, you do not need special permissions to use them in your manifests or push command correct.


### Push (upload) from your local machine

<a target="_blank" alt="19 Apr 2017 [2:31]" href="https://www.youtube.com/watch?v=YJMMVCVsRm4">
VIDEO</a>

0. <a href="#Login">Login to cf</a> (as described above)
0. Navigate to the application folder you wish to push (cd Pushing/web-app)
0. See the options associated with the cf push command:

   <tt><strong>cf help push</strong></tt>

   Alternately:

   <tt><strong>cf push -h</strong></tt>

   Here's the response:

   <pre>
   cf push APP_NAME [-b BUILDPACK_NAME] [-c COMMAND] [-d DOMAIN]
[-f MANIFEST_PATH] [--docker-image DOCKER_IMAGE]
   [-i NUM_INSTANCES] [-k DISK] [-m MEMORY] [--hostname HOST] [-p PATH]
[-s STACK] [-t TIMEOUT] [-u (process | port | http)] [--route-path ROUTE_PATH]
   [--no-hostname] [--no-manifest] [--no-route] [--no-start] [--random-route]
   </pre>

   NOTE: You can specify how much memory to allocate.

   PROTIP: An cf development enviornment is not needed just to push.

0. Push to CFs <strong>Cloud Controller</strong> based on what is defined in the manifest.yml file:
   
   <tt><strong>cf push 
   </strong></tt>

   Alternately:

   <tt><strong>cf set-env APP-NAME web-app
   cf push web-app \-\-no-start
   cf set-env APP-NAME special_token h4DKt6W7Fm4dLJxtBU37aW
   cf start APP-NAME
   </strong></tt>

   `web-app` is not needed if the name is defined in the manifest.yml file.

   `--no-start` stages apps instead of starting them immediately.

   `cf set-env APP-NAME special_token h4DKt6W7Fm4dLJxtBU37aW`<br />
   sets an envionment variable containing an access token

   `cf start APP-NAME` 

   What should happen:
   <!-- https://courses.edx.org/courses/course-v1:LinuxFoundationX+LFS132x+1T2017/courseware/05655ef9d6cf4b388239a47663b6b4a8/2336c77fbbdc48029ead67ce44bafe20/?child=first -->  
   ![cf-pushing-workflow-1024x768-179](https://user-images.githubusercontent.com/300046/29647251-4e161eba-8856-11e7-8608-3bd2ceeed495.jpg)

   The code is transformed through its deployment process through three stages into the application.

   1. Build transforms your code into an executable form.

      - The cf CLI gathers your app’s files and uploads them to Cloud Foundry Cloud Controller.

      - The Cloud Controller finds the needed Buildpack.

      - The Buildpack gather everything needed to build and run on Cloud Foundry, then builds an application image (<strong>Droplet</strong>).

   2. Release combines the executable with available configuration.

      The droplet is copied to a application <strong>container</strong>. 

      Within a container, the droplet is unpacked. The command to start your application is run. 

      If more instances of your application is created, the same droplet is used on those new application containers. 
      The droplet is built once, when pushed, and its use ensures that all future releases are identical until the next push.

   3. "Run" is when the release package gets deployed and executed.

      "<strong>Diego</strong>" takes that Droplet and runs it in a Container (Diego Cell).

      NOTE: Within Cloud Foundry, HTTP traffic is handled by the "GoRouter" gateway which connects two or more networks.
      The "Go" in the name is there because it was recently re-written (from the original Ruby) in the Go programming language
      to provide better performance through concurrency and a lower latency for each request.
      
      Externally are clients from the internet, in the middle is the router, and internally are the services of Cloud Foundry.

      Container execution is handled by "Garden".

0. Highlight the random URL CF generates (for example "flowing-packets" in "web-app-flowing-packets.cfapps.io")
   to copy to your Clipboard.

0. List the apps:

   <tt><strong>cf apps
   </strong></tt>

0. List the routes:

   <tt><strong>cf routes
   </strong></tt>

0. Open to view the app runnning. For example:

   <tt><strong>open https://web-app-flowing-packets.cfapps.io
   </strong></tt>

   The sample web-app from EDX simply says
   "Congratulations on pushing your first Cloud Foundry App".

   ### Load Balancer

   Many production environments have a load balancer in front of the requests coming into their network
   -- the entry point to the Cloud Foundry network. 

   The job of a hardware load-balancing device :

   * Minimize network downtime
   * Facilitate traffic prioritization 
   * Provide end-to-end application monitoring
   * Provide user authentication
   * Protect against malicious activity
   * Mitigate denial-of-service (DoS) attacks.

   Staging, functional testing, and development environments typically do not use a hardware device. 
   Instead, they will use <strong>HAProxy</strong> software to simulate the capabilities in software that the hardware device provides.

0. View the HTML to the app runnning. For example:

   <tt><strong>curl https://web-app-flowing-packets.cfapps.io
   </strong></tt>

0. View the app's logs created recently:

   <tt><strong>cf logs web-app \-\-recent
   </strong></tt>


   ### Restore

0. PROTIP: Create a script with the above and execute that instead of typing them again and again.

   ### Restore vs. Restart

   `--no-start` stages apps instead of starting them so people can view it.

   `cf set-env APP-NAME special_token h4DKt6W7Fm4dLJxtBU37aW`

   When a database is too small and you need to upgrade it, set up a larger server in preparation, import the database to it. 
   To use the new server, change the database URL in your configuration file and restart the application.

   `cf restart APP-NAME`



   ### Delete apps

0. Stop the application, destroy the containers, and remove the applications blobs.

   <tt><strong>cf delete web-app -r -f<br />
   cf delete web-worker -r -f
   </strong></tt>   

   `-r` also removes the route:

   <tt><strong>cf delete example com --hostname web-app-random-name
   </strong></tt>

## Service Marketplace

0. Find the service and plan you need:
   
   <tt><strong>cf marketplace<br />
   cf marketplace -s SERVICE
   </strong></tt>

   Drag the edge of the Terminal window to expand its width so you can see this:

   <a target="_blank" href="https://user-images.githubusercontent.com/300046/29647941-d9ca4ee2-8859-11e7-84d8-67c3d808dec9.png">
   <img alt="cf-marketplace-650x210-115kb" src="https://user-images.githubusercontent.com/300046/29647925-b86501f2-8859-11e7-89b1-e2d1e86b3ae8.png">
   <small>(Click to pop-up large image)</small></a>


0. Create an instance of the service:

   <tt><strong>cf create-service
   </strong></tt>

0. Tell Cloud Foundry which app to connect the service to:

   <tt><strong>cf bind-service
   </strong></tt>



## Elastic Runtime

A "runtime" consists of a specific choice of operating system, libraries, security measures, languages, and frameworks 
that need to be made operational.  

The runtime takes the instructions of the code and reduces them to the smallest set needed in order to operate. 
For Java, the runtime is called the Java Virtual Machine (JVM). 
The code that has been compiled is reduced into another form, called a binary. 
This binary can then be executed by the JVM.

"Elastic runtime" is about growing or shrinking processors, memory, disk space, etc. 
to meet demand from customers. 

To scale 5 instances containing myApp :

   <tt><strong>cf scale myApp -i 5</strong></tt>




### Create spaces to keep different apps and services logically organized.

   DEFINITION: Worker apps wait for requests, like a cron job (daemons) in Linux.
   Worker apps can start on a schedule, such as every 15 minutes.



<a name="Buildpacks"></a>

## Buildpacks

Runtimes are created by a buildpack.
So each buildpack typically targets a programming language and its corresponding build tools. 

See what buildpacks are available:

   <tt><strong>cf buildpacks
   </strong></tt>

CF can detect the applications' programming language:

   * Ruby buildpacks look for Gemfiles and Gemfile.lock files and runs Bundler
   * Node.js buildpacks look for packages.json and runs NPM or Yarn
   * Java looks for framework features like the .groovy directory for Groovy applications. Java can run Ant, Maven, and Gradle, depending on what it detects.
   * PHP may run Compose
   * Go
   * Python runs pip
   * Static Files buildpacks look for a file named Staticfiles 
   * Erlang https://github.com/cloudfoundry-community/cf-docs-contrib/wiki/Buildpacks
   * Swift https://github.com/cloudfoundry-community/swift-buildpack.git
   * Perl runs CPAN

   <!-- https://courses.edx.org/courses/course-v1:LinuxFoundationX+LFS132x+1T2017/courseware/a3d422fd1e7142a0a23bf754307a69f0/79bdd1365cbe4512ac9cd16bb9cfcdb6/?child=first -->

   https://docs.cloudfoundry.org/buildpacks/#system-buildpacks

   <a target="_blank" href="https://elements.heroku.com/buildpacks">
   Heroku third-party buildpacks</a> can be used on Cloud Foundry with little to no modification.

   ### Config parameters

   Buildpacks can have configuration parameters, so you can modify what features will be included with your application. For example, the PHP language buildpack allows you to choose which web server to use. 

   Some buildpacks even help you manage a service’s credentials when attaching and detaching a service such as a database, by managing additional application configuration parameters, such as environment variables and configuration files. 

   * Install dependencies your applications require
   * Compile your applications, if necessary
   * Provide Cloud Foundry with application configuration data. 

Buildpacks standardize the process for building applications, 
so the various steps during building that are common can use the same commands and tools.



## Resilience and Availability

<a target="_blank" href="https://12factor.net/">
https://12factor.net</a>
is a guide written by Heroku platform co-founder
by Adam Wiggins (<a target="_blank" href="https://twitter.com/hirodusk?lang=en">@hirodusk</a> in Berlin, Germany; 
<a target="_blank" href="http://about.adamwiggins.com/">about.adamwiggins.com</a>)

Its "Codebase" principle is not directly supported by CF.

DEFINITION: A codebase is the collection of code used to build a particular application.

A Twelve Factor app should be able to swap out local resources for remote ones with no code changes. 
There is no distinction between local and remote resources.

Locally within CF:

   * Datastores (e.g. MySQL, Redis)
   * Caching services (e.g. Memcached)

External resources remote outside CF:

   * Asset services (e.g. Amazon S3)
   * Logging (e.g. Loggly, New Relic)
   * Mail services (e.g. Postmark)

DEFINITION: A backing service is anything the application consumes over the network for normal operation. 

Application processes should not store anything that needs to persist on the filesystem of the web application.

Let's say an app has a three-step sign up process for users visiting the site (email, confirm, provide other contact info and preferences, etc.)
Each time the user hits next in that sign up process, the web server sees that as a fresh request. 
The state of that user's signup should be held in a backing service with an <strong>identifier</strong> passed in each page request.

The CF Backing services hold the <strong>state</strong> of transactions in a database, a cache or some other storage.
If an app uses (archaic) browser cookies, it should put them in a backing service when it receives them.

This "stateless" approach enables the app to be run on multiple servers. 
Every request to the web server is seen as a new request. 
Web server code should have no concept of a chain of events, it simply takes a request for a URL and gives a response.

Cloud Foundry provides comprehensive API endpoints that manage how applications and services connect to each other.


### Scaling


• Health Monitor?


## Orgs, Spaces, Roles, and Permissions
• Business Management Modeling
• Putting It All Together

## Routes and Domains
• Internet Routing
• Cloud Foundry Domains and Routes

## Zero Downtime Deployments
• What Is Zero Downtime Deployment?
• Concepts
• What Concepts Make Zero Downtime Deployments Fail?
• How Zero Downtime Deployment Works in Cloud Foundry

## Cloud Native Design Patterns
• Service Discovery Design Pattern
• Configuration Server Design Pattern
• Circuit Breaker Design Pattern

## Debugging Distributed Systems
• Application Logging in Cloud Foundry
• Debugging Commands
• Distributed Tracing

Autosleep 

<a name="Diego"></a>

## Diego

As of May 2017, Diego is the official run-time taking over DEAs.

https://www.youtube.com/watch?v=gB-nrdYTTKU

Its command toolset:

   <pre>cfdot</pre>


## Resources

<a target="_blank" href="https://www.youtube.com/channel/UC0ZYS0Y7b5oiVLvxGf4magw">
Cloud Foundry's YouTube channel</a>

There is a free EdX class
<a target="_blank" href="https://courses.edx.org/courses/course-v1:LinuxFoundationX+LFS132x+1T2017/">
Introduction to Cloud Foundry and Cloud Native Software Architecture</a>
by Tyler Bird
and Kevin Rutten

BTW, the 
"starkandWayne.com" emails mentioned in the example is a <a target="_blank" href="https://www.linkedin.com/company-beta/5230623/">
real cloud consultantcy company</a> in San Francisco, where the helpful
<a target="_blank" href="https://www.linkedin.com/in/norman-abramovitz-8690482">Norman Abramnovitz</a> works.

https://training.linuxfoundation.org/linux-courses/system-administration-training/cloud-foundry-for-developers


## Social Discussion Forums

Slack channel

https://stackoverflow.com/search?q=cf

<a target="_blank" href="https://plus.google.com/u/0/communities/114993035927692444558">
Google Group: Cloud Foundry User</a>


## Hackathons

https://thenewstack.io/brainstorming-new-platform-ideas-cloud-foundry-hackathon/
