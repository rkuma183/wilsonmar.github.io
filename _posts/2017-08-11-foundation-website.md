---
layout: post
title: "ZURB Foundation"
excerpt: "Generate a website using the flexible UI framework the top pros use"
tags: [UI, MacOS, setup]
image:
# foundation-form-1900x500-65699
  feature: https://user-images.githubusercontent.com/14143059/30937418-e98d386c-a393-11e7-8d17-4fa4c70e3a0b.jpg
  credit: Wilson Mar
  creditlink: https://user-images.githubusercontent.com/14143059/30937418-e98d386c-a393-11e7-8d17-4fa4c70e3a0b.jpg
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

As its website address shows, https://foundation.zurb.com, 
it's from Zurb, a web design services firm based in the Silicon Valley since 1998.

<a target="_blank" href="https://zurb.com/responsive">
Look at their showcase</a> of websites, web apps, and emails running on a WordPress backend.
Zurb's publicly named customers include Slack, Asana, Amazon, Disney, and eBay.

Their continuual work for clients with money is why Foundation can legitimately call itself "the most advanced responsive front-end framework in the world."

So if you aspire to be a world-class pro, get on the long path to earn a certification class/test for $500.

Skills development include their $99 design sketching class.

<a target="_blank" href="https://foundation.zurb.com/learn/responsive-reading">
Sign-up for their monthly newsletter</a> and Design Trends PDF on responsive design.

## Suite

Foundation is actually a family of responsive front-end frameworks that make it easy to design beautiful responsive experiences that look amazing on any device. Foundation is semantic, readable, flexible, and completely customizable.

* [Foundation for Sites](http://foundation.zurb.com/sites) (websites) consists of Node.js packages. The framework provides a XY Grid and coded UI components. It provides fine-grained control of font typography and forms. The ZURB Stack (ZURB template) uses Gulp to compresses JavaScripts, watches for file changes to rerun. 

   * Handlebars templates 
   * Bower modules
   * Panini
   <br />

* Foundation for web apps refers to the Apps Controller Using <strong>AngularJS</strong>.

* Foundation for Emails refers to the tool that creates HTML used to display beautifully formatted email bodies.


## Competitors

The lack of a cross-platform mobile + web app development approach is what may render it out of the running.

React + React Native

PWA

NativeScript


## Installation

0. Install the latest version of Foundation on any directory:

   <tt><strong>
   	npm install -g foundation-cli
   </strong></tt>

   The response at time of writing:

   <pre>
/usr/local/bin/foundation -> /usr/local/lib/node_modules/foundation-cli/bin/foundation.js
+ foundation-cli@2.2.3
added 376 packages in 37.966s
&nbsp;
   ╭─────────────────────────────────────╮
   │                                     │
   │   Update available 5.3.0 → 5.4.2    │
   │     Run npm i -g npm to update      │
   │                                     │
   ╰─────────────────────────────────────╯
   </pre>

0. Update if that's what it says:

   <tt><strong>
   npm i -g npm
   </strong></tt>

   The response repeats the update message, which you can now ignore:

   <pre>
/usr/local/bin/npm -> /usr/local/lib/node_modules/npm/bin/npm-cli.js
/usr/local/bin/npx -> /usr/local/lib/node_modules/npm/bin/npx-cli.js
+ npm@5.4.2
added 21 packages, removed 22 packages and updated 19 packages in 16.456s
&nbsp;
   ╭─────────────────────────────────────╮
   │                                     │
   │   Update available 5.3.0 → 5.4.2    │
   │     Run npm i -g npm to update      │
   │                                     │
   ╰─────────────────────────────────────╯
   </pre>


   ### Create repo in GitHub

   The following steps require switching between GitHub and Terminal, by pressing command+Tab until the icon for the app you want is highlighted.

0. On an internet browser on <a target="_blank" href="https://www.github.com/">GitHub.com</a>, create an account if you don't already have one.

0. Switch to a Terminal to create a public and private key:

   <tt><strong>ssh-keygen
   </strong></tt>

   The response:

   <pre>
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/hotwilson/.ssh/id_rsa): 
   </pre>

0. Press Enter to accept defaults until you see

   <pre>
