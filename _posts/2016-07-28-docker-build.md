---
layout: post
title: "Docker build"
excerpt: "Make your own Windows 2016 Docker images to run within a Mac laptop"
tags: [Docker, devops, ci, setup]
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

This tutorial contains a hands-on <strong>step-by-step</strong> instructions for "newbies" to create a Docker image that runs Windows 2016 server within a Mac laptop (the host machine).

This is a companion to ["Docker setup"](/docker-setup/)
and based on https://github.com/StefanScherer/docker-windows-box/

### .

1. Be inside a Terminal window, on any directory.
0. [Install Homebrew](/macos-homebrew/)
0. Install Vagrant.
0. To avoid issues

   <tt><strong>sudo rm /opt/vagrant/embedded/bin/curl
    </strong></tt>

0. Install a Git client.
0. ssh.exe or putty for Windows.

   ### VMWare

   Install VMware Fusion 8.5 for Mac (not the Pro edition) for its drivers.

0. Get the installer from:

   https://www.vmware.com/products/fusion/fusion-evaluation.html

   VMware-Fusion-8.5.8-5824040.dmg is 467 MB.

0. Double-click on the file downloaded to run the installer.
0. Exit the pop-up by clicking the "X" at the upper-left.
0. In Finder, scroll to the "Drives" section on the left pane to click the exit icon to the right of "VMware Fusion".
0. Right-click the .dmg and "Move to Trash".

   PROTIP: There is no need to invoke the program from Applications folder (/Applications/VMware Fusion.app).

   BEWARE: https://communities.vmware.com/thread/543980
   says uninstall Virtual Box solve the issue.

   https://unix.stackexchange.com/questions/169623/yosemite-fusion-7-0-1-now-gets-could-not-open-dev-vmmon-no-such-file-or-dir

   sudo sh VirtualBox_Uninstall.tool

   <a name="Packer"></a>

   ### Packer

   Packer (at <a target="_blank" href="https://packer.io/">packer.io</a>) is from Hashicorp who created Vagrant. It is a cross-vendor utility that builds images used by VMware and cloud providers: Amazon EC2, CloudStack, DigitalOcean, Docker, Google Compute Engine, Microsoft Azure, QEMU, VirtualBox.

0. Install Packer using Homebrew:

   <tt><strong>brew install packer
   </strong></tt>

0. Create a folder to house various repositories from GitHub:

   <pre><strong>
cd ~
mkdir gits
cd gits
   </strong></pre>

   Alternately, some prefer `dev`.

0. Create a folder to house repositories around a subject, such as virtual machines:

   <pre><strong>
cd ~/gits
mkdir vms
cd vms
   </strong></pre>

   Alternately, use your own "subject" folder.

0. Get the Packer scripts (just the latest version):

   <pre><strong>
git clone https://github.com/StefanScherer/packer-windows --depth=1
cd packer-windows 
   </strong></pre>

   Sample response:

   <pre>
Cloning into 'packer-windows'...
remote: Counting objects: 167, done.
remote: Compressing objects: 100% (133/133), done.
remote: Total 167 (delta 42), reused 93 (delta 11), pack-reused 0
Receiving objects: 100% (167/167), 130.58 KiB | 0 bytes/s, done.
Resolving deltas: 100% (42/42), done.
   </pre>

0. Use a text editor to view file `windows_2016_docker.json`.

   The sections are "builder", "provisioners", "Post-processors", and "variables".

   The "iso_url" variable defines the URL to get the Windows 2016 disk image.

   WARNING: The URL changes over time.


   ### Register for Windows ISO file

0. Get to the page providing downloads of Windows Server 2016 Evaluation edition good for 180 days:

   https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2016/

   We come to this page to get a cookie for a Packer script to download.

0. Click Register, and provide your info.
0. Select "ISO" (not Azure or Virtua Lab). Click Continue.
0. Select "English". Click Download.
0. Cancel the download of file:

   14393.0.161119-1705.RS1_REFRESH_SERVER_EVAL_X64FRE_EN-US.iso

   Leave it to the Packer to download the file, but we want to make sure that it downloads the most recent file Microsoft has.

   PROTIP: The file at time of writing is a whopping <strong>6.5 GB</strong>! 
   So it may take hours to download, depending on how fast your internet connection is.


   ### Packer pulls the installer and runs it

