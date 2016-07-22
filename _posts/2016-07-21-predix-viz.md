---
layout: post
title: "Node Starter"
excerpt: "API"
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

This is a tutorial on how to make use of Sahat Yalkabov's
<a target="_blank" href="https://github.com/sahat/hackathon-starter">
hackathon-starter</a> repo which uses SASS, Express, and several other packages
to create a new Node app that has basic plumbing for processing several APIs
along with account creation, login, contact form,
and other basic features of any website.

Unlike the README and most other tutorials, 
this tutorial specifies each step to present responses,
taking a "deep dive" approach, and adds NOTEs and PROTIPs commentary along the way.

The objective here is to add a visualization (viz) page
to the boilerplate website.

0. Use an internet browser to view<br />
   <a target="_blank" href="https://github.com/sahat/hackathon-starter">
   https://github.com/sahat/hackathon-starter</a>

0. Fork the repo into your own account, such as:<br />
   https://github.com/wilsonmar/hackathon-starter

0. Open a Terminal shell window and make a folder such as:

   <tt><strong>
   mkdir ~/gits
   </strong>

0. Clone to your local folder (replacing wilsonmar in the example below):

   <tt><strong>
   git clone --depth=1 https://github.com/wilsonmar/hackathon-starter predix-viz
   </strong>

   The "--depth=1" limits the history of commits.

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

0. Setup a upstream remote location to obtain future updates:

   <tt><strong>
   git remote add upstream https://github.com/sahat/hackathon-starter
   </strong>

0. Get a list of files and folders:

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

   Notice the <a target="_blank" href="https://github.com/sahat/hackathon-starter/blob/master/README.md#project-structure">
   project structure</a>:

   * scss files are used to generate the .css files

   * fontawesome icons are embedded

   * .jade files in the <strong>view</strong> folder are read by the Jade/Pug template engine for Express
   which dynamically generates HTML for display.

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

0. Install NPM dependencies

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

0. Install Nodemon, following instructions at:

   https://github.com/sahat/hackathon-starter/blob/master/README.md

   <tt><strong>
   npm install nodemon
   </strong></tt>

   The response:

   <pre>
> fsevents@1.0.14 install /Users/mac/gits/wilsonmar/predix-viz/node_modules/fsevents
> node-pre-gyp install --fallback-to-build
&nbsp;
[fsevents] Success: "/Users/mac/gits/wilsonmar/predix-viz/node_modules/fsevents/lib/binding/Release/node-v48-darwin-x64/fse.node" is installed via remote
hackathon-starter@4.0.1 /Users/mac/gits/wilsonmar/predix-viz
└── nodemon@1.9.2  extraneous
   </pre>

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

0. Have Nodemon instead of Node start app.js:

   <tt><strong>
   nodemon app.js
   </strong></tt>

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


   ### Add HTML #

   Per https://www.predix.io/learn?mkt_tok=...

   <pre>
<px-chart>
    <px-chart-controls data-controls show-date-range="true"></px-chart-controls>
</px-chart>
    </pre>


## Run again

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



## Look and feel customization #

0. Select a template from http://html5up.net/

   Each template come with index.html, images, css and js folders.

   https://github.com/sahat/hackathon-starter#custom-html-and-css-design-101

   Howeveer, Hackathon Starter CSS is coded to use gird and styles for 
   the Bootstrap CSS framework, but these templates do not. 

