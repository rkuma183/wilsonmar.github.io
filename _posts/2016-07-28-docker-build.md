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

The object of this tutorial is to succintly present
<strong>step-by-step</strong> instructions 
to <strong>build</strong> Docker images.

More specifically, a Windows 2016 Docker image that runs on a MacOS laptop (the host machine).

This is a companion to ["Docker setup"](/docker-setup/).

1. <a href="#Packer">Packer</a> for "configuration as code".


## Create Docker Windows 2016 instance

Here's how to create a Docker image to run Windows 2016 server, based on

https://github.com/StefanScherer/docker-windows-box/

### .

1. Be inside a Terminal window, on any directory.
0. Install Homebrew.
0. Install Vagrant.
0. Install a Git client.

   <a name="Packer"></a>

   ### Packer

   Packer (at <a target="_blank" href="https://packer.io/">packer.io</a>) is from Hashicorp.

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

0. While in the packer-windows folder, build the base box using the Packer file <a target="_blank" href="https://github.com/StefanScherer/packer-windows/blob/my/windows_2016_docker.json">windows_2016_docker.json</a> in the repo from Stefan:

   <pre><strong>
packer build --only=vmware-iso windows_2016_docker.json
   </strong></pre>

   <pre>
vmware-iso output will be in this color.
Build 'vmware-iso' errored: Failed creating VMware driver: Unable to initialize any driver for this platform. The errors
from each driver are shown below. Please fix at least one driver
to continue:
* Fusion application not found at path: /Applications/VMware Fusion.app
* Fusion application not found at path: /Applications/VMware Fusion.app
==> Some builds didn't complete successfully and had errors:
--> vmware-iso: Failed creating VMware driver: Unable to initialize any driver for this platform. The errors
from each driver are shown below. Please fix at least one driver
to continue:
* Fusion application not found at path: /Applications/VMware Fusion.app
* Fusion application not found at path: /Applications/VMware Fusion.app
==> Builds finished but no artifacts were created.
   </pre>


0. Vagrant

   <pre><strong>
vagrant box add windows_2016_docker windows_2016_docker_vmware.box
   </strong></pre>


   ### Windows Server

1. Get to the page providing downloads of Windows Server 2016 Evaluation edition good for 180 days:

   https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2016/

0. Click Register, and provide your info.
0. Select "ISO" (not Azure or Virtua Lab). Click Continue.
0. Select "English". Click Download.
0. The Download folder pop-up, click OK to:

   14393.0.161119-1705.RS1_REFRESH_SERVER_EVAL_X64FRE_EN-US.iso, 6.5 GB.

0. While you wait, read:

   https://info.microsoft.com/TheUltimateGuideToWindowsServer2016.html

   https://www.microsoft.com/en-us/cloud-platform/windows-server-comparison

   https://channel9.msdn.com/Blogs/windowsserver

   https://www.youtube.com/user/MSCloudOS/playlists?shelf_id=6&view=50&sort=dd

0. Select "Server with Desktop Experience" (not Server Core) to get the Desktop GUI.

0. Create WS 2016 TP5 VM in virtualbox

0. In the new VM, run this:

   https://msdn.microsoft.com/en-us/virtualization/windowscontainers/quick_start/quick_start_configure_host#scripted-existing-system-1-

   Now you can run Windows Containers in the VM. To make the setup a little easier to use, see this: 

    https://aka.ms/containers

https://docs.docker.com/docker-for-mac/#preferences

0. Put it into Docker Hub.



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



## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
