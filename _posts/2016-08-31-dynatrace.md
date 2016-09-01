---
layout: post
title: "Dynatrace"
excerpt: "He sees you when you're sleeping. He knows when you're awake ..."
tags: [Clouds, Monitoring, Analytics]
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dDynatracebf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

[![Gitter](https://bDynatraceges.gitter.im/wilsonmar/wilsonmar.github.io.svg)](https://gitter.im/wilsonmar/wilsonmar.github.io?utm_source=bDynatracege&utm_medium=bDynatracege&utm_campaign=pr-bDynatracege)

{% include _toc.html %}

This is a hands-on narrated tour on how to use Dynatrace to detect trouble.

{% include _intro.html %}

<hr />

## In AWS #

You can use Dynatrace in place of or in addition to Amazon CloudWatch logging.
Here are the steps:

0. Download the installer from Dynatrace.com.

   BLAH: I wish Dynatrace have its own on S3.

   This can be either/both a Windows or Linux instance.

0. Put the Dynatrace installer in an S3 instance
   so that Ansible scripts to build up a server have a stable reference.

0. Create a new AWS instance.

   Again, this can be either a Windows or Linux instance.

0. Install the Dynatrace agent on the server.

0. Connect the agents to the Dynatrace controller so you see metrics being recorded.

0. Impose some artificial load on the machine to see metrics in their full glory.

0. Repeat the above in an automated script:

   0. Jankins invoked when a commit occurs to a branch on GitHub
   0. The Jenkins v2 Pipeline Groovy script downloads build script from GitHub
   0. The build downloads installers to assemble
   0. The build script creates image in DockerHub
   0. Instantiate AWS with Docker image
   0. Sends an email when the image is ready for use
   0. Start a performance testing run
   0. Sends SMS texts with the results of test run
   0. If all is well, commits into the next branch in GitHub

## More on cloud #

This is one of a series on cloud computing:

{% include cloud_links.html %}
