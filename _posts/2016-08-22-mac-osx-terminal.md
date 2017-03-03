---
layout: post
title: "MacOS Terminal Command-line"
excerpt: "The terminal is your friend, who only speaks a foreign language."
tags: [apple, mac, setup]
image:
# feature: pic brown wood apple logo 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622035/740efa5c-0584-11e6-9a41-db5b03eaff85.jpg
  credit: Green Coffee Lover
  creditlink: http://www.greencoffeelover.com/wp-content/uploads/2015/03/7.jpg
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This tutorial describes how to make use of Terminal to do stuff
(make your life easier and less frustrating).

{% include _intro.html %}


<a id="Terminalz"></a>

## Open Terminal from Finder Folder #

It's hard to get away from using a command-line terminal.

Since Yosemite, you can open a terminal to a folder listed within Finder 
by positioning mouse on it then tapping with two fingers on the touchpad.

<ol type="1">
<li> Click the Apple icon, System Preferences....</li>
<li> Press K and select Keyboard.</li>
<li> Click Shortcuts, Services.</li>
<li> Scroll to the <strong>Files and Folders</strong> section.</li>
<li> Check on <strong>New Terminal at Folder</strong>.</li>
<li> Close the dialog by clicking the red dot at the upper left corner.</li>
</ol>



Three ways to relaunch the Finder:

0. Hold the Option key and right-click the Finder icon in the Dock, then select Relaunch.

0. Press Command with your right hand and Option-esc with your left hand
   and choose Force Quit from the Apple menu. Then select the Finder and click Relaunch.

0. Log out and log back in to your user account.


<a id="Configz"></a>

## System Preferences 

<ol type="1">
<li> If you don't see the Apple icon at the top of the screen,
move the cursor to the very top of the screen for a few seconds.</li>
<li> Click on the Apple icon at the upper left corner.</li>
<li> Select <strong>System Preferences</strong>.</li>
<li> Click <strong>Displays</strong>.</li>
<li> Set <strong>Resolution</strong> to <strong>Scaled</strong></li>

<li><a href="_blank" href="https://www.esolutions.se/en-GB/test">
Test Page</a> reports the screen and resolution along with browser version.</li>

   The Mac Pro 15 inch retina display is preconfigured to 
   a screen resolution of 1440 wide x 900 high, but a browser window of 1440 x 738.

<li> Click one of the 5 resolutions between <strong>Larger Text</strong> and 
<strong>More Space</strong>.</li>
</ol>


<a id="Microphonez"></a>

## Microphone #

To disable the internal microphone, there is no icon.
So reduce the input volume to 0:

<ol type="1">
<li> Click on the Apple logo at the upper left corner.</li>
<li> Select System Preferences.</li>
<li> Type S and click on <strong>Sound</strong>.</li>
<li> Click on the <strong>Input</strong> tab.</li>
<li> Drag the <strong>Input volume</strong> slider all the way to the left.</li>
<li> Close System Preferences.</li>
</ol>

This works by changing the audio input to the line-in, 
also known as the audio input port on your Mac. 
As long as you don't actually have any audio input device connected, 
such as an external microphone or some other line-in device, 
this method should work.




<a id="Setup_Sound"></a>

## Sound Control #


Until Apple realizes how annoying it is to have that start-up sound on a Mac, 
create in the /Library/Scripts folder shell scripts containing 
osacript (<a target="_blank" rel="amphtml" href="http://en.wikipedia.org/wiki/AppleScript">Applescript</a>a>) commands
to mute sound automatically before reboot, and un-mute after reboot.