0. While in the packer-windows folder, use the Packer file <a target="_blank" href="https://github.com/StefanScherer/packer-windows/blob/my/windows_2016_docker.json">windows_2016_docker.json</a> in the repo from Stefan:

   <tt><strong>
packer build \-\-only=vmware-iso windows_2016_docker.json 
   </strong></tt>

   This downloads the .iso file from Microsoft. Note one of the response lines from it:

   <pre>
vmware-iso: Downloading or copying: http://care.dlservice.microsoft.com/dl/download/1/4/9/149D5452-9B29-4274-B6B3-5361DBDA30BC/14393.0.161119-1705.RS1_REFRESH_SERVER_EVAL_X64FRE_EN-US.ISO
   </pre>

   Packer stores the installer into a folder named "packer_cache". 
   So to run using what has already been downloaded:

   <tt><strong>
packer build \-\-only=vmware-iso windows_2016_docker.json 
\-\-var iso_url=~/gits/vms/packer-windows/packer_cache/49f719e23c56a779a991c4b4ad1680b8363918cd0bfd9ac6b52697d78a309855.iso
   </strong></tt>

   NOTE: This is also MSDN file en_windows_server_2016_x64_dvd_9718492.iso

   PROTIP: The Packer command can be restarted and it restarts where it left off on partial downloads. 
   Once downloaded, it knows to not download again.

   The rest of the response:

   <pre>
    vmware-iso: Download progress: 100%
==> vmware-iso: Creating floppy disk...
    vmware-iso: Copying files flatly from floppy_files
    vmware-iso: Copying file: ./answer_files/2016/Autounattend.xml
    vmware-iso: Copying file: ./floppy/WindowsPowershell.lnk
    vmware-iso: Copying file: ./floppy/PinTo10.exe
    vmware-iso: Copying file: ./scripts/disable-screensaver.ps1
    vmware-iso: Copying file: ./scripts/disable-winrm.ps1
    vmware-iso: Copying file: ./scripts/docker/enable-winrm.ps1
    vmware-iso: Copying file: ./scripts/docker/2016/install-containers-feature.ps1
    vmware-iso: Copying file: ./scripts/microsoft-updates.bat
    vmware-iso: Copying file: ./scripts/win-updates.ps1
    vmware-iso: Done copying files from floppy_files
    vmware-iso: Collecting paths from floppy_dirs
    vmware-iso: Resulting paths from floppy_dirs : []
    vmware-iso: Done copying paths from floppy_dirs
==> vmware-iso: Creating virtual machine disk
==> vmware-iso: Building and writing VMX file
==> vmware-iso: Starting virtual machine...
   </pre>

   ### VMware Fusion Internal Error

   On occassion, my VMware Fusion 8.5 displays "Internal error" upon starting an image.

   <pre>
==> vmware-iso: Error starting VM: VMware error: Error: Cannot connect to the virtual machine
==> vmware-iso: Deleting output directory...
Build 'vmware-iso' errored: Error starting VM: VMware error: Error: Cannot connect to the virtual machine
&nbsp;
==> Some builds didn't complete successfully and had errors:
--> vmware-iso: Error starting VM: VMware error: Error: Cannot connect to the virtual machine
&nbsp;
==> Builds finished but no artifacts were created.
   </pre>

   PROTIP: The Packer command can be restarted and it restarts where it left off

   ### Windows Desktop Update

   Packer shows this message while it constructs a Windows instance:

   <pre>
==> vmware-iso: Waiting for WinRM to become available...
   </pre>

   A cmd.exe window appears to display messages about the Update process, which can take a while.

   <pre>
Checking for Windows Updates
Script: A:\win-updates.ps1
Script User: VAGRANT-2016\vagrant
Started: 9/18/2017 12:30:58 AM
   </pre>

   We wait (with no countdown UI) while this appears:

   <pre>
Downloading updates...
   </pre>

   WARNING: If Windows Update is interrupted, Packer will start again with a new instance of VMware Fusion image, and download again.

   TODO: Contact them and see if we can avoid re-downloading.

0. PROTIP: Keep your laptop plugged into a power source and a (preferrably fast) network.

