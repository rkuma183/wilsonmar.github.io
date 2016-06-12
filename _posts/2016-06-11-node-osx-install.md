---
layout: post
title: "Node.js on Mac OSX"
excerpt: "JavaScript for the win"
tags: [node, javascript, apple, mac, setup]
image:
# feature: pic orange wm_mcnaughton_sunset_runner_1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622121/097d7550-0585-11e6-9543-27d45c2487c2.jpg
  credit: William McNaughton
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}


<a id="NodeJSz"></a>

## Know the versions of Node.js 

0. Use an internet browser to visit the list of versions:

   <a target="_blank" href="http://nodejs.org/">
   http://nodejs.org</a>
<br />

0. Choose method of installing brew:

   * <a href="#Download">Download LTS (Long Term Support) v4.4.5</a>
   * <a href="#Download">Download most current version v6.2.1+</a>
   * <a href="#Homebrew">Brew install whatever version Homebrew has available</a>
   * <a href="#NVMInstall">Install NVM to install Node</a>
<br />

<hr />

<a name="Download"></a>

## Download and Install Node #

0. Download installer from <a target="_blank" href="http://nodejs.org/">
   http://nodejs.org</a>
0. Use the Mac Finder to navigate to the file in your Downloads folder.
0. Unzip the file downloaded.
0. Execute the file.
0. Respond to the prompts.
0. Skip to <a href="#Verify">Verify the install</a>

<a name="Homebrew"></a>

## Install Homebrew #

See https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Common-Issues.md


0. Install Homebrew if you haven't already.

   <pre><strong>
   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   <strong></pre>

   https://github.com/Homebrew/homebrew/issues

0. Get version:

   <pre><strong>
   brew -v
   </strong></pre>

   The response (at time of writing):

   <pre>
   Homebrew 0.9.9 (git revision e9cc; last commit 2016-06-12)
   Homebrew/homebrew-core (git revision 3977; last commit 2016-06-12)
   </pre>

0. Identify where the program is located:

   <pre><strong>
   which brew
   </strong></pre>

   The response:

   <pre>
   /usr/local/bin/brew
   </pre>

0. Analyze brew environment:

   <pre><strong>
   brew cleanup
   brew update
   brew doctor
   </strong></pre>

   Fix any issue revealed.


<a name="NodeInstall"></a>

## Install Node using Homebrew #

Several blogs addresses issues related to this topic:

* https://docs.npmjs.com/getting-started/fixing-npm-permissions
* <a target="_blank" href="https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md">
   Install npm packages globally without sudo on OS X and Linux</a>
* <a target="_blank" href="https://gist.github.com/DanHerbert/9520689">
  Advice on fixing npm On Mac OS X for Homebrew Users</a>
  * http://stackoverflow.com/questions/16151018/npm-throws-error-without-sudo/24404451#24404451
<br />

0. Choose method of installing brew:

   The simplest way to install node is to use brew:

   <pre><strong>
   brew install node
   </strong></pre>

   NOTE: By default, when node is installed, it installs 
   <strong>npm</strong>, the Node Package Manager,
   a node package to install additional packages.

   We can get the default location by this command:
   
   <pre><strong>
   which npm
   </strong></pre>

   The response for default installations:

   <pre><strong>
   /usr/local/lib/node_modules
   </strong></pre>

   We list npm global modules installed on the default global module folder
   with this command:

   <pre><strong>
   ls /usr/local/lib/node_modules
   </strong></pre>

   The command to install a package without additional parameters is, for example:

   <pre><strong>
   pwd
   npm install serverless
   </strong></pre>

   This installs the node packages <strong>locally</strong> within 
   whatever folder is the present working directory, revealed by the `pwd` command.

   However, we usually need node packages to be installed <strong>globally</strong> 
   for access from any present directory by any user on the machine.

   This location is one that OSX requires sudo prefix.
   For example:

   <pre><strong>
   sudo npm install serverless -g
   </strong></pre>

   Without sudo, an error would occur from the above command such as:

   <pre>
   npm WARN checkPermissions Missing write access to /...
   </pre>

   This is because the default npm folder is managed at the system level,
   not user level.

   To avoid these permission issues, 
   some recommend messing with permissions, as in:

   <pre><strong>
   sudo chown -R $USER:$GROUP ~/.npm
   sudo chown -R $USER:$GROUP ~/.config
   </strong></pre>

   More importantly, installation using Homebrew has created other issues,
   such as when upgrading, such as:

   <pre><strong>
   npm update npm -g
   </strong></pre>

   We can install the folder under a user's HOME folder, 
   which is defined by the ${HOME} environment variable:

   <pre><strong>
   echo "${HOME}"
   </strong></pre>

   The alternative npm folder name estblished by convention is:

   <pre><strong>
   ls ~/.npm-packages
   </strong></pre>

   To achieve this, we first need to uninstall the default install:

   <pre><strong>
   rm -rf /usr/local/lib/node_modules
   brew uninstall node
   </strong></pre>

   All of Node needs to be uninstalled because it installed npm which uses the system folder.

   To install node for global use, we can invoke

   <a target="_blank" href="https://github.com/glenpike/npm-g_nosudo/blob/master/npm-g-nosudo.sh">
   npm-g_nosudo</a>

   ### Install with no sudo #

   Alternately, we do it manually by following the steps below:

0. Create the ~/.npm-packages folder:

   <pre><strong>
   mkdir "${HOME}/.npm-packages"
   </strong></pre>

0. To avoid permission issues:

   <pre><strong>
   sudo chown -R $USER:$GROUP ~/.npm-packages
   sudo chown -R $USER:$GROUP ~/.config
   </strong></pre>

0. Indicate to npm where to store globally installed packages
   by adding a line at the bottom of the ~/.npmrc file:

   <pre><strong>
   echo prefix=~/.npm-packages >> ~/.npmrc
   </strong></pre>

   WARNING: NVM does not support this.

0. To install node for global use:

   <pre><strong>
   curl -L https://www.npmjs.com/install.sh | sh
   </strong></pre>

0. After install, verify the location:

   <pre><strong>
   which npm
   </strong></pre>

   The response, where "mac" is substitued with your user name:

   <pre>
   /Users/mac/.npm-packages/bin/npm
   </pre>

0. To ensure npm will find installed binaries and man pages,
   use a text editor to edit the <strong>~/.bash_profile</strong> file.

   BTW, .bash_profile is equivalent to the .bashrc file used in Linux systems.

0. Add an NPM_PACKAGES environment variable containing the path to npm-installed packages
   into the system PATH variable:

   <pre><strong>
   NPM_PACKAGES="${HOME}/.npm-packages"
   PATH="$NPM_PACKAGES/bin:$PATH"
   </strong></pre>

0. To identify where node executables are installed:

   <pre><strong>
   which node
   </strong></pre>

   the response:

   <pre>
   /usr/local/bin/node
   </pre>

   See that Node one among many other programs at:

   <pre>
   ls /usr/local/bin
   </pre>

0. Make sure that this path containing the node executable is in the PATH:

   <pre>
   echo $PATH
   </pre>

   If not add it to the system PATH:

   <pre>
   export NODE_PATH=/usr/local/bin
   </pre>

0. Save the file.
0. Activate the file in memory:

   <pre><strong>
   source ~/.bash_profile
   </strong></pre>


<a name="NVMInstall"></a>

### NVM #

NVM (Node Version Manager) downloads and installs multiple versions of Node.js. 

Its README at <a target="_blank" href="https://github.com/creationix/nvm">
https://github.com/creationix/nvm</a> notes that it uses a C++ compiler installed
with <a target="_blank" href="http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/">
Apple's stand-alone Command Line Tools</a> also within Apple's XCode application.

0. Install NVM:

   curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash

   It appends source string to ~/.bashrc

   Note it installs to folder <strong>~/.nvm</strong>.

0. Verify

   <pre><strong>
   nvm -v
   </strong></pre>

   3.9.5

   NOTE: nvm is a shell script, so where command does not work.

0. To download, compile, and install the latest v5.0.x release of node:

   nvm install 5.0

0. To list what versions of Node.js are installed:

   nvm ls

0. To use version 5.0 installed:

   nvm use 5.0

BTW, an alternative to NVM is "n" from https://github.com/tj/n.

<a name="Verify"></a>

### Verify Node works #

Regardless of how you installed node,
before discussing your installation, obtain and present these facts:

0. The operating system:

   <pre><strong>
   uname -a
   </strong></pre>

   On my Mac OSX, the response:

   <pre>
   Darwin macs-MacBook-Pro-4.local 15.5.0 Darwin Kernel Version 15.5.0: Tue Apr 19 18:36:36 PDT 2016; root:xnu-3248.50.21~8/RELEASE_X86_64 x86_64
   </pre>

0. Obtain node version:

   <pre><strong>
   node -v
   </strong></pre>

   v4.4.5

0. Obtain npm version:

   <pre><strong>
   npm -v
   </strong></pre>

   3.9.5

0. List what npm global packages installed as a tree:

   <pre><strong>
   npm list --depth=0 -g
   </strong></pre>

   The depth paramenter eliminates the dependencies.

0. List what global npm packages installed as a tree:

   <pre><strong>
   npm list -g --depth=0
   </strong></pre>

   Alternately,

   <pre><strong>
   npm ls --parseable | awk '{gsub(/\/.*\//,"",$1); print}'| sort -u
   </strong></pre>

0. Simple list of npm packages installed:

   <pre><strong>
   ls `npm root -g`
   </strong></pre>



<a name="CodeNode"></a>

## Code Node JavaScript

Others who have blogged about this include:

* <a target="_blank" href="http://quickleft.com/blog/getting-started-with-express-in-node">
   http://quickleft.com/blog/getting-started-with-express-in-node</a>

0. Make a folder containing Node application files, and go to it:

0. Install the express package and its dependencies:

   <pre><strong>
   npm install express -g
   </strong></pre>

0. Use a text editor to create file `index.js` containing "Hello World" code in JavaScript:

   <pre>
   /*jslint node: true */
   var express = require('express');
   var app = express();
   app.get('/', function(res,req){
      res.json({
         message: 'hello world'
      });
   });
   app.listen(3000); // This establishes port 3000. You can use another port.
   </pre>
   
   NOTE: Semicolons and carriage returns serve the same purpose in JavaScript. You only need semicolons if you are concatenating code together in a single line.

   See https://www.airpair.com/javascript/posts/eleven-mistakes-developers-javascript

0. Start the Node server running the default <strong>index.js</strong> program:

   <pre><strong>
   node index.js
   </strong></pre>

   The window remains open and accept no other commands
   until you press <strong>control+C</strong> to escape the process.

0. Switch to an internet browser to open the Node Express web server running locally at port 3000:

   <pre>
   http://localhost:3000/
   </pre>

   If you get "TypeError: res.json is not a function" ...

0. Install NodeMon:

   <pre><strong>
   npm install nodemon -g # -g installs globally as system command.
   nodemon index.js # watch for changes and kill server when needed
   </strong></pre>


<a id="Bower_installz"></a>

## Bower Install #

Bower is similar to npm, but for the front-end GUI applications.

Any frameworks or 3rd-party libraries that need to be accessible in the user's browser 
will be managed by bower.

Similarly to npm, bower tracks dependencies in a file called <strong>bower.json</strong>.

0. Install bower globally via npm:

   <pre><strong>
   npm install -g bower
   </strong></pre>

   Running bower install will resolve, download, and install them.


   ### Project Bower Install

0. cd to the project's folder.

0. Install the project's bower components using bower:

   <pre><strong>
bower install
   </strong></pre>

0. Install http-server using npm:

   <pre><strong>
npm install -g http-server
   </strong></pre>

0. Fire up the server at default port 8080:

   <pre><strong>
http-server client/
   </strong></pre>


<hr />

<a id="LearnNode"></a>

## Node Programming Tutorial #

The classic interactive tutorial introducing Node.Js was created on:

<a target="_blank" href="https://github.com/workshopper/learnyounode">
https://github.com/workshopper/learnyounode</a>

To install it we reference its npm package on npm.org:

0. Run `npm install learnyounode -g`

   Notice the -g can go before or after the module being installed.

0. Run `learnyounode` 

   <img width="540" height="320" alt="learnyounode 1080x640" src="https://cloud.githubusercontent.com/assets/300046/14714119/0163d652-07a1-11e6-9a24-0ea6d5941222.png">

   NOTE: Use keyboard up/down arrows to select option. This is not a GUI interface.

   The tutorial consumes a Terminal window process.

0. To exit, press control/command + C to close the process.

0. When you're done, run `npm uninstall learnyounode`.



## More on OSX #

This is one of a series on Mac OSX:

{% include mac_links.html %}
