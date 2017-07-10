---
layout: post
title: "Code Generation"
excerpt: "It does your job better and faster than you can imagine"
tags: [Mac, Robots]
shorturl: "https://goo.gl/"
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

{% include _toc.html %}

The generation of programming code is not new, it's just gotten more important over time.

The key point is that after each change in the requirements 
(templates and entities),
applications are completely re-generated again.
Code generation churns out higher quality code in less time, and more consistently.

By focusing on generation of code, developers leverage their time 
over more apps. Fix a bug and it applies to all other apps.

> Here is the promise of open source delivered.

There are several generations of code generation, each more sophisticated
and magical than the next:

1. <a href="#Templates">Gen from static templates</a>
2. <a href="#SwaggerGen">Gen client services from Swagger, RAML, or other client interface spec</a>
3. <a href="#DatabaseGen">Gen from a database schema</a>
4. <a href="#JSONGen">Gen from a JSON file</a>
5. <a href="#DataModel">Gen entire stack from an Entity Model</a>

<hr />

<a name="Templates"></a>

## Gen from Static Templates

Here is the first generation of code generation.

1. Mustache substitutes values from data files in places where 
   variables between {{ and }} are inserted in a template file.
   Data values are defined in JSON format.
   
   Mustache is really a concept rather than a product.
   This simple technique is implemented in a wide variety of programming languages.
   It works on individual files.

   https://www.npmjs.com/package/mustache-prestatic<br />
   repetitively creates a set of HTML files by applying the same template.

