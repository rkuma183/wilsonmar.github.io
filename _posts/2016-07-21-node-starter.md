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
hackathon-starter</a> repo which uses SASS, Express, and several other 
<a href="#Packages">commonly used packages</a>
to create a new Node app. 
Sahat Yalkabov's repo comes with basic plumbing for processing 
<a href="#APIs">several APIs</a>
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
   which generates HTML for display. See http://naltatis.github.io/jade-syntax-docs/#attributes
   for Jade Syntax Documentation by Example.
   If you have some HTML you want to paste in a jade file, http://html2jade.aaron-powell.com/
   generates jade from HTML.

0. Instal Node on MacOS OSX by following [my instructions](/node-osx-install/):

0. Install dependencies defined in the project.json file:

   <tt><strong>
   npm install 
   </strong></tt>

   NOTE:
   Some claim that "NPM" is a "bacronymic" abbreviation, a phrase constructed ex post facto to make itself,
   such as "npm is not an acronym".


   ### Add MongoDB in MacOS #

0. [Follow my tutorial](/mongodb/)


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


   ### Create new Node project #

0. Create:

   <tt><strong>
   npm init
   </strong></tt>

   Walk through the wizard to create a <strong>package.json</strong> file.

   If you don't provide a description or other fields, 
   a warning message will appear when you install additional modules, such as:

   <pre>
   npm WARN rocket-shop@1.0.0 No repository field.
   </pre>


   ### Mocha test framework #

   For testing:

0. Create a test folder

   <pre><strong>
   cd ~/gits
   mkdir rocket-shop
   cd    rocket-shop
   </strong></pre>

0. Install Mocha globally (from any folder):

   <tt><strong>
   npm install mocha -g
   </strong></tt>

   Note the folder paths:

   <pre>
/Users/mac/.nvm/versions/node/v6.8.1/bin/mocha -> /Users/mac/.nvm/versions/node/v6.8.1/lib/node_modules/mocha/bin/mocha
/Users/mac/.nvm/versions/node/v6.8.1/bin/_mocha -> /Users/mac/.nvm/versions/node/v6.8.1/lib/node_modules/mocha/bin/_mocha
/Users/mac/.nvm/versions/node/v6.8.1/lib
└─┬ mocha@3.1.2 
...
   </pre>

0. Run

   <tt><strong>
   mkdir test<br />
   mocha
   </strong></tt>

   Since no tests have been defined, the response is:

   <pre>
no test files found
   </pre>


   ### Install Sinon.JS locally #

   "Standalone test spies, stubs, and mocks for JavaScript.
   No dependencies. Works with any unit testing framework."

0. Install from sinonjs.org locally:

   <tt><strong>
   npm install sinon --save-dev
   </strong></tt>

   The response I got:

   <pre>
rocket-shop@1.0.0 /Users/mac/gits/nodes/rocket-shop
└─┬ sinon@1.17.6 
  ├── formatio@1.1.1 
  ├── lolex@1.3.2 
  ├── samsam@1.1.2 
  └─┬ util@0.10.3 
    └── inherits@2.0.1 
   </pre>

   ### Moment.JS #

   For working with dates and timezones in JavaScript.

0. Instead of downloading from momentjs.com:

   <tt><strong>
   npm install moment --save
   </strong></tt>

   PROTIP: `--save` instructs NPM to add a reference to the package 
   inside of the dependencies section of your package.json, 
   thus saving you the work of editing the file manually.

   The response:

   <pre>
rocket-shop@1.0.0 /Users/mac/gits/nodes/rocket-shop
└── moment@2.15.2 
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

   CAUTION: <a target="_blank" href="http://thenextweb.com/twitter/2012/08/17/twitter-4/#gref">
   In 2013</a> Twitter killed their API program by putting
   user caps for third-party Twitter clients and
   limiting the maximum number of users any outside client can ever have.

   <a target="_blank" href="http://www.zdnet.com/article/tweeting-trolls-without-tools-twitter-will-remain-a-cesspool-of-hate/">
   This author wisely noticed that</a> "by restricting access to its APIs, Twitter has in effect created a closed environment, where trolls can operate freely, because end-users do not have access to tools that would enable them to insulate themselves.
   It means the bad guys and the angry mob can game the system a lot easier."

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


## Website hosting #

There are several options to host a Node website.

   * Locally
   * Locally within a Vagrant instance.
   * Heroku cloud
   * AWS

   * https://mlab.com/home?newAccount=1

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

   ### Limit APIs loaded #

