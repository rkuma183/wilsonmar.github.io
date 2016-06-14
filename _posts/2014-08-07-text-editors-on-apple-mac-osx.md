---
layout: post
title: "Text Editors on Mac OSX"
excerpt: "One second saved per minute = 1.666% better living"
tags: [apple, mac, setup]
image:
# feature: pic RichTextEditorToolBar 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622140/227572b0-0585-11e6-8d8c-55c1faa4fd68.jpg
  credit: MH Education
  creditlink: http://highered.mheducation.com/sites/0000065899/student_view0/question_editor/rich_text_editor_toolbar.html
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

There is not shortage to the number of programs available to edit code.

Built-in OSX:

   * <a href="#vim">vim</a>
   * <a href="#pico">pico</a>

Free:

   * <a href="#atom">Atom</a> from GitHub (free)
   * Microsoft Code (free)
   * Adobe Brackets http://brackets.io on Windows too
   * http://barebones.com/products/textwrangler is the
     little brother to BBEdit.

Licensed nagware:

   * $89 <a href="#SublimeTextz">Sublime Text</a>
   * There is no equivalent of Notepad++ on Windows

Free IDEs:

   * Aptana Studio
   * NetBeans
   * Visual Studio Express from Microsoft

Licensed IDEs:

   * IntelliJ and WebStorm and PhpStorm from JetBrains
   * Visual Studio from Microsoft

<hr />

<a name="Features"></a>

## Features #

* Markdown display
* Code completion
* Pre-compile on the fly
* Static code scan on the fly
* Full project navigation
* Refactoring (renaming) support
* Debugging

<a name="vim"></a>

## Vim

To edit the file executed upon opening a command-line Terminal:

   <strong>vim ~/.bash_profile</strong>

To get out of VIM, type:

   <pre>
   :q to quit (short for :quit)
   :q! to quit without saving (short for :quit!)
   :wq to write and quit (think write and quit)
   :x to write and quit (shorter than :wq)
   :qa to quit all (short for :quitall)
   </pre>


<a name="pico"></a>

## pico

