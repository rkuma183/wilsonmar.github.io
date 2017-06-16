---
layout: post
title: "Mac OSX Homebrew"
excerpt: "Packaged for easy digestion"
tags: [homebrew, apple, mac, setup]
image:
# feature: pic brown homebrew logo 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622020/60672448-0584-11e6-8202-41c36ba82d04.jpg
  credit: Kickstarter
  creditlink: https://www.kickstarter.com/projects/homebrew/brew-test-bot
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This tutorial provides a deep dive of Homebrew,
a package manager for Mac OSX (MacOS)
like Chocolatey for Windows, apt-get for dpkg, or yum for RPM.

Step-by-step instructions are provided here to install Homebrew itself
and then install Homebrew packages based on the name of 
<strong>formulae</strong> specified for installation
in a command such as:

   <tt><strong>
   brew install wget
   </strong></tt>

DEFINITION: A formula provides instructions on how to install packages and
their dependencies, such as where to find tar.gzip files for download.  

Brew installs packages in its own Cellar directory (folder)
and adds symlinks to the /usr/local folder.


## About Homebrew #

Homebrew is the newest and most popular package utility on OSX.

Its web page is at <a target="_blank" href="http://brew.sh/">
http://brew.sh</a>

Alternatives to Homebrew:

   * https://www.macports.org/ 

   sudo port install tree

   * http://www.finkproject.org/

<hr />

<a id="Preparations"></a>

## Preparations #

0. Make a full backup of your system before following these instructions.

0. Install XCode.

   If XCode is not already installed, you are prompted to install it.

   Homebrew requires OS X 10.5+ and the Xcode command line tools.

   Since the El Capitan version of Mac OSX, 
   file permissions in /usr/local have changed,
   causing error messages such as:

   <pre>
   The linking step did not complete successfully
   The formula built, but is not symlinked into /usr/local
   </pre>

0. So in a Terminal shell window at any folder:

   <tt><strong>
   sudo chown -R :staff /usr/local
   </strong></tt>



<a id="HomebrewSetupz"></a>

## Install Homebrew #

0. Install Homebrew if you haven't already.

   <pre><strong>
   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   </strong></pre>

   CAUTION: Don't press Enter on the Terminal until the Download Software dialog reaches 100%.

   Press the Enter key to the message:
   <br /><tt>Press RETURN to continue or any other key to abort.</tt> then

   To proceed, enter the root password, or type Ctrl+C to abort.

   NOTE: The download is from<br />
   https://github.com/Homebrew/homebrew/

   HISTORICAL NOTE: Previously, the Homebrew installer was at<br /> 
   https://raw.github.com/Homebrew/homebrew/go/install/


0. Identify where the Homebrew program itself is located:

   <pre><strong>
   which brew
   </strong></pre>

   The response:

   <pre>
   /usr/local/bin/brew
   </pre>

   The "brew" above is a shell script file.


   ### Update Homebrew itself #

0. Get Homebrew version:

   <pre><strong>
   brew -v
   </strong></pre>

   The response (at time of writing) indicates Homebrew is not "v1.0" yet:

   <pre>
   Homebrew 0.9.9 (git revision e9cc; last commit 2016-06-12)
   Homebrew/homebrew-core (git revision 3977; last commit 2016-06-12)
   </pre>

   NOTE: Homebrew is open-sourced at<br />
   https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Common-Issues.md


0. To update Homebrew itself and its formulas:

   <tt><strong>
   brew update<br />
   brew update
   </strong></tt>

   Yes, run it twice to make sure all dependencies took.

   Each run can take several minutes.


<a name="InstallFormula"></a>

## Formulas #

   ### Search for a formula to install #

0. Use an internet browser (such as Google Chrome)
   to view formula defined in

   * <a target="_blank" href="http://braumeister.org/">
   http://braumeister.org</a> provides recent activity.
   
   * <a target="_blank" href="http://brewformulas.org/">
   http://brewformulas.org</a> 

   ### Install formula #

0. Install the wget command-line utility by formula name (for example, wget):

   <tt><strong>
   brew install wget
   </strong></tt>

   This installs to folder /usr/local/bin/wget.

   See <a target="_blank" href="https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Tips-N'-Tricks.md">
   Tips &amp; Tricks</a> on how to 
   use proxy, remove the beer mug emoji, highlighting within editors, etc.


   ### How many? #

