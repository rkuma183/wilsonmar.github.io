---
layout: post
title: "MacOS setup automation using a bootstrap script and Ansible"
excerpt: "How I setup several Macbooks while I sleep"
tags: [apple, mac, setup, automation]
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

<a id="AutoInstall"></a>

This is the fastest way to configure everything on a Mac for software developement,
specific to what you want installed.

One can <a target="_blank" href="https://www.youtube.com/watch?v=bjgZ93oEZF0">
Set Up OS X For Web Development in 10 Minutes</a>.
Try this for yourself. 
But first on a virtual machine (VMWare Fusion, Vagrant, or Virtualbox).

If you've already run this, <a href="#SelectApps">click here to skip to view and edit the install specifications further down this tutorial</a>.

To automate preparation of third-party software for mass deployment onto managed clients:

   * Autopkg at https://github.com/autopkg/autopkg (requies Git)
   aims to define the steps in a "Recipe" which can be defined in an understood (plist XML-based) format, run automatically instead of by hand, and shared with others.

   * Software distribution server software: <a target="_blank" href="https://github.com/munki/munki">Munki</a> (pronounced like "monkey"), Casper, Absolute Manage, etc. 
   <br /><br />

There are two phases to this:

   1. Phase one - supply your password to install Xcode, <a href="#Homebrew">Homebrew</a>, Tap, and Cask, and Ansible

   2. Phase two - supply your password again for Ansible to install what is not commented out in specification files:

## Dot files and Ansible

   I haven't seen it elsewhere on the internet, so I created an explanation of 
   <a target="_blank" href="https://wilsonmar.github.io/mac-osx-config-dotfiles/">
   MacOS customizations and "dot files" that set them automatically</a>.

0. Copy from below this shell script call (highlight the line, 
   then hold down command and press C to the invisible Clipboard):

   <pre><strong>
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/wilsonmar/ansible-macos-setup/master/install.sh)"
   </strong></pre>

0. Make a folder and navigate into it:

   <pre><strong>
   cd ~
   mkdir gits
   cd gits
   mkdir siyelo
   cd siyelo
   </strong></pre>

   You can create another folder name if you prefer, but folder names in this tutorial will be wrong.

0. In the Terminal window, paste the call from clipboard (hold down command and press V).
0. Press the <strong>enter/return</strong> key to invoke the command which
   causes files to be downloaded and folders created:

   * Xcode
   * <a href="#Homebrew">Homebrew</a>, Tap, and Cask
   * Ansible

   &nbsp;

   The command also downloads folder laptop from
   <a target="_blank" rel="amphtml" href="https://github.com/siyelo/laptop">
   https://github.com/siyelo/laptop</a>

   NOTE: Download and installation is skipped if it's already installed.

0. When <strong>SUDO password:</strong> appears, hold down the <strong>control</strong> key and press C.
   This message should appear (in red):

   "[ERROR]: User interrupted execution
   failed"

0. While still in the Terminal window from above, change to the directory just created:

   <tt><strong>
   cd laptop<br />
   pwd
   </strong></tt>

   You should now be at:

   <pre>
   /Users/mac/gits/siyelo/laptop
   </pre>

   Instead of "mac" above, it would show your account name.

   The <a target="_blank" rel="amphtml" href="https://github.com/siyelo/laptop/blob/master/playbook.yml">
   siyelo playbook.yml</a> file lists the applications to be loaded.

   The <a target="_blank" rel="amphtml" href="https://github.com/siyelo/laptop/blob/master/scripts/system_settings.sh">
   scripts/system_settings.sh</a> file are commands to configure the Mac operating system
   for better security and productivity. It would take hours to set them all manually.

<a name="SelectApps"></a>

### Mac Programs Google Sheet #

Switch to use an internet browser to see my list of programs for Mac OSX at
   <a target="_blank" rel="amphtml" href="https://docs.google.com/spreadsheets/d/15rgbl_C1qX_wyCi1hNoyHEzXpMCTm5DxAAOqTykPVsw/edit?usp=sharing">
   this Google spreadsheet online</a>.

   The <strong>_installer</strong> column identifies the technique to install to install each program named:

   * <a href="#Homebrew">**brew**</a> (formulas) are installed using the <a target="_blank" rel="amphtml" href="http://brew.sh/">brew</a> command.
     Programs installed this way are invoked using a text-based Terminal command-line interface.

   * <a href="#Tap">**tap**</a> uses the `brew tap` command to install a package <strong>within another repository</strong>.
   <a target="_blank" rel="amphtml" href="https://github.com/Homebrew/homebrew/wiki/Interesting-Taps-&-Branches">
   interesting brew tap</a>.

   * <a href="#Cask">**cask**</a> packages are installed using the `brew cask` command which is
     an extension to Homebrew that allows management of applications with a 
     <strong>graphical</strong> user interface (GUI).

   * **pip** are Python plug-ins.
   * <a href="#npm">**npm**</a> are Node modules (such as Express).

   * **store** indicates manual installation using the Apple iTunes program accessing the Apple Store.

   * **zip** programs are installed after a download, requiring an Ansible task to replace manual clicks and data entry.
   <br />

   WARNING: Each program added uses up more disk space.

   WARNING: This may make obsolete documentation based on default Mac settings.

   Ansible configurations are "idempotent", which means that if you run it again, the result is the same.
   With declarative specifications, items specified for install are not re-installed.