Your public key has been saved in /Users/hotwilson/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:lsjVHl3cuL/xRvbFzyWtSaFxVI59oDNyAuxicJeWqOs hotwilson@Wilsons-MacBook-Pro.local
The key's randomart image is:
+---[RSA 2048]----+
|       o.o   .o+.|
|    . o *o . o+=.|
|     + +. = *...+|
|    ..oo.o =.o+ .|
|     oo.S .  + = |
|    .  .    . o.O|
|   .         . BO|
|    E         o.*|
|               . |
+----[SHA256]-----+
   </pre>   

   PROTIP: The "hotwilson" shown above would be substituted with your own account name. But it doesn't matter because it's the certificates generated that are used for authentication.

0. Get the public key in the .ssh folder into your Mac's clipboard:

   <tt><strong>cat ~/.ssh/id_rsa.pub | pbcopy
   </strong></tt>

0. Press command+Tab to switch back to the internet browser showing GitHub.
0. Click the icon for your account at the upper-right of the screen to select <strong>Settings</strong>.
0. Click on <strong>SSH and GPG keys</strong>.
0. Click on <strong>New SSH key</strong> green button.
0. Click inside the field labeled <strong>Key</strong> so its border turns blue.

   PROTIP: You can leave the Label field blank.

0. Click on <strong>Add SSH key</strong> green button.

   You can now upload to any repo for your GitHub account.


   ### Create repo on GitHub

0. Click the "+" icon to create a new repository.
0. Click inside the field labeled <strong>Repository name</strong> so its border turns blue.
0. Type in the name of your new repository. For example:

   <pre>website1</pre>

   PROTIP: Dashes between words are interpreted as different words. 
   Underlines are interpreted as a single (hypenated) word.

   PROTIP: Add a number to the name makes the word searcheable with less duplicates.

0. PROTIP: Specify your GitHub account name in the container folder path (substituting "hotwilson"):

   <tt><strong>mkdir ~/gits/hotwilson
   </strong></tt>

   PROTIP: Instead of `gits`, some use `dev` to house all development work, separate from other folders such as "Desktop" and "Document" under your MacOS user account folder.

0. Click <strong>Initialie this repository with a README</strong>.

   NOTE: The Description and .gitignore and license files can be added later.

0. Click on <strong>Create repository</strong> green button.

   This creates the initial commit and enables you to skip needing to later type in a long "git remote add origin" command.


   ### Get website local

0. Switch to a Terminal.
0. Navigate into the containing folder for Foundation to build a new directory, such as:

   <tt><strong>cd ~/gits/hotwilson
   </strong></tt>

0. Create a folder containing your repo in GitHub (subsituting "hotwilson/website1" with your own account and repo name):

   <tt><strong>
   git clone https://github.com/hotwilson/website1
   </strong></tt>

0. Create a new site folder on the path above using the CLI command:

   <tt><strong>
   foundation new \-\-framework sites \-\-template zurb
   </strong></tt>

   https://github.com/zurb/foundation-zurb-template 

0. If you didn't specify the parameters, you will be prompted for them: Click the keyboard cursor to select.

   <pre>
? What's the project called? (no spaces) <strong>website1</strong>
? Which template would you like to use? ZURB Template: includes Handlebars templates and Sass/JS compilers
&nbsp;
            .
           /|     ,
      , /|/  \/| /|       Thanks for using ZURB Foundation for Sites!
     /|/       |/ |       -------------------------------------------
 |___|            |___|   Let's set up a new project.
 \___|  ^^   ^^   |___/   It shouldn't take more than a minute.
     | -[O]--[O]- |
     |    ___,    |
     |    ...     |
      \__________/
&nbsp;
Downloading the project template...
Done downloading!
   </pre>

0. Wait for the website base to be generated, culminating in:

   <pre>
You're all set!
&nbsp;
 ✓ New project folder created.
 ✓ Node modules installed.
 ✓ Bower components installed.
&nbsp;
Now run foundation watch while inside the folder created.
   </pre>

0. If you want to start over:

   <tt><strong>rm -rf 
   </strong></tt>

0. Open in an text editor that shows the folders of the name specified:

   <tt><strong>
   atom website1
   </strong></tt>

   Among the 861.6 MB created:

   * `.babelrc` defines Babel for ES6 JavaScript
   * `.bowerrc` defines Bower modules
   * `.DS_Store` is created by MacOS to be ignored
   * `.gitignore` is for GitHub
   * `config.yml` 
   * `gulpfile.babel.js` is used by the Gulp task running when `npm start` is run
   * `package.json` is for NPM to know what dependencies to download
   * `readme.md` is for people to read.
   <br /><br />