0. Get a count of kegs, how many files, and the disk space they take:

   <tt><strong>
   brew info --all
   </strong></tt>

   A sample response:

   <pre>
   15 kegs, 18,528 files, 540.6M
   </pre> 

   ### Where did it go? #

0. List where .tar.gz "bottle" files are downloaded into from the internet:

   DEFINITION: A "Bottle" is a pre-built binary Keg used for installation 
   instead of building from source.
   It can be unpacked.

   <tt><strong>
   brew --cache
   </strong></tt>

   The response includes your user name, which enables
   Homebrew to work without using sudo (elevation to root). 

   <pre>
   /Users/mac/Library/Caches/Homebrew
   </pre>

   The equivalent of the above is:

   <pre>
   ~/Library/Caches/Homebrew
   </pre>

0. List <strong>bottles</strong> downloaded: 

   <pre>
   ls ~/Library/Caches/Homebrew
   </pre>

   Examples of responses:

   <pre>
   autoconf-2.69.el_capitan.bottle.4.tar.gz	
   maven-3.3.9.tar.gz
   awscli-1.10.44.el_capitan.bottle.tar.gz
   node-6.2.2.tar.xz
   docker-1.11.2.el_capitan.bottle.tar.gz
   openssl-1.0.2h_1.el_capitan.bottle.tar.gz
   gimp-2.8.16-x86_64.dmg
   pkg-config-0.29.1.el_capitan.bottle.tar.gz
   libgpg-error-1.23.el_capitan.bottle.tar.gz
   readline-6.3.8.el_capitan.bottle.tar.gz
   libksba-1.3.4.el_capitan.bottle.tar.gz
   </pre>

0. List brew formulas installed:

   <tt><strong>
   ls /usr/local/Cellar<br />
   brew list<br />
   brew ls
   </strong></tt>

   The alternative commands above all do the same thing of the same folder,
   for example:

   <pre>
   autoconf	awscli		libgpg-error	libtool		maven		node		pkg-config	xz
   automake	docker		libksba		libyaml		mysql		openssl		readline
   </pre>

   There is no response if no brew package has been installed.

0. See one level below one of the above folders for a specific formula,
   such as openssl:

   <pre><strong>
   ls /usr/local/Cellar/openssl/
   </strong></pre>

   It is usually a version number, such as:

   <pre>
   1.0.2h_1
   </pre>

   DEFINITION: A "Keg" is the installation prefix of a formula, such as:

   <pre>
   openssl-1.0.2h_1.el_capitan.bottle.tar.gz
   </pre>


   ### Packages #

0. List brew package .rb (Ruby language) files installed:

   <pre>
   ls /usr/local/Library/Taps/homebrew/homebrew-core/Formula
   </pre>

   The response is a long list.

0. List brew package folders: 

   <tt><strong>
   brew search
   </strong></tt>

   The response is a long list.



### Troubleshoot Homebrew #

0. Different ways to install weget.

   The above is one of <a target="_blank" href="http://coolestguidesontheplanet.com/install-and-configure-wget-on-os-x/">
   several ways</a> to install the wget command-line utility.
   
   One way is to install Apple's Xcode.

   <tt><strong>	
   brew install --build-from-source wget
   </strong></tt>

   Test wget operating:

   <tt><strong>cd ~/Downloads<br />
   wget http://ftp.gnu.org/gnu/wget/wget-1.15.tar.gz
   </strong></tt>

0. Verify brew installation:

   <tt><strong>
   brew doctor
   </strong></tt>

   If you see this message at the top of messages returned:

   <pre>
   Warning: Unbrewed header files were found in /usr/local/include.
   If you didn't put them there on purpose they could cause problems when
   building Homebrew formulae, and may need to be deleted.
   </pre>

   The above may occur if curl and nodejs were installed without using homebrew.

   Remove them before installing node and curl using Homebrew:

   <pre><strong>
   rm -rf /usr/local/include/node/
   </strong></pre>


