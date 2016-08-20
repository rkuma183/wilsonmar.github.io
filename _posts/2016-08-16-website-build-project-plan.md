---
layout: post
title: "Website build project plan"
excerpt: "Here's how we build it, step-by-step"
tags: [website]
image:
# drawing blue messaging icons flow 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/15797012/6c3aa21a-29c7-11e6-8fbd-ef15a86df580.jpg
  credit: IT Management
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

Here are the sequence of specific steps to build a website -
a <a target="_blank" href="https://jamstack.org/">JAM stack</a> 
-- the "ideal" way of building websites and apps that are fast, secure, and simple to work with. 
JAM stands for JavaScript, APIs, and Markup - the components of software
leveraging the latest advances in computer science.
Content for the site is written in markup language stored on GitHub.com.

JavaScript on the site makes calls to API (Application Programming Interfaces) web services in the cloud
to manage subscription forms and email campaigns.

   ## Accounts

0. Setup email account
0. Setup Twitter account using email

0. Setup Github organization and github.io repo holding website
0. Setup Github account for each contributor
0. In Github grant permission to each contributor


   ## Development environment

   Out of scope:

   * Install git (use online GitHub)
   * Install repo viewer


   ### Site Design

0. Look through <a href="#WebsitesLiked">other websites</a> to identify what's to like
0. Pre-defined theme?
0. Scheme of color, fonts, layout
0. Theme in GitHub

   ### Site Logo

0. Custom icon (favico.ico/png) appearing on browser tabs
0. Apple Touch images mobile
0. Windows 10 desktop tile images

   ### Navigation

0. Top of page menu text (sections)
0. FontAwesome icon for each section

   Out of scope:

   * Visual site map
   * Breadcrumb trail

   ## Social #

0. Facebook account setup in _config.yml
0. Twitter setup in _config.yml
0. Position social buttons (<a target="_blank" href="http://www.jqueryscript.net/social-media/jQuery-Plugin-For-Floating-Social-Share-Contact-Sidebar.html">always visible on left side of page</a>)

   Out of scope:

   * GitHub
   * Google
   * LinkedIn
   * Instagram

   * Visitor comments using Disqus


   ## Subscription capture #

0. Setup AWS account for EmailOctopus
0. Setup EmailOctopus account
0. Setup AWS permissions for EmailOctopus
0. Position subscription form (always visible on right side of page)

0. Error messages in form
0. Pop-up subscription offer form
0. CAPTCHA in form

0. Commenting buttons to create a post on Twitter, Facebook, Google+, etc.


   ## Content 

0. Author statement text
0. Author photo
0. Author audio/video

0. Contact text
0. Contact photo
0. Contact audio/video

0. Exhibits text
0. Exhibits photo
0. Exhibits audio/video

0. Gallery index photos (3) cropped, compressed, positioned
0. Gallery index page with links
0. Gallery autorotator
0. Gallery spreadsheet of photos


   ## Photo processing 

0. Extract from previous site a .csv file listing attributes of each picture file. DONE 2 hrs.

   NOTE: The spreadsheet contains one line for each work:

   - _Category of work (Acrylics, Watercolor, MixedMedia)
   - Full sized file name
   - Width & height of picture

   - Thumbnail file name (with path assumed)
   - Width & height of thumbnail

   - _Year of creation (when done)
   - _Size of file (KB)
   - _Media (C)
   - _Width of actual piece
   - _Height of actual piece

   - _Note = comments about the picture (This makes a huge difference)
   - _<a href="#Tags">Tags</a> describe the work (for use in mouse-over and publicity)
   <br /><br />

0. Correct typos from previous site.
0. DONE - Sample from the .csv file. [2 hrs]

0. Parse .csv file to generate .md files. 
   <a target="_blank" href="http://vmassuchetto.github.io/2013/08/08/python-script-to-automate-jekyll-post-creation/">
   A Python program?</a> 


   To do on each picture:

0. <a target="_blank" href="http://superuser.com/questions/925068/script-to-get-images-in-folder-with-dimensions-printed-to-a-txt-file">
   Identify width, height, size of each picture file</a> [4 hrs] (for 80 works)

0. Comments about the creation of each. This helps a lot to increase sales.

0. Hash tag each. This helps a lot to increase interest.

   <a name="Tags"></a>

   * color: #blue #green #BlackAndWhite
   * subject: #vinyard #bridge #lake #river #portrait
   * objects in subject: #tractor #grapes #flowers #fruit #trees
   * social grouping: #rap #moms #teen #farmer
   * subject location: #nyc #brooklyn #italy #amalfi
   * artist location: #seattle #northwest
   * art media: #graffiti
   * art medium: #spraycan #acrylic #watercolor #graphite
   * art tool brand: #nikon #nike 
   * adjectives: #beautiful #amazing #fantastic #sunny #bright
   * emotion: #peaceful #sad #happy #thrilled #exhilirated #strong
   <br /><br />

0. Size it in 3 different types of screens (mobile, tablet, desktop)
0. Crop picture for Instagram squares (use instasize app, Gramblr)

0. Compress to make smaller
0. Visible Watermark 
0. Invisible Watermark 
0. Put the file in a "CDN" around on the web.


   ## SEO #

0. Google Analytics JavaScript
0. Google search ownership file
0. Bing search site ownership file

   Generated by Jekyll:

   * Site XML file for Google Search to discover


   ## Features

0. Add search field (and custom response page)

0. <a target="_blank" href="https://developers.google.com/maps/documentation/javascript/tutorial">
   Get Google Maps API key</a>
0. Map in Exhibits page <a target="_blank" href="http://robinlovelace.net/software/2014/03/05/webmap-test.html">
   using Google Maps or other API</a>


   Out of scope:

   * Infinte scrolling
   * Lookup location based on IP
   * Confirm identity simply, such as clicking a pre-agreed image
   * Time-appropriate greeting based on visitor's local time zone
   * Personalized greeting based on personalization data stored in browser during previous session
   * Store history of browser version, OS, etc.
   * Cookie policy verification (for EU visitors)
   * Display most popular post on anonymous landing


   ## Monitization #

   Out of scope:

   * Google ads
   * Shop (screen savers, mugs, t-shirts, etc.)


   ## Performance #

0. Setup Gemfile
0. Setup Grunt/Gulp task runners
0. Minify HTML, CSS, and JavaScript files

   Done by Jekyll:

   * Asychronous update of a section rather than entire form (submit)
   * [Google AMP coding](/accelerated-mobile-pages/)


   ## Campaign #

0. Load emails
0. Announce new site
0. Launch party

0. Item of the week/month


<a name="WebsitesLiked"></a>

## Websites Liked #

* http://www.currier.org/
* http://sgnhs.org/
* http://www.wellesley.edu/DavisMuseum/davismenu.html
* https://adelmanfineart.com/
* http://www.irisscottfineart.com/


## Website advice specifically to artists #

* http://theabundantartist.com/15-ways-to-sell-your-art-online/


## TODO: 

* Make this page into a form where people can check what they want, save it, send it to others, etc.


## More on front-end software development #

This is one of several topics:

{% include front-end_links.html %}
