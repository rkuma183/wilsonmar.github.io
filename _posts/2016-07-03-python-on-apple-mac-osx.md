---
layout: post
title: "Python on Mac OSX"
excerpt: "Confusion and errors from many alternatives and options"
tags: [python, apple, mac, setup]
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

This tutorial describes the different options to install
a package manager which helps you find and install Python packages.
Unlike others, this is a hands-on presentation providing step-by-step instructions 
followed by commentary.

Steps here are carefully sequenced for learning of concepts
rather than workflow so each concept introduced is done after the necessary background is learned.


<a name="PythonVersion"></a>

## Python version #

Since Python comes installed on MacOS machines
since the Mavericks version,
we start with this:

(Use the index at the right if you want to jump ahead)

0. Open a Terminal shell window and issue command:

   <tt><strong>
   python \-\-version
   </strong></tt>

   The response on El Capitan version:

   <pre>
   Python 2.7.6
   </pre>

   CAUTION: The version that comes installed with MacOS is obsolete.

   Alternately, if you have installed <a href="#Conda">Conda (described below)</a>,
   you would instead see:

   <pre>
   Python 2.7.12 :: Continuum Analytics, Inc.
   </pre>

0. List your present working directory:

   <tt><strong>
   pwd
   </strong></tt>

   We next use a Python interactive command to obtain this again.

0. Open a Python command-line prompt:

   <tt><strong>
   python
   </strong></tt>

   The response on a new El Capital machine:

   <pre>
   Python 2.7.6 (default, Sep  9 2014, 15:04:36)
   [GCC 4.2.1 Compatible Apple LLVM 6.0 (clang-600.0.39)] on darwin
   Type "help", "copyright", "credits" or "license" for more information.
   >>> 
   </pre>

   \>\>\> is the Python interpreter prompt.

   If you see \>\>\> in front of a command, don't enter that part.
   
0. Display Python's current working directory with these Python statements:

   <tt><strong>
   \>\>\> import os<br />
   \>\>\> os.getcwd()
   </strong></tt>

   The response is your home folder (substitue my "mac" user name with yours):

   <tt>
   '/Users/mac/Downloads'
   </tt>

0. Futhermore...

   <tt><strong>
   \>\>\> import os, sys<br />
   \>\>\> os.path.dirname(os.path.abspath(sys.argv[0]))
   </strong></tt>

   The response is your home folder (substitue "mac" with your user name):

   <tt>
   '/Users/mac'
   </tt>

0. Exit the Python interpreter by typing:

   <tt><strong>
   exit()
   </strong></tt>

   NOTE: MacOS does not come installed with a package manager for Python.


<a name="UpgradePython"></a>

## Upgrade Python #

To build Python on a machine requires a GCC compiler.
One comes with command-line tools installed with
Apple's XCode IDE</a>.

0. Use an internet browser to <a target="_blank" href="https://developer.apple.com/xcode/">
   https://developer.apple.com/xcode</a>

0. Click "Download" and provide your Apple ID.
   You'll need to establish an Apple ID.

0. Select the version to download:

   | File               | Date       | Download | Unpacked |
   | :----------------- | :--------- | -------: | ------: |
   | XCode_8_beta_2.xip | 2016-07-05 |   5.9 GB | 12.32 GB |
   | XCode_7.31         | 2016-05-03 |   3.8 GB | ? |
   | XCode_4.1          | 2014-      |   2.9 GB | ? |
   | XCode_3.2.4        | 2014-      |   2.? GB | ? |

   NOTE: These are massive files that may take a while to download if you don't have a fast internet connection.

   CAUTION: Even more important, make sure that your machine will have enough free space available.

0. Remember to delete the installer after you're done, then 

## Upgrade pip and setuptools #


<a name="BrewPip"></a>

### Install pip #

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

## Virtual Environments #

   Examples of instructions for installing a requirements.txt file 
   are typically preceded by a `source bin/activate` command
   which executes the activate script in the project's bin folder.

   An activate script is placed in each virtual environment established
   to store different sets of dependencies required by different projects in separate isolated locaations.
   
   This solves the &quot;Project X depends on version 1.x but, Project Y needs 4.x&quot; dilemma, 
   and keeps your global site-packages directory clean and manageable.
   - <a target="blank" href="http://docs.python-guide.org/en/latest/starting/install/osx/">
   Python Guide</a>





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
   Wheels are a pre-built distribution format that provides faster installation compared to Source Distributions (sdist), 
   especially when a project contains compiled extensions.

   <tt><strong>
   pip install \-\-use-wheel <em>package</em>
   </strong></tt>

   The steps to follow describe how to install pip:


<a id="PackagInstallerz"></a>

## Python installation #

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


## Python Package Install Options #

There is what can be a confusing conflict of choice here for installing Python and its package manager.

The "traditional" approach:

   * <a href="#PIPz">pip</a> (Python Installation Packager) is built on top of <strong>setuptools</strong> which
   is what downloads and installs Python software over a network (usually the Internet) with a single command (easy_install). 
   It itself is installed using easy_install.

   * <a href="#easy_install">easy_install</a> is an environment manager.
   <br /><br />

