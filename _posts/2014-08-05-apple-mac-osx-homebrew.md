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


<a id="HomebrewSetupz"></a>

## Brew (Homebrew) Package Utility Setup

Homebrew
at <a target="_blank" href="http://brew.sh/">
http://brew.sh/</a>
is the newest and most popular package utility on OSX.

Alternatives:

* https://www.macports.org/ and
* http://www.finkproject.org/

<hr />

<a name="Homebrew"></a>

## Install Homebrew #

See https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Common-Issues.md

0. Make a full backup before following these instructions.

0. Install XCode.

   If XCode is not already installed, you are prompted
   to install it.


0. Install Homebrew if you haven't already.

   <pre><strong>
   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   <strong></pre>

   CAUTION: Don't press Enter on the Terminal until the Download Software dialog reaches 100%.

   Press the Enter key to the message:
   <br /><tt>Press RETURN to continue or any other key to abort.</tt> then

   To proceed, enter your password, or type Ctrl+C to abort.

   NOTE: The download is from
   https://github.com/Homebrew/homebrew/issues

   HISTORICAL NOTE: Previously, the installer
   was at https://raw.github.com/Homebrew/homebrew/go/install)"


0. Get version after installation:

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

0. Remove obsolete brew:

   <pre><strong>
   brew cleanup
   </strong></pre>

   No response if there is nothing to clearn.

0. Update brew formulas:

    <pre><strong>
    brew update
    </strong></pre>

   This can take several minutes.

0. Identify an brew issues:

    <pre><strong>
    brew doctor
    </strong></pre>

    If you see this message at the top of messages returned:

    <pre>
    Warning: Unbrewed header files were found in /usr/local/include.
    If you didn't put them there on purpose they could cause problems when
    building Homebrew formulae, and may need to be deleted.
    </pre>

    The above may occur if curl and nodejs were installed without using homebrew.

    Remove them and install nodejs and curl from homebrew:

    <pre><strong>
    rm -rf /usr/local/include/node/
    </strong></pre>

    Warning: Broken symlinks were found. Remove them with `brew prune`:

0. Prune:

    <pre><strong>
    brew prune
    </strong></pre>

    A sample response:

    <pre>
    Pruned 1598 symbolic links and 185 directories from /usr/local
    </pre>


## Confirm installation #

List apps installed by Homebrew (in folder
<strong>/usr/local/Cellar</strong>):

   <tt><strong>brew list</strong></tt>

There is no response if no brew package has been installed.

## Use Homebrew #

Install the wget command-line utility:

   <tt><strong>brew install wget</strong></tt>

This installs to folder /usr/local/bin/wget.

* Each brew package should be defined in <a target="_blank" href="http://brewformulas.org/">
   brewformulas.org</a>

The above is one of <a target="_blank" href="http://coolestguidesontheplanet.com/install-and-configure-wget-on-os-x/">
several ways</a> to install the wget command-line utility.
One way is to install Apple's Xcode.


Test wget operating:

   <tt><strong>cd ~/Downloads<br />
   wget http://ftp.gnu.org/gnu/wget/wget-1.15.tar.gz
   </strong></tt>

## Keep Homebrew updated #

<tt><strong>brew update</strong></tt>

Brew places files in its Cellar:

   <pre><strong>
   /usr/local/Cellar/node/0.10.35
   </strong></pre>

To see first what exactly will be overwritten, without actually doing it.

<tt><strong>
brew link --overwrite --dry-run python
</strong></tt>

<tt><strong>
brew doctor
</strong></tt>



## Brew Cast Install #

Install brew cask:

<pre><strong>
brew tap caskroom/cask
brew install brew-cask
</strong></pre>



<a id="MavenSetupz"></a>

##  Maven via Homebrew #

Before Mavericks,
<a target="_blank" href="http://maven.apache.org/">
Maven</a> was installed by default in:

   <tt>/usr/share/maven/bin/mvn</tt>

To install older versions, see
http://stackoverflow.com/questions/3987683/homebrew-install-specific-version-of-formula


To install the latest version (instead of brew install homebrew/versions/maven30 ):

<pre><strong>
brew update
brew install maven
</strong></pre>

the response:

<pre>
==> Downloading http://www.apache.org/dyn/closer.cgi?path=maven/maven-3/3.2.5/bi
==> Best Mirror http://apache.cs.utah.edu/maven/maven-3/3.2.5/binaries/apache-ma
######################################################################## 100.0%
ðŸº  /usr/local/Cellar/maven/3.2.5: 82 files, 9.1M, built in 66 seconds
</pre>

Alternately, to install a previous version:

<pre><strong>
brew install homebrew/versions/maven30
</strong></pre>

Then, to switch among versions:

<pre><strong>
brew unlink maven30 && brew link maven
brew unlink maven && brew link maven30
</strong></pre>

To see the shell script:

<pre><strong>
which mvn
</strong></pre>

response:

<pre>
/usr/local/bin/mvn
</pre>


To verify install:

<pre><strong>
mvn -version
</strong></pre>

I got this response:

<pre>
Apache Maven 3.2.5 (12a6b3acb947671f09b81f49094c53f426d8cea1; 2014-12-14T10:29:23-07:00)
Maven home: /usr/local/Cellar/maven/3.2.5/libexec
Java version: 1.6.0_65, vendor: Apple Inc.
Java home: /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
Default locale: en_US, platform encoding: MacRoman
OS name: "mac os x", version: "10.10.2", arch: "x86_64", family: "mac"
</pre>

If JDK 1.6 in the above output but Oracle JDK 1.7 was installed,
add the following to under export PATH=:

<pre><strong>
cd $HOME
subl .bash_profile
</strong></pre>

add the following to under export PATH=:

<pre><strong>
export JAVA_HOME=$(/usr/libexec/java_home)
</strong></pre>

Also add these memory variables:

<pre><strong>
export M2_HOME=/usr/local/Cellar/maven/3.2.5/libexec
export M2=$M2_HOME/bin
export PATH=$PATH:$M2_HOME/bin
</strong></pre>

NOTE: Do not specify this wrong path specified in other instructions:

<tt>export M2_HOME=/Users/wilsonmar/apache-maven-3.1.1</tt>

Verify changes:

<pre><strong>
echo $JAVA_HOME
echo $M2_HOME
echo $M2
echo $PATH
</strong></pre>


Verify:

<pre><strong>
echo $JAVA_HOME
</strong></pre>

The reply I got:

<pre>
/Library/Java/JavaVirtualMachines/jdk1.7.0_65.jdk/Contents/Home
</pre>

Note the Maven home path above.
Because of homebrew, to get to Maven's configuration file:

<pre><strong>
cd /usr/local/Cellar/maven/3.2.5/libexec/conf/
subl settings.xml
</strong></pre>

Within the editor, press Ctrl+F to search for <strong>&LT;localRepository&GT;</strong>.

<pre>
&LT;!-- localRepository
|
| Default: ~/.m2/repository
&LT;localRepository>/path/to/local/repo&LT;/localRepository>
-->
&LT;localRepository>/Users/wilsonmar/maven/repo/&LT;/localRepository>
</pre>

Move the --> above the line to activate it and
replace <tt>/path/to/local/repo</tt> to point to where
you want maven to store artifacts on a Mac (substituting your name):

<pre>
/Users/wilsonmar//maven/repo/
</pre>

Create the location of maven repository (substituting your name):

<pre><strong>
cd /Users/wilsonmar
mkdir maven
cd maven
mkdir repo
</strong></pre>


## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