0. Create symlinks to installations performed manually in Cellar. 
   This allows you to have the flexibility to install things on your own but 
   still have those participate as dependencies in homebrew formulas.

   First, see what exactly will be overwritten, without actually doing it:

   <tt><strong>
   brew link --overwrite --dry-run openssl
   </strong></tt>

   The response is:

   <pre>
   Warning: openssl is keg-only and must be linked with --force
   Note that doing so can interfere with building software.
   </pre>

   "Keg-only" refers to a formula installed only into the Cellar and not linked into /usr/local, 
   which means most tools will not find it. 
   This is to avoid conflicting with the system version of the same package.


   Alternately, if aswcli is specified for dry-run, the response is:

   <pre>
   Warning: Already linked: /usr/local/Cellar/awscli/1.10.44
   To relink: brew unlink awscli && brew link awscli
   </pre>

   <tt><strong>
   brew link
   </strong></tt>

   NOTE: Homebrew installs to the Cellar it then symlinks some of the installation into /usr/local 
   so that other programs can see what's going on.

   A symlink to the active version of a Keg is called an "opt prefix".


   ### Prune symlinks #
   
   If you see this message:
   
   <pre>
   Warning: Broken symlinks were found. Remove them with `brew prune`:
   </pre>

   <pre><strong>
   brew prune
   </strong></pre>

   A sample response:

   <pre>
   Pruned 1598 symbolic links and 185 directories from /usr/local
   </pre>


0. List formula (package definitions):

   <tt><strong>
   brew edit $FORMULA
   </strong></tt>

   The above command brings you to your default text editor 
   (vim or whatever is specified in the $EDITOR variable).

   Type :q to quit out.  






## Upgrade brew formulas #

0. List brew packages that are obsolete:

   <tt><strong>
   brew outdated
   </strong></tt>

   To stop a specific package from being updated/upgraded,
   pin it:

   <tt><strong>
   brew pin $FORMULA
   </strong></tt>

   $FORMULA is ???
   
   To allow that formulae to update again, unpin it.


0. Download and update ALL software packages installed:

   <tt><strong>
   brew upgrade
   </strong></tt>

0. To see which files would be removed as no longer needed:

   <tt><strong>
   brew cleanup -n
   </strong></tt>

   No response if there is nothing to clearn.

0. To really remove all files no longer needed:

   <tt><strong>
   brew cleanup
   </strong></tt>

   A sample response:

   <pre>
   Removing: /Users/mac/Library/Caches/Homebrew/mariadb-10.1.14.el_capitan.bottle.tar.gz... (36.6M)
   ==> This operation has freed approximately 36.6M of disk space.
   </pre>



<a name="Tap"></a>

## Tap #

Brew tap adds repos not in the Homebrew master repo
from inside a larger package.

https://github.com/Homebrew/brew/blob/master/docs/brew-tap.md
says tap adds to the list of formulae that brew tracks, updates, and installs from.

0. List brew tap packages already installed:

   <pre><strong>brew tap
   </strong></pre>

0. Install the ip tool included with iproute2 on Linux:

   <pre><strong>brew tap brona/iproute2mac
   brew install iproute2mac
   </strong></pre>

   The command specififies the account and repo in GitHub, as in<br />
   https://github.com/brona/iproute2mac
   
   or https://superuser.com/questions/687310/ip-command-in-mac-os-x-terminal

   <pre><strong>ifconfig en0 | grep inet | grep -v inet6 | cut -d ' ' -f2
   </strong></pre>

0. Try it (instead of ifconfig):

   <pre><strong>ip
   ip addr show en0
   </strong></pre>

0. Remove a tap:

   <pre><strong>brew untap brona/iproute2mac
   </strong></pre>



<a name="CaskInstall"></a>

## Brew Cask Install #

Homebrew cask extends homebrew and brings its elegance, simplicity, and speed to 
MacOS (OS X) <strong>GUI</strong> applications and large binaries.

With Cask, you can skip the long URLs, 
the "To install, drag this icon…", and manually deleting installer files.

0. Temporarily set the permissions on /usr/local:

   <pre><strong>sudo chown $USER /usr/local
   </strong></pre>

0. Install brew cask:

   <pre><strong>brew tap caskroom/cask
   brew install brew-cask
   </strong></pre>

   Applications are kept in their Caskroom under /opt and symblinked to $HOME/Applications.

0. <a target="_blank" href="https://caskroom.github.io/">
   https://caskroom.github.io</a>, the home page, said there are 3,197 casks as of June 5, 2016.

   QUESTION: Is there a graph of growth in cask counts over time?