According to <a target="_blank" href="https://en.wikipedia.org/wiki/Pico_%28text_editor%29">
Wikipedia</a>, pico stands for "pine composer".

   ![pico menu 75](https://cloud.githubusercontent.com/assets/300046/15268678/21302782-19a4-11e6-9f8d-873c5a3073e4.jpg)

The ^ character means hold down the <strong>control</strong> key while you press the character.

<a id="SublimeTextz"></a>

## Sublime Text

Many tutorials make use of this tool.

There are two simultaneous production versions of Sublime Text: 2 and 3.

### Download and Install Sublime Text

* <a target="_blank" href="https://www.sublimetext.com/3">https://www.sublimetext.com/3</a>
   is recommended even though it's labeled "beta" because desirable packages are being written for it.

* <a target="_blank" href="https://www.sublimetext.com/2">https://www.sublimetext.com/2</a>

Expanded explanations for various platforms:

* http://docs.sublimetext.info/en/latest/getting_started/install.html

* On Linux: https://github.com/TCattd/sublime-text-linux-installer

### Configure for command-line invocation

To use the Sublime Text text editor from the command line,
make a symlink to subl.

0. If you don't have a folder <strong>/usr/local/bin/</strong>, create it.

   <pre>
   mkdir /usr/local/bin/
   ls
   </pre>

0. Assuming you've placed Sublime Text in the Applications folder:

   <pre><strong>
   sudo ln -s "/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
   </strong></pre>

0. To use Sublime Text as the editor for many commands that prompt for input,
   set your EDITOR environment variable:

   <pre><strong>
   export EDITOR='subl -w'
   </strong></pre>

   Specifying -w causes the subl command to not exit until the file is closed.

0. Use the Sublime text editor to open the profile file:

   <pre><strong>subl ~/.bash_profile</strong></pre>


### Install Package Control

One advantage of Sublime Text is its plug-ins.

0. Switch to an internet browser to visit
   <a target="_blank" href="https://sublime.wbond.net/">Package Control home page</a>.
0. Click Browse at the upper right for the most popular:

   * Emmet for keyboard shortcuts
   * SideBarEnhancements
   * SublimeLinter to find typos
   * Theme - Soda to look better
   * SFTP to transfer files from within the editor UI.

0. Click the <strong>Popular</strong> heading for a list with more detail.

0. Visit <a target="_blank" href="https://sublime.wbond.net/">Package Control home page</a>.

0. Open SublimeText 3.
0. If not already installed, see <a target="_blank" href="https://packagecontrol.io/installation#st3">
   https://packagecontrol.io/installation#st3</a>
0. Select your version of Sublime you have open.
0. Double-click on the command text to select it.
0. Press Ctrl+C to copy the command into the operating system's invisible clipboard.
0. Switch back to SublimeText (press Command+Tab).

0. Bring up Sublime's command-line <strong>Console</strong> by using the
   <strong>control+`</strong> (back-tick) shortcut or click menu View > Show Console.

   NOTE: The Console recognizes <strong>Python</strong> code.

0. Paste the command and press Enter.

   This creates the Installed Packages/ folder.

   If you get `IndentationError: unexpected indent` ???

0. Press `control+` again to remove the Console.
0. Restart Sublime Text.

### Use Package Control

0. Press <strong>Cmd+Shift+P</strong> to bring command palette in front.

   <img width="401" alt="scr sublime text 3 package manager" src="https://cloud.githubusercontent.com/assets/300046/15268029/c69a6dc8-198f-11e6-8860-7c8ccba65cef.png">

   The position from the previous action is remembered.

0. Type <strong>pac</strong> for Package Control. (Press Esc to dismiss it)
0. Select <strong>Install Package</strong>.

   NOTE: This may take a few seconds to bring up a list from a website visited above.

   <img width="469" alt="scr sublime text 3 package manager packages" src="https://cloud.githubusercontent.com/assets/300046/15268227/3c23493e-1995-11e6-983b-32fd4f708e76.png">

0. Type in a package name and press Enter to install it:

   <a target="_blank" href="https://packagecontrol.io/packages/Sublime%20Tutor">Sublime Tutor</a>

   (This is similar in operation to the Vim Tutor.)

0. Read more about SublimeText:

   <a target="_blank" href="http://sublimetexttips.com/">http://sublimetexttips.com</a>

   <a target="_blank" href="https://app.pluralsight.com/library/courses/sublime-text-3-from-scratch/table-of-contents">
   Sublime Text 3 From Scratch</a> 1h 42m video released 29 Oct 2013
   by <a target="_blank" href="http://www.jesseliberty.com/">Jesse Liberty</a>
   (<a target="_blank" href="https://www.twitter.com/jesseliberty/">@JesseLiberty</a>)

<a id="Git_Editor"></a>

## Git Editor


If Git finds conflicts, it needs a way to show the differences in a text editor.

Git uses the default vim editor.
To quit the page, press <strong>:q!</strong> (colon to specify a command, q to specify quit, exclaimation point for immediate).

Sublime Text is a popular text editor.

https://help.github.com/articles/associating-text-editors-with-git/




<a id="IntelliJ"></a>

## IntelliJ Control Key Shortcuts


During initial configuration, specify the Project SDK
using the command up-arrow to the secret portal:

<ol type="1">
<li> Click New button </li>
<li> Select JDK </li>
<li> Click on the folder list (containing bin, etc.)</li>
<li> Press <strong> command + up arrow </strong>
to <strong> navigate up a folder level</strong>
from Home to the **MacOS** folder. </li>
<li> Click Choose to select the Java associated
with the system. This is called the "Secret Portal" approach.</li>
</ol>

Defaults changeable in Preferences | Keymaps

command + G to Generate
<br />
command + O to go to class
<br />
command + &#9003; Delete line

* http://symbolcodes.tlt.psu.edu/keyboards/charpalosx.html


<a name="#atom"></a>

## Atom

0. Use an internet browser to <a target="_blank" href="https://atom.io/">atom.io</a>

   The site recognizes your operating system (OS X, Windows, or Linux)
   and presents the appropriate download button.

   Atom has package control, themes, auto-completion built-in.

0. <a target="_blank" href="https://confirmsubscription.com/h/i/FDEEF15834EF73C7">Sign up for updates</a>

0. Follow Twitter @AtomEditor



## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
