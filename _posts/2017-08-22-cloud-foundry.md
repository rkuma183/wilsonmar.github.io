---
layout: post
title: "Cloud-Foundry"
excerpt: "Multi-cloud"
shorturl: "https://goo.gl/"
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

This are the notes I took while I studied to become
Cloud Foundry certified.

Cloud Foundry simplifies for developers to deliver business value more quickly, without wasting time getting their app
to the cloud.

<a target="_blank" href="https://www.cloudfoundry.org/">
cloudfoundry.org</a> is the home page of 
the non-profit vendor-independent Cloud Foundry Foundation was formed by 70 vendors in January of 2015 to own the 
Cloud Foundry open source project.

## What is Cloud Foundry?

Cloud Foundry is a PaaS (Platform as a Service) which manages many of the details of running applications in production. It is a part of Pivotal.

Running an application in production uses different skills than those your team used to write the application in the first place. 
Cloud Foundry shortens and simplifies the process of deploying applications. 

This frees teams to focus on what they do best: writing applications.
Shorter deployments allow your team to ship new code quicker and more often. 

Using Cloud Foundry throughout the development process
enables teams to catch potential production problems earlier and avoid nasty surprises in production.

Cloud Foundry is a "service-based" platform,
running containers reliably and running as many as needed. 


### Monoliths

Monoliths are self-contained apps with its own UI, server, and database.

It can be easier to develop a monolithic application because all the functionality is in one place. And when tests are performed, even if the internals of the application are modular, externally there is only a single entity to test.

It is less complicated to make the application run on a server. 

DEFINITION: The process of moving the application from a developer's laptop to a testing environment, and eventually to production, is generally defined as deploying software.

With monoliths, the various pieces of the application typically share a single database. 

To handle increased demand for the application, more copies are deployed behind a load balancer which distributes requests among servers.

Monolithic applications have their place when a simple application serves a basic purpose. 

But when an application needs to grow, change, and perform, the monolith will no longer be a good fit, 
and it will be time to look into microservices.


As the application grows in complexity, in the lines of code, and in the number of features, 
the developers that have been around the longest can be the most effective to make changes. 
Yet, new developers take the longest on-board because they need to learn a large system to be effective.

Since the application is so large now, the ability to make important changes become harder to do. A developer needs to test any change they are working on and test the entire system before they are confident to release their changes to production. As a result, it can be harder to adopt new technologies, because it would affect the entire system.

When the size of the application was smaller, it was quicker to deploy. Now that the application grew to a larger size, and started running on multiple servers, the time it takes to deploy is longer. Every change, large or small, requires that the entire application gets deployed again.

Time does not just increase when a release goes to production. Because it needs to be tested first. If it is already slower to deploy to production, it is slower to deploy to every environment that is used to test it before deploying it to production.


### Microservices

Individual parts of the application need to be divided into their independent functions. 
They also need to be able to connect to each other. 
Each of these small services (or microservices, as they became known) are small applications which contain well-defined pieces of what was once a monolith.

To work together, services will need to talk to each other. 

Rules for interaction between components are called an Application Programmer Interface, or API for short.

Each microservice is responsible for its own storage (typically in memory) rather 
than share a common database.

Communication between microservices is done via the API, rather than through a shared database.

Applications which have been divided across multiple services (and thus multiple servers) are called distributed systems. Some services are visible to the user, while others are only used internally by other services. The latter are called back-end services.

Decomposing the application into more manageable chunks makes the entire codebase easier to understand, develop, and maintain. As your application grows, you can dedicate entire teams to particular services. These teams each focus on a single service, rather than your entire application.

As long as each component can stay loosely coupled with other services in the system, each team is free to develop as it sees fit. Thus, the barrier to adopting new technologies, frameworks, or languages is lowered.

Now, each deploy can be controlled at the service level, not at the system-wide level. By breaking apart the large, monolithic deployment into separate, smaller deployments, developers have an easier time to make a change, run the tests, and send it to production. 

Even scaling each of the services is easier now. Each component can be monitored and have the correct amount of resources, instead of adding an entire server just to provide capacity for a few features.

It can be harder to troubleshoot separate services than it is with a monolith. 
This can be overcome if you have the right tools and technology in place. 
Cloud Foundry makes this easier, by gathering logs and making them available through the cf CLI.

Each microservice in your system is responsible for its own database or other storage. 
This creates the potential for data duplication across the services. 
The solution to this is (a) drawing service boundaries in the right places and 
(b) always ensuring that any particular data have a single source of truth.

Microservice application testing is more complex than testing a monolith. 
If service A relies on service B, then the team testing service A must 
either provide an instance of service B to test against or provide a simplified version of B as a placeholder. 
These placeholders are called stubs.

Dividing things into its smaller parts can be taken too far. 
You will know you have gone too far when the overhead (communications, maintenance, etc.) outweighs its utility. Instead, see if you can combine the service back into another that is similar.


## Cloud Foundry Account

1. Sign Up for a free trial Cloud Foundry account.

   
   <a name="Org"></a>

   ### Org

0. Define the org

0. Define the route, which can be randomly assigned by cf.

0. Define the app name such as "web-app".

0. Define the binding

0. Define the space "example" as ...com.


## Cloud Foundry CLI