0. Install dependencies:

   <tt><strong>npm install
   </strong></tt>

   The response at time of writing:

   <pre>
npm notice created a lockfile as package-lock.json. You should commit this file.
up to date in 11.122s
   </pre>   

0. As the prompt advises:

   <tt><strong>git init && git add . && git commit -m"Initial"
   </strong></tt>

   PROTIP: Upload to GitHub as well to avoid going through the above again.

   <a name="gitignore"></a>

   ### .gitignore

   Entries in the .gitignore file keeps the node_modules and dist folders from being uploaded.

   NOTE: From here on you can work in a cave with no internet. But only edit what's under the `src` folder to make it your own.

   PROTIP: The folder `dist` generated should not be edited.


0. Start a web server (which calls Gulp task runner):

   <tt><strong>npm start
   </strong></tt>

   <pre>
[Browsersync] Access URLs:
 ----------------------------------
       Local: http://localhost:8000
    External: http://10.0.0.4:8000
 ----------------------------------
          UI: http://localhost:3001
 UI External: http://10.0.0.4:3001
 ----------------------------------
[Browsersync] Serving files from: dist
   </pre>

0. Switch to an internet browser (Chrome or Firefox) to visit the "Welcome" page generated:

   <pre><strong>http://localhost:8000
   </strong></pre>


   ### Watch

0. Open another Terminal to the folder (in a different color) and cd to your working folder.


0. Establish a watch on the pwd to watch for changes to files and invoke Gulp:

   <tt><strong>
   foundation watch
   </strong></tt>

   ### Build for Production

0. Close the localhost website by pressing <strong>control+C</strong>.

0. Create compressed, production-ready assets, run 

   <tt><strong>npm run build
   </strong></tt>

   The response:

   <pre>
> foundation-zurb-template@1.0.0 build /Users/hotwilson/gits/hotwilson/foundation/website1
> gulp build --production
&nbsp;
[12:38:46] Requiring external module babel-register
[12:38:52] Using gulpfile ~/gits/hotwilson/foundation/website1/gulpfile.babel.js
[12:38:52] Starting 'build'...
[12:38:52] Starting 'clean'...
[12:38:52] Finished 'clean' after 5.3 ms
[12:38:52] Starting 'pages'...
[12:38:52] Starting 'sass'...
[12:38:52] Starting 'javascript'...
[12:38:52] Starting 'images'...
[12:38:52] Starting 'copy'...
[12:38:53] gulp-imagemin: Minified 0 images
[12:38:53] Finished 'images' after 1.49 s
[12:38:53] Finished 'pages' after 1.59 s
[12:38:53] Finished 'copy' after 1.59 s
[12:38:56] Finished 'sass' after 4.19 s
[12:38:59] Version: webpack 2.7.0
 Asset    Size  Chunks                    Chunk Names
app.js  678 kB       0  [emitted]  [big]  app
[12:38:59] Finished 'javascript' after 7.71 s
[12:38:59] Starting 'styleGuide'...
[12:38:59] Finished 'styleGuide' after 32 ms
[12:38:59] Finished 'build' after 7.75 s
   </pre>   


   <a name="Upload2GitHub"></a>

   ### Upload

   <a target="_blank" href="https://zurb.com/university/lessons/zero-to-website-guide-br-part-6-br-deploying-your-site">
   VIDEO: Deploying Your Site to GitHub</a>

0. Send your changes to GitHub:

   <tt><strong>
   git add . && git commit -m"update" && git push
   </strong></tt>




## Videos

<a target="_blank" href="https://www.youtube.com/channel/UC01kRrdHtuWrzerp4BcAsYg">
Videos on Zurb's YouTube channel</a> 

<a target="_blank" href="https://zurb.com/university/foundation-intro">
Zurb's $299 Foundation intro class</a>


### Flexbox for XY Grid

https://zurb.com/university/lessons/learn-the-flexbox-based-powerhouse-xy-grid


<a target="_blank" href="https://webdesign.tutsplus.com/series/learn-foundation--cms-1227">Tuts+ has a course</a>

<a target="_blank" href="https://app.pluralsight.com/library/courses/building-websites-foundation-6/table-of-contents">
Building Websites with Foundation 6 (for sites)</a> [1:42] 23 May 2017
by Gary Simon (<a target="_blank" href="https://www.garysimon.com/">garysimon.com</a>)
shows use of Node v6.10.0.



