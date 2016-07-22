---
layout: post
title: "Node API Starter"
excerpt: "Add routes to basic features included"
tags: [Node, API]
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

This is a tutorial on how to make use of the
<a target="_blank" href="https://github.com/sahat/hackathon-starter">
hackathon-starter</a> repo which uses SASS, Express, and several other commonly used packages
to create a new Node app. 
Sahat Yalkabov's repo comes with basic plumbing for processing several APIs
along with account creation, login, contact form,
and other basic "plumbing" features of websites.

This tutorial takes a <strong>"deep dive"</strong> approach 
by explaining each step's responses,
and adding NOTEs and PROTIPs commentary along the way.

The objective of the steps below is to add a top menu item a new route (page)
to the boilerplate website.

## Getting Started #

0. Click the URL:<br />
   <a target="_blank" href="https://github.com/sahat/hackathon-starter">
   <strong>https://github.com/sahat/hackathon-starter</strong></a>

0. Click <strong>Fork</strong> to copy the repo into your own account, such as:<br />
   https://github.com/wilsonmar/hackathon-starter

   This assumes that you have a GitHub account and logged into it.

0. Open a Terminal shell window and make a folder such as:

   <tt><strong>
   mkdir ~/gits<br />
   mkdir wilsonmar
   </strong>

   But instead of "wilsonmar" specify your GitHub account name.

0. Clone to your local folder (replacing wilsonmar in the example below):

   <tt><strong>
   git clone --depth=1 https://github.com/wilsonmar/hackathon-starter predix-viz
   </strong>

   The "--depth=1" limits the history of commits downloaded.

   The response:

   <pre>
Cloning into 'predix-viz'...
remote: Counting objects: 9185, done.
remote: Compressing objects: 100% (8/8), done.
remote: Total 9185 (delta 2), reused 0 (delta 0), pack-reused 9177
Receiving objects: 100% (9185/9185), 8.45 MiB | 170.00 KiB/s, done.
Resolving deltas: 100% (5347/5347), done.
Checking connectivity... done.
   </pre>

0. Setup an upstream remote location to obtain future updates:

   <tt><strong>
   git remote add upstream https://github.com/sahat/hackathon-starter
   </strong>

   ### Examine repo files & folders #

0. Get a list of files and folders from your local machine (subsituting as you type):

   <tt><strong>
   cd ~/gits/wilsonmar/predix-viz<br />
   tree 
   </strong></tt>

   The response:

   <pre>
