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

   * <a target="_blank" href="http://nodejs.org/">
   http://nodejs.org</a>

0. Choose which method of installation:

   * <a href="#Download">Download LTS (Long Term Support) v4.4.5</a>
   * <a href="#Download">Download Most current version v6.2.1+</a>
   * <a href="#Homebrew">Brew install whatever version Homebrew has available</a>

<hr />

<a name="Download"></a>

## Download and Install #

0. Download installer from <a target="_blank" href="http://nodejs.org/">

0. Use the Mac Finder to navigate to the file in your Downloads folder.
0. Unzip the file downloaded.
0. Execute the file.
0. Respond to the prompts.
0. <a href="#Verify">Verify the install</a>

<a name="Homebrew"></a>

## Install it using Homebrew #

0. Install Homebrew if you haven't already.

0. Verify

   <tt><strong>
   which brew
   </strong></tt>

   The response:

   <pre>
   /usr/local/bin/brew
   </pre>

0. Install whatever version Homebrew has vetted:

   <tt><strong>
   brew install node
   </strong></tt>

0. Verify version installed:


<a name="Verify"></a>

## Verification #

There are two major aspects:

0. Verify node:

   <tt><strong>
   node -v
   </strong></tt>

0. Verify npm:

   <tt><strong>
   npm -v
   </strong></tt>



## Set path to Node #

Put NPM (Node Package Manager) in the path for commands to be found:

   <tt><strong>
npm config set prefix ~/.npm<br >
echo 'export PATH="$PATH:~/.npm/bin"' >> ~/.bashrc<br >
~/.bashrc
   </strong></tt>


<a id="LearnNode"></a>

## Node Module Install and Uninstall

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


## Troubleshooting 

* <a target="_blank" href="https://gist.github.com/DanHerbert/9520689">
Fixing npm On Mac OS X for Homebrew Users</a>

* <a target="_blank" href="http://quickleft.com/blog/getting-started-with-express-in-node">
http://quickleft.com/blog/getting-started-with-express-in-node</a>


<a id="Bower_installz"></a>

## Bower Install

Bower is similar to npm, but for the front-end of your application. 
Any frameworks or 3rd-party libraries that need to be accessible in the user's browser will be managed by bower.

Similarly to npm, bower tracks dependencies in a file called <strong>bower.json</strong>.

Running bower install will resolve, download, and install them.

0. Install bower globally via npm:

   <tt><strong>
   npm install -g bower
   </strong></tt>

### Project Bower Install

0. cd to the project's folder.

0. Install the project's bower components using bower:

   <tt><strong>
bower install
   </strong></tt>

0. Install http-server using npm:

   <tt><strong>
npm install -g http-server
   </strong></tt>

0. Fire up the server at default port 8080:

   <tt><strong>
http-server client/
   </strong></tt>


## Brew Node.js 

Brew places node file in its Cellar:

   <tt><strong>
   /usr/local/Cellar/node/0.10.35
   </strong></tt>

<!--

/Users/wilsonmar/.nvm/v0.11.14/bin/node


## UnInstall

You probably don't want to do this just yet right now, but just in case:

   <tt><strong>
rew rm node
   </strong></tt>

Uninstalling /usr/local/Cellar/node/0.10.35...

curl https://raw.githubusercontent.com/creationix/nvm/v0.22.0/install.sh | bash
reset
source /Users/wilsonmar/.bash_profile
nvm h
nvm -list 
nvm ls-remote
nvm install v0.11.14

   <tt><strong>
nvm use v0.11.14
nvm default v0.11.14
   </strong></tt>


   <tt><strong>
experess<br />
request
   </strong></tt>

   <tt><strong>
mkdir farmhack<br />
cd /farmhack<br />
npm install -g n # n refers to npm<br />
npm init # prompt create package.json
   </strong></tt>

# http://expressjs.com/ says:

   <tt><strong>
npm install -g express --save<br />
npm install -g request --save
   </strong></tt>

   <tt><strong>
touch index.js<br />
subl index.js
   </strong></tt>
-->

## Postman app #

Postman is a desktop app for interacting with a REST API server.

<a target="_blank" href="http://www.getpostman.com/">
getpostman.com</a>


<a name="CodeNode"></a>

## Code Node JavaScript

{% highlight JavaScript %}
var express = require('express');
var app = express();
app.get('/', function(res,req){
   res.json({
   message: 'hello world'
   });
});

app.listen(3000);{% endhighlight %}

<!--
## Alternative installations

{% highlight text %}
npm install nodemon -g # -g installs globally as system command.
nodemon index.js # watch for changes and kill server when needed
node index.js

ngrok.com to setup extern
sudo mv ~/Downloads/ngrok /usr/local/bin/ngrok
ngrok 3000
for pop-up
http://ngrok:3000{% endhighlight %}


{% highlight text %}
Tunnel Status                 online
Version                       1.7/1.7
Forwarding                    http://42d8c4de.ngrok.com -> 127.0.0.1:3000
Forwarding                    https://42d8c4de.ngrok.com -> 127.0.0.1:3000
Web Interface                 127.0.0.1:4040

# Conn                        0
Avg Conn Time                 0.00ms{% endhighlight %}



## Find file

Where is that file?

   <tt><strong>
sudo find / -name learnyounode
   </strong></tt>

   <tt><strong>
sudo find -name *vagrantfile
   </strong></tt>

https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Common-Issues.md

   <tt><strong>
sudo chown -R $(whoami) /usr/local
   </strong></tt>

https://github.com/Homebrew/homebrew/issues


<a id="Resourcez"></a>

## Resources

-->

## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
