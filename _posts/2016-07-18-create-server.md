---
layout: post
title: "Create server button"
excerpt: "Click a button on GitHub to birth a server"
tags: [python, apple, mac, setup]
comments: true
image: # pic-black-bkg-white-cloud_1920x1200
  feature: https://cloud.githubusercontent.com/assets/300046/15269257/8104a824-19b6-11e6-9c42-014bf608009a.jpg
  credit: Theme Bin
  creditlink: http://www.themebin.com/hd-wallpapers/wandering-clouds-hd-wallpaper/
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This tutorial describes the steps to create dev and beta server instances in Amazon, Microsoft, and Google
by just clicking an icon on GitHub.

The "magic" is supplied by 
a continuous integration and deployment platform (Shippable)
using Docker, Kubernetes, and other magic.


## App source in GitHub repo #

If you don't have application source project, clone one to your account.

0. Use an internet browser to navigate to<br />
   <a target="_blank" href="https://github.com/wilsonmar/shippable_node">
   <strong>https://github.com/wilsonmar/shippable_sample_node</strong></a><br />
   which was cloned from<br />
   <a target="_blank" href="https://github.com/shippableSamples/sample_node">
   https://github.com/shippableSamples/sample_node</a>

   Alternately, you can clone locally to a folder of your choice:

   <tt><strong>
   cd ~/gits<br />
   git clone https://github.com/wilsonmar/shippable_sample_node
   </strong></tt>

   This repo contains Python and Grunt coding to build a sample Node.js simple "hello-world" app.

0. On the GitHub site, click <strong>Fork</strong> to your account.

0. Open a new browser tab or window to Shippable's Dashboard at<br />
   <a target="_blank" href="https://app.shippable.com/subscriptions/">
   https://app.shippable.com/subscriptions</a>

   If you have an account at Shippable, you would see a menu.

   <amp-img width="403" height="218" alt="shippable-subscriptions-menu-403x218-c50.jpg"
   layout="responsive" 
   src="https://cloud.githubusercontent.com/assets/300046/16921725/e14c5cf8-4ccf-11e6-9d62-ed12cb322d76.jpg">
   </amp-img>
   <br /><br />

   Open an account if you don't.

0. On the Shippable subscriptions page,
   select a project list from your GitHub account and click <strong>Enable</strong>.


## Add the run button #

0. Get the code.

0. Paste the text in your GitHub repo. README.md.

0. Get an API key from Shippable.

0. Customize the code with your API.

## 

0. Now the next time you click on the button, a server is created based on your preferences.