0. You may want to comment out APIs that you don't intend on using:

   <tt><strong>
   atom package.json
   </strong></tt>

   Replace atom with whatever text editor you prefer (subl for Sublime, vim, etc.).

   A short description of each package is <a target="_blank" href="https://github.com/sahat/hackathon-starter/blob/master/README.md#list-of-packages">
   here</a>.


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



## Enable basic features #

0. Email

0. Google Analytics

0. Search


## Customize Look and feel #

0. Favicon

   Generate favicons for PC, Android, iOS, Windows 8 at
   http://realfavicongenerator.net/

   <a name="APIs"></a>

0. Use default APIs

   PROTIP: Invest in getting setup with the various APIs before you need them.
   Not only will you be prepared,
   you'll be more knowledgeable and thus more creative when you understand the possibilities.

0. Adopt a template from http://html5up.net/

   Each template come with index.html, images, css and js folders.

   https://github.com/sahat/hackathon-starter#custom-html-and-css-design-101

   Howeveer, Hackathon Starter CSS is coded to use gird and styles for 
   the Bootstrap CSS framework, but these templates do not. 

0. Add another API 


<a name="AddGoogleMap"></a>

## Add Google Maps API #

In 2005 Google introduced https://developers.google.com/maps/
Maps API.

Before you do down this road (pun intended), know that there's money involved.

   <img align="right" width="284" height="353" alt="google maps apis 284x353-c69.png"
   src="https://cloud.githubusercontent.com/assets/300046/17079993/3b6b1406-50de-11e6-984b-03ba44805fe6.png">
0. Switch to the Google API Console at<br />
   <a target="_blank" href="https://console.developers.google.com/">
   https://console.developers.google.com</a>
   create a project and
   click "more" to expose all the Map APIs
   so you click each of the APIs in yellow
   to Enable them for your project.

0. Click the “Credentials” menu item on the left 
   to "Create Credentials” button for API Key.
   Browser key.

0. Accept "Browser Key 2" or type in a name before clicking
   Create.

   We will return to specify referrer restrictions.

   AIzaSyDpk2I9IuO-ktQvqK56vfqprQu_i3X1bXE

0. Copy the API key and paste it to replace the "..." 
   in this JavaScript, then copy the whole set of lines
   and paste it near the bottom of body in HTML:

   <pre>
   &LT;script async defer
   scr="https://maps.googleapis.com/maps/api/js?&key=...&v=3&callback=initMap">
   &LT;/script>
   </pre>

   Not http://maps.google.com/maps/api/js?sensor=true 

   Refer to the JavaScript API at
   https://developers.google.com/maps/documentation/javascript/reference

0. Get gmaps.js from Gustavo Leon's<br />
   <a target="_blank" href="https://github.com/hpneo/gmaps/">
   https://github.com/hpneo/gmaps</a>
   as described at
   <a target="_blank" href="https://www.sitepoint.com/google-maps-made-easy-with-gmaps-js/">
   this December 2015 blog</a>.

   It's an improvement over 
   https://github.com/moshen/node-googlemaps

   Instructions also from:

   * https://dzone.com/articles/create-google-maps-gmapsjs

   Use a version in a CDN (Content Distribution Network):

   * https://cdn.jsdelivr.net/gmaps/0.4.24/gmaps.min.js
   from http://www.jsdelivr.com/projects/gmaps

   * http://hpneo.github.io/gmaps/
   from https://cdnjs.com/libraries/gmaps.js/

0. The GMap library requires jQuery:

   <pre>
   &Lt;script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js">&LT;/script>
   </pre>

   QUESTION: Is this library in the Google CDN or CloudFlare CDN?


0. Paste the CSS tag where the Google JavaScript library paints the \#map:

   <pre>
   &LT;div id="map">&LT;/div>
   </pre>

0. Paste this at the top right under &LT;body> to receive the callback:

   <pre>
var map = new GMaps({
    div: '#map',
    lat: -12.043333,
    lng: -77.028333
});
   </pre>

   Instead of Google's:

   <pre>
   &LT;script>
   var map;
   function initMap(){
      map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 40.1234567, lng: -73.1234567},
        zoom: 13
      });
      // TODO: Use a database instead:
      var locations= [
         {title: 'Park Ave', location: {lat: 40.1234567, lng: -73.1234567}},
         {title: 'Chinatown', location: {lat: 40.1234567, lng: -73.1234567}}
      ];
   }
   &LT;/script>
   </pre>



0. PROTIP: One good way to learn this is 
   Google's FREE 12 hour
   <a target="_blank" href="https://www.udacity.com/course/google-maps-apis--ud864">
   video course at Udacity</a> which builds a 
   Real Estate listing app.
   


