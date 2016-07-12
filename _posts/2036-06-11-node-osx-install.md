---
layout: post
title: "Node.js Installation on MacOS"
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

## Know the versions of Node.js #

0. Use an internet browser to visit the list of versions:

   <a target="_blank" href="http://nodejs.org/">
   http://nodejs.org</a>
<br />

Choose one (all mutually exclusive) method of installing Node:

   * A: <a href="#Homebrew">Brew install node with default npm and nvm</a>. More error-prone.
   * B: <a href="#Homebrew">Brew install node without npm, then install .npm-packages with no nvm</a>. Recommended.
   * C: <a href="#Download">Download LTS (Long Term Support) v4.4.5</a>.
   * D: <a href="#Download">Download most current version v6.2.1+</a>.
   <br />

The recommended approach is presented second in the list in order for us to see the issue with using defaults in option A.

<hr />

<a name="Homebrew"></a>

## Brew install (for both options A. and B.) #

0. Follow instructions at my [Homebrew installation tutorial](/apple-mac-osx-homebrew/).

   <a href="#NpmPackageInstall">Click here if you want to go straight to the recommended option B</a>.

   ## Option A: Install node with default npm and nvm #

   0. The simplest way to install node is to use brew:

      <pre><strong>
      brew install node -g
      </strong></pre>

      Notice the folder (which may have a different version number):

      <pre>
      ~/Library/Caches/Homebrew/node-6.2.1.el_capitan.bottle.tar.gz
      </pre>

      NOTE: By default, when node is installed, it installs
      <strong>npm</strong>, the Node Package Manager,
      a node package to install additional packages.

0.   Identify which folder npm is obtained:

      <pre><strong>
      which npm
      </strong></pre>

      The response for default installations:

      <pre><strong>
      /usr/local/bin/npm
      </strong></pre>

0.    List npm global modules installed on the default global module folder:

      <pre><strong>
      ls /usr/local/lib/node_modules
      </strong></pre>

      <a name="NVMInstall"></a>

      #### NVM Install #

   NVM (Node Version Manager) downloads and installs multiple versions of Node.js.

0. Install C++ Compiler.

      The README at <a target="_blank" href="https://github.com/creationix/nvm">
      https://github.com/creationix/nvm</a> notes that it uses a C++ compiler installed
      with <a target="_blank" href="http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/">
      Apple's stand-alone Command Line Tools</a> also within Apple's XCode application.

0. Install NVM:

      <pre><strong>
      curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash
      </strong></pre>

      It appends source string to ~/.bashrc

      Note it installs to folder <strong>~/.nvm</strong>.

      CAUTION: NVM does not recognize the PREFIX used in the
      <a href="#AltFolder"> Alternate folder technique</a>.
      So we would need to live with just elevated permissions.

0. Verify

      <pre><strong>
      nvm -v
      </strong></pre>

      3.9.5

      NOTE: nvm is a shell script, so where command does not work.

0. To download, compile, and install the latest v5.0.x release of node:

      <pre>
      nvm install 5.0
      </pre>

0. To list what versions of Node.js are installed:

      <pre>
      nvm ls
      </pre>

0. To use version 5.0 installed:

      <pre>
      nvm use 5.0
      </pre>

NOTE: nvm only seems with work with plugins installed in the
default .npm folder (not in .npm-packages described below).



<a name="NpmPackageInstall"></a>

## B. Install node without npm, then install .npm-packages with no nvm #

   <a name="Uninstall"></a>

   ### Uninstall default install #

0. If node was previously installed, uninstall it:

      <pre><strong>
      brew uninstall node
      </strong></pre>

