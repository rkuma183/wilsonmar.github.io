---
layout: post
title: "GitHub Hooks"
excerpt: "Let's all hold hands and sing songs"
tags: [GitHub, Jenkins, setup]
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

[![Gitter](https://badges.gitter.im/wilsonmar/wilsonmar.github.io.svg)](https://gitter.im/wilsonmar/wilsonmar.github.io?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

{% include _toc.html %}

This article shows you how to install and configure 
GitHub hooks into Jenkins version 2 for Continuous Delivery (CD) as well as Continuouse Integration (CI).

{% include _intro.html %}

## Receivers first #

We would like Jenkins to attempt a new build when a change is committed in GitHub.com or pushed to it from Git.

   The alternative to this is polling on an interval,
   which can be a little bit inefficient if nothing was changed.
   However, a regular schedule is useful when people work strict hours.

   ### Begin from Jenkins #

0. In Manage Jenkins | Manage Plugins, Available tab, find "GitHub plugin" at<br />
   <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Github+Plugin/">
   https://wiki.jenkins-ci.org/display/JENKINS/Github+Plugin</a>
0. Return to the Jenkins Dashboard.
0. Create a new item or click an existing build job.
0. Select Configure from the menu.
0. In v2, under Build Triggers, Check "GitHub project".
   
   In v1, scroll to "Scource Code Management". Check "Git".

0. Specify the Project URL.
0. Check "Build when a change is pushed to GitHub".



## Set up webhook on GitHub #

0. Sign into the repository. You won't see the "Settings" tab unless you have permissions.
0. Click on the <strong>Settings</strong> tab.
0. Click on Webhooks & services from the left menu.
0. Click on Add webhook on the upper right.

   Webhooks allow external services to be notified when certain events happen within your repository. When the specified events happen, we’ll send a POST request to each of the URLs you provide. 

   <a target="_blank" href="https://developer.github.com/webhooks/creating/">
   https://developer.github.com/webhooks/creating</a><br />
   explains each field:

0. In Payload URL goes a URL such as "http://localhost:4567/payload" or

   <tt><strong>
   http://138.68.1.138:8080/github-webhook/
   </strong></tt>

   CAUTION: Use http://

0. For Content type, "application/json" sends a HTTP POST. 
   Older form data is sent with "application/x-www-form-urlencoded".
0. For secret, 
0. Select "Just the push event" for "Which events would you like to trigger this webhook?"
   or too much will be sent.

   The technical name of all events are described at<br />
   https://developer.github.com/webhooks/#events

0. Click Add Webhook.

   GitHub sends a Ping<br />
   https://developer.github.com/webhooks/#ping-event.

0. There is a check box near the bottom of the authentication section labeled 
   "Prevent Cross Site Request Forgery exploits"
   that needs to be unchecked in order for this to work.

References:

   * https://help.github.com/articles/about-webhooks/
   * https://thepracticalsysadmin.com/setting-up-a-github-webhook-in-jenkins/
   * http://fourkitchens.com/blog/article/trigger-jenkins-builds-pushing-github

Payload sizes need to be monitored because GitHub caps them at 5 MB each. 