0. Install wrapper for asynchronously used Google Maps API:

   <tt><strong>
   npm install <a target="_blank" href="https://www.npmjs.com/package/google-maps">googlemaps</a>
   </strong></tt>

   The response:

   <pre>
/usr/local/Cellar/node/6.3.0/lib
└─┬ googlemaps@1.11.1 
  ├── check-types@1.3.2 
  ├── qs@4.0.0 
  ├─┬ request@2.44.0 
  │ ├── aws-sign2@0.5.0 
  │ ├─┬ bl@0.9.5 
  │ │ └─┬ readable-stream@1.0.34 
  │ │   ├── core-util-is@1.0.2 
  │ │   ├── inherits@2.0.1 
  │ │   ├── isarray@0.0.1 
  │ │   └── string_decoder@0.10.31 
  │ ├── caseless@0.6.0 
  │ ├── forever-agent@0.5.2 
  │ ├─┬ form-data@0.1.4 
  │ │ ├── async@0.9.2 
  │ │ ├─┬ combined-stream@0.0.7 
  │ │ │ └── delayed-stream@0.0.5 
  │ │ └── mime@1.2.11 
  │ ├─┬ hawk@1.1.1 
  │ │ ├── boom@0.4.2 
  │ │ ├── cryptiles@0.2.2 
  │ │ ├── hoek@0.9.1 
  │ │ └── sntp@0.2.4 
  │ ├─┬ http-signature@0.10.1 
  │ │ ├── asn1@0.1.11 
  │ │ ├── assert-plus@0.1.5 
  │ │ └── ctype@0.5.3 
  │ ├── json-stringify-safe@5.0.1 
  │ ├── mime-types@1.0.2 
  │ ├── node-uuid@1.4.7 
  │ ├── oauth-sign@0.4.0 
  │ ├── qs@1.2.2 
  │ ├── stringstream@0.0.5 
  │ ├── tough-cookie@2.3.0 
  │ └── tunnel-agent@0.4.3 
  └── waitress@0.1.5 
     </pre>

   Other node libraries:

   * https://github.com/mikeal/request

   * https://github.com/danwrong/restler

   * https://prazjain.wordpress.com/2012/04/19/maps-example-with-google-maps-and-nodejs/
   uses libraries express, ejs, 
   geohash to latitude and longitude coordinates.

0. Define Proxy.

0. Get geocode (physical address) from IP Address.

0. Display Static Map.

0. Place Search.

0. Calculate distance.


   ### JavaScript changes #

   When coding JavaScript please keep in mind the rules specified in this Style Guide:

   https://github.com/airbnb/javascript

   Reference these:

   * http://www.javascripting.com/
   provides a database of JavaScript libraries.

   * http://www.javascriptoo.com/
   provides a directory of JavaScript libraries with examples, CDN links, statistics, and videos.

   * http://sahatyalkabov.com/jsrecipes/
   provides JavaScript tutorials for backend and frontend development.

   
## MLab #

0. Open the <a target="_blank" href="https://mlab.com/">mlab.com</a> website.

0. If you don't already have one, click the <strong>Sign up</strong> button 
   and fill in your user information then hit Create account.

0. From the dashboard, click on <strong>⚡ Create new</strong> (database) button.
0. Select any cloud provider. I usually go with AWS East, the default.
0. Under Plan, click on <strong>Single-node</strong> tab, and 
   select <strong>Sandbox</strong> (shared, 0.5 GB) since it's free.
0. Leave MongoDB version as is <strong>3.0.x (MMAPv1)</strong>

   QUESTION: What happened to 2.4.x ?

0. Enter Database name* for your web app.

   <tt><strong>
   https://api.mlab.com/api/1/databases/[db]/collections/[collection]?apiKey=[key]
   </strong></tt>

   [db] is replaced

   [collection]

   [key]

0. Click on ⚡Create new MongoDB deployment button
0. Now, to access your database you need to create a DB user
0. Click to the recently created database
   
   You should see the following message:
   
   A database user is required to connect to this database. Click here to create a new one.

0. Click the link and fill in DB Username and DB Password fields

0. Use a text editor to update database credentials in .env file:

   <pre>
   mongodb://localhost:27017/test
   </pre>

   use the following URI with your credentials:

   <tt><strong>
   db: 'mongodb://USERNAME:PASSWORD@ds027479.mongolab.com:27479/DATABASE_NAME'
   </strong></tt>

   Note: As an alternative to mLab, there is also 
   https://www.compose.io/

## Learning resources #

* https://school.scotch.io/build-a-restful-nodejs-api/
   offers a video introduction for free.
   Subscribe for the MongoDB tutorial ($12/month).