0. If node was previously installed,
   these folders have been known to block re-install,
   so remove them:

   <pre>
   sudo rm '/usr/local/lib/dtrace/node.d'
   sudo rm `/usr/local/bin/npn'
   sudo rm `/usr/local/bin/node'
   sudo rm `/usr/local/share/doc/node/gdbinit'
   sudo rm `/usr/local/share/man/man1/node.1`
   sudo rm `/usr/local/share/systemtap/tapset/node.stp`
   sudo rm `/usr/local/share/systemtap/tapset`
   </pre>

   ### Create .npm-packages folder #

0. Create the ~/.npm-packages folder:

   <pre><strong>
   mkdir "${HOME}/.npm-packages"
   </strong></pre>

0. To avoid permission issues:

   <pre><strong>
   sudo chown -R $USER:$GROUP ~/.npm-packages
   sudo chown -R $USER:$GROUP ~/.config
   sudo chown -R $USER:admin /usr/local/
   sudo chown -R $USER:admin /usr/local/include
   </strong></pre>

   Provide your password when prompted.

0. Indicate to npm where to store globally installed packages
   by adding a line at the bottom of the ~/.npmrc file:

   <pre><strong>
   echo prefix=~/.npm-packages >> ~/.npmrc
   </strong></pre>

   WARNING: NVM does not support this.

0. Install node without default npm:

    <pre><strong>
    brew install node --without-npm -g
    </strong></pre>

0. Install npm for global use:

   <pre><strong>
   curl -L https://www.npmjs.com/install.sh | sh
   </strong></pre>

   The response:

   <pre>
   fetching: http://registry.npmjs.org/npm/-/npm-3.9.5.tgz
   </pre>

0. After install, verify the location:

   <pre><strong>
   which npm
   </strong></pre>

   The response, where "mac" is substituted with your user name:

   <pre>
   /Users/mac/.npm-packages/bin/npm
   </pre>

0. To ensure npm will find installed binaries and man pages,
   use a text editor to edit the <strong>~/.bash_profile</strong> file.

   BTW, .bash_profile on Mac is equivalent to the .bashrc file used in Linux systems.

0. Add a NPM_PACKAGES environment variable containing the path to npm-installed packages
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

0. Save changes to the .bash_profile file.
0. Run the file into memory:

   <pre><strong>
   source ~/.bash_profile
   </strong></pre>

The above is recommended by
<a target="_blank" href="https://gist.github.com/DanHerbert/9520689">
Advice on fixing npm On Mac OS X for Homebrew Users</a>

BTW, an alternative to NVM is "n" from https://github.com/tj/n.
However, I never got it to work for me.


<hr />


<a name="Download"></a>

## C: Download and Install Node #

0. Download installer from <a target="_blank" href="http://nodejs.org/">
   http://nodejs.org</a>
0. Use the Mac Finder to navigate to the file in your Downloads folder.
0. Unzip the file downloaded.
0. Execute the file.
0. Respond to the prompts.
0. Skip to <a href="#Verify">Verify the install</a>


## Resources #

Several blogs addresses issues related to this topic:

* https://docs.npmjs.com/getting-started/fixing-npm-permissions
* <a target="_blank" href="https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md">
   Install npm packages globally without sudo on OS X and Linux</a>
  * http://stackoverflow.com/questions/16151018/npm-throws-error-without-sudo/24404451#24404451
  * http://stackoverflow.com/questions/10081293/install-npm-into-home-directory-with-distribution-nodejs-package-ubuntu/13021677#13021677
<br />



<hr />

   The command to install a package without additional parameters is, for example:

   <pre><strong>
   pwd
   npm install serverless
   </strong></pre>

   This installs the node packages <strong>locally</strong> within
   whatever folder is the present working directory, revealed by the `pwd` command.

   However, we usually need node packages to be installed <strong>globally</strong>
   for access from any present directory by any user on the machine.

   This location is one MacOS requires sudo (super user do) permission elevation.
   For example:

   <pre><strong>
   sudo npm install serverless -g
   </strong></pre>

   Without sudo, an error would occur from the above command such as:

   <pre>
   npm WARN checkPermissions Missing write access to ...
   </pre>

   This is because the default npm folder is managed at the system level,
   not user level.

   To avoid these permission issues,
   some recommend higher permissions to folders, as in:

   <pre><strong>
   sudo chown -R $USER:$GROUP ~/.npm
   sudo chown -R $USER:$GROUP ~/.config
   </strong></pre>

   This may not be enough to address installation issues when using Homebrew
   such as when upgrading with command:

   <pre><strong>
   npm update npm -g
   </strong></pre>

   <a name="AltFolder"></a>

   #### Alternate folder #

   We can install the folder under a user's HOME folder,
   which is defined by the ${HOME} environment variable:

   <pre><strong>
   echo "${HOME}"
   </strong></pre>

   The alternative npm folder name established by convention is:

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


<a name="VerifyNode"></a>

## Verify #

0. Verify:

   <pre><strong>
   echo $NODE_PATH
   </strong></pre>

   The response:

   <pre>
   /Users/mac/.npm-packages/lib/node_modules:/usr/local/bin
   </pre>

   Regardless of how you installed node,
   before discussing your installation, obtain and present these facts:

0. The operating system:

   <pre><strong>
   uname -a
   </strong></pre>

   On my machine, the response:

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

0. From any folder, list what global npm packages installed as a tree:

   <pre><strong>
   npm list -g --depth=0
   </strong></pre>

   The response is a list with version numbers:

   <pre>
/Users/mac/.npm-packages/lib
├── bower@1.7.9
├── express@4.13.4
├── grunt@1.0.1
├── grunt-cli@1.2.0
├── learnyounode@3.5.3
├── n@2.1.0
├── npm@3.9.5
└── serverless@0.5.6
   </pre>

   Note the first line in the response shows the folder.

   Alternately, for just a simple list of package names:

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



   <pre><strong>
   npm ls
   </strong></pre>

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


## How NPM works #

HEADS UP! This article was written for an older version of node. More up-to-date information may be available elsewhere.
https://howtonode.org/introduction-to-npm

http://stackoverflow.com/questions/25897908/how-npm-install-works

https://www.npmjs.org/doc/cli/npm-shrinkwrap.html

I use Node.js (via browserify) for each of my web apps, all of which have some dependencies in common and others specific to themselves. Each of these apps has a package.json file that specifies which versions of which modules it needs.

Yes, that is what npm install does. In node.js code, the require algorithm has a particular sequence of places it looks, including walking up the filesystem. However, npm install doesn't do that. It just installs in place. The algorithms it uses are all constrained to just a single node_modules directory under your current directory and it won't touch anything above that (except for with -g).

Right now, I have a /node_modules directory in the parent folder of my apps for modules that they all need to reference, and then I put app-specific modules in a node_modules folder in that app's directory. This works fine in the short term, since my require() statements are able to keep looking upward in the file structure until they find the node_modules directory with the correct app in it.

Where this gets tricky is when I want to go back to an old project and run npm install to make sure it can still find all the dependencies it needs. (Who knows what funny-business has occurred since then at the parent directory level.) I was under the impression that npm install did this:

    for each module listed in package.json, first check if it's present, moving up the directory the same way require does. If it's not, install it to the local node_modules directory (creating that directory if necessary).

When I run npm install inside an app folder, however, it appears to install everything locally regardless of where else it may exist upstream. Is that the correct behavior? (It's possible there's another reason, like bad version language in my package.json). If this IS the correct behavior, is there a way for me to have npm install behave like the above?

It's not a big deal to widely replicate the modules inside every app, but it feels messy and prevents me from make small improvements to the common modules and not having to update every old package.json file. Of course, this could be a good thing...

Yeah basically you're doing it wrong. The regular workflow scales well to the Internet. 
For your use case it creates some extra tedious work, 
but you can also just use semantic versioning as intended and specify "mylib": "^1.0.0" in your package.json for your apps and be OK with automatically getting newer versions next time you npm install.




## Resources #

<a target="_blank" href="https://iojs.org/">
iojs.org</a>
is a forke of Node.js by several core committers frustrated by Joyant.
It uses the Go language.


## More on MacOS #

This is one of a series on MacOS:

{% include mac_links.html %}