1. Install cf CLI for your operating system.

   Use package managers for easy management and upgrades. 

   * http://docs.cloudfoundry.org/cf-cli/install-go-cli.html
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
0. Install the packaging system Homebrew (https://brew.sh)

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

   https://cli.run.pivotal.io/stable?release=windows64&source=github

3. <a href="#Verify">Verify</a> below.


<a name="Verify"></a>

### Verify

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


### Providers' Endpoints

BOSH provides a cloud-agnostic layer supporting cloud providers.

DEFINITION: A provider is a company that hosts Cloud Foundry as a service, 
then bills the client for the resources they use.
   See https://www.cloudfoundry.org/certified-platforms/

The <strong>API Endpoint</strong> is provided by each 
<a target="_blank" href="https://cloudfoundry.org/certified-platforms/">
Cloud Foundry certified provider</a>: 

   * Pivotal Web Services uses <a target="_blank" href="https://api.run.pivotal.io">https://api.run.pivotal.io</a>
   * IBM BlueMix uses https://api.ng.bluemix.net to IBM's Watson artificial intelligence services
   * <a target="_blank" href="https://www.swisscom.ch/en/business/enterprise/offer/cloud-data-center-services/paas/application-cloud.html">Swisscom Application Cloud</a> uses https://api.lyra-836.appcloud.swisscom.com
   * VMware vSphere
   * Amazon Web Services (AWS)
   * SAP Cloud Platform uses https://api.cf.us10.hana.ondemand.com
   * Atos Cloud Foundry https://atos.net/en/solutions/application-cloud-enablement-devops/multi-cloud-application-platform
   * Huawei Digital Transformation FusionStage (China)
   * Microsoft Azure???
   * Google Compute Platform (GCP)
   * SoftLayer
   * OpenStack
   <br /><br />

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


<a name="Login"></a>

## Log into Cloud Foundry

   <tt><strong>cf login</strong></tt>

   Instead of asking for your email and password again for every command,
   once logged in, Cloud Foundry generates a temporary token that the CLI can store and use 
   (typically for 24 hours).

   The <a href="#Org">Org</a>, route and space.


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

0. Push to CFs <strong>Cloud Controll</strong> your "web-app":

   <tt><strong>cf push web-app</strong></tt>

   `web-app` is not needed if the name is defined in the manifest.yml file.

   What should happen:

   - The CLI gathers your app’s files and uploads them to Cloud Foundry Cloud Controller.
   - The Cloud Controller finds the needed Buildpack, which helps applications gather everything they need to build and run on Cloud Foundry.
   - The Buildpack builds an application image (Droplet).
   - The release stage is when the droplet is copied to your application container. The droplet is unpacked and the command to start your application is run. If you create more instances of your application, the same droplet is used on those new application containers. The droplet is built once, when pushed, and ensures all the releases in the future are identical until your next push.
   - Diego takes that Droplet and runs it in a Container (Diego Cell).
   <br /><br />

   <!-- https://courses.edx.org/courses/course-v1:LinuxFoundationX+LFS132x+1T2017/courseware/05655ef9d6cf4b388239a47663b6b4a8/2336c77fbbdc48029ead67ce44bafe20/?child=first -->  
   ![cf-pushing-workflow-1024x768-179](https://user-images.githubusercontent.com/300046/29647251-4e161eba-8856-11e7-8608-3bd2ceeed495.jpg)

   The Gorouter handles HTTP traffic.

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

0. View the HTML to the app runnning. For example:

   <tt><strong>curl https://web-app-flowing-packets.cfapps.io
   </strong></tt>

0. View the app's logs created recently:

   <tt><strong>cf logs web-app \-\-recent
   </strong></tt>


   ### Restage

0. PROTIP: Create a script with the above and execute that instead of typing them again and again.

   ### Restage vs. Restart

   `--no-start` stages apps instead of starting them so people can view it.

   `cf set-env APP-NAME special_token h4DKt6W7Fm4dLJxtBU37aW`

   `cf restage APP-NAME`


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

   Widen the response:

   <a target="_blank" href="https://user-images.githubusercontent.com/300046/29647941-d9ca4ee2-8859-11e7-84d8-67c3d808dec9.png">
   <img alt="cf-marketplace-650x210-115kb" href="https://user-images.githubusercontent.com/300046/29647925-b86501f2-8859-11e7-89b1-e2d1e86b3ae8.png">
   <small>(Click to pop-up large image)</small></a>


0. Create an instance of the service:

   <tt><strong>cf create-service
   </strong></tt>

0. Tell Cloud Foundry which app to connect the service to:

   <tt><strong>cf bind-service
   </strong></tt>



## Elastic Runtime

A "runtime" consists of a specific choice of operating system, libraries, security measures, languages, and frameworks that need to be made operational.  

The runtime takes the instructions of the code and reduces them to the smallest set needed in order to operate. 
For Java, the runtime is called the Java Virtual Machine (JVM). 
The code that has been compiled is reduced into another form, called a binary. 
This binary can then be executed by the JVM.

"Elastic runtime" is about growing or shrinking processors, memory, disk space, etc. 
to meet demand from customers. 

To scale 5 instances containing myApp :

   <tt><strong>cf scale myApp -i 5</strong></tt>

   `cf` is the Cloud Foundry CLI program.


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
   * Python
   * Static Files buildpacks look for a file named Staticfiles 
   * Erlang https://github.com/cloudfoundry-community/cf-docs-contrib/wiki/Buildpacks
   * Swift https://github.com/cloudfoundry-community/swift-buildpack.git

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


## Twelve Factor App Methodology

https://12factor.net
is a guide by Adam Wiggins, the Heroku platform co-founder.

## Cloud Foundry Components
• Routing
• Authentication
• Application Lifecycle
• App Storage and Execution
• Services
• Messaging
• Metrics and Logging

## Resilience and Availability
• Basics of Scaling in Cloud Foundry
• Using the CLI to Scale the App
• Scaling Your App
• Health Monitor?
• Killing Some Apps

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