The other columns in the spreadsheet:

   _want contains Y for the generator to include in Ansible file.

<a name="Homebrew"></a>

## Homebrew #



<a name="Cask"></a>

## Cask #


<a name="Dotfiles"></a>

## Dotfiles #

<a target="_blank" href="http://dotfiles.github.io/">
GitHub's Dotfiles</a> manage files containing preferences for command-line programs.

For example, the configuration file for Zsh is .zshrc.
The SSH configuration folder is .ssh.
And on.

Such files have a dot because they are hidden.

Famous collections of dotfiles from:

* https://github.com/holman/dotfiles from Zach Holman
* Matthias Bynens
* Paul Irish
* https://github.com/mattstauffer/ohmyzsh-dotfiles

Features added by dotfiles:

   * Color grep output
   * Boost ls commands
   * Adding plugins to vim

### Symlinks #

Symlinks to files allow you to git pull and watch your dotfiles instantly update.

One
stores .ssh-config file in his Dropbox folder which he symlinks:

   <pre>
   touch ~/Dropbox/.ssh-config
   ln -s ~/Dropbox/.ssh-config ~/.ssh/config
   </pre>

The .ssh-config file contains:

<pre>
# My Awesome Web Site
Host awesome
    Hostname 141.141.141.141
    User me_duh
    IdentityFile=/Users/me/.ssh/id_for_awesome_site.rsa
</pre>

The above enables him to invoke:

   <pre><strong>
   ssh awesome
   </strong></pre>

   No more remembering ip addresses, fumbling with command line switches for multiple SSH IDs, or even remembering your ssh usernames.


   * https://mattstauffer.co/blog/setting-up-a-new-os-x-development-machine-part-3-dotfiles-rc-files-and-ssh-config


<a name="EditApps"></a>

## Edit playbook.yml #

0. Use the vi text editor program to edit the file:

   <tt><strong>
   vi ~/gits/siyelo/laptop/playbook.yml
   </strong></tt>

   * To quit without editing type <strong>:q</strong>
   * To save changes type <strong>:wq</strong> (colon, w, and q)
   * To enter insert mode, press I.
   * To escape insert mode, press the Esc key.

   &nbsp;

0. Have a # (pound sign) in front of each package based on your evaluation.

   Click on each link to open a web page about each.
   Some links take you to a section lower in this tutorial.

    NOTE: The playbook.yml file contains code to run the system_settings.sh file.

<a name="EditSettings"></a>

## Edit System Settings #

0. List the files and change directory into the scripts folder:

   <tt><strong>
   ls -al
   cd scripts
   </strong></tt>

   The above list the files and change directory into the scripts folder.

0. Use the vi text editor program to edit the file:

   <tt><strong>
   vi ~/gits/siyelo/laptop/scripts/system_settings.sh
   </strong></tt>

   * To quit without editing type <strong>:q</strong>
   * To save changes type <strong>:wq</strong> (colon, w, and q)

<a href="npm"></a>

## NPM #

0. Search for packages at this site where resources are downloaded for install:

   * <a target="_blank" href="https://www.npmjs.com/package/">
   https://www.npmjs.com/package/generator-webapp</a>

Example:

   <tt><strong>
   npm install -g yo
   </strong></tt>

   The `-g` globally installs for access from any folder.


### Other Ansible Playbooks #

Consider other Ansible playbooks for Mac:

* <a target="_blank" rel="amphtml" href="https://github.com/MWGriffin/ansible-playbooks">
   github.com/MWGriffin/ansible-playbooks</a>
   is one of the first to use Ansible to install Macs.

   The last change was made in 2013.
   It provides playbooks for installation of php and others from zip file
   that may now be available as Homebrew packages.

   It copies from URLS such as https://copy.com/8WKZ3x1ZWOIC/VLC-2.0.6.dmg?download=1
   into the /.ansible-downloads/ folder it creates.

* <a target="_blank" rel="amphtml" href="https://bitbucket.org/samfisher/mac-ansible-provisioning/src/">
     https://bitbucket.org/samfisher/mac-ansible-provisioning/src/</a>

   &nbsp;