0. PROTIP: Keep the MacOS screen from going to sleep: choose Apple menu > System Preferences, click Energy Saver.
   Drag the "Display sleep" to "Never".

   PROTIP: To move mouse beyond the Windows machine, press command+Tab until the process you want is highlighted.

   The <strong>WindowsServer2016Docker.vmx</strong> file that VMware Fusion opens is created inside the <strong>output-vmware-iso</strong> folder. However, this folder is <strong>deleted</strong> when you finally see:

   <pre>
Build 'vmware-iso' finished.
==> Build finished. The artifacts of successful builds are:
--> vmware-iso: 'vmware' provider box: windows_2016_docker_vmware.box
   </pre>

   The .box file is in the GitHub root level directory. 

   Custom applications are added within the Vagrant image, not in the .vmx image.

   <a name="VagrantBox"></a>

   <a target="_blank" href="https://gist.github.com/kekru/a76ba9d0592ce198f09f6ba0cefa5afb">
   EXAMPLE</a>, <a target="_blank" label="explains the various option for the box command" href="https://www.vagrantup.com/docs/cli/box.html#box-add">DOCS</a>

0. Vagrant

   <pre><strong>
vagrant box add windows_2016_docker windows_2016_docker_vmware.box
   </strong></pre>

   The response:

   <pre>
 detected as metadata. Adding it directly...
==> box: Adding box 'windows_2016_docker' (v0) for provider: 
    box: Unpacking necessary files from: file:///Users/wilsonmar/gits/vms/packer-windows/windows_2016_docker_vmware.box
==> box: Successfully added box 'windows_2016_docker' (v0) for 'vmware_desktop'!
   </pre>

   PROTIP: The above command adds to folder `~/.vagrant.d/boxes/` under your user home.

0. List Vagrant boxes (to verify):

   <pre><strong>
vagrant box list
   </strong></pre>

   The response should be:

   <pre>
windows_2016_docker (vmware_desktop, 0)
   </pre>

0. List Vagrant commands:

   <pre><strong>
vagrant
   </strong></pre>

   Example:

   <pre>
Usage: vagrant [options] <em>command</em>> [<em>args</em>>]
&nbsp;
    -v, --version                    Print the version and exit.
    -h, --help                       Print this help.
&nbsp;
Common commands:
     box             manages boxes: installation, removal, etc.
     connect         connect to a remotely shared Vagrant environment
     destroy         stops and deletes all traces of the vagrant machine
     global-status   outputs status Vagrant environments for this user
     halt            stops the vagrant machine
     help            shows the help for a subcommand
     init            initializes a new Vagrant environment by creating a Vagrantfile
     login           log in to HashiCorp's Vagrant Cloud
     package         packages a running vagrant environment into a box
     plugin          manages plugins: install, uninstall, update, etc.
     port            displays information about guest port mappings
     powershell      connects to machine via powershell remoting
     provision       provisions the vagrant machine
     push            deploys code in this environment to a configured destination
     rdp             connects to machine via RDP
     reload          restarts vagrant machine, loads new Vagrantfile configuration
     resume          resume a suspended vagrant machine
     share           share your Vagrant environment with anyone in the world
     snapshot        manages snapshots: saving, restoring, etc.
     ssh             connects to machine via SSH
     ssh-config      outputs OpenSSH valid configuration to connect to the machine
     status          outputs status of the vagrant machine
     suspend         suspends the machine
     up              starts and provisions the vagrant environment
     validate        validates the Vagrantfile
     version         prints current and latest Vagrant version
&nbsp;
For help on any individual command run `vagrant COMMAND -h`
&nbsp;
Additional subcommands are available, but are either more advanced
or not commonly used. To see all subcommands, run the command
`vagrant list-commands`.
   </pre>

0. PROTIP: Create a separate folder to house each Vagrant file. Multiple servers can be specified within a single Vagrantfile.

0. Initialize (create a) Vagrantfile with a lot of hints:

   <pre><strong>
vagrant init windows_2016_docker windows_2016_docker_vmware.box
   </strong></pre>

   Example:

   <pre>
A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
   </pre>

0. Edit the Vagrantfile. Without the comments:

   <pre>
Vagrant.configure("2") do |config|
  # Wait max 10 minutes (600 seconds) to start VM without provisioning:
  config.vm.boot_timeout = 600

  config.vm.provider :virtualbox do |p|
    p.name = 'windows_2016_docker'
    config.vm.box_url = "windows_2016_docker_vmware.box"
  end
