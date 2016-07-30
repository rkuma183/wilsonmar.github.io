---
layout: post
title: "Jenkins Setup"
excerpt: "Meet your robot butler"
tags: [Jenkins, setup]
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This tutorial aims to succintly present
<strong>step-by-step</strong> instructions 
to setup Jenkins on Mac OSX and CentOS.

{% include _intro.html %}

Jenkins invokes other programs (maven scripts, build, Selenium, JMeter, etc.)
for building software, conducting tests, etc.

Jenkins can invoke jobs on a schedule, 
but it's called a "continuos integration" (CI) tool because it can
invoke jobs when a <strong>trigger</strong> is fired.

Jenkins can orchestrate a chain of <strong>tasks</strong> 
that kicks off each step in sequence based on the ending status of the previous step,
such as to ensure that components already unit-tested can be integrated together.

For scaling, several slaves can be setup to run simultaneously.


<a id="Alternatives"></a>

## Alternatives to Jenkins #

<amp-img width="530" height="246" alt="jenkins alternatives" src="https://cloud.githubusercontent.com/assets/300046/12533728/df265ae4-c1ee-11e5-9a0b-bbc380a2d20f.png"></amp-img>

   * [My list of CI tools](/devops-choices/#CITaskRunner/)

Jenkins began in 2010 as a fork of Oracle Hudson into Github from java.net 
after its acquisition by Oracle's purchase of Sun.
See <a target="_blank" href="http://jenkins-ci.org/content/whos-driving-thing">*</a>
and <a target="_blank" href="https://isotope11.com/blog/continuous-deployment-at-isotope11-an-update">*</a>


<a id="Prerequisites"></a>

## Prerequisites: Java #

Jenkins is open-source software written in Java.
So you'll need to first install Java 1.5 or higher.

If you download Jenkins, it's a <strong>jenkins.war</strong> file.

It contains a Tomcat web server Java runs under.


<a id="Installation"></a>

## Installation options #

   * <a href="#DigitalOcean">DigitalOcean</a> Saas
   * <a href="#CloudbeesInstall">Cloudbees</a> Saas
   * <a href="#CodeDeploy">AWS CodeDeploy service</a> SaaS
   * Layershift Jelastic PaaS 

   * <a href="#AmazonInstall">Amazon EC2 instance you setup</a>
     with Ansible script using Docker image
   * <a href="#Install_Mac">Mac</a> locally
   * <a href="#Choco_Windows">Windows</a> locally using Chocolatey
   * <a href="#Install_Windows">Windows</a> locally by download
   * <a href="#Install_Linux">Linux</a> locally

<hr />

<a id="DigitalOcean"></a>

## Digital Ocean SaaS #

0. Sign up for an account at<br />
   <a targte="_blank" href="https://digitalocean.com/">
   https://www.digitalocean.com</a>

0. Instantiate a CentOS droplet (instance)
   <a target="_blan" href="https://www.digitalocean.com/community/tutorials/how-to-set-up-jenkins-for-continuous-development-integration-on-centos-7">
   per this doc</a> (Centos with 512 MB, SFO 2).

0. Click on the name of the droplet listed (such as "centos-512mb-sfo2-01").

0. Click Access, then "Reset Root Password".

0. Copy the password and paste it to a safe place.

0. Click on the IP address.

0. Login:

   <tt><strong>
   ssh root@138.68.1.138
   </strong></tt>

   Alternately, for Windows, 
   <a targt="_blank" href="https://mediatemple.net/community/products/dv/204404604/using-ssh-in-putty-">use Putty</a>.

   <pre>
The authenticity of host '138.68.1.138 (138.68.1.138)' can't be established.
ECDSA key fingerprint is SHA256:vwQzKkAHmgwCouPC8wY3qEimOMj+etG/35GMRQKrD28.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '138.68.1.138' (ECDSA) to the list of known hosts.
root@138.68.1.138's password:
   </pre>

0. Type in the password you specified to use DO:

   <pre>
You are required to change your password immediately (root enforced)
Last failed login: Wed Jul 27 19:14:36 UTC 2016 from 40.113.109.51 on ssh:notty
There were 4544 failed login attempts since the last successful login.
Last login: Wed Jul 20 20:00:36 2016
Changing password for root.
(current) UNIX password:
New password:
Retype new password:
   </pre>

0. Type in another made-up (strong) password. Twice.

   Copy and paste these steps to run all steps at once:


   If you want to add users 
   <a target="_blank" href="https://www.digitalocean.com/community/tutorials/initial-server-setup-with-centos-7">
   see this</a>.

   The shell script to do the manual steps below automatically:

   <pre><strong>
# Install Java:
sudo yum -y install java
# Verify java install:
java -version
# Download Jenkins from the Red Hat repo:
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
# Import the verification key using the package manager RPM:
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
# Install Jenkins by running:
sudo yum install jenkins
# Input Y
# Start Jenkins as a service:
sudo systemctl start jenkins.service
# Check the status of the service:
sudo systemctl status jenkins.service
# TODO: Add IP address of server:
# Open browser to http://138.68.1.138:8080
   </strong></pre>

   There are two basic ways to install Jenkins on CentOS: 
   through a repository, or repo, and via a Java WAR file. 
   Installing from a repo is the preferred method.

0. Install latest version of Java (JDK which Jenkins uses):

   <tt><strong>
   sudo yum -y install java
   </strong></tt>

   The response:

   <pre>
Failed to set locale, defaulting to C
Loaded plugins: fastestmirror
base                                                     | 3.6 kB     00:00
extras                                                   | 3.4 kB     00:00
updates                                                  | 3.4 kB     00:00
updates/7/x86_64/primary_db                                | 5.7 MB   00:00
Loading mirror speeds from cached hostfile
 * base: mirror.n5tech.com
 * extras: mirror.pac-12.org
 * updates: mirror.math.princeton.edu
Resolving Dependencies
--> Running transaction check
---> Package java-1.8.0-openjdk.x86_64 1:1.8.0.101-3.b13.el7_2 will be installed
--> Processing Dependency: java-1.8.0-openjdk-headless = 1:1.8.0.101-3.b13.el7_2 for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: xorg-x11-fonts-Type1 for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libpng15.so.15(PNG15_0)(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libjvm.so(SUNWprivate_1.1)(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libjli.so(SUNWprivate_1.1)(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libjava.so(SUNWprivate_1.1)(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libasound.so.2(ALSA_0.9.0rc4)(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libasound.so.2(ALSA_0.9)(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: fontconfig for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libpng15.so.15()(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libjvm.so()(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libjli.so()(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libjava.so()(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libgif.so.4()(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libawt.so()(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libasound.so.2()(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libXtst.so.6()(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libXrender.so.1()(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libXi.so.6()(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libXext.so.6()(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: libX11.so.6()(64bit) for package: 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64
--> Running transaction check
---> Package alsa-lib.x86_64 0:1.0.28-2.el7 will be installed
---> Package fontconfig.x86_64 0:2.10.95-7.el7 will be installed
--> Processing Dependency: fontpackages-filesystem for package: fontconfig-2.10.95-7.el7.x86_64
---> Package giflib.x86_64 0:4.1.6-9.el7 will be installed
--> Processing Dependency: libSM.so.6()(64bit) for package: giflib-4.1.6-9.el7.x86_64
--> Processing Dependency: libICE.so.6()(64bit) for package: giflib-4.1.6-9.el7.x86_64
---> Package java-1.8.0-openjdk-headless.x86_64 1:1.8.0.101-3.b13.el7_2 will be installed
--> Processing Dependency: tzdata-java >= 2015d for package: 1:java-1.8.0-openjdk-headless-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: lksctp-tools for package: 1:java-1.8.0-openjdk-headless-1.8.0.101-3.b13.el7_2.x86_64
--> Processing Dependency: jpackage-utils for package: 1:java-1.8.0-openjdk-headless-1.8.0.101-3.b13.el7_2.x86_64
---> Package libX11.x86_64 0:1.6.3-2.el7 will be installed
--> Processing Dependency: libX11-common >= 1.6.3-2.el7 for package: libX11-1.6.3-2.el7.x86_64
--> Processing Dependency: libxcb.so.1()(64bit) for package: libX11-1.6.3-2.el7.x86_64
---> Package libXext.x86_64 0:1.3.3-3.el7 will be installed
---> Package libXi.x86_64 0:1.7.4-2.el7 will be installed
---> Package libXrender.x86_64 0:0.9.8-2.1.el7 will be installed
---> Package libXtst.x86_64 0:1.2.2-2.1.el7 will be installed
---> Package libpng.x86_64 2:1.5.13-7.el7_2 will be installed
---> Package xorg-x11-fonts-Type1.noarch 0:7.5-9.el7 will be installed
--> Processing Dependency: ttmkfdir for package: xorg-x11-fonts-Type1-7.5-9.el7.noarch
--> Processing Dependency: ttmkfdir for package: xorg-x11-fonts-Type1-7.5-9.el7.noarch
--> Processing Dependency: mkfontdir for package: xorg-x11-fonts-Type1-7.5-9.el7.noarch
--> Processing Dependency: mkfontdir for package: xorg-x11-fonts-Type1-7.5-9.el7.noarch
--> Running transaction check
---> Package fontpackages-filesystem.noarch 0:1.44-8.el7 will be installed
---> Package javapackages-tools.noarch 0:3.4.1-11.el7 will be installed
--> Processing Dependency: python-javapackages = 3.4.1-11.el7 for package: javapackages-tools-3.4.1-11.el7.noarch
--> Processing Dependency: libxslt for package: javapackages-tools-3.4.1-11.el7.noarch
---> Package libICE.x86_64 0:1.0.9-2.el7 will be installed
---> Package libSM.x86_64 0:1.2.2-2.el7 will be installed
---> Package libX11-common.noarch 0:1.6.3-2.el7 will be installed
---> Package libxcb.x86_64 0:1.11-4.el7 will be installed
--> Processing Dependency: libXau.so.6()(64bit) for package: libxcb-1.11-4.el7.x86_64
---> Package lksctp-tools.x86_64 0:1.0.13-3.el7 will be installed
---> Package ttmkfdir.x86_64 0:3.0.9-42.el7 will be installed
---> Package tzdata-java.noarch 0:2016f-1.el7 will be installed
---> Package xorg-x11-font-utils.x86_64 1:7.5-20.el7 will be installed
--> Processing Dependency: libfontenc.so.1()(64bit) for package: 1:xorg-x11-font-utils-7.5-20.el7.x86_64
--> Processing Dependency: libXfont.so.1()(64bit) for package: 1:xorg-x11-font-utils-7.5-20.el7.x86_64
--> Running transaction check
---> Package libXau.x86_64 0:1.0.8-2.1.el7 will be installed
---> Package libXfont.x86_64 0:1.5.1-2.el7 will be installed
---> Package libfontenc.x86_64 0:1.1.2-3.el7 will be installed
---> Package libxslt.x86_64 0:1.1.28-5.el7 will be installed
---> Package python-javapackages.noarch 0:3.4.1-11.el7 will be installed
--> Processing Dependency: python-lxml for package: python-javapackages-3.4.1-11.el7.noarch
--> Running transaction check
---> Package python-lxml.x86_64 0:3.2.1-4.el7 will be installed
--> Finished Dependency Resolution
&nbsp;
Dependencies Resolved
&nbsp;
================================================================================
 Package                      Arch    Version                    Repository
                                                                           Size
================================================================================
Installing:
 java-1.8.0-openjdk           x86_64  1:1.8.0.101-3.b13.el7_2    updates  221 k
Installing for dependencies:
 alsa-lib                     x86_64  1.0.28-2.el7               base     391 k
 fontconfig                   x86_64  2.10.95-7.el7              base     228 k
 fontpackages-filesystem      noarch  1.44-8.el7                 base     9.9 k
 giflib                       x86_64  4.1.6-9.el7                base      40 k
 java-1.8.0-openjdk-headless  x86_64  1:1.8.0.101-3.b13.el7_2    updates   31 M
 javapackages-tools           noarch  3.4.1-11.el7               base      73 k
 libICE                       x86_64  1.0.9-2.el7                base      65 k
 libSM                        x86_64  1.2.2-2.el7                base      39 k
 libX11                       x86_64  1.6.3-2.el7                base     605 k
 libX11-common                noarch  1.6.3-2.el7                base     162 k
 libXau                       x86_64  1.0.8-2.1.el7              base      29 k
 libXext                      x86_64  1.3.3-3.el7                base      39 k
 libXfont                     x86_64  1.5.1-2.el7                base     150 k
 libXi                        x86_64  1.7.4-2.el7                base      40 k
 libXrender                   x86_64  0.9.8-2.1.el7              base      25 k
 libXtst                      x86_64  1.2.2-2.1.el7              base      20 k
 libfontenc                   x86_64  1.1.2-3.el7                base      30 k
 libpng                       x86_64  2:1.5.13-7.el7_2           updates  213 k
 libxcb                       x86_64  1.11-4.el7                 base     189 k
 libxslt                      x86_64  1.1.28-5.el7               base     242 k
 lksctp-tools                 x86_64  1.0.13-3.el7               base      87 k
 python-javapackages          noarch  3.4.1-11.el7               base      31 k
 python-lxml                  x86_64  3.2.1-4.el7                base     758 k
 ttmkfdir                     x86_64  3.0.9-42.el7               base      48 k
 tzdata-java                  noarch  2016f-1.el7                updates  179 k
 xorg-x11-font-utils          x86_64  1:7.5-20.el7               base      87 k
 xorg-x11-fonts-Type1         noarch  7.5-9.el7                  base     521 k
&nbsp;
Transaction Summary
================================================================================
Install  1 Package (+27 Dependent packages)
&nbsp;
Total download size: 36 M
Installed size: 114 M
Downloading packages:
(1/28): fontconfig-2.10.95-7.el7.x86_64.rpm                | 228 kB   00:01
(2/28): fontpackages-filesystem-1.44-8.el7.noarch.rpm      | 9.9 kB   00:00
(3/28): alsa-lib-1.0.28-2.el7.x86_64.rpm                   | 391 kB   00:01
(4/28): giflib-4.1.6-9.el7.x86_64.rpm                      |  40 kB   00:00
(5/28): libICE-1.0.9-2.el7.x86_64.rpm                      |  65 kB   00:00
(6/28): libX11-1.6.3-2.el7.x86_64.rpm                      | 605 kB   00:00
(7/28): java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64.rp | 221 kB   00:00
(8/28): libX11-common-1.6.3-2.el7.noarch.rpm               | 162 kB   00:00
(9/28): javapackages-tools-3.4.1-11.el7.noarch.rpm         |  73 kB   00:00
(10/28): libXext-1.3.3-3.el7.x86_64.rpm                    |  39 kB   00:00
(11/28): libXi-1.7.4-2.el7.x86_64.rpm                      |  40 kB   00:00
(12/28): libXau-1.0.8-2.1.el7.x86_64.rpm                   |  29 kB   00:00
(13/28): libXrender-0.9.8-2.1.el7.x86_64.rpm               |  25 kB   00:00
(14/28): libfontenc-1.1.2-3.el7.x86_64.rpm                 |  30 kB   00:00
(15/28): libSM-1.2.2-2.el7.x86_64.rpm                      |  39 kB   00:00
(16/28): libXtst-1.2.2-2.1.el7.x86_64.rpm                  |  20 kB   00:00
(17/28): libxcb-1.11-4.el7.x86_64.rpm                      | 189 kB   00:00
(18/28): lksctp-tools-1.0.13-3.el7.x86_64.rpm              |  87 kB   00:00
(19/28): libXfont-1.5.1-2.el7.x86_64.rpm                   | 150 kB   00:00
(20/28): python-javapackages-3.4.1-11.el7.noarch.rpm       |  31 kB   00:00
(21/28): python-lxml-3.2.1-4.el7.x86_64.rpm                | 758 kB   00:00
(22/28): ttmkfdir-3.0.9-42.el7.x86_64.rpm                  |  48 kB   00:00
(23/28): libpng-1.5.13-7.el7_2.x86_64.rpm                  | 213 kB   00:00
(24/28): xorg-x11-font-utils-7.5-20.el7.x86_64.rpm         |  87 kB   00:00
(25/28): xorg-x11-fonts-Type1-7.5-9.el7.noarch.rpm         | 521 kB   00:00
(26/28): libxslt-1.1.28-5.el7.x86_64.rpm                   | 242 kB   00:00
(27/28): tzdata-java-2016f-1.el7.noarch.rpm                | 179 kB   00:00
(28/28): java-1.8.0-openjdk-headless-1.8.0.101-3.b13.el7_2 |  31 MB   00:02
--------------------------------------------------------------------------------
Total                                              9.0 MB/s |  36 MB  00:03
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : libfontenc-1.1.2-3.el7.x86_64                               1/28
  Installing : libICE-1.0.9-2.el7.x86_64                                   2/28
  Installing : libxslt-1.1.28-5.el7.x86_64                                 3/28
  Installing : python-lxml-3.2.1-4.el7.x86_64                              4/28
  Installing : python-javapackages-3.4.1-11.el7.noarch                     5/28
  Installing : javapackages-tools-3.4.1-11.el7.noarch                      6/28
  Installing : libSM-1.2.2-2.el7.x86_64                                    7/28
  Installing : libXfont-1.5.1-2.el7.x86_64                                 8/28
  Installing : 1:xorg-x11-font-utils-7.5-20.el7.x86_64                     9/28
  Installing : lksctp-tools-1.0.13-3.el7.x86_64                           10/28
  Installing : libXau-1.0.8-2.1.el7.x86_64                                11/28
  Installing : libxcb-1.11-4.el7.x86_64                                   12/28
  Installing : alsa-lib-1.0.28-2.el7.x86_64                               13/28
  Installing : libX11-common-1.6.3-2.el7.noarch                           14/28
  Installing : libX11-1.6.3-2.el7.x86_64                                  15/28
  Installing : libXext-1.3.3-3.el7.x86_64                                 16/28
  Installing : libXi-1.7.4-2.el7.x86_64                                   17/28
  Installing : libXtst-1.2.2-2.1.el7.x86_64                               18/28
  Installing : giflib-4.1.6-9.el7.x86_64                                  19/28
  Installing : libXrender-0.9.8-2.1.el7.x86_64                            20/28
  Installing : ttmkfdir-3.0.9-42.el7.x86_64                               21/28
  Installing : fontpackages-filesystem-1.44-8.el7.noarch                  22/28
  Installing : fontconfig-2.10.95-7.el7.x86_64                            23/28
  Installing : xorg-x11-fonts-Type1-7.5-9.el7.noarch                      24/28
  Installing : 2:libpng-1.5.13-7.el7_2.x86_64                             25/28
  Installing : tzdata-java-2016f-1.el7.noarch                             26/28
  Installing : 1:java-1.8.0-openjdk-headless-1.8.0.101-3.b13.el7_2.x86_   27/28
  Installing : 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64          28/28
  Verifying  : libXext-1.3.3-3.el7.x86_64                                  1/28
  Verifying  : tzdata-java-2016f-1.el7.noarch                              2/28
  Verifying  : giflib-4.1.6-9.el7.x86_64                                   3/28
  Verifying  : libXtst-1.2.2-2.1.el7.x86_64                                4/28
  Verifying  : 1:java-1.8.0-openjdk-1.8.0.101-3.b13.el7_2.x86_64           5/28
  Verifying  : python-lxml-3.2.1-4.el7.x86_64                              6/28
  Verifying  : libxcb-1.11-4.el7.x86_64                                    7/28
  Verifying  : 2:libpng-1.5.13-7.el7_2.x86_64                              8/28
  Verifying  : fontpackages-filesystem-1.44-8.el7.noarch                   9/28
  Verifying  : ttmkfdir-3.0.9-42.el7.x86_64                               10/28
  Verifying  : libX11-1.6.3-2.el7.x86_64                                  11/28
  Verifying  : python-javapackages-3.4.1-11.el7.noarch                    12/28
  Verifying  : 1:java-1.8.0-openjdk-headless-1.8.0.101-3.b13.el7_2.x86_   13/28
  Verifying  : libXrender-0.9.8-2.1.el7.x86_64                            14/28
  Verifying  : libX11-common-1.6.3-2.el7.noarch                           15/28
  Verifying  : xorg-x11-fonts-Type1-7.5-9.el7.noarch                      16/28
  Verifying  : libxslt-1.1.28-5.el7.x86_64                                17/28
  Verifying  : libXfont-1.5.1-2.el7.x86_64                                18/28
  Verifying  : libICE-1.0.9-2.el7.x86_64                                  19/28
  Verifying  : javapackages-tools-3.4.1-11.el7.noarch                     20/28
  Verifying  : alsa-lib-1.0.28-2.el7.x86_64                               21/28
  Verifying  : libXi-1.7.4-2.el7.x86_64                                   22/28
  Verifying  : libXau-1.0.8-2.1.el7.x86_64                                23/28
  Verifying  : libSM-1.2.2-2.el7.x86_64                                   24/28
  Verifying  : libfontenc-1.1.2-3.el7.x86_64                              25/28
  Verifying  : fontconfig-2.10.95-7.el7.x86_64                            26/28
  Verifying  : lksctp-tools-1.0.13-3.el7.x86_64                           27/28
  Verifying  : 1:xorg-x11-font-utils-7.5-20.el7.x86_64                    28/28
&nbsp;
Installed:
  java-1.8.0-openjdk.x86_64 1:1.8.0.101-3.b13.el7_2
&nbsp;
Dependency Installed:
  alsa-lib.x86_64 0:1.0.28-2.el7
  fontconfig.x86_64 0:2.10.95-7.el7
  fontpackages-filesystem.noarch 0:1.44-8.el7
  giflib.x86_64 0:4.1.6-9.el7
  java-1.8.0-openjdk-headless.x86_64 1:1.8.0.101-3.b13.el7_2
  javapackages-tools.noarch 0:3.4.1-11.el7
  libICE.x86_64 0:1.0.9-2.el7
  libSM.x86_64 0:1.2.2-2.el7
  libX11.x86_64 0:1.6.3-2.el7
  libX11-common.noarch 0:1.6.3-2.el7
  libXau.x86_64 0:1.0.8-2.1.el7
  libXext.x86_64 0:1.3.3-3.el7
  libXfont.x86_64 0:1.5.1-2.el7
  libXi.x86_64 0:1.7.4-2.el7
  libXrender.x86_64 0:0.9.8-2.1.el7
  libXtst.x86_64 0:1.2.2-2.1.el7
  libfontenc.x86_64 0:1.1.2-3.el7
  libpng.x86_64 2:1.5.13-7.el7_2
  libxcb.x86_64 0:1.11-4.el7
  libxslt.x86_64 0:1.1.28-5.el7
  lksctp-tools.x86_64 0:1.0.13-3.el7
  python-javapackages.noarch 0:3.4.1-11.el7
  python-lxml.x86_64 0:3.2.1-4.el7
  ttmkfdir.x86_64 0:3.0.9-42.el7
  tzdata-java.noarch 0:2016f-1.el7
  xorg-x11-font-utils.x86_64 1:7.5-20.el7
  xorg-x11-fonts-Type1.noarch 0:7.5-9.el7
&nbsp;
Complete!
   </pre>

0. OPTIONAL: Verify Java version installed:   

   <pre><strong>
   java -version
   </strong></pre>

   <pre>
openjdk version "1.8.0_101"
OpenJDK Runtime Environment (build 1.8.0_101-b13)
OpenJDK 64-Bit Server VM (build 25.101-b13, mixed mode)
   </pre><br /><br />

0. Download Jenkins from the Red Hat repo:

   <pre><strong>
   sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
   </strong></pre>

   QUESTION: What version of Jenkins?

   <pre>
/pkg.jenkins-ci.org/redhat/jenkins.repo
--2016-07-27 19:26:57--  http://pkg.jenkins-ci.org/redhat/jenkins.repo
Resolving pkg.jenkins-ci.org (pkg.jenkins-ci.org)... 52.202.51.185
Connecting to pkg.jenkins-ci.org (pkg.jenkins-ci.org)|52.202.51.185|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 71
Saving to: '/etc/yum.repos.d/jenkins.repo'
&nbsp;
100%[======================================>] 71          --.-K/s   in 0s
&nbsp;
2016-07-27 19:26:57 (8.20 MB/s) - '/etc/yum.repos.d/jenkins.repo' saved [71/71]
   </pre>

   NOTE: The wget tool downloads files into the filename specified after the "O" flag (that's a capital 'O', not a zero).

0. Import the verification key using the package manager RPM:

   <pre><strong>
   sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
   </strong></pre>

   There is no response if successful.

0. Install Jenkins by running:

   <pre><strong>
   sudo yum install jenkins
   </strong></pre>

   The response:

   <pre>
Failed to set locale, defaulting to C
Loaded plugins: fastestmirror
jenkins                                                  | 2.9 kB     00:00
jenkins/primary_db                                         |  85 kB   00:00
Loading mirror speeds from cached hostfile
 * base: mirror.n5tech.com
 * extras: mirror.pac-12.org
 * updates: mirror.math.princeton.edu
Resolving Dependencies
--> Running transaction check
---> Package jenkins.noarch 0:2.15-1.1 will be installed
--> Finished Dependency Resolution
&nbsp;
Dependencies Resolved
&nbsp;
================================================================================
 Package           Arch             Version             Repository         Size
================================================================================
Installing:
 jenkins           noarch           2.15-1.1            jenkins            65 M
&nbsp;
Transaction Summary
================================================================================
Install  1 Package
&nbsp;
Total download size: 65 M
Installed size: 66 M
Is this ok [y/d/N]:
   </pre>

0. Type y.

   The response:

   <pre>
Downloading packages:
jenkins-2.15-1.1.noarch.rpm                                |  65 MB   00:07
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : jenkins-2.15-1.1.noarch                                      1/1
  Verifying  : jenkins-2.15-1.1.noarch                                      1/1
&nbsp;
Installed:
  jenkins.noarch 0:2.15-1.1
&nbsp;
Complete!
   </pre>

0. Start Jenkins as a service:

   <tt><strong>
   sudo systemctl start jenkins.service
   </strong></tt>

   There is no response if successful.

0. List the process being used by Jenkins with a Linux command:

   <tt><strong>
   ps aux | less
   </strong></tt>

   Optional: http://www.cyberciti.biz/faq/show-all-running-processes-in-linux/

0. Check the status of the service:

   <tt><strong>
   sudo systemctl status jenkins.service
   </strong></tt>

   If everything went well, you should see two lines similar to the following:

   <pre>
● jenkins.service - LSB: Jenkins Continuous Integration Server
   Loaded: loaded (/etc/rc.d/init.d/jenkins)
   Active: active (running) since Wed 2016-07-27 19:31:35 UTC; 1min 54s ago
     Docs: man:systemd-sysv-generator(8)
  Process: 2272 ExecStart=/etc/rc.d/init.d/jenkins start (code=exited, status=0/SUCCESS)
   CGroup: /system.slice/jenkins.service
           └─2287 /etc/alternatives/java -Dcom.sun.akuma.Daemon=daemonized -D...
&nbsp;
Jul 27 19:31:34 centos-512mb-sfo2-01 systemd[1]: Starting LSB: Jenkins Conti....
Jul 27 19:31:34 centos-512mb-sfo2-01 runuser[2273]: pam_unix(runuser:session)...
Jul 27 19:31:35 centos-512mb-sfo2-01 jenkins[2272]: Starting Jenkins [  OK  ]
Jul 27 19:31:35 centos-512mb-sfo2-01 systemd[1]: Started LSB: Jenkins Contin....
Hint: Some lines were ellipsized, use -l to show in full.
&nbsp;
Loaded: loaded (/etc/systemd/system/jenkins.service; disabled)
Active: active (running) since Tue 2015-12-29 00:00:16 EST; 17s ago
   </pre>

   "Active: active (running)" 
   means the Jenkins services completed its startup 
   and is running. 

   If you see:<br />
   "Active: Active (exited)" 
   <a href="#StopJenkins">
   stop and start the service again, as described below</a>.

0. Visit the address using an internet browser:

   <pre><strong>
   http://138.68.1.138:8080
   </strong></pre>


0. Click <a href="#Config_Security">here to Skip pass 
   other installation options to 
   Unlock Jenkins Admin Password</a>


   <a name="StopJenkins"></a>

   ### Stop Jenkins #

0. Stop the Jenkins server:

   <tt><strong>
   sudo systemctl stop jenkins.service
   </strong></tt>

0. Check status of the service again:

   <tt><strong>
   sudo systemctl status jenkins.service
   </strong></tt>

   You should see:

   <pre>
   "Active: inactive (dead)"
   </pre>


<a id="CloudbeesInstall"></a>

## Cloudbees Installation #

Installation is not necessary if you use <a target="_blank" href="http://www.cloudbees.com/">
Cloudbees.com</a> which hosts Jenkins in their cloud. Their CEO is Kohsuke Kawaguchi (@kohsukekwa, kk@kohsuke.org)
who invented Hudson/Jenkins. Hear him speak at <a target="_blank" href="https://www.youtube.com/watch?v=0nG4xGYvAa0"> this Oct, 2014 meetup about Workflow</a>.

Cloudbees sells Nectar, a supported and enhanced on-premise version of Jenkins that automatically scales on VMWare virtual machines.
Cloudbees has a professional certification exam on this product.



<a name="CodeDeploy"></a>

## AWS CodeDeploy service #

### Pre-requisites #

Define what will be specified later:

0. Define EC2 Key Pair.
0. Define VPC id.
0. Define VPC subnet.

### Use Kubernetes #

TBD

### Use CloudFormation #

0. <a target="_blank" href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new">
  Go to AWS CloudFormation service, Create stack</a>.
0. Create a <strong>CloudFormation template</strong> based on 
   <a target="_blank" href="https://github.com/mikepfeiffer/jenkins-aws-ec2/blob/master/jenkins-server.template">
   this one</a>.
0. Upload it to S3.
0. Specify a Stack name according to your organization's naming standards. (For now we use "Jenkins1").
0. For Parameters, select an Instance Type (t2.micro).
0. For YourIPRange, type "0.0.0.0" to expose it to the world. Next.
0. Options: Tag a key not necessary.
0. Advanced notification options and stack policy not used for now. Next.
0. Check acknowledge resource creation (to talk to CodePipeline).
0. Click Create in the Summary page.

   Status goest from CREATE_IN_PROGRESS to CREATE_COMPLETE.

<a name="AmazonInstall"></a>

### Amazon EC2 Installation #

If you have a prefer to select your own server sizes on EC2,
Jenkins can be hosted on the Amazon cloud several ways.

Jeff Shantz did a great job on his videos on "Continuous Integration with Jenkins on Amazon EC2" (from 2014):
   <a target="_blank" href="https://www.youtube.com/watch?v=1JSOGJQAhtE">
   1</a>,
   <a target="_blank" href="https://www.youtube.com/watch?v=zojMg2c6k3Q">
   2</a>,
   <a target="_blank" href="https://www.youtube.com/watch?v=0ZS2BL5R3Ow">
   3</a>,
   <a target="_blank" href="https://www.youtube.com/watch?v=SRAQzs41ct4">
   4</a>,
   <a target="_blank" href="https://www.youtube.com/watch?v=IZ99VwrF6t4">
   5</a>

However, there are some updates necessary two years later.


<a name="Install_Linux"></a>

## Linux Installation #

Alternately, to install on RedHat and Centos Linux machines, follow instructions at:

 * https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Red+Hat+distributions


## Local laptop install #


<a id="Install_Mac"></a>

### Local MacOS OSX Install #

PROTIP: Install Jenkins locally for experimentation.

0. Install on Mac OSX using Homebrew:

 <pre><strong>
 brew update
 brew doctor
 brew install jenkins
 </strong></pre>

  A sample response:

{% highlight text %}
==> Downloading http://mirrors.jenkins-ci.org/war/2.5/jenkins.war
==> Downloading from http://ftp-chi.osuosl.org/pub/jenkins/war/2.5/jenkins.war
######################################################################## 100.0%
==> jar xvf jenkins.war
==> Caveats
Note: When using launchctl the port will be 8080.

To have launchd start jenkins now and restart at login:
brew services start jenkins
Or, if you don't want/need a background service you can just run:
jenkins
==> Summary
🍺  /usr/local/Cellar/jenkins/2.5: 6 files, 66.4M, built in 2 minutes 46 seconds
{% endhighlight %}
 
   Homebrew puts the jenkins.war file in:
  
   ```
   /usr/local/Cellar/jenkins/2.5/libexec/jenkins.war
   ```
  
 For more information:
 
    * http://iosfactory.blogspot.com/2015/02/jenkins-setup-for-ios-development.html
 

<a id="Choco_Windows"></a>

### Windows Chocolatey Installation #

0. Open a Command Window.
0. Install the Chocolatey package manager (if you haven't already) by copying and pasting the PowerShell command from
   <a target="_blank" href="http://chocolatey.org/">Chocolatey.org</a>
0. Install the version of Jenkins that Chocolatey makes available:
 
   <pre><strong>
   choco install jenkins
   </strong></pre>
 
   If Java is not installed on your computer already, it will be installed as a dependency.

   A sample response:

{% highlight text %}
Microsoft Windows [Version 6.1.7601]
Copyright (c) 2009 Microsoft Corporation.  All rights reserved.

C:\Users\Mainali>choco install jenkins
Chocolatey detected you are not running from an elevated command shell
  (cmd/powershell). You may experience errors - many functions/packages
  require admin rights. Only advanced users should run choco w/out an
  elevated shell (and very advanced users as non-admin). When you open
  the command shell, you should ensure "Run as Administrator".
Chocolatey (v0.9.8.31) is installing 'jenkins' and dependencies. By installing y
ou accept the license for 'jenkins' and each dependency you are installing.

jenkins v1.645.0.0

Mode                LastWriteTime     Length Name
----                -------------     ------ ----
d----        01/24/2016     23:09            jenkins

Downloading jenkins 64 bit
  from 'http://mirrors.jenkins-ci.org/windows/jenkins-1.645.zip'
Extracting C:\Users\Mainali\AppData\Local\Temp\chocolatey\jenkins\jenkins-1.645.
zip to C:\Users\Mainali\AppData\Local\Temp\chocolatey\jenkins...
C:\Users\Mainali\AppData\Local\Temp\chocolatey\jenkins
Installing jenkins...
jenkins has been installed.
Finished installing 'jenkins' and dependencies - if errors not shown in console,
 none detected. Check log for errors if unsure.
{% endhighlight %}
 
   Notice Java is installed on path `C:\Users\%User%\AppData\Local\Temp\chocolatey\jenkins`, where %user% is what's on your own computer.

<a id="Install_Windows"></a>

### Windows Installation from download #

CAUTION: Do not download the Windows jenkins.msi such as:

   <a target="_blank" href="https://jenkins.io/content/thank-you-downloading-windows-installer/">
   https://jenkins.io/content/thank-you-downloading-windows-installer</a>

   After you install to Program Files(x86). Install 2.7.1. Finish.

   A web server is automatically created on localhost:8080 and pops up an Authorization.

   But what is the User Name and Password?

So here is the approach that Umesh Lakana recommends:

0. Download the jenkins.war file from 

   <a target="_blank" href="http://ftp.tsukuba.wide.ad.jp/software/jenkins/war-stable/2.7.1/jenkins.war">
   http://ftp.tsukuba.wide.ad.jp/software/jenkins/war-stable/2.7.1/jenkins.war</a>

TODO: 

<a id="Verify_install"></a>

## Verify Installation #

Regardless of the installation mechanism:

0. Verify intallation on a Mac or Linux:

   ```
   which jenkins
   ```
 
   The response is the location Jenkins was installed:
 
   ```
   /usr/local/bin/jenkins
   ```

<a id="Start-server"></a>

## Start server with defaults #

The command to start Jenkins has several parameters.

0. See https://wiki.jenkins-ci.org/display/JENKINS/Starting+and+Accessing+Jenkins
   for a full explanation, inclidiong use of <strong>nohup</strong>.

0. Start Jenkins using defaults:

   ```
   jenkins
   ```

   If all goes well, you should see:

   ```
   INFO: Jenkins is fully up and running.
   ```

0. Confirm tcp ports Jenkins uses as java (8005 sharing, 8009, 8080):

   ```
   netstat | grep java
   ```

   NOTE: This command takes a minute or more.


## Stop server #

PROTIP: Do not stop the Jenkins instance by clicking the red X to close the command window Jenkins runs under.
   Doing a soft-stop enables Jenkins to save data to memory rather than potentially lose data during a hard and sudden stop.

0. Stop the server by escaping the process.

   * Ctrl+C on Windows
   * command+C on Macs

   &nbsp;

   The response is:
   
   ```
   INFO: JVM is terminating. Shutting down Winstone
   ```

## First-time setup #


### Use HTTPS #

PROTIP: Encrypt over the wire by using https instead of https.
    
0. Start Jenkins again using more parameters:

   <pre><strong>
   java -jar jenkins.war --httpPort=-1 --httpsPort=8081 –httpListenAddress=0.0.0.0
   </strong></pre>

    Value -1 turns off the port.

    –httpListenAddress=0.0.0.0 allows remote access, while 127.0.0.1 does not.

    A sample response:
    
   {% highlight text %}
   Running from: /usr/local/Cellar/jenkins/2.5/libexec/jenkins.war
   webroot: $user.home/.jenkins
   Jan 26, 2016 8:52:21 AM winstone.Logger logInternal
   INFO: Beginning extraction from war file
   Jan 26, 2016 8:52:21 AM org.eclipse.jetty.util.log.JavaUtilLog info
   INFO: jetty-winstone-2.9
   Jan 26, 2016 8:52:27 AM org.eclipse.jetty.util.log.JavaUtilLog info
   INFO: NO JSP Support for , did not find org.apache.jasper.servlet.JspServlet
   Jenkins home directory: /Users/wmar/.jenkins found at: $user.home/.jenkins
   Jan 26, 2016 8:52:34 AM org.eclipse.jetty.util.log.JavaUtilLog info
   INFO: Started SelectChannelConnector@0.0.0.0:8081
   Jan 26, 2016 8:52:34 AM winstone.Logger logInternal
   INFO: Winstone Servlet Engine v2.0 running: controlPort=disabled
   {% endhighlight %}

   NOTE: Some use a domain name to reach the IP address.



<a id="Config_Security"></a>

## Unlock Admin password #

PROTIP: Jenkins is installed with no authentication enabled.

The first time, you see this screen:

   <amp-img width="660" height="238" alt="jenkins-unlock" src="https://cloud.githubusercontent.com/assets/300046/15393232/7631489a-1d89-11e6-8d3b-8479160064ff.jpg"></amp-img>

   On a Mac machine, copy this path and change $USER to your user name:

   <pre><strong>
   /User/$USER/.jenkins/secrets/initialAdminPassword
   </strong></pre>

   On a Linux machine, copy this path:

   <pre><strong>
   /var/lib/jenkins/secrets/initialAdminPassword
   </strong></pre>

0. Open a new Terminal session.
0. Type the contents using the cat command:

   ```
   cat /var/lib/jenkins/secrets/initialAdminPassword
   ```

   A sample response:

   <pre>
   f79db609207e4d06ba2344a0d4d66cf9
   </pre>

0. Copy the password revealed and dismiss the editor window.

0. Return to the web page and paste it under "Administrator password". Press Continue.


### Customize Initial Plug-ins #

PROTIP: Configure one plug-in at a time. This makes it easier to troubleshoot.

0. Press "Select plugins to install" or "Start using Jenkins".

0. DO NOT click "Install the Suggested Plugins" Recommended. 
   But if you do, you'll see:

   <amp-img width="650" height="206" alt="jenkins-recommended-plugins-650x206" src="https://cloud.githubusercontent.com/assets/300046/15395245/2e9ac3a2-1d94-11e6-8c12-e9dbcc261d1f.jpg"></amp-img>

   For the list of plug-ins to select,
   see [my list of Jenkins plugins](/jenkins-plugins/),
   then return here again.

0. Click Install.

   The "Getting Started" page shows the progress of plug-ins being installed.


## Create First Admin User #

Back to the Jenkins web page UI after plug-ins are installed:

0. PROTIP: Open a text file and type your choice for
   Username, Password, Confirm, Full Name, E-mail address.
   Do this in case there is a typo.

0. Copy each answer from the file and paste it on the screen.

   PROTIP: Print the file and store it in a safe place but
   where other administrators know to access.

0. Press OK (or "Start Using Jenkins" in older versions) 
   to see the login screen:

   <amp-img width="296" height="145" alt="jenkins2.5-login" src="https://cloud.githubusercontent.com/assets/300046/15448936/c665558c-1f2c-11e6-9fe4-21e7a125e3da.jpg"></amp-img>

0. Type in the credentials entered earlier.



## Dashboard Explained #


   <amp-img width="471" height="336" alt="jenkins2 5-dashboard-annotated" src="https://cloud.githubusercontent.com/assets/300046/15448917/36b153be-1f2c-11e6-8ae6-512e16f05f16.jpg"></amp-img>


1\. The whole page is called a **Dashboard**.
2\. **Breadcrumbs** show the hierarchy of page navigation.
3\. Menu items are within a **Sidebar**.
4\. Under the **Build Queue** heading.
5\. Under the **Build Executor Status** heading.
6\. To the right of the **All** view ???
7\. Under the **Name** column are jobs and projects.
8\. Build.
9\. Different colors of icons under the **S** column indicate differing **build status**.
10\. Different colors of icons under the **W** column indicate differing **uild trend**, 
   where yellow sunshine is good and a thundercloud is bad.



## Server Status #

Use the process status command to find the process ID to kill:

   <tt><strong> ps -eaf | grep jenkins </strong></tt>

   A sample response:

<pre>
  501  4137     1   0 Thu06AM ??         2:54.41 /usr/bin/java -Dmail.smtp.starttls.enable=true -jar /usr/local/opt/jenkins/libexec/jenkins.war --httpListenAddress=127.0.0.1 --httpPort=8080
  501 14728 14384   0  6:31PM ttys002    0:00.00 grep jenkins
</pre>

To remove the Jenkins process:

    <pre><strong>
    kill 4137
    </strong></pre>


## Configure User Security #

Jenkins installation options are described at:
 
   * https://wiki.jenkins-ci.org/display/JENKINS/Starting+and+Accessing+Jenkins

   By default, Jenkins stores its configuration files in the user's home folder at `~/.jenkins`.

   To make a Jenkins server completely public (and open to hacking)
   use a text editor to edit ~jenkins/.ssh/config
   to add `StrictHostKeyChecking no`.

0. Create a key without a passphrase, per https://help.github.com/articles/generating-ssh-keys/

0. Login under user named Jenkins (if applicable):

   ```
   sudo su jenkins
   ```

0. Copy your github key to Jenkins .ssh folder.

   ```
   cp ~/.ssh/id_rsa_github*  /var/lib/jenkins/.ssh/
   ```

0. Raname the keys:

   ```
   mv id_rsa_github id_rsa
   mv id_rsa_github.pub id_rsa.pub
   ```


<a id="AddUser"></a>

### Add User Permissions #

0. Bring up Jenkins in your default browser:

   <a target="_blank" href="http://localhost:8081/">
   https://localhost:8081/</a>

   If you don't see the full menu (shown on the right), you don't have some permissions.

   As with other systems, granting permissions is typically done only by the Administrator of the system.
   
    ![do_jenkins_createuser_01b](https://cloud.githubusercontent.com/assets/10678180/17228006/cd742c42-54d6-11e6-9d7d-290bf096dbac.png)

0. Click **Manage Jenkins** on the left menu of the Dashboard screen.

   ![do_jenkins_createuser_globalsecurity_02](https://cloud.githubusercontent.com/assets/10678180/17228195/9d08ffb4-54d7-11e6-8abc-b86104e65882.png)

0. Click **Configure Global Security**.

   <amp-img width="481" height="57" alt="jenkins2 5-manage-config-global-security-962x114" src="https://cloud.githubusercontent.com/assets/300046/15433535/f9da19d8-1e6f-11e6-8e30-e66dc2cbc9c4.png"></amp-img>

0. Check the option box for <strong>Enable Security</strong>.
0. If you have an LDAP, select that. 

    ![do_jenkins_createuser_jenkensdatabase_02a](https://cloud.githubusercontent.com/assets/10678180/17228474/c08dfb28-54d8-11e6-84ad-5ac8814f3b25.png)

0. Under the Access Control section, Check <strong>Use Jenkin's own user database</strong>. But you'll have to add each user.

    ![do_jenkins_createuser_globalsecurity_allowusertosignup_03](https://cloud.githubusercontent.com/assets/10678180/17228700/b730a2b4-54d9-11e6-86c8-5b67b3fdabbd.png)

0. Deselect the checkbox marked **Allow users to sign up**.

     ![do_jenkins_createuser_globalsecurity_auth_matrixbasedsecurity_04](https://cloud.githubusercontent.com/assets/10678180/17228742/f988f12a-54d9-11e6-8809-a31c1efcd362.png)


0. Under Authorization, Check **Matrix-based security**.

     ![do_jenkins_createuser_icon_08](https://cloud.githubusercontent.com/assets/10678180/17237283/daed5d28-5515-11e6-89ec-c84f043b21a2.png)

  
     ![user](https://cloud.githubusercontent.com/assets/10678180/17260321/4801a4e4-5595-11e6-8604-f962663770ff.PNG)
  

0. Click on the small button to the right of the Anonymous row to select all permissions.

     PROTIP: Rather than specifying individual users and their permissions,
     the preferred approach is to first assign individual users to a group in LDAP,
     then assign permission to the group (like what the Windows OS does).

     ![do_jenkins_createuser_save_09](https://cloud.githubusercontent.com/assets/10678180/17260091/1d5441ee-5594-11e6-9199-577720b44705.png)

0. Click on **Save**.

0. To create a new user, manually create additional new users by Returning to **Home** and Click on **Manage Jenkins**.

     ![manageuser](https://cloud.githubusercontent.com/assets/10678180/17237614/74029c5a-5519-11e6-8b6e-0a7fd642e2c1.PNG)

0. Scroll down and click on **Manage Users**. 

     ![do_createuser](https://cloud.githubusercontent.com/assets/10678180/17237692/385e80a0-551a-11e6-9081-2924266b1a18.png)

0. From the menu on the left, Click on **Create User**. 

    ![do_createuser1](https://cloud.githubusercontent.com/assets/10678180/17237767/e083dad2-551a-11e6-8f24-ce1a03e14330.png)

0. Fill out the Username,Password,Confirm password, Full name and E-mail address and Click on **Create User**

   ![do_usergroup](https://cloud.githubusercontent.com/assets/10678180/17237869/06aa05a0-551c-11e6-8aa0-0be916efd5db.png)
   
   
   ![do_userandy](https://cloud.githubusercontent.com/assets/10678180/17237904/6b198c40-551c-11e6-8d9e-d6f3dcb5ddcb.png)

0. Use the **User/group to add** input field to specify a new user and Click **Add**
0. Click on the small button to the right of the **andy** row to select all permissions.

   ![do_applysave](https://cloud.githubusercontent.com/assets/10678180/17237967/36eb74e6-551d-11e6-8529-df4fa4f5c7c1.png)

0. Click **Apply** and Click **Save**.

0. Install the "AWS CodePipeline Plugin" 
   by following the next section below.


<a id="Plug-ins"></a>

## Plug-ins #

See [Install Jenkins Plug-ins](/jenkins-plugins/)



<a id="Nodes"></a>

## Nodes for scalability #

 A Jenkins server can scale by adding **nodes** to spread build work across several servers running different operating systems.

 Look at the **Load Statistics** UI to see whether additional nodes are necessary.
 
 Jenkins slave nodes can be started by the master using several launch methods:

  * Launch slave agents on Unix machines via SSH
  * Launch slave agents via Java Web Start
  * Launch slave via execution of command on the Master
  * Let Jenkins control this Window slave as a Windows service

0. Setup a node as a VirtualBox. TODO.

0. In Configure Server, a node can be setup as a **Virtualbox** 
   URL such as http://localhost:18083/.

0. In Manage Nodes, configure a VBox host.
1. Run the box by clicking the icon at the far right of the node listed.
2. Launch Slave Agent to start the machine.


<a id="Node_Security"></a>

### From a slave node #

0. From a slave command line, connect to a Jenkins master:
 
   ```
   java -jar slave.jar -jnlpUrl http://jenkins-master:8081/computer/Test Node/slave-agent.jnlp
   ```

 Several **executors** can be running simultaneously.
 This number is specified within the **Manage Jenkins** UI.
 
 Tool locations (such as Github) is also specified in that UI.

 Nodes are described at:
 * https://wiki.jenkins-ci.org/display/JENKINS/Distributed+builds

<a id="Builds">

## Build Projects</a>

Jenkins was originally created for automating the building (compilation) of java programs.
But Jenkins is ALSO used for other types of work.
Nevertheless, the Jenkins term <strong>"build"</strong> 
is another word for what operating systems call a <strong>"job"</strong> (unit of batch work).

Builds/jobs can be automatically triggered several ways:

 * after other projects
 * periodically on a schedule
 * poll a version control system for changes


## Resources #

* <a target="_blank" href="https://www.youtube.com/watch?v=Lxd6JMMxuwo">
   Getting Started With Jenkins | Jenkins and DevOps tutorial on YouTube</a>
  
* <a target="_blank" href="https://www.selikoff.net/2016/02/27/jeannes-experiences-with-the-jenkins-certification-beta-exam/">
   Jenkins beta certification exam</a> by Jeanne Boyarsky, 27 Feb 2016
   shares a word file and quizlet that enabled her to pass.

* <a target="_blank" href="http://www.crashcourse.ca/wiki/index.php/Jenkins">
   Jenkins Crash Course wiki</a>


