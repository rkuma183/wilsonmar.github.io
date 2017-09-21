---
layout: post
title: "Python Conda Anaconda Miniconda Pip on Mac OSX"
excerpt: "Confusion and errors from many alternatives and options"
tags: [python, apple, mac, setup]
shorturl: "https://goo.gl/wNVxWD"
image:
# pic white python logo 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622164/4230c848-0585-11e6-957b-be11147346e6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This tutorial describes the different options to install and
<a href="#Uninstall">uninstall</a> Python within various
package managers (which helps you find and install Python packages).

Here I'm taking a "deep dive" approach because I haven't seen one on the internet.

I've pulled out the various incantations suggested by others on StackOverlow
and put them here in context.

{% include _intro.html %}

## TL;DR Summary #

PROTIP: Various methods of installing Python are incompatible with each other.

There are two separate versions of Python such that
<a href="#CommandVersions">
some Python functions in one version do not work with commands in another version</a>.

<a href="#PythonMacVersion">The version of Python that comes with Apple Mac OSX is obsolete</a> 
and needs to be <a href="#UpgradePython">updated</a>
with <a href="#XCode">XCode</a>.

Version 2 of Python must be the default Python command for Apple's use.

Despite all this hassle, Python is the preferred language of 
Artificial Intelligence
and Machine Learning 
at the forefront of computer science innovation today.

The heavy use of math in AI and ML means it's best to 
<a href="#AnacondaInstall">
install Anaconda</a> and use conda commands (instad of Miniconda or pip with virtualenv).
These provide for custom 
<a href="virtualenv">virtual environments</a> 
that each contain a desired version of Python (2.7 vs 3.6) for a specific purpose/project,
plus specific versions of add-on Python packages (such as TensorFlow).

PIP install is troublesome, often because they are more recent than those in Conda.


<a name="Packaging"></a>

## Python Install Options #

There is what can be a confusing conflict of choice here for installing Python and its package manager.

The "traditional" approach:

   * <a href="#PackagInstallerz">Download Python installer from python.org</a>. 

   Not recommended. That would be too easy.

   * <a href="#PIPz">pip</a> (Python Installation Packager) is built on top of <strong>setuptools</strong> which
   is what downloads and installs Python software over a network (usually the Internet) with a single command (easy_install). 
   It itself is installed using easy_install.

   * <a href="#easy_install">easy_install</a> is an environment manager.
   <br /><br />

   <a target="_blank" href="http://stackoverflow.com/questions/1213690/what-is-the-most-compatible-way-to-install-python-modules-on-a-mac">
   One writes</a>:
   "Avoid easy_install or pip to install a Python package that needs a library used by non Python programs,
   such as Qt bindings (PySide)".

Alternatively, there are these alternatives:

   * <a href="#Conda">Conda</a> is the command-line interface (CLI) 
   tool that combines functionality of pip and virtualenv
   
   * <a href="#MiniConda">Miniconda</a> is a lightweight distribution of Conda.

   So miniconda users also use conda commands.
   
   * Anaconda contains a curated collection of <a target="_blank" href="https://docs.continuum.io/anaconda/pkgs.html">
   over 720 "common" packages</a> for scientific Python users. It goes on top of miniconda.

   * Install using Homebrew, then add <a target="_blank" href="https://github.com/Homebrew/homebrew-science/">
   homebrew science</a> for scientific work (according to <a target="_blank" href="http://stackoverflow.com/questions/33541876/os-x-deciding-between-anaconda-and-homebrew-python-environments">this</a>).

   * <a target="_blank" href="https://trac.macports.org/wiki/Python">
   MacPorts</a> is an alternative to Homebrew that is more compatible with other Linux.
   However, not all packages are available in MacPorts.
   <br /><br />

CAUTION: <a target="_blank" href="http://stackoverflow.com/questions/33874084/how-can-i-resolve-a-conflict-between-homebrew-and-macports-or-fink">
   MacPorts, Fink, and Homebrew do not coexist on a single machine</a>.


Differences among them:

* Pip is a package manager.
* Virtualenv is an environment manager. 
* Conda is both.

* Conda handles library dependencies outside of the Python packages as well as 
   the Python packages themselves. 

* Conda installs from binary, meaning that someone (e.g., Continuum) 
   has already done the hard work of compiling the package, making installation easier, and faster.

* pip can install anything from PyPI in one command. 
* Conda requires at least three commands: skeleton, build, install, and possibly more

* Conda uses its own format, which has some advantages (like being static, and again, Python agnostic). 

<a target="_blank" href="http://kylepurdon.com/blog/using-continuum-analytics-conda-as-a-replacement-for-virtualenv-pyenv-and-more.html">
Conda provides an alternative</a> set of 
<a href="#CommandsTable">commands</a>
popular for scientific (Machine Learning) computing.

   <a target="_blank" href="http://conda.pydata.org/docs/_downloads/conda-cheatsheet.pdf">
   http://conda.pydata.org/docs/_downloads/conda-cheatsheet.pdf</a>


<a target="_blank" href="http://conda.pydata.org/docs/_downloads/conda-pip-virtualenv-translator.html">
This table</a> lists the difference in commands between Conda and pip:

<table border="1" cellpadding="4" cellspacing="0">
<colgroup>
<col width="17%" />
<col width="25%" />
<col width="33%" />
<col width="25%" />
</colgroup>
<thead valign="bottom">
<tr class="row-odd"><th class="head">Task</th>
<th class="head">Conda package and environment manager command</th>
<th class="head">Pip package manager command</th>
<th class="head">Virtualenv environment manager command</th>
</tr>
</thead>
<tbody valign="top">
<tr class="row-even"><td>Install a package</td>
<td><tt class="docutils literal"><span class="pre">conda</span> <span class="pre">install</span> <span class="pre">$PACKAGE_NAME</span></tt></td>
<td><tt class="docutils literal"><span class="pre">pip</span> <span class="pre">install</span> <span class="pre">$PACKAGE_NAME</span></tt></td>
<td>-</td>
</tr>
<tr class="row-odd"><td>Update a package</td>
<td><tt class="docutils literal"><span class="pre">conda</span> <span class="pre">update</span> <span class="pre">--name</span> <span class="pre">$ENVIRONMENT_NAME</span> <span class="pre">$PACKAGE_NAME</span></tt></td>
<td><tt class="docutils literal"><span class="pre">pip</span> <span class="pre">install</span> <span class="pre">--upgrade</span> <span class="pre">$PACKAGE_NAME</span></tt></td>
<td>-</td>
</tr>
<tr class="row-even"><td>Update package manager</td>
<td><tt class="docutils literal"><span class="pre">conda</span> <span class="pre">update</span> <span class="pre">conda</span></tt></td>
<td>Linux/OSX: <tt class="docutils literal"><span class="pre">pip</span> <span class="pre">install</span> <span class="pre">-U</span> <span class="pre">pip</span></tt> Win: <tt class="docutils literal"><span class="pre">python</span> <span class="pre">-m</span> <span class="pre">pip</span> <span class="pre">install</span> <span class="pre">-U</span> <span class="pre">pip</span></tt></td>
<td>-</td>
</tr>
<tr class="row-odd"><td>Uninstall a package</td>
<td><tt class="docutils literal"><span class="pre">conda</span> <span class="pre">remove</span> <span class="pre">--name</span> <span class="pre">$ENVIRONMENT_NAME</span> <span class="pre">$PACKAGE_NAME</span></tt></td>
<td><tt class="docutils literal"><span class="pre">pip</span> <span class="pre">uninstall</span> <span class="pre">$PACKAGE_NAME</span></tt></td>
<td>-</td>
</tr>
<tr class="row-even"><td>Create an environment</td>
<td><tt class="docutils literal"><span class="pre">conda</span> <span class="pre">create</span> <span class="pre">--name</span> <span class="pre">$ENVIRONMENT_NAME</span> <span class="pre">python</span></tt></td>
<td>-</td>
<td><tt class="docutils literal"><span class="pre">cd</span> <span class="pre">$ENV_BASE_DIR;</span> <span class="pre">virtualenv</span> <span class="pre">$ENVIRONMENT_NAME</span></tt></td>
</tr>
<tr class="row-odd"><td>Activate an environment</td>
<td><tt class="docutils literal"><span class="pre">source</span> <span class="pre">activate</span> <span class="pre">$ENVIRONMENT_NAME</span></tt></td>
<td>-</td>
<td><tt class="docutils literal"><span class="pre">source</span> <span class="pre">$ENV_BASE_DIR/$ENVIRONMENT_NAME<br />/bin/activate</span></tt></td>
</tr>
<tr class="row-even"><td>Deactivate an environment</td>
<td><tt class="docutils literal"><span class="pre">source</span> <span class="pre">deactivate</span></tt></td>
<td>-</td>
<td><tt class="docutils literal"><span class="pre">deactivate</span></tt></td>
</tr>
<tr class="row-odd"><td>Search available packages</td>
<td><tt class="docutils literal"><span class="pre">conda</span> <span class="pre">search</span> <span class="pre">$SEARCH_TERM</span></tt></td>
<td><tt class="docutils literal"><span class="pre">pip</span> <span class="pre">search</span> <span class="pre">$SEARCH_TERM</span></tt></td>
<td>-</td>
</tr>
<tr class="row-even"><td>Install package from specific source</td>
<td><tt class="docutils literal"><span class="pre">conda</span> <span class="pre">install</span> <span class="pre">--channel</span> <span class="pre">$URL</span> <span class="pre">$PACKAGE_NAME</span></tt></td>
<td><tt class="docutils literal"><span class="pre">pip</span> <span class="pre">install</span> <span class="pre">--index-url</span> <span class="pre">$URL</span> <span class="pre">$PACKAGE_NAME</span></tt></td>
<td>-</td>
</tr>
<tr class="row-odd"><td>List installed packages</td>
<td><tt class="docutils literal"><span class="pre">conda</span> <span class="pre">list</span> <span class="pre">--name</span> <span class="pre">$ENVIRONMENT_NAME</span></tt></td>
<td><tt class="docutils literal"><span class="pre">pip</span> <span class="pre">list</span></tt></td>
<td>-</td>
</tr>
<tr class="row-even"><td>Create requirements file</td>
<td><tt class="docutils literal"><span class="pre">conda</span> <span class="pre">list</span> <span class="pre">--export</span></tt></td>
<td><tt class="docutils literal"><span class="pre">pip</span> <span class="pre">freeze</span></tt></td>
<td>-</td>
</tr>
<tr class="row-odd"><td>List all environments</td>
<td><tt class="docutils literal"><span class="pre">conda</span> <span class="pre">info</span> <span class="pre">--envs</span></tt></td>
<td>-</td>
<td><tt class="docutils literal"><span class="pre">Install virtualenv wrapper</span>,<br />then 
<span class="pre">lsvirtualenv</span></tt></td>
</tr>
<tr class="row-even"><td>Install other package manager</td>
<td><tt class="docutils literal"><span class="pre">conda</span> <span class="pre">install</span> <span class="pre">pip</span></tt></td>
<td><tt class="docutils literal"><span class="pre">pip</span> <span class="pre">install</span> <span class="pre">conda</span></tt></td>
<td>-</td>
</tr>
<tr class="row-odd"><td>Install Python</td>
<td><tt class="docutils literal"><span class="pre">conda</span> <span class="pre">install</span> <span class="pre">python=x.x</span></tt></td>
<td>-</td>
<td>-</td>
</tr>
<tr class="row-even"><td>Update Python</td>
<td><tt class="docutils literal"><span class="pre">conda</span> <span class="pre">update</span> <span class="pre">python</span></tt> *</td>
<td>-</td>
<td>-</td>
</tr>
</tbody>
</table>

<hr />

<a name="PythonMacVersion"></a>

## Python comes with Mac OSX #

Ever since the Mavericks version of Mac OSX,
Python 2 comes installed on MacOS machines.

(Use the index at the right if you want to jump ahead)

0. Open a Terminal shell window and issue command:

   <tt><strong>
   python \-\-version
   </strong></tt>

   The response on a freshly installed El Capitan version:

   <pre>
   Python 2.7.6
   </pre>

   CAUTION: The sub-version that comes installed with MacOS may be obsolete
   and needs to be <a href="#UpgradePython">upgraded</a>.
   But keep to version 2, not version 3 of Python.



## Interactive Python on CLI #

0. List your present working directory:

   <tt><strong>
   pwd
   </strong></tt>

   We next use a Python interactive command to obtain this again.

0. Open a Python command-line prompt:

   <tt><strong>
   python
   </strong></tt>

   The response:

   <pre>