end
   </pre>

0. Bring up Vagrant .box in the folder:

   <pre><strong>
vagrant up
   </strong></pre>

   Example:

   <pre>
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Box 'windows_2016_docker' could not be found. Attempting to find and install...
    default: Box Provider: virtualbox
    default: Box Version: >= 0
==> default: Box file was not detected as metadata. Adding it directly...
==> default: Adding box 'windows_2016_docker' (v0) for provider: virtualbox
    default: Unpacking necessary files from: file:///Users/wilsonmar/gits/vms/packer-windows/windows_2016_docker_vmware.box
   </pre>

   CAUTION: Do not stop the window (by pressing congtrol+C) unless you want to.

0. Open another Terminal window to login to the new server via SSH (Secure Shell):

   <tt><strong>
vagrant rdp
   </strong></tt>



   ### Windows customizations


   Once your instance is created, you will likely want to make customizations, 
   such as adding applications.

   PROTIP: Make a copy of it before making changes. This takes several Gigabytes.



<hr />


   ### Windows Server

0. Select "Server with Desktop Experience" (not Server Core) to get the Desktop GUI.

0. Create WS 2016 TP5 VM in virtualbox

0. In the new VM, run this:

   https://msdn.microsoft.com/en-us/virtualization/windowscontainers/quick_start/quick_start_configure_host#scripted-existing-system-1-

   Now you can run Windows Containers in the VM. To make the setup a little easier to use, see this: 

    https://aka.ms/containers

https://docs.docker.com/docker-for-mac/#preferences

0. Put it into Docker Hub.


## Add Hyper-V support to 2016 TP5 Docker VM 

https://stefanscherer.github.io/adding-hyper-v-support-to-2016-tp5-docker-vm/

https://github.com/PatrickLang/packer-windows/commit/7e13d4799e28a3afb1e35b878e00394256011022

A more up to date guide Getting started with Windows Containers by @glennsarti

http://glennsarti.github.io/blog/getting-started-with-windows-containers/

https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/

<hr />


   <a name="BuildCommand"></a>

## Build command #

0. View the build command which carries out specifications in Dockerfile
   to package an image to run within Docker containers:

   <tt><strong>
   docker build \-\-help
   </strong></tt>

   The response:

   <pre>
Usage:   docker build [OPTIONS] PATH | URL | -
&nbsp;
Build an image from a Dockerfile
&nbsp;
Options:
      --build-arg value         Set build-time variables (default [])
      --cgroup-parent string    Optional parent cgroup for the container
      --cpu-period int          Limit the CPU CFS (Completely Fair Scheduler) period
      --cpu-quota int           Limit the CPU CFS (Completely Fair Scheduler) quota
  -c, --cpu-shares int          CPU shares (relative weight)
      --cpuset-cpus string      CPUs in which to allow execution (0-3, 0,1)
      --cpuset-mems string      MEMs in which to allow execution (0-3, 0,1)
      --disable-content-trust   Skip image verification (default true)
  -f, --file string             Name of the Dockerfile (Default is 'PATH/Dockerfile')
      --force-rm                Always remove intermediate containers
      --help                    Print usage
      --isolation string        Container isolation technology
      --label value             Set metadata for an image (default [])
  -m, --memory string           Memory limit
      --memory-swap string      Swap limit equal to memory plus swap: '-1' to enable unlimited swap
      --no-cache                Do not use cache when building the image
      --pull                    Always attempt to pull a newer version of the image
  -q, --quiet                   Suppress the build output and print image ID on success
      --rm                      Remove intermediate containers after a successful build (default true)
      --shm-size string         Size of /dev/shm, default value is 64MB
  -t, --tag value               Name and optionally a tag in the 'name:tag' format (default [])
      --ulimit value            Ulimit options (default [])
   </pre>

0. Change directory to the present working directory 
   of the app folder containing a Dockerfile.

   Alternately, the folder path to read can be specified by the "-f" parameter.

0. Build an image referencing the Dockerfile in the present working directory:

   <tt><strong>
   sudo docker build -t dv:02.01 .
   </strong></tt>

   NOTE: A semi-colon separates the REPOSITORY name from the TAG ("02.01").

   PROTIP: It's best practice to tag images by specifying a name after the 
   <strong>-t</strong> flag. 

   WARNING: There is a dot at the end of the command to designate the local folder.