0. Install the cask extension to Homebrew:

   <pre><strong>brew tap caskroom/cask
   </strong></pre>

   Alternately:

   <pre><strong>ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null
   </strong></pre>

0. Search for a cask by name, in website is where casks are obtained:

   <a target="_blank" href="https://github.com/caskroom/homebrew-cask/search?utf8=✓">
   https://github.com/caskroom/homebrew-cask/search?utf8=✓</a>

   Alternately, run a search command. This example searches for "yo":

   <pre><strong>brew cask search yo
   </strong></pre>

   PROTIP: One should see the cask definition before using it.
   I would be suspicious of casks with sparse information.

   The safe way to get the homepage URL of the programmer is from here (don't Google it and end up at a rogue site).

0. Look at some cask definitions:

   <a target="_blank" href="https://github.com/caskroom/homebrew-cask/blob/master/Casks/google-chrome.rb">
   https://github.com/caskroom/homebrew-cask/blob/master/Casks/google-chrome.rb</a>
   is a sample cask definition:

{% highlight text %}
cask 'google-chrome' do
  version :latest
  sha256 :no_check

  url 'https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg'
  name 'Google Chrome'
  homepage 'https://www.google.com/chrome/'
  license :gratis

  auto_updates true

  app 'Google Chrome.app'

  zap delete: [
                '~/Library/Application Support/Google/Chrome',
                '~/Library/Caches/Google/Chrome',
                '~/Library/Caches/com.google.Chrome',
                '~/Library/Caches/com.google.Chrome.helper.EH',
                '~/Library/Caches/com.google.Keystone.Agent',
                '~/Library/Caches/com.google.SoftwareUpdate',
                '~/Library/Google/GoogleSoftwareUpdate',
                '~/Library/Logs/GoogleSoftwareUpdateAgent.log',
              ],
      rmdir:  [
                '~/Library/Caches/Google',
                '~/Library/Google',
              ]
end{% endhighlight %}

0. Install the cask:

   <tt><strong>brew cask install google-chrome
   </strong></tt>

   Cask downloads then moves the app to the ~/Applications folder,
   so it can be opened this way:

0. Open the installed cask from Terminal:

   <pre><strong>open /Applications/"Google Chrome.app"
   </strong></pre>

0. Installing with cask enables you to cleanup:

   <pre><strong>brew cask cleanup
   </strong></pre>


   ### Error prevention

   <a target="_blank" href="https://github.com/caskroom/homebrew-cask/issues/19547">
   If</a> you get an error about "permissions denied":

0. Create a Caskroom folder

   <pre><strong>cd ~
   mkdir Caskroom
   </strong></pre>

0. Edit the .bash_profile

   <pre><strong>vim ~/.bash_profile
   </strong></pre>

0. Add this line:

   <pre>export HOMEBREW_CASK_OPTS="--appdir=~/Applications --caskroom=~/Caskroom"
   </pre>

   QUESTION: The use of --caskroom is deprecated?

0. Save the file.
0. Restart the terminal.

   <pre><strong>source ~/.bash_profile
   </strong></pre>


## Debian apt-get

Download Fink commander Fink Installer.pkg from<br />
http://finkcommander.sourceforge.net/help/install.php


<a target="_blank" href="https://thecustomizewindows.com/2013/11/how-to-install-apt-get-on-mac-os-x/">This</a> explains: 
Fink stores data in the directory “/sw” by default. 
This goes against the Filesystem Hierarchy Standard’s recommendation to use “/usr/local”. 
Within Fink’s directory, a FHS-like layout (/sw/bin, /sw/include, /sw/lib, etc.) is used.


## Documentation #

0. For more documentation on brew, look <a target="_blank" href="https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/FAQ.md">
   here</a> and:

   <tt><strong>
   man brew
   </strong></tt>
   

## Social media #

Social media from <a target="_blank" href="https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/README.md#readme">
brew's readme</a>:

   * <a target="_blank" href="https://twitter.com/MacHomebrew">@MacHomebrew</a> on Twitter
   * IRC freenode.net#machomebrew
   * Email <a target="_blank" href="mailto:homebrew-discuss@googlegroups.com">homebrew-discuss@googlegroups.com</a>
   * <a target="_blank" href="https://groups.google.com/forum/#!forum/homebrew-discuss">
     Read archive of emails at https://groups.google.com/forum/#!forum/homebrew-discuss</a>


## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