Python 2.7.12 (default, Oct 16 2016, 19:01:27) 
[GCC 4.2.1 Compatible Apple LLVM 8.0.0 (clang-800.0.38)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
   </pre>

   The response on a new El Capital machine:

   <pre>
   Python 2.7.6 (default, Sep  9 2014, 15:04:36)
   [GCC 4.2.1 Compatible Apple LLVM 6.0 (clang-600.0.39)] on darwin
   Type "help", "copyright", "credits" or "license" for more information.
   >>> 
   </pre>

   \>\>\> is the Python interpreter prompt.

   Don't enter or copy \>\>\> when typeing or copying Python commands.
   
   ### Current Working Directory

0. Display Python's <strong>current working directory</strong>:

   <tt><strong>
   \>\>\> import os<br />
   \>\>\> os.getcwd()
   </strong></tt>

   In the response, substitue my "mac" user name with yours:

   <pre>
   '/Users/mac/Downloads'
   </pre>

   The above should be the same as the path obtained from pwd before entering Python.

0. Futhermore...

   <tt><strong>
   \>\>\> import os, sys<br />
   \>\>\> os.path.dirname(os.path.abspath(sys.argv[0]))
   </strong></tt>

   The response is your home folder (substitue "mac" with your user name):

   <tt>
   '/Users/mac'
   </tt>

   ### Exit Python

0. Exit the Python interpreter by typing the exit function (with the parentheses symbols) :

   <tt><strong>
   exit()
   </strong></tt>

   NOTE: MacOS does not come installed with a package manager for Python.

   <a target="_blank" href="http://ipython.org/ipython-doc/dev/interactive/htmlnotebook.html">
   IPython (Jupyter) Notebook</a> 
   enables a "notebook" interface to re-run commands.
   http://sjbyrnes.com/python/ notes

0. Enter Python again for the instructions to follow.


   <a name="PythonHTTP"></a>

   ### Start a HTTP Server Using Python #

   A simple HTTP server service can be started with command:

   <tt><strong>
   python -m SimpleHTTPServer
   </strong></tt>

   For Python3: 

   <tt><strong>
   python3 -m http.server
   </strong></tt>

   The response:

   <pre>
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...   
   </pre>


## Don't Uninstall Python 2.7 #


> The version of Python that comes with Mac OSX should not be removed 
because some Apple system software have hard-coded references to it.

That is the reason why elevated privilages (sudo) is necessary to remove Python from your Mac:

Nevertheless here's the bad advice to harm yourself:

   <pre><strong>
   sudo rm -rf ~/Library/Frameworks/Python.framework/Versions/2.7
   sudo rm -rf "/Applications/Python 2.7"
   </strong></pre>

   Remove symbolic links pointing to the python version see 

   <pre><strong>
   cd /usr/local/bin/
   ls -l /usr/local/bin | grep '../Library/Frameworks/Python.framework/Versions/2.7' | awk '{print $9}' | tr -d @ | xargs rm
   </strong></pre>

   Remove references to deleted paths in PATH environment variable within shell profile files.  
   Depending on which shell you use, any of the following files may have been modified: 
   
   <pre>
   ~/.bash_login, 
   ~/.bash_profile, 
   ~/.cshrc, 
   ~/.profile, 
   ~/.tcshrc,
   ~/.zprofile
   </pre> 

0. List symbolic links pointing to the python version: 

   <pre><strong>
   ls -l /usr/bin/python
   </strong></pre> 
   
   On El Capitan, this should display: a sym link such as:

   <pre>
-rwxr-xr-x  2 root  wheel 58416 Jul 14  2015 /usr/bin/python
   </pre>

   If instead you followed some bad advice and see something like this:

   <pre>
lrwxr-xr-x  1 root  wheel  18 Feb  7 20:54 /usr/bin/python -> /usr/bin/python2.7
   </pre>

0. List symbolic links pointing to the python version: 

   <pre><strong>
   cd ~
   ls -l /usr/bin/python/python2.7
   </strong></pre> 
   
   Response:

   <pre>
lrwxr-xr-x  1 root  wheel  75 Oct  8 10:46 /usr/bin/python2.7 -> ../../System/Library/Frameworks/Python.framework/Versions/2.7/bin/python2.7
   </pre>

   The "../../" means that it's above your HOME folder, in the root of the Mac OS.

0. So let's go there:
 
   <pre><strong> 
   cd /System/Library/Frameworks/Python.framework/Versions/2.7/bin/
   </strong></pre>

   There are the executables "python" and "python2.7" plus others.

0. Run:

   python2.7

   The response:

   <pre>
Python 2.7.10 (default, Jul 30 2016, 19:40:32) 
[GCC 4.2.1 Compatible Apple LLVM 8.0.0 (clang-800.0.34)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> 
   </pre>

0. Exit

0. Run the generic python generically:

   <pre><strong>
   python2.7
   </strong></pre>

   The response is a newer Python:

   <pre>
Python 2.7.12 (default, Oct 16 2016, 19:01:27) 
[GCC 4.2.1 Compatible Apple LLVM 8.0.0 (clang-800.0.38)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> exit()
   </pre>

0. List symbolic links pointing to the Python version: 

   <pre><strong>
   ls -l /usr/local/bin | grep '../Library/Frameworks/Python.framework/Versions/2.7'
   </strong></pre> 
   
   According to <a target="_blank" href="http://stackoverflow.com/questions/3819449/how-to-uninstall-python-2-7-on-a-mac-os-x-10-6-4">
   this</a>:


   ### Alias to the rescue #

   CAUTION: I'm still working on the following:

   If you tried to commit suicide like the above, the work-around is an alias,
   which the operating system resolves before going down PATH.

0. Get a Python 2.7 installed. For example, at:

   ../Cellar/python/2.7.12_2/bin/python2.7

0. Verify the sym link:

   <pre><strong>
   ls -l /usr/local/bin
   </strong></pre>

   The response:

   <pre>
lrwxr-xr-x  1 mac  staff  39 Mar  5 00:41 /usr/local/bin/python2.7 -> ../Cellar/python/2.7.12_2/bin/python2.7
   </pre>

0. Edit ~/.bash_shell to add a shell alias:

   <pre>
   alias python=/usr/local/bin/python2.7
   </pre>

0. Close and open another Terminal.
0. Verify the version.

   <pre><strong>
   cd ~
   python --version
   </strong></pre>

   The response should be the newer sub-version:

   <pre>2.7.12 </pre>

<hr />

<a name="UpgradePython"></a>

<a name="XCode"></a>

## XCode

To build Python on a machine requires a GCC compiler.
One comes with command-line tools installed with
Apple's XCode IDE. Newer versions also installs a Git client.

### XCode install


0. Get the installation location in a Terminal window:

   <pre><strong>
   xcode-select -p
   </strong></pre>

   The answer:

   <pre>
   /Applications/Xcode.app/Contents/Developer
   </pre>


It used to be that one can enter a command:

   <pre>xcode-select --install</pre>

   The response on my Sierra machine is:

   <pre>
   xcode-select: error: command line tools are already installed, use "Software Update" to install updates
   </pre>

So below is the "Software Update" approach:

0. Use an internet browser to <a target="_blank" href="https://developer.apple.com/xcode/">
   https://developer.apple.com/xcode</a>

0. Provide your Apple ID and password. Get one if you don't already have one.

0. Go through Apple's location verification if prompted.

0. Click "Download" and provide your Apple ID.
   You'll need to establish an Apple ID.

0. Select the version to download:

   | File               | Date       | Download | Unpacked |
   | :----------------- | :--------- | -------: | ------: |
   | XCode_8.2.1 8C1002 | 2016-12-19 |   ? GB | ? GB |
   | XCode_8_beta_2.xip | 2016-07-05 |   5.9 GB | 12.32 GB |
   | XCode_7.31         | 2016-05-03 |   3.8 GB | ? |
   | XCode_4.1          | 2014-      |   2.9 GB | ? |
   | XCode_3.2.4        | 2014-      |   2.? GB | ? |

   NOTE: These are massive files that may take a while to download if you don't have a fast internet connection.

   CAUTION: Even more important, make sure that your machine will have enough free space available.

0. Open App Store. Click Open.

0. Remember to delete the installer after you're done, then 

   ### XCode version

0. Confirm the version installed.

   <pre><strong>
   /usr/bin/xcodebuild -version
   </strong></pre>

   The answer:

   <pre>
Xcode 8.2.1
Build version 8C1002
   </pre>

   The should match up with the Build Number on the Apple web page.

   Alternately, for a more precise version number and other info 
   (Mavericks and up):

   <pre><strong>
   pkgutil --pkg-info=com.apple.pkg.CLTools_Executables
   </strong></pre>

   This is a specific version of:

   <pre>
   pkgutil --pkgs | grep -i tools
   </pre>

   The response:

   <pre>
package-id: com.apple.pkg.CLTools_Executables
version: 8.2.0.0.1.1480973914
volume: /
location: /
install-time: 1484969093
groups: com.apple.FindSystemFiles.pkg-group 
   </pre>


0. Get the version of GCC installed:

   <pre>
   gcc --version
   </pre>

   The answer:

   <pre>
Configured with: --prefix=/Applications/Xcode.app/Contents/Developer/usr --with-gxx-include-dir=/usr/include/c++/4.2.1
Apple LLVM version 8.0.0 (clang-800.0.42.1)
Target: x86_64-apple-darwin16.4.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
   </pre>





<a name="PackagInstallerz"></a>

## Download Python installer #

If you must do it the hard way, bareback, etc:

0. In an internet browser at <br />
   <a target="_blank" href="https://www.python.org/downloads/mac-osx/">
   https://www.python.org/downloads/mac-osx</a>

0. Click the Latest link at the top or a <br />
   specific "Mac OS X 64-bit/32-bit installer".

   | File                         | Date       | Download |
   | :--------------------------- | :--------- | ------: |
   | python-2.7.12-macosx10.6.pkg | 2016-06-25 | 21.3 MB |
   | python-2.7.11-macosx10.6.pkg | 2015-12-05 | 21.1 MB |
   | python-2.7.10-macosx10.6.pkg | 2015-05-23 | 21.1 MB |
   | python-2.7.09-macosx10.6.pkg | 2014-12-10 | 21.0 MB |
   | python-2.7.08-macosx10.6.pkg | 2014-07-02 | 19.4 MB |
   | python-2.7.07-macosx10.6.pkg | 2014-05-31 | 19.4 MB |
   | python-2.7.06-macosx10.6.pkg | 2013-11-10 | 19.2 MB |

   This table shows the growth in download size over time,
   an analysis unique to this page.


<hr />

<a name="PipUpgrade"></a>

## Upgrade pip and setuptools #


<a name="BrewPip"></a>

### Install pip homebrew without setuptools #

Instead of following instructions such as 
<a target="_blank" href="https://packaging.python.org/installing/#install-pip-setuptools-and-wheel">
this</a> with:

   <tt><strong>
   pip install -U pip setuptools
   </strong></tt>

   BTW, on Windows it's:

   <tt><strong>
   python -m pip install -U pip setuptools
   </strong></tt>

0. On a Mac use the Mac system package manager [Homebrew](/homebrew/)
   to install pip (as <a target="_blank" href="http://penandpants.com/2012/02/24/install-python/">recommended by this site</a>
   and <a target="_blank" href="https://pip.readthedocs.io/en/stable/installing/">https://pip.readthedocs.io/en/stable/installing</a>):

   <tt><strong>
   brew install pip
   </strong></tt>

   Conda installs outside the standard structure, so 

0. Run:

   <tt><strong>
   brew doctor
   </strong></tt>

   this warning appears (which can be safely ignored):

{% highlight text %}
Warning: "config" scripts exist outside your system or Homebrew directories.
`./configure` scripts often look for *-config scripts to determine if
software packages are installed, and what additional flags to use when
compiling and linking.

Having additional scripts in your path can confuse software installed via
Homebrew if the config script overrides a system or Homebrew provided
script of the same name. We found the following "config" scripts:
    /Users/mac/miniconda2/bin/python-config
    /Users/mac/miniconda2/bin/python2-config
    /Users/mac/miniconda2/bin/python2.7-config
{% endhighlight %}

   QUESTION: Is there a way to suppress these messages?


<a name="Requirements"></a>

## Requirements.txt #

In a GitHub repo cloned locally,
if you see a file <strong>Requirements.txt</strong>, 
it is likely a list of Python packages needed by the application:

   <pre>
# pip install awscli mkdocs
awscli==1.7.26
bcdoc==0.14.0
botocore==0.107.0
certifi==2015.4.28
colorama==0.3.3
docutils==0.12
ghp-import==0.4.1
Jinja2==2.7.3
jmespath==0.7.1
livereload==2.3.2
Markdown==2.6.2
MarkupSafe==0.23
mkdocs==0.14.0
pyasn1==0.1.7
python-dateutil==2.4.2
PyYAML==3.11
rsa==3.1.4
six==1.9.0
tornado==4.1
   </pre>

   Notice each specific version is specified.

0. In a Terminal shell window, change the directory to where app resides.

0. Just for laughs:

   <tt><source>
   pip install
   </strong></tt>

   The response:

   <pre>
You must give at least one requirement to install (see "pip help install")
   </pre>

   The use of the word "requirement" in this message is partly why 
   lists of Python package dependencies are in a requirements.txt file.


   <a name="VirtualEnvironments"></a>

   ### Virtual Environments #

   Examples of instructions for installing a <strong>requirements.txt</strong> file 
   are typically preceded by a `source bin/activate` command
   which executes the activate script in the project's bin folder.

   An activate script is placed in each virtual environment established
   to store different sets of dependencies required by different projects in separate isolated locaations.
   
   This solves the &quot;Project X depends on version 1.x but, Project Y needs 4.x&quot; dilemma, 
   and keeps your global site-packages directory clean and manageable.
   - <a target="blank" href="http://docs.python-guide.org/en/latest/starting/install/osx/">
   Python Guide</a>

   -----

   before the `pip install` command:
   Automatically download the packages listed
   (after you manually change the /path/to)

   <tt><source>
   source bin/activate<br />
   pip install -r /path/to/requirements.txt  
   </strong></tt>

   This downloads dependencies from PyPI (the Python Package Index),
   a public repository of software for the Python programming language at
   <a target="_blank" href="https://pypi.python.org/pypi">
   https://pypi.python.org/pypi</a>.

   However, adding the "\-\-no-index" option would not use it.

   NOTE: pip compiles everything from source if a "wheel" is not available for it.
   Wheels are a pre-built distribution format that provides faster installation compared to 
   Source Distributions (sdist), 
   especially when a project contains compiled (C language) extensions.

   <tt><strong>
   pip install \-\-use-wheel <em>package</em>
   </strong></tt>


   ### pip scikit-learn #

0. In a Terminal on any folder, globally install dependencies libraries:

   <tt><strong>
   pip install -U scikit-learn
   </strong></tt>

0. Edit the Python script to add at the top:

   <pre>
   from sklearn import tree
   </pre>


   <a id="iPython"></a>

   ### pip iPython Jupyter #

0. <a target="_blank" href="https://ipython.org">
   iPython</a> is the kernel of [Jupyter](jupyter).

   <tt><strong>
   pip install ipython
   </strong></tt>

<hr />

<a name="Virtualenv"></a>

## Virtualenv and Docker #

<a target="_blank" href="https://hynek.me/articles/virtualenv-lives/">
Hynek Schlawack recommends</a>

   * Don’t pip-install anything into its global site-packages beyond virtualenv.

   * Install <strong>both</strong> virtualenv and system isolation (they are not mutually exclusive):

      * Isolate your application server’s OS from its host using Docker/lxc/jails/zones/kvm/VMware/… to one container/vm per application.

      * inside of them also do isolate your Python environment using virtualenv from unexpected surprises in the system site-packages.

Remove hassles from managing per-project virtualenvs by using one of these, depending on the shell and operating system used:

   * virtualenvwrapper
   * virtualenvwrapper-win on MS Windows
   * <a target="_blank" href="https://github.com/adambrenecki/virtualfish"> virtualfish</a>



<a id="PIPz"></a>

## PIP (Python Installation Packager)

As of Python 2.7.9 and Python 3.4.x, python.org installers for OS X install pip as well
from Activestate.com and download ActivePython. 
It's a simple install that gives you both Python and pip. 

According to https://www.python.org/download/mac/tcltk/,
download from
http://www.activestate.com/activetcl/downloads
file ActiveTcl8.6.3.1.298624-macosx10.5-i386-x86_64-threaded.dmg

After install, the 
<a target="_blank" href="file:///Library/Documentation/Help/ActiveTcl-8.6/index.html">
ActiveTcl User Guide</a> is popped up.

Jesse Noller notes in
<a target="_blank" href="http://jessenoller.com/blog/2009/03/16/so-you-want-to-use-python-on-the-mac">
So you want to use python on the Mac</a>:

   "Now, some people may recommend you install Macports or Fink: 
   these are both "sorta" package managers for OS/X, 
   and while I do have Macports installed, I do not use it for Python work. 
   I prefer compilation and self management."



<a name="easy_install"></a>

### Easy_install #

Others use 
<strong>easy_install</strong> (with setuptools) 
to install packages from the web. 

   <tt><strong>
   sudo easy_install pip
   </strong></tt>

   The response:

   <pre>
Password:
Searching for pip
Best match: pip 8.1.2
Adding pip 8.1.2 to easy-install.pth file
Installing pip script to /Users/mac/miniconda2/bin
Installing pip3.5 script to /Users/mac/miniconda2/bin
Installing pip3 script to /Users/mac/miniconda2/bin
&nbsp;
Using /Users/mac/miniconda2/lib/python2.7/site-packages
Processing dependencies for pip
Finished processing dependencies for pip
   </pre>




<a id="VirtualPyEnvz"></a>

### Virtual pip environments #

The best way to have painless and reproducible deployments is to package whole virtual environments of the application you want to deploy including all dependencies but without configuration.

> In the world of Python, an **environment** is a folder (directory) containing everything that a 
   Python **project** (application) needs to run in an organised, isolated fashion. 

When it is initiated, it automatically comes with its own Python interpreter 
- a copy of the one used to create it - alongside its very own pip.

The ability to work with either version 3 or 2.7 on the same machine is needed
because, <a target="_blank" href="http://www.macobserver.com/tmo/article/how-to-upgrade-your-mac-to-python-3"> as this MacWorld article</a>
points out, Mac Mavericks and Yosemite are installed with Python 2.7,
cannot run python3 scripts.

You can work on a Python project which requires Django 1.3<br />
while also maintaining a project which requires Django 1.0.

It's done by creating isolated Python environments using
<a target="_blank" href="https://pypi.python.org/pypi/virtualenv">
virtualenv</a> (Virtual python environment builder).

   <tt><strong>
   sudo pip install virtualenv
   </strong></tt>

As the reponse requests, activate:

   <tt><strong>
   source /usr/local/opt/autoenv/activate.sh
   </strong></tt>

   This does not issue a response.


0. Instead of &quot;venv&quot;, substitute your project name to to create:

   <tt><strong>
   cd my_project_folder<br />
   virtualenv venv
   </strong></tt>

   Exclude the virtual environment folder from source control by adding it to the git ignore list.

   <pre>
New python executable in /Users/mac/gits/wilsonmar/shippable/one/bin/python
Installing setuptools, pip, wheel...
  Complete output from command /Users/mac/gits/wils...pable/one/bin/python - setuptools pip wheel:
  Traceback (most recent call last):
  File "<stdin>", line 4, in <module>
  File "/Users/mac/miniconda2/lib/python2.7/tempfile.py", line 32, in <module>
    import io as _io
  File "/Users/mac/miniconda2/lib/python2.7/io.py", line 51, in <module>
    import _io
ImportError: dlopen(/Users/mac/gits/wilsonmar/shippable/one/lib/python2.7/lib-dynload/_io.so, 2): Symbol not found: __PyCodecInfo_GetIncrementalDecoder
  Referenced from: /Users/mac/gits/wilsonmar/shippable/one/lib/python2.7/lib-dynload/_io.so
  Expected in: flat namespace
 in /Users/mac/gits/wilsonmar/shippable/one/lib/python2.7/lib-dynload/_io.so
----------------------------------------
...Installing setuptools, pip, wheel...done.
Traceback (most recent call last):
  File "/Users/mac/miniconda2/bin/virtualenv", line 11, in <module>
    sys.exit(main())
  File "/Users/mac/miniconda2/lib/python2.7/site-packages/virtualenv.py", line 711, in main
    symlink=options.symlink)
  File "/Users/mac/miniconda2/lib/python2.7/site-packages/virtualenv.py", line 944, in create_environment
    download=download,
  File "/Users/mac/miniconda2/lib/python2.7/site-packages/virtualenv.py", line 900, in install_wheel
    call_subprocess(cmd, show_stdout=False, extra_env=env, stdin=SCRIPT)
  File "/Users/mac/miniconda2/lib/python2.7/site-packages/virtualenv.py", line 795, in call_subprocess
    % (cmd_desc, proc.returncode))
OSError: Command /Users/mac/gits/wils...pable/one/bin/python - setuptools pip wheel failed with error code 1
   </pre>

   QUESTION: How to fix this?
   This occurs when virtualenv was installed with easy_install (or "python setup.py install")

0. List all virtual environments:

   <tt><strong>
   lsvirtualenv
   </strong></tt>

0. To use a particular Python interpreter:

   <tt><strong>
   virtualenv -p /usr/bin/python2.7 venv
   </strong></tt>

0. Activate your project:

   <tt>
   source venv/bin/activate
   </tt>

   The name of the current virtual environment should now appear on the left of the prompt 
   (e.g. (venv)Your-Computer:your_project UserName$). 

   From now on, any package that you install using pip will be placed in the venv folder, isolated from the global Python installation.

   ### autoenv

0. To automatically activate an vironment when you cd into it:

   <tt>
   brew install autoenv
   </tt>

   The response:

   <pre>
==> Downloading https://github.com/kennethreitz/autoenv/archive/v0.1.0.tar.gz
==> Downloading from https://codeload.github.com/kennethreitz/autoenv/tar.gz/v0.
######################################################################## 100.0%
==> Caveats
To finish the installation, source activate.sh in your shell:
  source /usr/local/opt/autoenv/activate.sh
==> Summary
🍺  /usr/local/Cellar/autoenv/0.1.0: 4 files, 5K, built in 2 seconds
   </pre>

0. Install packages as usual, for example:

   <tt>
   pip install request
   </tt>

0. When you are done working in the virtual environment for the moment:

   <tt>
   deactivate
   </tt>

   The above puts you back to the system's default Python interpreter with all its installed libraries.

0. To delete a virtual environment, delete its folder. In this case, it would be:

   <tt>
   rm -rf venv
   </tt>

0. To keep your environment consistent, 
   <srong>freeze</srong> the current state of the environment packages:

   <tt>
   pip freeze > requirements.txt
   </tt>

   This creates (or overwrites) a <strong>requirements.txt</strong> file 
   containing a simple list of all the packages in the current environment and their respective versions. 
   This file would make it easier to re-create the environment and
   to install the same packages using the same versions:

   <tt>
   pip install -r requirements.txt
   </tt>

   This ensures consistency across installations, deployments, and developers.

As noted in 
http://docs.python-guide.org/en/latest/dev/virtualenvs/
this create a folder in the current directory containing the Python executable files, 
and a copy of the pip library which you can use to install other packages. 
The name of the virtual environment (in this case, it was venv) can be anything;
omitting the name will place the files in the current directory instead.

0. Open an internet browser to 
   <a target="_blank" href="https://www.python.org/downloads/">
   https://www.python.org/downloads/</a>
   and download file python-3.4.2-macosx10.6.pkg.

   See 	http://docs.python-guide.org/en/latest/dev/virtualenvs/
   https://www.digitalocean.com/community/tutorials/common-python-tools-using-virtualenv-installing-with-pip-and-managing-packages

0. To list what packages have been installed:

   <tt>
   pip list
   </tt>

0. Look for packages by keyword:

   <tt>
   pip search django
   </tt>

<!--
 I would like to backup the contents of my gmail account.
 A recommended solution is 
 https://github.com/jay0lee/got-your-back/releases
 But within its setup.py file there is a reference to Windows py2exe .
 
 File "setup.py", line 2, in &LT;module>
 import py2exe, sys, os
 ImportError: No module named py2exe
 
 This is more like a StackOverflow question, but 
 I'd like to take this opportunity to install a virtual environment for Python, so I can use python3 on Yosemite, perhaps as described by
 http://www.macobserver.com/tmo/article/how-to-upgrade-your-mac-to-python-3
 
 
 virtualenv creates a folder which contains all the necessary executables to use the packages that a Python project would need.
 
	Create a virtual environment for a project:
 <tt>
 cd my_project_folder
 virtualenv venv
 </tt>
	
	create a folder in the current directory which will contain the Python executable files, and a copy of the pip library which you can use to install other packages. The name of the virtual environment (in this case, it was venv) can be anything; omitting the name will place the files in the current directory instead.
 
 This creates a copy of Python in whichever directory you ran the command in, placing it in a folder named venv.
 
	Specify a Python interpreter:
 <tt>
 virtualenv -p /usr/bin/python2.7 venv
 </tt>
 
 
	Activate the new virtuali environment for use:
 <tt>
 source venv/bin/activate
 </tt>
 
	In a Terminal, install easy_setup and pip and
 <tt>
 sudo pip install virtualenv
 </tt>
 
	<a target="_blank" href="https://pypi.python.org/pypi/virtualenv">
	virtualenv</a>.
 
 virtualenv into the 2.6.1 install we installed previously. The binaries are installed to /Library/Frameworks/Python.framework/Versions/2.6/bin. Your egregious modification of this pristine install is almost complete.
 
 Next install virtualenvwrapper:
 
 sudo pip install virtualenvwrapper
 
	Open <a target="_blank" href=http://peak.telecommunity.com/dist/ez_setup.py">
	the ez_setup.py python script</a> which
	bootstraps setuptools and easy_install for you - just run:
	control-click on it to save it to your Downloads folder.
 
 sudo python ez_setup.py
 Once that's complete, head over to pypi and download the pip tarball. Unpack it and execute "sudo python setup.py install". 
 
 -->

### Use pip to install Tensorflow

<a target="_blank" href="https://www.youtube.com/watch?v=2FmcHiLCwTU&t=1m3s">
As Siraj shows in his video</a>, on a Mac Terminal,
define an environment variable that points to the download URL:

   <pre>
export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-0.10.0rc0-py3-none-any.whl
   </pre>

   (This is for Python 3 on a Mac.)

   Install it using PIP and the variable:

   <pre>
sudo pip3 install --upgrade $TF_BINARY_URL
   </pre>


## Vagrant #

This explanation forks 
<a target="_blank" href="http://coolestguidesontheplanet.com/getting-started-vagrant-os-osx-10-9-mavericks/">
another</a>.

Setup a provider VM solution to store the image (like VMware, AWS, Hyper-V).
https://www.virtualbox.org/wiki/Downloads
click "x86/amd64" next to <strong>VirtualBox 4.3.20 for OS X hosts</strong>
to download VirtualBox-4.3.20.96.dmg (109 MB)
Read the 368 page User Manual.

Install https://github.com/dotless-de/vagrant-vbguest
to keep VirtualBox guest additions up to date.
http://schof.org/2014/03/31/working-around-virtualbox-bug-12879/

In the Finder, in the <strong>Applications</strong> folder, 
drag and drop it onto your Dock for quicker use later.
Double-click on VirtualBox for the <strong>VirtualBox Manager</strong>. 


Download the 224.3 MB vagrant_1.7.1.dmg

   The binary gets installed in the Applications folder with a link to the /usr/bin so it is added to the shell path.

List commands:

   <tt>
   vagrant<br />
   vagrant list-commands
   </tt>

Change directory to where you want to store the Vagrant project and run

   <tt>
   vagrant init
   </tt>

The response:<br />

<tt>A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
</tt>

   <tt>
   ls
   </tt>

   This shows Vagrantfile (with capital V).

   https://www.vagrantup.com/downloads.html


   <tt><strong>
   vagrant up \-\-provider=PROVIDER
   </strong></tt>


https://vagrantcloud.com/boxes/search
lists boxes created by the community.

I am pulling the box from ATT M2X https://m2x.att.com/developer/sample-code
This Repo provides a Vagrant virtual machine that contains several demo applications (Ruby and Python) that report data to AT&T M2X.
https://github.com/attm2x/m2x-demo-vagrant

   <tt><strong>
   git clone https://github.com/attm2x/m2x-demo-vagrant.git
   </strong></tt>

   vagrant box add chef/centos-6.5	

   bootstrap.bash


User data for Vagrant is filed in the directory from which vagrant was used and is stored in an invisible directory .vagrant.d



<a id="Pythonz"></a>

## Python 2 executables #

<a target="_blank" href="http://youshoulddoityourself.blogspot.com/2010/11/test.html">
This advice from 2010</a>.


   ### Path to executables #

0. To see what MacOS

   <tt><strong>
   which python
   </strong></tt>

   If you have MiniConda installed:

   <pre>
/Users/mac/miniconda2/bin/python
   </pre>
 
   If you have Anaconda installed:

   <pre>
/Users/mac/anaconda/bin/python
   </pre>

   If you are inside a conda activated environment:

   <pre>
/Users/mac/anaconda/envs/py2/bin/python
   </pre>   

0. For a list of what Python executes:

   <tt><strong>
   ls ~/miniconda2/bin
   </strong></tt>

   The response begins with this:

   <pre>
2to3        openssl        python2-config
activate    pip         python2.7
aws         pip2        python2.7-config
   </pre>
   
   ### Type python

0. Find where you are picking up Python from?

   <tt><strong>
   type python
   </strong></tt>

   If Python was installed:

   <tt>
   python is hashed (/usr/bin/python)
   </tt>

   Alternately, if Conda was installed:

   <tt>python is hashed (/Users/mac/miniconda2/bin/python)</tt>

0. Open a Terminal shell window and issue command:

   <tt><strong>
   python \-\-version
   </strong></tt>

   The response is its version. My Mac Yosemite default of Python shows this:

   <pre>
Python 2.7.6 (default, Sep  9 2014, 15:04:36)
[GCC 4.2.1 Compatible Apple LLVM 6.0 (clang-600.0.39)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>
   </pre>

   With Miniconda installed on El Capitan, it's this instead:

   <pre>
Python 2.7.12 |Continuum Analytics, Inc.| (default, Jul  2 2016, 17:43:17) 
[GCC 4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2336.11.00)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
Anaconda is brought to you by Continuum Analytics.
Please check out: http://continuum.io/thanks and https://anaconda.org
>>>
   </pre>

0. Get the folder:

   <tt><strong>
   python -m site \-\-user-site
   </strong></tt>

The response I got is this:

   <tt>
   /Users/mac/Library/Python/2.7/lib/python/site-packages
   </tt>

   Alternately:

   <tt>
   /Users/mac/.local/lib/python2.7/site-packages
   </tt>

<a name="Miniconda"></a>

## Miniconda install #

Below is a more "hands-on" description than what
<a target="_blank" href="http://conda.pydata.org/docs/install/quick.html">
pydata.org</a> and
<a target="_blank" href="http://kylepurdon.com/blog/using-continuum-analytics-conda-as-a-replacement-for-virtualenv-pyenv-and-more.html">
Kyle Purdon</a> offers.

0. Use an internet browser to visit the <a target="_blank" href="http://conda.pydata.org/miniconda.html">
   Miniconda Download page at http://conda.pydata.org/miniconda.html</a>

   Alternately, download:

   <tt><strong>
   cd ~/Downloads<br />
   wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
   </strong></tt>

0. Select version to download. For Python 2.7:

   | Version    | File                               | Size    |
   | :--------- | :--------------------------------- | ------: |
   | Python 2.7 | Miniconda2-latest-MacOSX-x86_64.sh | 20.3 MB |
   | Python 3.5 | Miniconda3-latest-MacOSX-x86_64.sh | 23.4 MB |

   NOTE: Python3 is not backward compatible with Version 2.

   Notice the ".sh" means these are shell scripts.

0. Open a Terminal shell window to
   navigate to your Downloads folder and run the Python 2.7 script:

   <tt><strong>
   cd ~/Downloads<br />
   bash Miniconda2-latest-MacOSX-x86_64.sh -b
   </strong></tt>

   PROTIP: The "-b" option specifies unattended with defaults.

   The response:

   <pre>
Welcome to Miniconda2 4.0.5 (by Continuum Analytics, Inc.)
&nbsp;
In order to continue the installation process, please review the license
agreement.
Please, press ENTER to continue
>>> 
   </pre>

0. Press Enter to accept the license.
0. Press "q" to the ":" prompt.
0. Type yes.

   "ERROR: File or directory already exists:"
   appears if miniconda was already installed.

0. <a href="#CondaVersion">Confirm conda version</a>.


<hr />

<a name="AnacondaInstall"></a>

## Anaconda Install 

<a target="_blank" href="https://www.youtube.com/watch?v=YJC6ldI3hWk">
This video</a> by Corey Schafer explains it well.

https://docs.continuum.io/anaconda/install

0. Go to web page:

   <a target="_blank" href="https://www.continuum.io/downloads">
   https://www.continuum.io/downloads</a>

   QUESTION: Is there a brew anaconda?

0. Click on the operating system icon (Mac, Windows, Linux) or scroll down and press the tab.
0. Click to download the "command-line installer".

   | Version    | File                          | Installer | Installed |
   | :--------- | :---------------------------- | -------: | ----: |
   | Python 3.6 | Anaconda3-4.3.0-MacOSX-x86_64 | 363 MB | - |
   | Python 2.7 | Anaconda2-4.3.0-MacOSX-x86_64 | 358 MB | 1.41 GB |

0. In a (bash) Terminal:

   <pre>
   cd Downloads
   chmod 555 ./Anaconda3-4.3.0-MacOSX-x86_64.sh 
   ./Anaconda3-4.3.0-MacOSX-x86_64.sh 
   </pre>

   The response:

   <pre>
Welcome to Anaconda3 4.3.0 (by Continuum Analytics, Inc.)
&nbsp;
In order to continue the installation process, please review the license
agreement.
Please, press ENTER to continue
   </pre>

0. Press Enter (as if you cared).
0. Press Tab until you're exhausted.
0. Type yes and press Enter.

   Anaconda3 will now be installed into this location:
   /Users/mac/anaconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

0. Press Enter.

   PREFIX=/Users/mac/anaconda3

0. Wait for it to come back to you.

   <pre>
installing: _license-1.1-py36_1 ...
installing: alabaster-0.7.9-py36_0 ...
installing: anaconda-client-1.6.0-py36_0 ...
installing: anaconda-navigator-1.4.3-py36_0 ...
installing: appnope-0.1.0-py36_0 ...
installing: appscript-1.0.1-py36_0 ...
installing: astroid-1.4.9-py36_0 ...
installing: astropy-1.3-np111py36_0 ...
installing: babel-2.3.4-py36_0 ...
...
installation finished.
Do you wish the installer to prepend the Anaconda3 install location
to PATH in your /Users/mac/.bash_profile ? [yes|no]
[yes] >>> yes
   </pre>

0. Type yes.

You may wish to edit your .bashrc or prepend the Anaconda3 install location:

$ export PATH=/Users/mac/anaconda3/bin:$PATH

Thank you for installing Anaconda3!

Share your notebooks and packages on Anaconda Cloud!
Sign up for free: https://anaconda.org


<hr />

<a name="CondaVersion"></a>

## Conda verson #

   See https://uoa-eresearch.github.io/eresearch-cookbook/recipe/2014/11/20/conda/

0. For the version of conda installed, specify the upper-case V:

   <tt><strong>
   conda -V
   </strong></tt>

   Alternately:

   <tt><strong>
   conda \-\-version
   </strong></tt>

   The response is like:

   <pre>
   conda 4.3.9
   </pre>
  

## Update conda

0. To update miniconda's version, use the conda command line installed above:

   <tt><strong>
   conda update conda
   </strong></tt>

   The response is a list of packages to be updated if you agree:

   <pre>
Fetching package metadata: ....
.Solving package specifications: ..........
&nbsp;
Package plan for installation in environment /Users/mac/miniconda2:
&nbsp;
The following packages will be downloaded:
&nbsp;
    package                    |            build
    ---------------------------|-----------------
    sqlite-3.13.0              |                0         1.4 MB
    python-2.7.12              |                1         9.5 MB
    conda-env-2.5.1            |           py27_0          26 KB
    ruamel_yaml-0.11.7         |           py27_0         174 KB
    conda-4.1.8                |           py27_0         201 KB
    ------------------------------------------------------------
                                           Total:        11.2 MB
&nbsp;
The following NEW packages will be INSTALLED:
&nbsp;
    ruamel_yaml: 0.11.7-py27_0
&nbsp;
The following packages will be UPDATED:
&nbsp;
    conda:       4.0.4-py27_0 --> 4.1.8-py27_0 
    conda-env:   2.4.5-py27_0 --> 2.5.1-py27_0 
    python:      2.7.11-0     --> 2.7.12-1     
    sqlite:      3.9.2-0      --> 3.13.0-0     
&nbsp;
Proceed ([y]/n)? 
   </pre>

0. Press "y" to proceed. A sample response:

   <pre>
Fetching packages ...
sqlite-3.13.0- 100% |################################| Time: 0:00:02 483.10 kB/s
python-2.7.12- 100% |################################| Time: 0:00:20 477.84 kB/s
conda-env-2.5. 100% |################################| Time: 0:00:00 392.63 kB/s
ruamel_yaml-0. 100% |################################| Time: 0:00:00 331.95 kB/s
conda-4.1.8-py 100% |################################| Time: 0:00:00 457.60 kB/s
Extracting packages ...
[      COMPLETE      ]|###################################################| 100%
Unlinking packages ...
[      COMPLETE      ]|###################################################| 100%
Linking packages ...
[      COMPLETE      ]|###################################################| 100%
   </pre>

0. After install, close and then re-open the terminal window so the changes can take effect.

0. For a list of packages installed locally (in the currently active environment):

   <tt><strong>
   conda list
   </strong></tt>

   The "py36_1" in the list are pip installed.

   <pre>
_license                  1.1                      py36_1  
alabaster                 0.7.9                    py36_0  
anaconda                  4.3.0               np111py36_0  
   </pre>

## .bash_profile config

   TODO: Instructions for both Miniconda and conda.

The path to Python should be the first in PATH:

0. Open a text editor to ~/.bash_profile and add:

   <tt><strong>
   export PATH="~/miniconda2/bin:$PATH"<br />
   export PYTHON_PATH=~/miniconda2/bin/python
   </strong></tt>

   When you're done:
   
0. Activate the shell file :

   <tt><strong>
   source ~/.bash_profile
   </strong></tt>


   ### Troubleshoot

0. To reset:

   brew link --overwrite python

   <pre>
Warning: Already linked: /usr/local/Cellar/python/2.7.12_2<br />
To relink: brew unlink python && brew link python
   </pre>

 


   ### Conda info #

0. Get a list:

   <tt><strong>
   conda info 
   </strong></tt>

   The response:

   <pre>
Current conda install:
&nbsp;
             platform : osx-64
          conda version : 4.3.9
       conda is private : False
      conda-env version : 4.3.9
    conda-build version : 2.1.2
         python version : 3.5.2.final.0
       requests version : 2.12.4
       root environment : /Users/mac/anaconda  (writable)
    default environment : /Users/mac/anaconda
       envs directories : /Users/mac/anaconda/envs
          package cache : /Users/mac/anaconda/pkgs
           channel URLs : https://repo.continuum.io/pkgs/free/osx-64
                          https://repo.continuum.io/pkgs/free/noarch
                          https://repo.continuum.io/pkgs/r/osx-64
                          https://repo.continuum.io/pkgs/r/noarch
                          https://repo.continuum.io/pkgs/pro/osx-64
                          https://repo.continuum.io/pkgs/pro/noarch
            config file : None
           offline mode : False
             user-agent : conda/4.3.9 requests/2.12.4 CPython/3.5.2 Darwin/16.4.0 OSX/10.12.3
                UID:GID : 501:20
       </pre>

   ### Conda environments #

0. Get a list of Conda environments (from any folder) using the -e flag:

   <tt><strong>
   conda info -e
   </strong></tt>

   Alternately, if you like typing long options:

   <tt><strong>
   conda info --env
   </strong></tt>

   The response are like this:

   <pre>
tensorflow_env           /Users/mac/anaconda/envs/tensorflow_env
root                  *  /Users/mac/anaconda
   </pre>

0. Create a Conda environment named py2 using Python 2.7:

   <pre><strong>
   conda create -n py2 python=2.7 anaconda
   </strong></pre>

0. Press y to go ahead.

0. Add python packages, such as TensorFlow:

   <pre><strong>
   conda install -n <em>yourenvname</em> tensorflowp
   conda install -c conda-forge tensorflow
   </strong></pre>

0. Activate to use the environment:

   <pre>
   source activate
   </pre>

0. When done using TensorFlow, deactivate the environment:

   <pre>
   source deactivate
   </pre>



### Conda pyenv #

pyenv enables switch between multiple versions of Python on a single system (laptop). 

0. Create two "named" Conda environments (one with Python2 and the other with Python3):

   <pre><strong>
   conda create -n py3 python=3*
   conda create -n py2 python=2*
   </strong>

0. Set one of these as my default by adding to my terminal startup file ~/.bash_profile:

   <pre><strong>
   source activate py3 
   </strong></pre>

   Typically I only use these "named python" environments to run a Python REPL or do general Python tasks. 
   I'll create another conda environment named specifically for each real project I work on.

### Uninstall

PROTIP: Delete Conda one folder at a time (without the --yes parameter).

   anaconda-clean

   Files such as:

   <pre>
   .conda
   Backup directory: /Users/mac/.anaconda_backup/2017-03-07T051620
   .continuum
   .idlerc
   .ipython
   .jupyter
   .matplotlib
   </pre>

<hr />

http://www.numericalexpert.com/blog/conda_tips/

<hr />

   <a name="PythonPackages"></a>

   ### Install Python packages #

   From inside a conda environment:

0. NumPy at http://www.numpy.org/
   needed by
   http://www.pymvpa.org/installation.html

   <tt><strong>
   pip install numpy
   </strong></tt>

0. Instead of downloading
   http://www.scipy.org/scipylib/download.html#
   linear algebra, standard distributions, signal processing, data IO

   <tt><strong>
   pip install scipy
   </strong></tt>

0. SKlearn

   <tt><strong>
   pip install sklearn
   </strong></tt>

0. Pandas based on
   <a target="_blank" href="https://www.youtube.com/watch?v=0KVIsLTBjWA">
   VIDEO: How to install Pandas</a> Miniconda:

   <tt><strong>
   pip install pandas
   </strong></tt>

   <a target="_blank" href="https://www.youtube.com/channel/UCxn_7r6CDazLYPN9Gm7knDw">
   YouTube videos: Learn Pandas</a> 

0. matplotlib

Other Python packages:

   * xlwings interfaces with Microsoft Excel spreadsheets
   * pygame develops GUI


### OpenCV for computer vision

Follow the instructions below to install python2 + OpenCV in mac

http://www.pyimagesearch.com/2016/11/28/macos-install-opencv-3-and-python-2-7/

In case of python3 + OpenCV follow

http://www.pyimagesearch.com/2016/12/05/macos-install-opencv-3-and-python-3-5/


<hr />


<a name="CommandVersions"></a>

## Python 3 vs. 2

Sure, they say "all new Python code should be written for version 3.
There are so many new features in Python 3 that it doesn't make much sense to stick with Python 2 unless you're working with old code."

Most new features introduced with Python 3 versions not backwards compatible with version 2.


   <a name="Python3z"></a>

   ### Using Python 3

0. After installing Python3, obtain the Python 3 command line with:

   <tt><strong>python3</strong></tt>

   The response I got:

   <pre>
Python 3.4.2 (v3.4.2:ab2c023a9432, Oct  5 2014, 20:42:22)
[GCC 4.2.1 (Apple Inc. build 5666) (dot 3)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
   </pre>

Here are the steps to remove Python3 from your Mac:

   <pre>
   ls -l ~/Library/Frameworks/Python.framework/Versions/3.4/bin/python3
   </pre>

   sudo rm -rf that.


### Floating point

In Python 2, type:

   1/2

   The response is:

   0

In Python3, type:

   1/2

   The response is:

   0.5


### Print

For the most part, Python 2 code works with Python 3. 

Where Python 2 code fails most often is the print statement.
Printing in Python 2 is done like so:

   <pre><strong>print "Hello", "world!"</strong></pre>

   The response:

   Hello world!

   If you input the above in Python 3, the response is:

   SyntaxError: Missing parentheses in call to 'print'
 
   This is because Python 3 uses a function:

   <pre>print("Hello", "world!")</pre>

So in Python 2.6+, use the __future__ module to back-port:

   <pre>from __future__ import print_function
   print("Hello", "world!")
   </pre>

Try this:

   <pre><strong>
   import sys
   print('Python: {}'.format(sys.version))
   </strong></pre>

   The response:

   <pre>
Python: 3.5.2 |Anaconda custom (x86_64)| (default, Jul  2 2016, 17:52:12) 
[GCC 4.2.1 Compatible Apple LLVM 4.2 (clang-425.0.28)]
   </pre>   


BLAH: This doesn't work for me:

   <pre><strong>
import numpy
print('Numpy: {}'.format(numpy.version))
   </strong></pre>

   The response:

   <pre>
Numpy: &LT;module 'numpy.version' from '/Users/mac/anaconda/lib/python3.5/site-packages/numpy/version.py'>
   </pre>   


<a name="PyCharm"></a>

## PyCharm

https://discussions.udacity.com/t/referencing-pygame-from-pycharm-with-anaconda/223711/13


<a name="Turi"></a>

## Turi (Dato) Python algorithms #

<a target="_blank" href="https://dato.com/products/create/">
GraphLab Create</a> from Dato 
provides scalable "pre-implemented" ML algorithms 
using Python installed using Anaconda.
Entire courses on its use is at

* https://www.coursera.org/learn/ml-foundations
* https://www.turi.com/learn/userguide/
* https://www.turi.com/products/create/docs/
* https://github.com/learnml/machine-learning-specialization
* https://www.coursera.org/learn/ml-clustering-and-retrieval/supplement/iF7Ji/software-tools-you-ll-need-for-this-course

When the one-year free license is over, note
scikit-learn also uses Python with Anaconda.


## Python libraries

For matrix operations, use the <a target="_blank" href="http://www.numpy.org/">
Numpy</a> open-source Python library for fast performance with data that fits in memory.
<a target="_blank" href="https://docs.scipy.org/doc/numpy-dev/user/quickstart.html">
Quickstart</a>.

In a requirements.txt file: 

tweepy (http://www.tweepy.org)

csv (https://pypi.python.org/pypi/csv)

textblob (https://textblob.readthedocs.io/en/dev/)

keras (https://keras.io)


bokeh
Flask
ipython
jupyter
matplotlib
nose
numpy
pandas
Pillow
pymc
requests
scikit-image
scikit-learn
scipy
seaborn
statsmodel
tensorflow
virtualenv
virtualenvwrapper

## OpenCV3

<pre>
brew tap homebrew/science && brew update
brew install opencv3 --with-contrib --with-python3 --without-python
ln -s /usr/local/opt/opencv3/lib/python3.6/site-packages/cv2.cpython-36m-darwin.so /usr/local/lib/python3.6/site-packages/cv2.so
export PYTHONPATH=$PYTHONPATH:/usr/local/Cellar/opencv3/3.2.0/lib/python3.6/site-packages
   </pre>

## Data Manipulation #

<a target="_blank" href="https://github.com/dato-code/SFrame">
SFrame</a> is an open-source, highly-scalable Python library for data manipulation. 
Unlike <a target="_blank" href="http://pandas.pydata.org/">
Pandas</a>, SFrame is not limited to datasets which can fit in memory, 
so it can deal with large datasets, even on a laptop.

http://stackoverflow.com/questions/509211/explain-pythons-slice-notation/



<hr />
## Miscellaneous #

http://stackoverflow.com/questions/990754/how-to-leave-exit-deactivate-a-python-virtualenv?rq=1

https://gist.github.com/alyssaq/f60393545173379e0f3f
describes install of https://bootstrap.pypa.io/get-pip.py 


## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}