0. Open a terminal and type in nano. Press Enter.

   Type this in the nano editor that pops up this shell script (starting with the she-bang #! characters):

   <pre>
   #!/bin/bash
   osascript -e 'set volume with output muted'
   </pre>

0. Press Ctrl+O, then when it asks you for the filename type in 

   <tt>
   ~/Documents/mute.sh
   </tt>

0. Hit Enter to save the file. This puts the mute script in your Documents folder (don't worry, we're going to move it later).

0. Create the unmute.sh script:

   <pre>
   #!/bin/bash
   osascript -e 'set volume without output muted'
   </pre>

   (In older versions the unmute script instead has 

   <tt>set volume with output unmuted</tt>.

0. Press Ctrl+X, press Y to agree, then type in 

   <tt><strong>
   ~/Documents/unmute.sh for the file name. 
   </strong></tt>

0. Hit Return to save the new file, and nano should quit.

0. To make the scripts executable,
   run the following commands in the Terminal, hitting Enter after each one

   <pre>
   sudo chmod u+x ~/Documents/mute.sh
   sudo chmod u+x ~/Documents/unmute.sh
   sudo mv ~/Documents/mute.sh /Library/Scripts/
   sudo mv ~/Documents/unmute.sh /Library/Scripts/
   </pre>

0. Set the scripts to run automatically:

   <pre>
   sudo defaults write com.apple.loginwindow LogoutHook /Library/Scripts/mute.sh
   sudo defaults write com.apple.loginwindow LoginHook /Library/Scripts/unmute.sh
   </pre>

0. Close the Terminal, save data in all other apps, and reboot your machine.

0. To undo the above actions, set defaults in a Terminal window:

   <pre>
   sudo defaults delete com.apple.loginwindow LogoutHook
   sudo defaults delete com.apple.loginwindow LoginHook
   </pre>

For more about Applescript commands and hooks, see
<a target="_blank" rel="amphtml" href="https://developer.apple.com/library/mac/documentation/AppleScript/Conceptual/AppleScriptX/AppleScriptX.html">
this</a>.



<a id="Wallpaperz"></a>

## Desktop Wallpaper Pictures #

Get to the Desktop by spreading thumb and 4 fingers on the touchpad.

Choose a different picture from Preferences 
> desktops/screensaver 
> select your desktop (highlight) 
> press Command and C at he same time. BTW, notice where your picture/photo folders.

Want to add the Windows 10 wallpaper to your desktop?

   Get to folder where system wallpapers are held from the 
   Finder > Go |> Go to Folder >  /Library/Desktop Pictures.

Sort by File Size. 

Some wallpaper images that come with OS X are of Retina resolution: 
<strong>5120x2880</strong>.




<a id="Hosts"></a>

## Hosts file

Mac, Windows, and Linux systems have a hosts file that locally does the work of the public DNS
-- translating host names (typed on browser address field) to IP address numbers.

0. Edit the hosts file on a Mac:

   <pre><strong>
   atom /etc/hosts
   </strong></pre>

   The default contents:

   <pre>
127.0.0.1 localhost
255.255.255.255 broadcasthost
::1 localhost
fe80::1%lo0 localhost
   </pre>

   fe80::1 is like 127.0.0.1 for IPV4, but
   actually 169.254.*.* in IPV4, an address not often used.

   fe80:: is a block of IPV6 addresses reserved for link-local addresses used for packets sent only to directly connected devices (not routed). The network discovery protocol (NDP), which replaces ARP and DHCP in IPv4, is the biggest user of link-local addresses (NDP sorta .

   Each IPV6 interface has a different link-local address starting with fe80:: and (typically) ending with a modified version the interface's MAC address (EUI-64 format) to ensure a unique address on a segment. 

   Programs such as OpenVPN add to the bottom of the file:

   <pre>
# BEGIN section for OpenVPN Client SSL sites
127.94.0.1  client.openvpn.net
# END section for OpenVPN Client SSL sites
   </pre>   

<a id="DNSConfigz"></a>

## DNS Configuration with NameBench #

<a target="_blank" href="http://www.macworld.com/article/2824564/slow-internet-edit-your-dns-settings.html">
Analysis at one time</a> showed this ranking by speed:

<ol type="1">
<li> UltraDNS at 156.154.70.1 </li>
<li> Google at 8.8.4.4, 8.8.8.8</li>
<li> OpenDNS at 208.67.222.222, 208.67.220.220, 208.67.222.220 </li>
</ol>

<a href="_blank" href="https://code.google.com/p/namebench/">
Google Namebench</a> tries the speed of various DNS servers from YOUR machine (which takes some time) and pops up in your browser this:

   <amp-img media="(min-width: 401px)" width="401" height="109"
layout="responsive" src="https://cloud.githubusercontent.com/assets/300046/15806416/10a81d26-2b00-11e6-9bcc-811ea1debc07.jpg"></amp-img>

<ol type="1">
<li> If you don't see the Apple icon at the top of the screen,
move the cursor to the very top of the screen for a few seconds.</li>
<li> Click on the Apple icon at the upper left corner.</li>
<li> Select <strong>System Preferences</strong>.</li>
<li> Click <strong>Network</strong>.</li>
<li> Click <strong>Advanced</strong>.</li>
<li> Click <strong>DNS</strong>.</li>
<li> Click <strong>[+]</strong>, copy, and paste </li>
</ol>

An example:

<ol type="1">
<li> 205.171.3.65 </li>
<li> 216.146.35.35 </li>
<li> 192.168.0.1 </li>
</ol>

Flush the DNS cache since OSX 10.9 :

   <tt><strong>
   sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
   </strong></tt>

Previously, OSX 10.7 and 10.8, only the killall was needed.

Previous to that, OSX 10.5 and 10.6, only the decacheutil was needed, without the sudo.

BTW, the equivalent for Ubuntu is `sudo service network-manager restart`
while other Linux flavors uses `sudo /etc/init.d/nscd restart`.
Windows uses `ipconfig /flushdns`.



<a id="HotCornerz"></a>

## Cursor to Screen Hot Corners #

By default, if you move the mouse to one of the corners of the screen,
stuff happens. It can be annoying.

0. Click the Apple menu at the upper left corner.
0. Select System Preferences.
0. Select Desktop &amp; Screen Saver.
0. Click Hot Corners at the lower-right corner.
   
   <amp-img media="(min-width: 320px)" width="320" height="118" 
layout="responsive" src="https://cloud.githubusercontent.com/assets/300046/14206160/5a816098-f7ce-11e5-8e9c-eb5c06d3b2ad.jpg"></amp-img><!-- http://merc.tv/img/scr/mac_10.10_hot_corners.jpg" -->

ADVICE:
I disabled each by selecting the dash (last choice) 
because they show up when I don't want them.





<a id="TerminalPingHostz"></a>

### Terminal Ping Host #

Find the IP address of a website host name:

<pre><strong>host microsoft.com</strong></pre>

<pre>
microsoft.com has address 134.170.185.46
microsoft.com has address 134.170.188.221
microsoft.com mail is handled by 10 microsoft-com.mail.protection.outlook.com.
</pre>




<a id="Terminal_file_listing"></a>

## Terminal File Listing Home Folder #

By default, the terminal shows the hard drive and lowest level file folder name, 
in white letters over black.

To show the present (current) working directory (folder):

<tt><strong>
pwd
</strong></tt>

The response for me is:

<tt><strong>
/Users/wilsonmar
</strong></tt>

You will of course have a different machine user name than wilsonmar.

To get back to this <strong>home</strong> folder:

<tt><strong>
cd ~/
</strong></tt>

To list all file names (without any metadata):

<tt><strong>
ls
</strong></tt>

Folders available by default include Documents, Downloads, Pictures, Desktop, Music, Movies.


To dive into a folder type:

<tt><strong>
cd mu
</strong></tt>

Press Enter.

Nothing happens because upper case letters are important.
Press delete to remove the mu and type:

<tt><strong>
cd Mu
</strong></tt>

Press Enter for the Music folder.

Go back up a level:

<tt><strong>
cd ..
</strong></tt>

To list all files with their permission settings:

<tt><strong>
ls -ls
</strong></tt>

Notice that no hidden files are listed.
To list all <strong>hidden</strong> files with permission settings,
piping the listing to more instead of having results flying by:

<tt><strong>
ls -la ~/ | more
</strong></tt>

A colon appears at the bottom if there is more to show. 

To cancel the listing, press <strong>control + C</strong>.

Notice the .bashrc on the first page, something like:

<tt>
-rw-r--r--  1 discworld discworld  3330 Mar 10 16:03 .bashrc
</tt>

(It's for the <a href="#BashShell">Bash Shell</a>.)


If it's not listed, create it with:

<tt><strong>
vi ~/.bashrc
</strong></tt>

To make it rw r r:

<tt><strong>
chmod 644 .bashrc 
</strong></tt>

List only hidden files in the current folder:

<tt><strong>
ls -ld .??*
</strong></tt>

Create a Projects folder to hold projects downloaded from 
<a href="#Setup_Github">Github</a>:

<tt><strong>
mkdir Projects
</strong></tt>

This only needs to be done once.

<a id="ShowHiddenInFinderz"></a>

## Show Hidden Invisible Files in Finder #

By default, the Mac's Finder does not show hidden files.

0. Close all Finder folders. 

0. Enter this in Terminal before typing Return:

   <tt><strong>
   defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder
   </strong></tt>

   This causes all Finder windows to be reset.

   To make invisible files invisible again:

   <tt><strong>
   defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder
   </strong></tt>

   A description of each keyword:

   **defaults** - OSX's command to change defaults, apple's low-level preference system.

   **write** - tells defaults you want to change a preference, or write it

   **com.apple.finder** - defaults that the application's preferences you want to change is Finder, specified by the application's bundle identifier.

   **AppleShowAllFiles** - specifies which preference you want to change within the application.

   **TRUE or FALSE** - the value you want to set the preference to. In this case, it is a boolean, so the values must be TRUE or FALSE. I think you might be able to use YES or NO, but I'm not sure.

   **&&** - a terminal operator to run whatever's after this if the previous command is successful.

   **killall** - kills processes or closes applications.

   **Finder** - specifies the process or application to close.


### Create Terminal Aliases #

Most developers leave files un-hidden.
But if you want to just type <strong>showFiles</strong> and <strong>hideFiles</strong> 
to show and hide Mac OS X’s hidden files, consider
<a target="_blank" rel="amphtml" href="http://ianlunn.co.uk/articles/quickly-showhide-hidden-files-mac-os-x-mavericks/">
this article</a> to create such terminal aliases.

An example is an alias for the tree command by adding
this in the ~/.bash_profile script:

   <pre>
   alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
   </pre>

Alternately:

### Brew install tree #

OSX does not come with the tree command that many other Linux distributions provide.
So add it using brew:

   <tt><strong>brew install tree</strong></tt>

Active Terminal sessions need to be closed so new Terminal | Shell | New Window | Shell has this activated.

See list of parameters:

   <tt><strong>tree \-\-help</strong></tt>

List only 2 levels deep with human-readable file size kilobytes and sort by last modified date:

   <tt><strong>tree -L 2 -s -h -p -D -t</strong></tt>


<a id="BashConfigz"></a>

## Bash Profile Configuration #

The profile file is run during <strong>boot-up</strong>
to configure the terminal 
to define file path, shims, and autocompletion handlers.

This is the single biggest frustration with people using Linux on Mac.


One of the earliest articles on bash at
http://www.macdevcenter.com/pub/a/mac/2004/02/24/bash.html
shows shell variables, environment variables, and aliases.

Each operating system has its own file name for its profile:

<ul>	
<li> With Ubuntu: Modify ~/.profile instead of ~/.bash_profile.</li>
<li> With Zsh: Modify ~/.zshrc file instead of ~/.bash_profile.</li>
<li> With Fish: Modify `~/.conf/fish/config.sh` to append.</li>
</ul>

If there is both a .bash_profile and a .profile file, boot-up only executes the first one it finds.

On my Yosemite Mac, open a terminal and:

<pre><strong>
cd ~
</strong></pre>

View the file using the vi editor that comes with OSX:

<pre><strong>
vi .bash_profile
</strong></pre>

According to the <a target="_blank" rel="amphtml" href="http://linux.die.net/man/1/bash">
bash man page</a>, 
.bash_profile is executed during <strong>login</strong> before the command prompt,
while .bashrc is executed for interactive non-login shells such as
when you start a new bash instance by typing /bin/bash in a terminal.

Here's what my profile file begins:

<pre>
echo ".profile"
export NVM_DIR="/Users/wilsonmar/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH=/Library/Frameworks/Python.framework/Versions/3.4/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
</pre>

Exit vi by typing <tt>:q</tt>


Some installers request that adding a $PATH using a command such as:

<pre>
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
</pre>

To execute profile with the changes:

<pre><strong>
source  ~/.bash_profile
</strong></pre>

Alternately, to install GHC copy and paste into ~/.bash_profile:

<pre>
# Add GHC 7.8.4 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Users/wilsonmar/Applications/ghc-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi
</pre>

https://github.com/gcuisinier/jenv/blob/master/README.md




<a id="Terminalz"></a>

## Terminal Usage #

This page contains notes for system administrators and developers,
who need to control Macs below the UI level, which require
typing commands into a command-line terminal screen.

To list open files (process id's and ports, actually):

<tt><strong>
sudo lsof -i -P
</strong></tt>

To avoid text wrapping, pull the right edge to expand the screen width.

The right-most column heading &quot;Name&quot; shows the port
(either TCP or UDP).

To filter a particular port number:

<tt><strong>
sudo lsof -i -P | grep 8080
</strong></tt>

The second column, PID, lists the process identifier.
Copy a number for use in the kill command:

<tt><strong>sudo kill 289</strong></tt>



<a id="OSKernelz"></a>

## Operating System Kernel #

I can use Linux commands in my version of the operating system:

<tt><strong>uname -a</strong></tt> (a for all) or 
<tt><strong>uname -rvm</strong></tt> 

returns:

<tt>14.3.0 Darwin Kernel Version 14.3.0: Mon Mar 23 11:59:05 PDT 2015; root:xnu-2782.20.48~5/RELEASE_X86_64 x86_64</tt>

which is a combination of:

<tt><strong>uname -r</strong></tt> for release number,
<br /><tt><strong>uname -v</strong></tt> for kernel version,
<br /><tt><strong>uname -m</strong></tt> for model:

<tt>x86_64</tt> for Intel or AMD 64-bit or
<br /><tt>i*86</tt> for 32-bit.

For more information about Darwin operating system
developed at Apple, see:

* http://www.wikiwand.com/en/XNU and
* https://www.wikiwand.com/en/Comparison_of_operating_system_kernels

NOTE: <tt><strong>lsb_release -a</strong></tt>
which works on Debian, RHEL 6.6, and Ubuntu 
is not recognized on Gentoo nor CentOS 6,
which has no folder /etc/lsb-release.

Distriwatch.com describes releases.




<a id="Setup_Mac"></a>

## Setup Your Mac Like a Pro #

Paul Irish is one of top pros among developers, and now a Google Evangelist.
He put his Mac configuration settings on
<a target="_blank" rel="amphtml" href="https://github.com/paulirish/dotfiles">
github.com/paulirish/dotfiles</a>. But he recommends cloning 
<a target="_blank" rel="amphtml" href="https://github.com/mathiasbynens/dotfiles/">
github.com/mathiasbynens/dotfiles/</a>.

On the Git page notice that he has established an industry convention of using
<strong>Projects</strong> folder we defined earlier.

On the Git page I clicked on <strong>Clone in Desktop</strong>.

The library is called dotfiles because that's what hidden files are called,
and most configuration files are hidden.	



<a id="Edit_Terminal_setting"></a>

## Edit terminal prompt setting #

<div class="sidenote">
Paul Irish offers his setup-a-new-machine.sh at
https://github.com/paulirish/dotfiles

ZShell (included with Mac and can be set as the default in Terminal)
* oh-my-zsh as a ZShell framework
* The oh-my-zsh Git plugin
* And the oh-my-zsh theme called jnroweï»¿
</p></div>

By default, if you have a long file name, it would leave little room to type in commands before it wraps to the next line.

<a target="_blank" rel="amphtml" href="http://code.tutsplus.com/tutorials/how-to-customize-the-command-prompt--net-20586">
To redefine what appears in the prompt</a>,
edit this file using the vi editor that comes with each Mac:
<tt>
vi .bashrc 
</tt>
Copy this and paste to the bottom of the .bashrc file:
<pre>
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White

bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White

unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White

bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White

txtrst='\e[0m'    # Text Reset

print_before_the_prompt () {
printf "\n $txtred%s: $bldgrn%s \n$txtrst" "$USER" "$PWD"
} 
PROMPT_COMMAND=print_before_the_prompt
PS1='->'
</pre>
The command above uses global parameters $USER and $PWD,
plus <a target="_blank" rel="amphtml" href="https://wiki.archlinux.org/index.php/Color_Bash_Prompt#List_of_colors_for_prompt_and_Bash">
colors from this list</a>.

Exit from the Terminal shell:
<tt>
exit
</tt>




<a id="EnvVarz"></a>

## Environment Variables


Like on PCs, the PATH environment variable stores
where the operating system should look to find
a particular program to execute.

A big reason to use a command-line terminal is to set environment variables.

To see what is already defined:

<tt><strong>export</strong></tt>

http://stackoverflow.com/questions/135688/setting-environment-variables-in-os-x
talks about setting <strong>launchd.conf</strong> and rebooting.
This applies to all users.


To see what was already defined:

<tt><strong>echo $PATH</strong></tt>

$PATH must be upper case.

The response I'm getting is:

<tt>
/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
</tt>


<a id="RootSudoz"></a>

## Root user for sudo commands

The root user has the ability to relocate or remove required system files and to introduce new files in locations that are protected from other users.

Any user with an administrator account can become the root user or reset the root password.
A root user has the ability to access other users' files.

Under a Unix system like Mac OS X you must have "root" (administrative) privileges to start IP-services using ports smaller than 1024.

After Mac install, the root or superuser account is not enabled. 
While it is possible to enable the root account, 
once enabled, if forgetten, you'll have to 
<a target="_blank" rel="amphtml" href="http://danfrakes.com/2014/10/16/how-to-make-a-bootable-yosemite-installer-drive/">
reboot from the installer drive</a> (a hassle).

It is safer and easier to use the sudo command to gain temporary root access to the system.

DOTHIS: 
In a Terminal window invoke:

<tt>sudo -s</tt>
After I type in my password, the response for me is the version of bash:

<tt>bash-3.2# </tt>

to demote out of root:

<tt>exit</tt>

DO THIS:
The folders that bash looks into are:

<tt>/bin/echo $PATH</tt>

On a fresh Yosemite, its:

<tt>/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin</tt>

Each additional app adds to the front of the list:

<tt>
/Library/Frameworks/Python.framework/Versions/3.4/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
</tt>

Separating the folders between colon separator:

<ul>
<li>/Library/Frameworks/Python.framework/Versions/3.4/bin</li>
<li>/opt/local/bin</li>
<li>/opt/local/sbin</li>
<li>/Applications/MAMP/bin/php5/bin</li>
<li>/Applications/MAMP/Library/bin</li>
<li>/Applications/Adobe AIR SDK/bin</li>

<li>/usr/local/bin</li>
<li>/usr/bin</li>
<li>/bin</li>
<li>/usr/sbin</li>
<li>/sbin</li>
</ul>

New folders are added to the front of the PATH using a command such as:

<tt>
export PATH=&LT;new folders>:$PATH
</tt>

Depending on how you're setup, file ~/.profile or ~/.bash_profile or ~/.bash_login 
contains the path echo'd.

Or your PATH may be set in /etc/profile for all users

Clear the terminal history:

<strong>clear</strong>



<a id="Spotlightz"></a>

## Spotlight on Network Utility to List Ports

Apple's <strong>Spotlight</strong> is like Window's Search omni-box.
Press <strong>Command+Spacebar</strong>. 

<!-- From http://osxdaily.com/2014/05/20/port-scanner-mac-network-utility/
-->
Type the name of utilities that are buried, such as
<strong>Network Utility</strong>.

Click the keyboard return/enter key to launch the Network Utility app.

Select the &quot;Port Scan&quot; tab.

Enter the IP (such as 127.0.0.1), localhost, or domain name 
you wish to scan for open ports.

Choose <strong>scan</strong> to see what ports the server responds to.


<a id="Browserz"></a>

## Create Windows-like shortcuts with parameters using text editor

http://www.jesseweb.com/coding/automator/create-windows-like-shortcuts-with-parameters/

Mac OSX doesn't allow you to create shortcuts like Windows.
OSX alias don't allow parameters (ex. create a Screen Sharing shortcut that connects to a specific computer). 

Jessie suggests <a target="_blank" rel="amphtml" href="http://www.jesseweb.com/coding/automator/create-windows-like-shortcuts-with-parameters/"> 
this</a> to create a Windows like shortcut with parameters in the Comments field.

<a target="_blank" rel="amphtml" href="http://hints.macworld.com/article.php?story=20040111200114634">
Another alternative</a>
is to use a text editor to create URL shortcut files
like the ones Windows Internet Explorer stores its bookmarks. 
Apple Safari recognizes them when clicked within Finder.
So they are cross-platform.

<ol type="1">
<li> Copy the URL to the clipboard by pressing Command+C.</li>
<li> From within a text editor, open a new text file.</li>
<li> Type at the top of the file: 

<tt>[InternetShortcut]<br />
URL=</tt>
</li>
<li> Paste from clipboard by pressing Command+V</li>
<li> Press enter/return to add a blank line under the URL line.</li>
<li> Save the file with a .url file extension.</li>
<li> From within Finder, click on the file to see it display by Safari.</li>
</ol>




<a id="MountDmg"></a>

### Mount .dmg files using hdiutil tool

.dmg (Disk Image) files can be mounted from the command line:

<tt><strong>
hdiutil attach /path/to/diskimage.dmg
</strong></tt>

The response is like:

<pre>
/dev/disk1 Apple_partition_scheme
/dev/disk1s1 Apple_partition_map
/dev/disk1s2 Apple_HFS /Volumes/Mounted Disk Image
</pre>

Note the disk from the message above to unmount (detatch):

<tt><strong>
hdiutil detach /dev/disk1s2
</strong></tt>

The same utility can mount .iso images:

<tt><strong>
hdiutil mount sample.iso
</strong></tt>




<a id="DNSClearz"></a>

## Clear DNS Cache Cache

<a index="_blank" href="http://coolestguidesontheplanet.com/clear-the-local-dns-cache-in-osx/">
Different commands</a> are needed for different versions of OS.
<strong>OSX 10.10</strong> added requirement for sudo when using the 
built-in discoveryutil:

<tt>sudo discoveryutil udnsflushcaches</tt>

<strong>OSX 10.9</strong>

<tt>dscacheutil -flushcache;<br />
sudo killall -HUP mDNSResponder</tt>

<strong>OSX 10.7  to 10.8</strong>

<tt>sudo killall -HUP mDNSResponder</tt>

<strong>OSX 10.5 to 10.6</strong>

<tt>sudo dscacheutil -flushcache</tt>

<strong>Windows</strong> by contrast:

<tt>ipconfig /flushdns</tt>

<strong>Linux (depending on the flavor running)</strong>

<tt>/etc/init.d/named restart<br />
/etc/init.d/nscd restart</tt>




<a id="HardDrivez"></a>

## Hard Drives on Mac

DOTHIS: Open a Terminal window to invoke:

<tt>diskutil list</tt>

This lists <strong>physical and virtual disks</strong>. 

&quot;0:&quot; and other such numbers are <strong>partitions</strong>.

DOTHIS: In a Terminal window invoke:

<tt>diskutil info /dev/disk0</tt>

The "Device / Media Name" is the partition label from the disk's partition map 
(GPT - GUID Partition Table).
<strong>disk0</strong> Device Media Name: such as &quot;APPLE SSD SM768E Media&quot;
is the make and model of your drive.

Device / Media Names are set when a partition is created on a disk. The only way you could rename the "startup partition" would be to startup from another drive. The initial name is set by Apple.
(which Apple does not expected people to change
and does not reference them at the CLI or GUI level).

AOTW, Apple sells SD drives up to 750.4 GB.

Notice that <strong>disk1</strong> is a <strong>Logical Volume on disk0s2</strong>
with a GUID referencing disk0.

DOTHIS: In a Terminal window invoke:

<tt>diskutil info /dev/disk0s2</tt>

<strong>disk0s1</strong>: "EFI system partition"

contains extended firmware for your drive.



DOTHIS: In a Terminal window invoke:

<tt>diskutil info /dev/disk0s1</tt>

<strong>disk0s1</strong>: "EFI system partition"
<br />
contains extended firmware for your drive.


<strong>disk0s2</strong>: "Customer" to diskutil
is where your files are stored.

DOTHIS: In a Terminal window invoke:<br />

<tt>diskutil info /dev/disk1</tt>

appears on the Desktop as &quot;Macintosh HD&quot; system partition, 
which can be changed by pressing Return key after clicking on it.

<strong>disk0s3</strong>: "Recovery HD"
is a clean install of the OS to make restoring your computer easier.

If you add your own custom partition to the mix you will find that Apple's tools (i.e. Disk Utility) will match the visible name and the device name.



DOTHIS: Plug in a <strong>Time Machine</strong> drive. 
In a Terminal window invoke:

   <pre><strong>
   diskutil info /dev/disk2
   </strong></pre>

In the list it would have 3 partitions:

0: Apple_partition_scheme<br />

1: Windows_FAT_32

2: Apple_HFS



DOTHIS: Plug in a <strong>SD card</strong>. 
In a Terminal window invoke:

   <pre><strong>
   diskutil list
   </strong></pre>

In the list it would have 2 partitions:

0: FDISK_partition_scheme

1: Windows_NTFS

In a Terminal window invoke:

   <tt>diskutil info /dev/disk3</tt>


DOTHIS: 
Plug in an <strong>external drive</strong>. 
In a Terminal window invoke:

   <tt>diskutil list</tt>

In the list it would have 2 partitions:

0: FDisk_partition_scheme

1: Windows_NTFS Seagate Backup Plus ...

DOTHIS: 
In a Terminal window invoke:

   <tt>diskutil info /dev/disk5</tt>

&quot;Seagate BUP Slim SL Media&quot;

According to 
http://osxdaily.com/2014/03/20/mount-ext-linux-file-system-mac/">
http://sourceforge.net/projects/osxfuse/files/osxfuse-2.7.5/osxfuse-2.7.5.dmg/download">
OSX Fuse</p> 
extend OS X's native file handling capabilities via third-party file systems
such as ext4.

fstab -- static information about filesystems.



<a id="PartitionTablez"></a>

## Hard Drive Partition Tables

DOTHIS: 
To show partition tables for a particular disk:
In a Terminal window invoke:

   <tt>sudo get show /dev/disk0</tt>

Eject the disk from the Finder (or use the unmount terminal command if you'd like). If you don't do this, you may get a Resource busy error message during the following step.

CAUTION:
Change the partition label as desired:

   <pre><strong>
   sudo gpt label -i 2 -l "My New Partition Label" /dev/rdisk0
   </strong></pre>

(replace disk0 with the relevant disk number
and replace 2 with the index number.


<a id="App"></a>

## Disk Space Usage #

<a target="_blank" href="https://medium.com/@thomasdegry/how-sketch-took-over-200gb-of-our-macbooks-cb7dd10c8163">
One of the folks at Sketch (the Mac photo-editing tool) noticed</a> that 
Daisy Disk didn't map all the disk space usage.

To reveal disk usage by a file that Apple Lion uses to store copies of files to revert to any version:

   <pre><strong>
   sudo du -sh /.DocumentRevisions-V100
   </strong></pre>

Resetting to zero would involve re-installs.

If you use an alternative backup such as Dropbox, 
you can turn it off for a particular program:

   <pre><strong>
   defaults write -app ‘sketch’ ApplePersistence -bool no
   </strong></pre>


<a id="DevFolderz"></a>

## Folders accessed by developers

DOTHIS: 
In Finder, select from the left panel the first item under the 
<strong>Devices</strong> list.

Click on <strong>Macintosh HD</strong>.

<ul>
<li><strong>Applications</strong> hold apps installed.</li>
<li><strong>Incompatible Software</strong> hold apps which cannot be installed,
such as Amazon Kindle, which competes with Apple's iBooks.
This occured during upgrade to Yosemite.</li>
<li><strong>Library/Library</strong> holds Apple internal apps.</li>
<li><strong>System</strong> hold apps installed.</li>
<li><strong>Users</strong> hold data for each user defined,
as well as a Shared folder accessible by all users.</li>
</ul>

DOTHIS:
Click on your username (wilsonmar in my case).
This action is the same as clicking on the last default item under the
Favorites list.

Many WordPress developers prefer to add a folder named <strong>Sites</strong>
which holds the wordpress folder expanded from download.



<a id="Curlz"></a>
## IPv6 compatibility with Curl command line apps #

<tt>
curl http://localhost:3000
</tt>

When invoked on Mac OS 10.10 (Yosemite), you need to add a parameter
to make the request using IPv4:

<tt>
curl http://localhost:3000 <strong>--ipv4</strong>
</tt>

Otherwise, you will see an error message such as:

<tt>
curl: (7) Failed to connect to localhost port 3000: Connection refused
</tt>

even if the URL loads fine in a browser.

This occurs because curl, being under Yosemite, uses IPv6 by default but
some apps, such as LoopBack.io, by default uses IP v4.

See if you see IP v6 entries in your hosts file (::1 localhost, fe80::1%lo0 localhost).
If they are there it is likely that curl is making requests using IP v6. 

You can make your LoopBack app use IPv6 by specifying an IPv6 address as shown below:

<pre>
app.start = function() {
// start the web server
return app.listen(3000, '::1',function() {
app.emit('started');
console.log('Web server listening at: %s', app.get('url'));
});
};
</pre>


## VMWare Fusion #

To create a Windows 10 instance within VMWare Fusion: 

0. Download the ISO file from:

    https://www.microsoft.com/en-us/software-download/windows10ISO

0. Within VMWare Fusion, select File | New.
0. Drag the ISO file and drop on the dialog.
0. Supply the license key.

<a name="ElCapitanSIP"></a>

## Disable System Integrity Protection #

Some programs make calls to the operating system which OSX began to see as a threat, beginning with El Capitan.

<a target="_blank" href="https://support.apple.com/en-us/HT204899/">
Apple says</a> System Integrity Protection blocks code injection (and many other things).

But what about useful programs (such as 
<a target="_blank" href="https://www.trankynam.com/xtrafinder/sip.html">
XtraFinder</a>)
which works by injecting its code into Finder and other application processes?

   * For example, OpenVPN issues a JSONDialog Error "DynamicClientBase: JSONDialog: Error running jsondialog".

To get around this, you need to partially disable System Integrity Protection in OS X El Capitan.

See <a target="_blank" href="https://developer.apple.com/library/prerelease/mac/documentation/Security/Conceptual/System_Integrity_Protection_Guide/ConfiguringSystemIntegrityProtection/ConfiguringSystemIntegrityProtection.html">
Apple's article</a> on how:

0. Run a full backup to an external USB drive.
0. Shut down all apps, then the operating system (from the Apple icon).
0. Reboot the Mac. 

   This is needed because System Integrity Protection settings are stored in NVRAM on each individual Mac.
   So it can only be modified from the recovery environment running in NVRAM.

0. Boot OS X into Recovery Mode: hold down the <strong>command + R</strong> keys simultaneously after you hear the startup chime.
0. When the <strong>OS X Utilities</strong> screen appears, pull down the Utilities menu at the top of the screen.

   <amp-img width="650" height="250" alt="scr mac osx reboot" src="https://cloud.githubusercontent.com/assets/300046/15366780/2b09aaca-1ce3-11e6-92e1-7f44ccc54b5d.png">
   </amp-img>

0. Choose Terminal.
0. Type the following command into the terminal before hitting the return key.

   ```
   csrutil disable; reboot
   ```

0. For XtraFinder:

   ```
   csrutil enable \-\-without debug
   ```

0. To revert SIP to original state:

   ```
   csrutil clear
   ```



## Skill Certification #

<a target="_blank" rel="amphtml" href="https://app.pluralsight.com/library/courses/mac-osx-support-installation-configuration/table-of-contents">
Video course Mac OS X Support: Installation and Configure</a>
is the first of courses on Plurasight toward
Apple Certified Support Professional (ACSP)


<a href="#DotFileRepos">

## Dotfile Settings from others #

* https://github.com/afranken/dotfiles
* https://github.com/mathiasbynens/dotfiles


## Daemons and Agents #

* https://developer.apple.com/library/mac/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html


## Resources:

* https://www.hamsterpad.com/chat/typescriptpdx
   Typescript Slack group

## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