2. To generate <strong>multiple files</strong> from a single template,
   <a target="_blank" href="http://www.codesmithtools.com/product/generator">
   Generator from CodeSmith</a> is for Windows only, $299 for single developers.
   A server product is $499. Its templates (with .csp file extension) 
   are all about windows. It uses &LT% and %> markers ASP uses.
   It has templates that can generate complete applications for use on Windows,
   with ORM such as PLINQO (replacement of LINQ to SQL in C#) at<br />
   https://github.com/codesmithtools/Templates/releases

3. http://mygeneration.sourceforge.net/ is an open-source copycat of CodeSmith,
   and thus also focused on .NET Windows.
   It's no longer maintained.
   Its website http://www.mygenerationsoftware.com/ was taken over in 2015.

4. Microsoft Visual Studio has a generator called T4 (Text Generation Transformation Toolkit)

   * <a target="_blank" href="http://www.hanselman.com/blog/T4TextTemplateTransformationToolkitCodeGenerationBestKeptVisualStudioSecret.aspx">
     Scott Hanselman blogs about the T4 Template Transformation Toolkit in Visual Studio</a>

   * <a target="_blank" href="https://www.youtube.com/watch?v=XK17iNvJqQs">
   YOUTUBE video on Code Generation using T4</a> [9:38]
   <br /><br />

5. <a target="_blank" href="https://github.com/moplus/modelorientedplus">
   https://github.com/moplus/modelorientedplus</a><br />
   Mo+ - model oriented programming language and IDE for model oriented development.

6. <a target="_blank" href="http://jsonnet.org/implementation/commandline.html">
   Jsonnet</a> emits JSON on stdout from a commandline wrapper around the C API.

7. Microsoft Excel processes macros written in 
   VBA (Visual Basic for Applications) programming language that
   can programmatically output files based on the contents of the spreadsheet.

8. Configuration managers Chef and Puppet have the capability to generate files based on 
   specification files in their own format.

http://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html

<a name="SwaggerGen">

## 2. Gen from client interface spec

See my dev-ecosystem

<a name="DatabaseGen"></a>

## 3. Gen UI from a database schema

Since the 90's, Ironspeed.com generated web UI from Access databases
until license hacks and patent trolls killed them.


<a name="JSONGen"></a>

## 4. Gen UI from a JSON file

Swagger-codegen generates client code from Swagger specification files.


<a name="DataModel"></a>

## 5. Gen UI based on Entity Models

The first commit to 
<a target="_blank" href="https://github.com/jhipster/">
https://github.com/jhipster</a> 
(<a target="_blank" href="https://twitter.com/java_hipster">@java_hipster</a>)
 by <a href="#JulienDubois">Julien Dubois</a>
was on October 21, 2013.

<a target="_blank" href="https://jhipster.github.io/">
JHipster.github.io</a> 
JHipster should really be called a <strong>project generator</strong>
   and not just a code generator because it generates ALL the code.
JHipster creates code for the entire application and DevOps stacks
based on entity data models defined in its
<a target="_blank" href="https://jhipster.github.io/jdl-studio/">
JDL Studio</a>
<a target="_blank" href="https://youtu.be/kkHN2G_nXV0?t=1460">
See video</a>.

> What is generated will not be exactly what you want, but it gets you going, making use of all the many components of the front-end, back-end, and DevOps tool stacks.

Some sample apps have been mentioned:

   <a target="_blank" href="https://jhipster.github.io/showcase/">
   https://jhipster.github.io/showcase</a><br />
   lists apps created by this technology.

   QUESTION: No longer available on-line is<br />
   https://jhipster-4-demo.herokuapp.com/<br />
    created based on source at:<br />
   https://github.com/dancancro/great-big-example-application

0. View the sample app online URL:

   <a target="_blank" href="https://www.21-points.com/">
   https://21-points.com</a> 

   <a target="_blank" href="https://user-images.githubusercontent.com/300046/28042820-41d20188-658c-11e7-80de-8676a12f279e.png"><img width="954" alt="jhipster-21-points-1908x1050" src="https://user-images.githubusercontent.com/300046/28042820-41d20188-658c-11e7-80de-8676a12f279e.png"></a>

   It resides at 
   http://health-by-points.herokuapp.com
   built as described in 
   <a href="#MattRaible">Matt Raible</a>'s book.

0. View the book pdf:

   <img align="right" width="150" alt="jhipster-logo-400x507.svg.png" src="https://user-images.githubusercontent.com/300046/27997722-e11c2ac4-64bb-11e7-8620-cc7250eaf539.png">

   <a target="_blank" href="https://www.infoq.com/minibooks/jhipster-2-mini-book">JHipster v2 mini-book</a>
   @jhipster_book
   (published by InfoQ)
   describes for web developers the combination of
   AngularJS, Bootstrap, and Spring Boot as used by JHipster.
   It's based on Node.js v4.5.0 and JDK 8.

   Notice the <a target="_blank" href="https://jhipster.github.io/">
   person in the logo</a> has Spring Boot and Angular logos tatooed on his neck.

   Anyway, the book describes, step-by-step, the 1,157 lines of custom code, 
   with JHipster generating 94.5% of all code.

0. View the product webpage (in 5 screenshots):

   <a target="_blank" href="https://jhipster.github.io/screenshots/">
   https://jhipster.github.io/screenshots/</a> 

   My commentary while looking at each screen:

   ### Welcome Screen

   <a target="_blank" href="https://jhipster.github.io/images/screenshot_1.png"><img width="400" alt="jhipster_1-welcome-800x486.png" src="https://user-images.githubusercontent.com/300046/27997881-68b197d8-64be-11e7-874b-08511e29bdc1.png"><br /><small>(click image for full-screen image)</small></a>

   All this was generated.

   ### Monitoring

   <a target="_blank" href="https://jhipster.github.io/images/screenshot_2.png"><img width="400" alt="jhipster_2-monitoring-800x498.png" src="https://user-images.githubusercontent.com/300046/27997908-013d956a-64bf-11e7-8d0c-9e9453d3ae2c.png"><br />(click image for full-screen image)</a>

   Installation of JVM monitoring agents is automatically done,
   as is the UI.


   ### Logging

   <a target="_blank" href="https://jhipster.github.io/images/screenshot_4.png"><img width="400" alt="jhipster_4-logmgmt-800x406.png" src="https://user-images.githubusercontent.com/300046/27997957-1574de5c-64c0-11e7-9d8e-97de29109292.png"><br />(click image for full-screen image)</a>

   Many back-end services are automatically generated, 
   such as log management.


   ### Admin Forms

   <a target="_blank" href="https://jhipster.github.io/images/screenshot_3.png"><img width="400" alt="jhipster_3-form-260x342.png" src="https://user-images.githubusercontent.com/300046/27997981-de2903dc-64c0-11e7-8616-cb09edf94eb2.png"><br />(click image for full-screen image)</a>

   The generator provides several choices for app UI:
   * Bootstrap for "responsive" CSS.
   * HTML5 Boilerplate to avoid inconsistencies among browsers.

   QUESTION: PWA? Mobile hybrid?


   ### Entity Forms

   <a target="_blank" href="https://jhipster.github.io/images/screenshot_5.png"><img width="400" alt="jhipster_5-books-800x471.png" src="https://user-images.githubusercontent.com/300046/27998014-6376d0d2-64c1-11e7-8df6-d62221266afe.png"><br />(click image for full-screen image)</a>

   QUESTION: In addition to the "Freelancer" UI theme, are there other skins?

   ### Build Entities

   Coding to handle entities are generated from JDL code.

   JDL is the JHipster Domain Language processed within the JDL Studio.

   <pre><strong>https://github.com/jhipster/jdl-samples
   </strong></pre>

   A "One to Many" relationship would be generated as a list screen
   by JHipster, which creates all the JPA entities, DTOs, Spring Rest Controllers all the way through to the client side with Angular.

   Among <a target="_blank" href="https://www.youtube.com/channel/UCAC2AFfB0DFmiIeOEEJ7uhA">
   Matt's YouTube videos</a> is 
   <a target="_blank" href="https://www.youtube.com/watch?v=XRREt1KB4Y8">
   this</a> about
   <a target="_blank" href="https://github.com/mraible/jhipster4-demo/">
   github.com/mraible/jhipster4-demo</a>
   The sample entity diagram models a database containing Job History 
   with reference to Language and Departments with a Location consisting of Country, Region.

   ![jhipster-589x575-71kb](https://user-images.githubusercontent.com/300046/27988589-6a003126-63e2-11e7-9aa6-44e99ce86dbe.png)


   ### Advantages of this

   PROTIP: The fantastic thing about the app generated is that the
   technologies underneath are <strong>changeable</strong>.

   You can choose between any of the popular databases:
   MySQL, MongoDB, Cassanda, MSSQL, etc

   Today, it's SPA (Single Page Application) Angular UIs 
   with WebSockets communication to back-end Java Spring microservices.

   http://angularjs.blogspot.com/2016/12/ok-let-me-explain-its-going-to-be.html

   BTW, "AngularJs" refers to the Angular1.x framework.

   #Angular

   * Angular 2
   * Angular 3 is skipped
   * Angular 4 on 2017-03 (backward compatible with Angular 2)
   * Angular 5 on 2017-09
   * Angular 6 on 2018-03
   * Angular 7 on 2018-09
   <br /><br />

   All Google applications use Angular version equal to the current GitHub’s master branch of the Angular repository. 

   ReactJS is being worked on at
   <a target="_blank" href="https://github.com/hipster-labs">
   https://github.com/hipster-labs</a>
   until it is added to the <a target="_blank" 
   href="https://jhipster.github.io/tech-stack/">
   JHipster technology stack</a>.


   ### Third-party Add-on modules

   <a target="_blank" href="https://jhipster.github.io/modules/marketplace/#/list"> A marketplace of third-party modules</a>
   (that act like standard JHipster sub-generators)
   can access JHipster variables and functions through hook mechanisms
   before and after <a target="_blank" href="http://yeoman.io/generators/">
   Yeoman app generation</a>:

   * <a target="_blank" href="https://jhipster.github.io/modules/marketplace/#/details/generator-jhipster-vuejs">
   Use VueJS</a> 
   * <a target="_blank" href="https://jhipster.github.io/modules/marketplace/#/details/generator-jhipster-google-analytics">
   Google Analytics</a>
   * <a target="_blank" href="https://jhipster.github.io/modules/marketplace/#/details/generator-jhipster-google-maps">
   Google Maps</a>
   <br /><br />

>  This is how one keeps apps up using all the latest tech stacks.

   This visionary approach to development
   involving code generation rather than manually gluing various pieces together -- and testing integration.

   ### Still to do

   0. Mobile + desktop PWA (Progressive Web Apps) that loads initial data
   for off-line usage

   0. Google Maps of geolocation data

   0. Visualizations of app data (using D3.js or http://krispo.github.io/angular-nvd3)

   0. Automatic tuning of configuration parameters.

   0. Comparison of "total cost per app transaction" varying various components.


   ### Microservice architecture

   JHipster generates a full fledge microservice architecture 
   that makes use of Netflix’s OSS (Open Source Software). From jhipster.github.io/microservices-architecture

   <a target="_blank" href="https://user-images.githubusercontent.com/300046/27989850-a1a1b65e-6400-11e7-9dec-371c9bb5d151.png">
   <img alt="jhipster-microservices_arch_2-1280x768.png" src="https://user-images.githubusercontent.com/300046/27989850-a1a1b65e-6400-11e7-9dec-371c9bb5d151.png"><br /><small>(Click on diagram for it in a full-sized window)</small></a>

   Visitors to the website use a modern browser such as Chrome or Firefox.

   In a Gateway server a Zuul Proxy 
   distributes traffic to AngularJS app servers.

   For Access Control apps reference a 
   JHipster UAA (???) server containing user role information.

   Apps reference 
   Ribbon
   which handles WebSocket calls to servers handling various microservices.

   Consul 
   JHipster Registry
   contains a Eureka server that ...
   and a Spring cloud Config server.
   These servers are provided by Netflix.
   They access Git repos.

   The JHipster Console consists of a Elasticsearch database fed by
   logs ingested by Logstash and displayed by Kibana.
   Administration of this ELK stack is accessed by a separate browser 
   instance on port 5601 by default. 
   Logs managed make use of default port 5000.

   More on Microservices:

   https://martinfowler.com/microservices/

   https://martinfowler.com/articles/microservices.html



   ### Build dev environment

0. Install Vagrant.
0. `vagrant up`

0. Navigate to or create a folder to hold:
0. Git clone https://github.com/jhipster/jhipster-devbox

0. Install Vagrant box created:

   <pre><strong>vagrant init jhipster/jhipster-devbox; vagrant up --provider virtualbox
   </strong></pre>

   Its use would not require these actions to setup a dev box:

0. Install Ubuntu operating system
0. Goggle Chrome and Firefox browsers
0. Install OpenJDK.
0. Install Node.js to run a development web server and build the project. 
0. Install Yarn (instead of NPM) to manage Node dependencies such that
live reload of your client-side code (HTML, CSS, TypeScript) works (thanks to Webpack and Browsersync).

   <pre>yarn start</pre>

   Edit any file and the browser refreshes automatically.

0. Install Ubuntu Make
0. Use Make to install IntelliJ IDEA or Eclipse
0. pgAdmin 3
0. MySQL Workbench
0. MongoDB client
0. Cassandra DB command line (cqlsh)

0. Cloud Foundry command line (cf)
0. Heroku toolbelt command line

0. Yeoman front-end app generator:

   <pre>yarn global add generate-jhipster
   </pre>

   The response when I did it:

   <pre>
yarn global v0.27.5
[1/4] Resolving packages...
[2/4] Fetching packages...
error jhipster-core@1.3.4: The engine "node" is incompatible with this module. Expected version ">=6.9.0".
error Found incompatible module
info Visit https://yarnpkg.com/en/docs/cli/global for documentation about this command.
   </pre>

   https://www.openhub.net/p/generator-jhipster
   ???

   The "Yeoman workflow" is made up of three types of tools to enhance your productivity and satisfaction when building a webapp:

   • the scaffolding tool (yo),
   • the build tool (Grunt, Gulp, etc.), and
   • the package manager (Bower, npm, etc.)

   <pre>yarn global add generator-jhipster
   </pre>

0. Install Gulp task runner (build tool).

0. Install Bower to manage CSS and JavaScript dependencies used in this application.

   ### Maven pull

   Use the embedded Maven wrapper to run:

   <pre><strong>jhipster
   ./mvnw
   </strong></pre>

   The above installs based on the <strong>pom.xml</strong>:

0. Sass = "syntactically awesome style sheets"
0. WebSockets
0. Browsersync
0. Spring Data JPA generates JPA repositories automatically
0. Liquibase from http://www.datical.com/ - the ORM (Object Relation Model) that works with Spring and JPA (Java Persistance) to handle updating database schemas
0. Elasticsearch for JMX or Graphite reporting

0. https://webpack.github.io/ to squeeze only those JavaScript functions
   that are only used. Compiles, minifies, optimizes front-end for hot-reload.
0. Leaflet.js
0. http://www.thymeleaf.org/ template engine to generate Web pages server side
Replaces JSPs and JSTLs, which are outdated and deprecated

   <pre>&LT;h1 th:text="#{title}">Hello, world&LT;/h1></pre>

0. Netflix OSS

   JHipster Registry

   * Eureka - Service registry for load balancing and failover.
   * Zuul - Proxy for dynamic routing, monitoring and security
   * Ribbon - software load balancing for services

0. Caching

   * Ehcache is the most widely used solution
   * HazelCast is a great alternative, with clustering support!
   * Hibernate 2nd level cache or Spring Caching abstraction


   ### Eclipse

   https://www.youtube.com/watch?v=LERTahPqVjo
   Eclipse

0. Edit the .editorconfig file to specify indent_size, etc.

   ### Run Generator

   PROTIP: One of the great advantages of using a code generator is
   having different options to do a similar thing.
   
0. Create or Navigate to your app's folder.

   Unlike other Java app generators, Yeoman expects to be in the directory 
   where it creates your project rather than creating it for you.

0. Initiate generation:

   <pre><strong>yo jhipster
   </strong></pre>

   BTW, this same command is used to upgrade as well.

   The generator asks a series of questions (15 or so).

   QUESTION: Is there sample automation to answer questions?

   ? (1/16) Which *type* of application would you like to create?

   * Monolithic
   * Services ???


   <a name="SubGenerators"></a>

   ### Sub-generators

   "import-jdl" sub-generator generates a complex entity model using JDL Studio

   "entity" sub-generator generates a complete JPA entity, from database to Angular

   "service" sub-generator generates a Spring business service

   "languages" sub-generator adds languages for i18n (Spanish)


   ### Configuration files

0. Run the ci-cd sub-generator to generate configuration files for a number of Continuous Integration systems. 

   <pre><strong>jhipster ci-cd
   </strong></pre>

   Consult the Setting up Continuous Integration page for more information.

   See https://www.npmjs.com/package/generator-jhipster

   npm generator-jhipster

0. Zipkin to trace HTTP requests throughout your services
0. Elastalert to get alerted when an issue occurs

   ### Examine sample app code

https://github.com/jhipster/generator-jhipster

0. The on-line app is built from a repository in GitHub:

   <a target="_blank" href="https://github.com/jhipster/jhipster-sample-app-ng2">
   https://github.com/jhipster/jhipster-sample-app-ng2</a>

   <a target="_blank" href="https://github.com/jhipster/jhipster-sample-app">
   https://github.com/jhipster/jhipster-sample-app</a>


   ### Test

0. Install Karma

   http://karma-runner.github.io/

   write unit tests for Angular controllers and directives using

   http://jasmine.github.io/2.5/introduction.html

   write integration tests with Protractor:
   http://www.protractortest.org/#/

0. To launch your application's tests, run:

   <pre><strong>./mvnw clean test
   </strong></pre>

0. Install Scala to run Gatling.
0. Install Gatling to run performance tests.

   ### Dockerize

   <pre>
   FROM pbesson/jhipster:onbuild
   FROM pbesson/jhipster:onrun
   </pre>

   ### Generator for Kubernetes

   The Kubernetes generator generates deployment descriptors to deploy into Kubernetes in order to scale horizontally with ease, and adapt to failure scenarios.


   ### Run in production mode locally

   <pre>
./mvnw -Pprod package
docker-compose -f src/main/docker/mysql.yml up -d
java -jar target/*.war
   </pre>



   ### Deploy to Heroku

   JHipster ships with support for deploying to 
   Cloud Foundry, Heroku, Kubernetes, AWS, and Boxfuse.

0. To Heroku:

   <pre><strong>yo jhipster:heroku
   </strong></pre>

0. View the app in Heroku. For example:

   <pre><strong>https://jhipster-4-demo.herokuapp.com/
   </strong></pre>

   Build and Deploy to AWS

   Build and Deploy to CloudFoundry


<hr />

## Modifications

   ### Customize landing page

   Substitute JHipster logo with your own logo.

   ### Material Design

   <pre>npm install -g generator-jhipster-bootstrap-material-design
   yo jhipster-bootstrap-material-design
   </pre>

   <pre>
? Do you want to install Bootstrap Material design? Yes
Composing JHipster configuration with module bootstrap-material-design
Reading the JHipster project configuration for your module
 conflict bower.json
? Overwrite bower.json? overwrite
  force bower.json
  create src/main/webapp/app/blocks/config/bootstrap-material.config.js
 conflict src/main/webapp/scss/main.scss
? Overwrite src/main/webapp/scss/main.scss? overwrite
  force src/main/webapp/scss/main.scss
 conflict src/main/webapp/content/css/main.css
? Overwrite src/main/webapp/content/css/main.css? overwrite
  force src/main/webapp/content/css/main.css
   </pre>

   PROTIP: The vendor.css is before all material-design stylesheets in your
index.html

   ### Add an Entity

   jhipster entity Foo

   ### Infinite scroll third-party module

   https://jhipster.github.io/tips/019_tip_infinite_scroll_with_slice.html

   ### Configure email

   https://jhipster.github.io/tips/011_tip_configuring_email_in_jhipster.html

   ### Sprint social connector

   https://jhipster.github.io/tips/012_tip_add_new_spring_social_connector.html


## Developers

<a target="_blank" href="https://groups.google.com/forum/?utm_medium=email&utm_source=footer#!forum/jhipster-dev">on Google Forum</a>:

   <a name="JulienDubois"></a>
Julien Dubois
(@juliendubois)

   * https://www.youtube.com/watch?v=d1MEM8PdAzQ
   20 minute tutorial.
   * https://www.youtube.com/watch?v=dzdjP3CPOCs
   Be Productive with JHipster by Julien Dubois and Deepu K Sasidharan
   Nov 8, 2016 at Devoxx US 
   * https://www.youtube.com/watch?v=dOO-8cAKDu8
   What's new in JHipster in 2016 by Julien Dubois @ Spring I/O 2016 

   <a name="Deepu"></a>
Deepu K Sasidharan at XebiaLabs
   <a target="_blank" href="https://twitter.com/deepu105">@deepu105</a>
   https://nl.linkedin.com/in/deepu05
   https://github.com/deepu105
   * https://deepu.js.org/jh-slides-v3/#/intro

   * https://www.youtube.com/watch?v=YmEKClTBkUI
   Building Spring boot + Angular4 apps in minutes
   * https://www.youtube.com/watch?v=nKRpVkba4Ck
   2016-Mar at Tata
   * SOAP WSDL

   <a name="MattRaible">Matt Raible</a>
Matt Raible
   @mraible
   https://raibledesigns.com/
   https://www.linkedin.com/in/mraible

   * http://sudheerjonna.com/my-books/
   PrimeFaces themes and PrimeNG.

   * https://www.youtube.com/watch?v=kkHN2G_nXV0
   Get Hip with JHipster: Spring Boot + AngularJS + Bootstrap (Matt Raible)
   Devoxx FR

   * https://www.youtube.com/watch?v=ZGF4gEM4FuA
   JHipster 2.7 Blog Demo [20:30]


Ray Tsang
   https://twitter.com/saturnism

Yakov Fain - https://yakovfain.com/
   https://twitter.com/yfain


   ### Talk about it

   https://stackoverflow.com/questions/tagged/jhipster

   http://scholarcoder.com/1072/making-full-stack-java-development-easier-jhipster

https://www.youtube.com/watch?v=zHtd8qav8kk
Jhipster - Introduction, build simple application (Part 1)
JHipster learning with Yappy Toy

https://www.youtube.com/watch?v=DcWx_BOugIM
Jhipster 4 + Angular 2 | Java web application. MySql.
by Vengeance Coding


https://www.youtube.com/watch?v=5CWu4NoMsSk
JHipster, the best way to breed a new webapp 
by Jfokus