0. After providing the password, the response is like:

   <pre>
Sending build context to Docker daemon 102.4 kB
Step 1 : FROM node:0.10.44-slim
0.10.44-slim: Pulling from library/node
8b87079b7a06: Pull complete 
a3ed95caeb02: Pull complete 
1bb8eaf3d643: Pull complete 
5674f5dccbc4: Pull complete 
b63eb91619dc: Pull complete 
Digest: sha256:c1ddf2b7d80c66ba8883601ef6a5e201ac2b855b87b6589a023ca889aec24204
Status: Downloaded newer image for node:0.10.44-slim
 ---> f73347dab179
Step 2 : ADD . /home/demo/box/
 ---> 812aefdf5cd4
Removing intermediate container 26d14d6cc382
Step 3 : RUN cd /home/demo/box && npm install
 ---> Running in 4f85900e5796
underscore@1.8.3 node_modules/underscore
&nbsp;
async@2.0.1 node_modules/async
└── lodash@4.14.0
&nbsp;
mongoose@4.5.7 node_modules/mongoose
├── sliced@1.0.1
├── ms@0.7.1
├── regexp-clone@0.0.1
├── muri@1.1.0
├── hooks-fixed@1.2.0
├── mpromise@0.5.5
├── kareem@1.1.3
├── mpath@0.2.1
├── async@1.5.2
├── bson@0.4.23
├── mquery@1.11.0 (sliced@0.0.5, debug@2.2.0, bluebird@2.10.2)
└── mongodb@2.1.18 (es6-promise@3.0.2, readable-stream@1.0.31, mongodb-core@1.3.18)
 ---> 1780349c4f38
Removing intermediate container 4f85900e5796
Step 4 : ENTRYPOINT /home/demo/box/boot.sh
 ---> Running in f448f0fed4ec
 ---> 5bb9d72b9e60
Removing intermediate container f448f0fed4ec
Successfully built 5bb9d72b9e60
   </pre>

   Wait for status to go from "Downloading" to "Pull complete".






## Compose #

0. Define a <strong>base docker-compose.yml</strong> to create a new configuration.

0. Define a <strong>production.yml</strong> file to selectively override specific
   the original Compose file.

0. Override the base file with elements of the production.yml file:

   <tt><strong>
   docker-compose -f docker-compose.yml -f production.yml up -d
   </strong></tt>

   See https://docs.docker.com/v1.11/compose/extends/#different-environments
   

### Add Webhooks to Docker Hub #

0. Click the <strong>Webhooks</strong> tab.
0. Click the image under <strong>CREATE A WEBHOOK</strong> (which turns to "+").
0. Type a webhook name. It must be more than 2 characters long.
0. Specify the Webhook URL.

   NOTE: Do not check "When Active, new pushes will trigger automatic builds"

0. Click Create.
0. Activate build trigger.
0. Highlight the contents of field <strong>Trigger URL</strong> containing a string such as:

   <tt><strong>
   https://registry.hub.docker.com/u/user/repo/trigger/123456-1234-1234-12345678912345/
   </strong></tt>

   Your link would have something else than "user/repo" and the GUID at the end.

0. Copy it to Clipboard.

   <hr />

0. Switch to your CI tool (Jenkins), create new Environment Variable.
0. Name each variable. 
   paste it.

   <hr />

   ### Set Docker Trigger URL #

0. Switch to your CI tool (Jenkins).
0. Define a new enviornment variable such as "DOCKER_HUB_TRIGGER".
0. Construct in its value field this:

   <tt><strong>
   curl -H "Content-Type:application/json" --data '{"build":true}' -X POST <em>TRIGGER_URL</em>
   </strong></tt>

0. Switch to Docker Hub to copy




## Resources

See <a target="_blank" href="https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images">
"Docker Explained: Using Dockerfiles to Automate Building of Images"</a>a>

   https://info.microsoft.com/TheUltimateGuideToWindowsServer2016.html

   https://www.microsoft.com/en-us/cloud-platform/windows-server-comparison

   https://channel9.msdn.com/Blogs/windowsserver

   https://www.youtube.com/user/MSCloudOS/playlists?shelf_id=6&view=50&sort=dd



## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