|-- LICENSE
|-- README.md
|-- app.js
|-- config
|   `-- passport.js
|-- controllers
|   |-- api.js
|   |-- contact.js
|   |-- home.js
|   `-- user.js
|-- models
|   `-- User.js
|-- package.json
|-- public
|   |-- css
|   |   |-- lib
|   |   |   |-- bootstrap
|   |   |   |   |-- _alerts.scss
|   |   |   |   |-- _badges.scss
|   |   |   |   |-- _breadcrumbs.scss
|   |   |   |   |-- _button-groups.scss
|   |   |   |   |-- _buttons.scss
|   |   |   |   |-- _carousel.scss
|   |   |   |   |-- _close.scss
|   |   |   |   |-- _code.scss
|   |   |   |   |-- _component-animations.scss
|   |   |   |   |-- _dropdowns.scss
|   |   |   |   |-- _forms.scss
|   |   |   |   |-- _glyphicons.scss
|   |   |   |   |-- _grid.scss
|   |   |   |   |-- _input-groups.scss
|   |   |   |   |-- _jumbotron.scss
|   |   |   |   |-- _labels.scss
|   |   |   |   |-- _list-group.scss
|   |   |   |   |-- _media.scss
|   |   |   |   |-- _mixins.scss
|   |   |   |   |-- _modals.scss
|   |   |   |   |-- _navbar.scss
|   |   |   |   |-- _navs.scss
|   |   |   |   |-- _normalize.scss
|   |   |   |   |-- _pager.scss
|   |   |   |   |-- _pagination.scss
|   |   |   |   |-- _panels.scss
|   |   |   |   |-- _popovers.scss
|   |   |   |   |-- _print.scss
|   |   |   |   |-- _progress-bars.scss
|   |   |   |   |-- _responsive-embed.scss
|   |   |   |   |-- _responsive-utilities.scss
|   |   |   |   |-- _scaffolding.scss
|   |   |   |   |-- _tables.scss
|   |   |   |   |-- _theme.scss
|   |   |   |   |-- _thumbnails.scss
|   |   |   |   |-- _tooltip.scss
|   |   |   |   |-- _type.scss
|   |   |   |   |-- _utilities.scss
|   |   |   |   |-- _variables.scss
|   |   |   |   |-- _wells.scss
|   |   |   |   |-- bootstrap.scss
|   |   |   |   `-- mixins
|   |   |   |       |-- _alerts.scss
|   |   |   |       |-- _background-variant.scss
|   |   |   |       |-- _border-radius.scss
|   |   |   |       |-- _buttons.scss
|   |   |   |       |-- _center-block.scss
|   |   |   |       |-- _clearfix.scss
|   |   |   |       |-- _forms.scss
|   |   |   |       |-- _gradients.scss
|   |   |   |       |-- _grid-framework.scss
|   |   |   |       |-- _grid.scss
|   |   |   |       |-- _hide-text.scss
|   |   |   |       |-- _image.scss
|   |   |   |       |-- _labels.scss
|   |   |   |       |-- _list-group.scss
|   |   |   |       |-- _nav-divider.scss
|   |   |   |       |-- _nav-vertical-align.scss
|   |   |   |       |-- _opacity.scss
|   |   |   |       |-- _pagination.scss
|   |   |   |       |-- _panels.scss
|   |   |   |       |-- _progress-bar.scss
|   |   |   |       |-- _reset-filter.scss
|   |   |   |       |-- _reset-text.scss
|   |   |   |       |-- _resize.scss
|   |   |   |       |-- _responsive-visibility.scss
|   |   |   |       |-- _size.scss
|   |   |   |       |-- _tab-focus.scss
|   |   |   |       |-- _table-row.scss
|   |   |   |       |-- _text-emphasis.scss
|   |   |   |       |-- _text-overflow.scss
|   |   |   |       `-- _vendor-prefixes.scss
|   |   |   |-- bootstrap-social.scss
|   |   |   `-- font-awesome
|   |   |       |-- _animated.scss
|   |   |       |-- _bordered-pulled.scss
|   |   |       |-- _core.scss
|   |   |       |-- _fixed-width.scss
|   |   |       |-- _icons.scss
|   |   |       |-- _larger.scss
|   |   |       |-- _list.scss
|   |   |       |-- _mixins.scss
|   |   |       |-- _path.scss
|   |   |       |-- _rotated-flipped.scss
|   |   |       |-- _stacked.scss
|   |   |       |-- _variables.scss
|   |   |       `-- font-awesome.scss
|   |   |-- main.scss
|   |   `-- themes
|   |       |-- default
|   |       |   |-- _default.scss
|   |       |   `-- _variables.scss
|   |       |-- flatly
|   |       |   |-- _flatly.scss
|   |       |   `-- _variables.scss
|   |       |-- ios7
|   |       |   `-- _ios7.scss
|   |       `-- modern
|   |           |-- _modern.scss
|   |           `-- _variables.scss
|   |-- favicon.png
|   |-- fonts
|   |   |-- FontAwesome.otf
|   |   |-- fontawesome-webfont.eot
|   |   |-- fontawesome-webfont.svg
|   |   |-- fontawesome-webfont.ttf
|   |   |-- fontawesome-webfont.woff
|   |   `-- fontawesome-webfont.woff2
|   `-- js
|       |-- lib
|       |   |-- bootstrap.min.js
|       |   `-- jquery-2.2.0.min.js
|       `-- main.js
|-- test
|   |-- app.js
|   `-- models.js
`-- views
    |-- account
    |   |-- forgot.jade
    |   |-- login.jade
    |   |-- profile.jade
    |   |-- reset.jade
    |   `-- signup.jade
    |-- api
    |   |-- aviary.jade
    |   |-- bitgo.jade
    |   |-- clockwork.jade
    |   |-- facebook.jade
    |   |-- foursquare.jade
    |   |-- github.jade
    |   |-- index.jade
    |   |-- instagram.jade
    |   |-- lastfm.jade
    |   |-- linkedin.jade
    |   |-- lob.jade
    |   |-- nyt.jade
    |   |-- paypal.jade
    |   |-- pinterest.jade
    |   |-- scraping.jade
    |   |-- steam.jade
    |   |-- stripe.jade
    |   |-- tumblr.jade
    |   |-- twilio.jade
    |   |-- twitter.jade
    |   |-- upload.jade
    |   |-- venmo.jade
    |   `-- yahoo.jade
    |-- contact.jade
    |-- home.jade
    |-- layout.jade
    `-- partials
        |-- flash.jade
        |-- footer.jade
        `-- header.jade
   </pre>

   PROTIP: This is a MVC (Model View Controller) project structure.

0. For a summary description of the files and folders, click 
   <a target="_blank" href="https://github.com/sahat/hackathon-starter/blob/master/README.md#project-structure">
   this URL to the project-structure</a>.

   * .scss files are used to generate the .css files

   * fontawesome icons are embedded in the repo

   * .jade files in the <strong>view</strong> folder are read by the Jade/Pug template engine for Express.js
   which dynamically generates HTML for display.

   ### Limit APIs loaded #

0. You may want to comment out APIs that you don't intend on using:

   <tt><strong>
   atom package.json
   </strong></tt>

   Replace atom with whatever text editor you prefer (subl for Sublime, vim, etc.).

   A short description of each package is <a target="_blank" href="https://github.com/sahat/hackathon-starter/blob/master/README.md#list-of-packages">
   here</a>.

0. Instal Node on MacOS OSX by following [my instructions](/node-osx-install/):

0. Install dependencies defined in the project.json file:

   <tt><strong>
   npm install 
   </strong></tt>

   ### Add MongoDB #

0. <a target="_blank" href="https://docs.mongodb.com/manual/tutorial/install-mongodb-on-os-x/">
   Install Mongodb, on a Mac</a> (not the latest dev release):

   <tt><strong>
   brew update<br />
   brew install mongodb
   </strong></tt>

   The response (takes a long time):

   <pre>
==> Downloading https://homebrew.bintray.com/bottles/mongodb-3.2.8.el_capitan.bo
==> Pouring mongodb-3.2.8.el_capitan.bottle.tar.gz
==> Caveats
To have launchd start mongodb now and restart at login:
  brew services start mongodb
Or, if you don't want/need a background service you can just run:
  mongod --config /usr/local/etc/mongod.conf
==> Summary
🍺  /usr/local/Cellar/mongodb/3.2.8: 17 files, 264.1M
   </pre>

0. Per the output above:

   <tt><strong>
   brew services start mongodb
   </strong></tt>

   The response:

   <pre>
==> Successfully started `mongodb` (label: homebrew.mxcl.mongodb)
   </pre>

   ### NPM Dependencies #

0. Install NPM dependencies using npm (Node Package Manager) installed along with Node:

   <tt><strong>
   npm install
   </strong></tt>

   The response begins with:

   <pre>
npm WARN deprecated jade@1.11.0: Jade has been renamed to pug, please install the latest version of pug instead of jade
npm WARN deprecated transformers@2.1.0: Deprecated, use jstransformer
npm WARN deprecated to-iso-string@0.0.2: to-iso-string has been deprecated, use @segment/to-iso-string instead.
npm WARN deprecated jade@0.26.3: Jade has been renamed to pug, please install the latest version of pug instead of jade
npm WARN deprecated minimatch@0.3.0: Please update to minimatch 3.0.2 or higher to avoid a RegExp DoS issue
npm WARN prefer global node-gyp@3.4.0 should be installed with -g
&nbsp;
> secp256k1@3.0.1 install /Users/mac/gits/wilsonmar/predix-viz/node_modules/secp256k1
> npm run rebuild
&nbsp;
> secp256k1@3.0.1 rebuild /Users/mac/gits/wilsonmar/predix-viz/node_modules/secp256k1
> node-gyp rebuild
   </pre>

   Then some warnings:

   <pre>
In file included from ../src/secp256k1-src/src/secp256k1.c:13:
In file included from ../src/secp256k1-src/src/field_impl.h:19:
../src/secp256k1-src/src/field_5x52_impl.h:54:13: warning: unused function
      'secp256k1_fe_verify' [-Wunused-function]
static void secp256k1_fe_verify(const secp256k1_fe *a) {
            ^
In file included from ../src/secp256k1-src/src/secp256k1.c:15:
../src/secp256k1-src/src/group_impl.h:219:12: warning: unused function
      'secp256k1_gej_is_valid_var' [-Wunused-function]
static int secp256k1_gej_is_valid_var(const secp256k1_gej *a) {
           ^
2 warnings generated.
  CC(target) Release/obj.target/secp256k1/src/secp256k1-src/contrib/lax_der_privatekey_parsing.o
  SOLINK_MODULE(target) Release/secp256k1.node
   </pre>


   ### Start Node app.js #

0. Install Nodemon globally, following instructions at:

   https://github.com/sahat/hackathon-starter/blob/master/README.md

   <tt><strong>
   npm install -g nodemon
   </strong></tt>

   The response:

   <pre>
/usr/local/Cellar/node/6.3.0/bin/nodemon -> /usr/local/Cellar/node/6.3.0/lib/node_modules/nodemon/bin/nodemon.js
/usr/local/Cellar/node/6.3.0/lib
└── nodemon@1.9.2 
   </pre>

   -bash: nodemon: command not found

0. Start app.js using nodemon (instead of node command) in order for changes to files 
   cause Node to restart automatically and thus reflect changes made:

   <tt><strong>
   nodemon -e js,jade app.js
   </strong></tt>

   PROTIP: We use the "-e" parameter to watch .jade files to also watch .js files for changes
   as well as .js files. 

   The response:

   <pre>
Express server listening on port 3000 in development mode
   </pre>

   It's important that you get this working as a baseline before making any changes.

0. Open an internet browser (Chrome) to:

   <pre>
   http://localhost:3000
   </pre>

   The response should be what is shown on-line at the <a target="_blank" href="http://hackathonstarter-sahat.rhcloud.com/">
   Live Demo site at http://hackathonstarter-sahat.rhcloud.com</a>.


   ### Configure Login #

0. Click "CREATE ACCOUNT".

   NOTE: The Starter includes coding for website visitors to create an account 
   based on email and password entry.

   The information is stored in the MongoDB database created earlier.

0. Click "LOGIN" to see that 
   the Starter includes coding to process Login credentials from major identity vendors:

   <amp-img width="345" height="349" alt="node login vendors 20160722-345x349-c50.jpg" 
   src="https://cloud.githubusercontent.com/assets/300046/17050688/8d255064-4fb1-11e6-92e5-963ac6c1ca57.jpg">
   </amp-img>

0. Click on <strong>Sign in with Twitter</strong>.

   When you are redirected back, and your name should appear at the upper right corner.

   If this doesn't appear, open a new browser tab, sign into Twitter, then return.

   PROTIP: The Starter makes use of the cookie stored on your browser when you sign into Twitter.

   TODO: Describe the Starter's CSRF prevention techniques.
   CSRF prevention work by embedding additional authentication data into requests that allows the web application to detect requests from unauthorized locations.

0. Click your name and select <strong>My Account</strong>.

   Notice the public details you provided to Twitter (Email, Gender, Location, etc.) is shown.

0. Click <strong>CONTACT</strong> at the top menu.

   BTW, I filed an issue to suggest <a target="_blank" href="https://github.com/sahat/hackathon-starter/issues/530">
   populating the contact form with information on the user</a>.

   <a name="ConfigureAPI"></a>

   ### Configure API in menu #

0. Click "API EXAMPLES" at the top menu.

0. Click <strong>Pinterest</strong> (near the bottom of the list).

0. Click <strong>Okay</strong> to concede.

   When running in localhost, you'll get a blank screen with a URL such as:<br />
   https://localhost:3000/auth/pinterest/callback?code=112d913b9083d141

   PROTIP: In order for Pinterest to finish its work, there needs to be a public-addressible website.

   So let's put the (unedited) website out there.


## Publish website #

Here we use docker-compose to get your Nodejs project in a real server.

0. Install Vagrant.
0. Install Node and Docker in it.

0. Open a new file containing this sample below and
   save it with name <strong>docker-compose-dev.yml</strong>

   <pre>
version: '2'
services:
&nbsp;
  web:
    image: node:6.1
    volumes:
      - ./:/usr/src/app
    working_dir: /usr/src/app
    command: sh -c 'npm install; npm install -g nodemon ; nodemon -e js,jade app.js'
    ports:
      - "80:3000"
    depends_on:
      - mongo
    networks:
      - all
    environment:
      MONGODB_URI: "mongodb://mongo:27017/hackathon"
&nbsp;
  mongo:
    image: mongo:3
    command: mongod --smallfiles
    networks:
      - all
&nbsp;
networks:
  all:
   </pre>

   PROTIP: The file above defines a service named "web" based on "node:6.1".
   A storage volume is mounted to hold a working directory at "usr/src/app".
   Semicolons act like separate Enter of commands we manually did above.

   The example above came from <a target="_blank" href="https://sloppy.io/from-dev-to-prod-with-nodejs-and-hackathon-starter-using-docker-compose-part-1/">
   this article</a>
   by MikeMichel (in Cologne, Germany), who explains:

   The "depends_on" clause specifies that the web services starting should depend on mongo db starting first. 
   The Docker image requests version 3 of mongo.
   We want to 

   The environment variable MONGODB_URI created is used by hackathon-starter to point to mongodb.

   The command to start mongod (Mongo Daemon) 
   includes "--smallfiles" to reduce the initial size for data files 
   so less diskspace is needed. 

   The "all" under networks places both services in the same network.

0. In a Termianl:

   <tt><strong>
   docker-compose -f docker-compose-dev.yml up
   </strong></tt>


   ### Build Docker image #

0. Open a new file containing this sample:

   <pre>
FROM node:6.1.0
&nbsp;
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
&nbsp;
COPY . /usr/src/app/
RUN npm install
&nbsp;
CMD [ "node", "app.js" ]
   </pre>

0. Save the file with name "Dockerfile" (no file extension) in your working directory.

0. Build with your own dockerhubname:

   <tt><strong>
   docker build -t yourdockerhubname/hackathon-starter:0.1
   </strong></tt>

   Create a docker-compose.yml file to test if your just build image is running like expected.

0. Duplicate the docker-compose.yml file.
0. Edit the image to:

   <pre>
  web:
    image: yourdockerhubname/hackathon-starter:0.1
   </pre>

   Remove:

   <pre>
    volumes:
      - ./:/usr/src/app
    working_dir: /usr/src/app
    command: sh -c 'npm install; npm install -g nodemon ; nodemon -e js,jade app.js'
   </pre>

0. Save the file.

0. Run:

   <tt><strong>
   docker-compose up
   </strong></tt>

   ### Use the image #

0. Open an internet browser (Chrome) to:

   <pre>
   http://localhost:3000
   </pre>

0. Try again to <a href="#ConfigureAPI">Configure API above</a>.


   ### Share Dock image #

   If everything is fine:

   Replace your dockerhubname.

0. If you want to keep your project private use a private repository instead.

0. Push your image to dockerhub.com with a version number (such as "0.1"):

   <tt><strong>
   docker push yourdockerhubname/hackathon-starter:0.1
   </strong></tt>

   Now others can start your app locally using the docker-compose.yml file 
   and running docker-compose up.


   ### Update using CI/CD #

   See https://sloppy.io/from-dev-to-prod-with-nodejs-and-hackathon-starter-part-2/
   which uses Wrker.

   TODO: Write instructions for using Shippable.




## Add a viz page #

   ### viz.jade file #

0. In a Finder window, navigate to the repo's Views folder, <strong>home.jade</strong> file.

   Notice the Visual Studio Code editor recognizes .jade files.

0. Open file <strong>home.jade</strong> using Visual Studio Code.

   Notice color-coding appears for different elements of the file.

   Alternately, you can use any text editor to edit the landing page:

0. If you are not familiar with Jade/Pug templating markup, see<br /> 
   <a target="_blank" href="http://jade-lang.com/tutorial/">
   http://jade-lang.com/tutorial</a>

0. Save to new file <strong>viz.jade</strong>.

0. Examine the formatting:

   <pre>
extends layout
&nbsp;
block content
  h1 Hackathon Starter
  p.lead A boilerplate for Node.js web applications.
  hr
  .row
    .col-sm-12
      h2 Heading
      p Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
      p
        a.btn.btn-default(href='#', role='button') View details »
   </pre>
   <br />
   
   The ".col-sm-2" is coding processed by
   <a target="_blank" href="http://getbootstrap.com/javascript/">
   Bootstrap JavaScript</a>

0. Edit the file to specify your page.




0. Save the changes and exit.


   ### viz.js #

0. Edit the <strong>home.js</strong> file using Visual Studio Code or another text editor:

   The contents:

   <pre>
/**
 * GET /
 * Home page.
 */
exports.index = (req, res) => {
  res.render('home', {
    title: 'Home'
  });
};
   </pre>

0. Save to new file <strong>viz.js</strong>.

0. Replace all "Home" with "Viz"
   and all "home" with "viz".

   The end result:

   <pre>
/**
 * GET /
 * Viz page.
 */
exports.index = (req, res) => {
  res.render('viz', {
    title: 'Viz'
  });
};
   </pre>

0. Save and exit the file.


   ### Add Controller in app.js #

0. Edit the <strong>app.js</strong> file using Visual Studio Code or another text editor:

   Notice from the top of the file down:

   * The require statement brings in each library.

   * The <strong>.env.example</strong> file contains API keys and passwords.

   * ./config/passport

   * <strong>Controllers</strong> process top level menu items (Home, API, Contact, etc.)

0. Read https://github.com/sahat/hackathon-starter#how-do-i-create-a-new-page

0. Duplicate line (copy and paste):

   <tt><strong>
   const contactController = require('./controllers/contact');
   </strong></tt>

0. Edit to make a new Viz route, add:

   <tt><strong>
   const vizController = require ('./controllers/viz');
   </strong></tt>


   ### Add Custom route in app.js #

0. To add a new Viz route, add (above the Error Handler section):

   <pre></strong>
   /**
    * Custom routes:
    */
   app.get('/viz', vizController.getViz);
   </strong></pre>

0. Save and exit the file.


   ### Define getViz #

0. Define getViz.



   ### Run to see changes #

   Alternately, you may instead see some error messages:

   <pre>
/Users/mac/gits/wilsonmar/predix-viz/node_modules/express/lib/router/route.js:196
        throw new Error(msg);
        ^
&nbsp;
Error: Route.get() requires callback functions but got a [object Undefined]
    at Route.(anonymous function) [as get] (/Users/mac/gits/wilsonmar/predix-viz/node_modules/express/lib/router/route.js:196:15)
    at EventEmitter.app.(anonymous function) [as get] (/Users/mac/gits/wilsonmar/predix-viz/node_modules/express/lib/application.js:481:19)
    at Object.&LT;anonymous> (/Users/mac/gits/wilsonmar/predix-viz/app.js:221:5)
    at Module._compile (module.js:541:32)
    at Object.Module._extensions..js (module.js:550:10)
    at Module.load (module.js:458:32)
    at tryModuleLoad (module.js:417:12)
    at Function.Module._load (module.js:409:3)
    at Module.runMain (module.js:575:10)
    at run (bootstrap_node.js:352:7)
    at startup (bootstrap_node.js:144:9)
    at bootstrap_node.js:467:3
       </pre>



## Customize Look and feel #

0. Select a template from http://html5up.net/

   Each template come with index.html, images, css and js folders.

   https://github.com/sahat/hackathon-starter#custom-html-and-css-design-101

   Howeveer, Hackathon Starter CSS is coded to use gird and styles for 
   the Bootstrap CSS framework, but these templates do not. 




   ### JavaScript changes #

   When coding JavaScript please keep in mind the rules specified in this Style Guide:

   https://github.com/airbnb/javascript

   