Alternatively, there are these alternatives from Continuum Analytics:

   * <a href="#Conda">Conda</a> is the command-line tool that combines functionality of pip and virtualenv
   * <a href="#MiniConda">Miniconda</a> is a lightweight distribution of conda
   * Anaconda contains a curated collection of over 720 "common" packages for scientific python users. It goes on top of miniconda.
   <br /><br />

Differences among them:

* Pip is a package manager.
* Virtualenv is an environment manager. 
* Conda is both.

* pip can install anything from PyPI in one command. 
* Conda requires at least three commands: skeleton, build, install, and possibly more

* Conda handles library dependencies outside of the Python packages as well as the Python packages themselves. 

* Conda installs from binary, meaning that someone (e.g., Continuum) 
   has already done the hard work of compiling the package, making installation easier and faster.

* Conda uses its own format, which has some advantages (like being static, and again, Python agnostic). 



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

   <a name="Conda"></a>

   ### Update Conda verson #

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

0. For a list of packages installed in the currently active environment:

   <tt><strong>
   conda list
   </strong></tt>

  
   ### Path to Miniconda executables #

0. To see what MacOS

   <tt><strong>
   which python
   </strong></tt>

   The response on my machine (yours will have something else than "mac"):

   <pre>
   /Users/mac/miniconda2/bin/python
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
   
0. Open a text editor to ~/.bash_profile and add:

   <tt><strong>
   export PATH="~/miniconda2/bin:$PATH"<br />
   export PYTHON_PATH=~/miniconda2/bin/python
   </strong></tt>

0. Activate the shell file as if you logged in:

   <tt><strong>
   source ~/.bash_profile
   </strong></tt>



0. For just the version number:

   <tt><strong>
   conda \-\-version
   </strong></tt>

   The response:

   <pre>
   conda 4.1.8
   </pre>

0. For details:

   <tt><strong>
   conda info
   </strong></tt>

   The response:

   <pre>
Current conda install:
&nbsp;
             platform : osx-64
        conda version : 4.1.8
    conda-env version : 2.5.1
  conda-build version : not installed
       python version : 2.7.12.final.0
     requests version : 2.10.0
     root environment : /Users/mac/miniconda2  (writable)
  default environment : /Users/mac/miniconda2
     envs directories : /Users/mac/miniconda2/envs
        package cache : /Users/mac/miniconda2/pkgs
         channel URLs : https://repo.continuum.io/pkgs/free/osx-64/
                        https://repo.continuum.io/pkgs/free/noarch/
                        https://repo.continuum.io/pkgs/pro/osx-64/
                        https://repo.continuum.io/pkgs/pro/noarch/
          config file : None
         offline mode : False
    is foreign system : False
       </pre>

0. Download a cheat-sheet of Conda commands in a PDF file:

   * <a target="_blank" href="http://conda.pydata.org/docs/_downloads/conda-cheatsheet.pdf">
   http://conda.pydata.org/docs/_downloads/conda-cheatsheet.pdf</a>



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

## Virtual Python environments #

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
 
 Next up, well - let's cheat - in terminal, type:
 
 sudo pip install virtualenv
 
 su root
 easy_install [LIBRARY NAME]
 
 
 
 
 
 -->
This explanation forks 
http://coolestguidesontheplanet.com/getting-started-vagrant-os-osx-10-9-mavericks/

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

Click New
</p>


## Vagrant #

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

## Using Python 2 #

<div class="sidenote">
<a target="_blank" href="http://youshoulddoityourself.blogspot.com/2010/11/test.html">
This advice from 2010</a>
</div>

Where you are picking up Python from?

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


Do not delete or modify the system-provided Python in<br />
/System/Library/Frameworks/Python.framework and /usr/bin/python<br />
or you will hose your operating system and need to reinstall Yosemite.

Install packages:

<pre><strong>
pip install numpy
pip install scipy
</strong></pre>

Instead of downloading
http://www.scipy.org/scipylib/download.html#
linear algebra, standard distributions, signal processing, data IO

http://www.numpy.org/

which are needed by
http://www.pymvpa.org/installation.html



<a id="PythonHTTP"></a>

## Start a HTTP Server Using Python


A simple HTTP server service can be started with command:

<pre><strong>
python -m SimpleHTTPServer
</strong></pre>

For Python3: 

<pre><strong>
python -m http.server
</strong></pre>

 


<a id="Python3z"></a>

## Using Python 3

0. After installing Python3, obtain the Python 3 command line with:

   <tt><strong>python3</strong></tt>

   The response I got:

   <pre>
Python 3.4.2 (v3.4.2:ab2c023a9432, Oct  5 2014, 20:42:22)
[GCC 4.2.1 (Apple Inc. build 5666) (dot 3)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
   </pre>

   Unlike Apple's default install of 2.x, version 3.x installs into your own library folder. 
   Using the symbol ~ as a shorthand for /Users/&LT;your acct name>, then we can write the location as:

   <pre>
   ~/Library/Frameworks/Python.framework/Versions/3.4/bin/python3
   </pre>



## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