* Mr. Jeff Geeling I call "Master of the
   <a target="_blank" rel="amphtml" href="https://github.com/geerlingguy/mac-dev-playbook">
   Ansible Galaxy</a>" because he has contributed both the most downloaded roles and garnered the highest ratings.
   His <a target="_blank" rel="amphtml" href="https://github.com/geerlingguy/mac-dev-playbook">
   mac-dev-playbook</a>
   contains:

{% highlight text %}
|-- LICENSE
|-- README.md
|-- files
|   |-- etc
|   |   `-- sudoers
|   |-- sublime
|   |   `-- Library
|   |       `-- Packages
|   |           `-- User
|   |               |-- DashDoc.sublime-settings
|   |               |-- Package\ Control.sublime-settings
|   |               `-- Preferences.sublime-settings
|   `-- terminal
|       `-- JJG-Term.terminal
|-- inventory
|-- main.yml
|-- requirements.txt
|-- tasks
|   |-- ansible-setup.yml
|   `-- preferences.yml
`-- vars
    `-- main.yml{% endhighlight %}

The <strong>requirements.txt</strong> file specifies files to download from the Ansible Gaxlaxy sharing site.

   * <a target="_blank" rel="amphtml" href="https://github.com/geerlingguy/dotfiles/blob/master/.osx">geerlingguy.dotfiles</a>
      sets up preferences and configurations for all the built-in services and apps.

      It references <a target="_blank" href="http://secrets.blacktree.com/?showapp=com.apple.finder">
      http://secrets.blacktree.com/?showapp=com.apple.finder

   * <a target="_blank" rel="amphtml" href="https://github.com/geerlingguy/homebrew">geerlingguy.homebrew</a>

Use a text editor to edit the <strong>main.yml</strong> file at the root.
Change <strong>user:</strong> value from "jgeeling" to your Mac account name.

{% highlight text %}
---
- hosts: localhost
  user: jgeerling
  connection: local

  vars_files:
    - vars/main.yml

  roles:
    - geerlingguy.homebrew
    - geerlingguy.dotfiles

  tasks:
    - include: tasks/ansible-setup.yml
    - include: tasks/preferences.yml

    # TODO: Use sudo once .osx can be run via root with no user interaction.
    - name: Run .osx dotfiles.
      shell: ~/.osx --no-restart
      changed_when: false{% endhighlight %}


Under the vars folder main.yml file is a list of several Homebrew packages.

<a name="RunAncible"></a>

## Run Installation #

0. Open a Termial, go to the directory:

   <tt><strong>
   cd ~/gits/siyelo/laptop/
   </strong></tt>

0. Run Ansible:

   <tt><strong>
   ansible-playbook playbook.yml -i hosts --ask-sudo-pass -vvvv
   </strong></tt>

0. Press the return key to invoke the command.

0. A restart is needed at the end.

<a name="RemoveApp"></a>

## Remove app #

QUESTION: How to remove apps

## Apple Store programs #

Programs are installed into the Applications folder.
Remember there are two different Applications folders

   * `cd /Applications`

   * `cd ~/Applications` to see programs installed by clicking browser links,
   such as GoToMeeting, etc.

To get rid of GarageBand,

0. In a Terminal, go to where Apple stores its default apps at:

   <pre>
   cd "/Library/Application Support/GarageBand/"
   </pre>

   The quotes are needed because there is a space in the folder name.

0. See how much disk space it takes.

   <pre>
   ls -al
   </pre>

   The number of bytes is to the left of the date:

   <pre>
   -rw-rw-r--   1 root  admin  31211520 Oct 25  2013 Themes.db
   </pre>

0. PROTIP: Delete the contents, but leave the folder name.

   <pre>
   rm -rf *.* /s
   </pre>

## Others like this

The script described here was based on reviews of other similar "Mac booststrap" scripts:

* https://gist.github.com/zeekay/7394565

* https://github.com/fs/osx-bootstrap
  is a setup for Rails developement, including
  http://fs.github.io/fs-tool/
  for creating pull-requests from command line and Ruby in Heroku.

   ImageMagick

* https://github.com/divio/osx-bootstrap
   also asks for RSA keys to GitHub

* <a target="_blank" href="https://github.com/monfresh/laptop">
   https://github.com/monfresh/laptop</a>
   provides a set of shell scripts.



## Resources #

https://code.tutsplus.com/tutorials/setting-up-a-mac-dev-machine-from-zero-to-hero-with-dotfiles--net-35449

To uninstall, select it and press Command+Delete or drag the program into the Trash.

http://osxdaily.com/2014/01/02/delete-garageband-imovie-iphoto-mac-os-x/

http://osxdaily.com/2014/01/01/4-free-os-x-utilities-mac/

https://www.ansible.com/videos-ansiblefest-sf-2016


## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
