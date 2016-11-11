---
layout: post
title: "Docker setup"
excerpt: "Get little bits working together"
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
to contrast the setup of Docker on Mac OSX, CentOS Linux, and 
<a href="#Docker4Windows">Windows</a>.

{% include _intro.html %}


## VMs vs. Docker #

<amp-img width="690" height="516" alt="dockervsvmhost 690x516-i36.png" 
src="https://cloud.githubusercontent.com/assets/20669891/17195327/e4f823fc-5411-11e6-9648-752a31fa03a8.png"></amp-img>

With Virtual Memory (VM), every image keeps its own copy of the operating system kernel 
and associated libraries in addition to apps running within each.

Docker enables the read-only portion of a Linux operating system kernel 
to be shared among several images.
Each image has its own lib and bin folders containing executables.

Docker enables developers and system administrators 
<strong>port</strong> applications
across systems and machines easily, 
with all dependencies intact.

Docker containers are created using docker images, 
built by parsing a <strong>Dockerfile</strong> 
containing Docker commands.

### Competition

<a target="_blank" href="https://coreos.com/">
CoreOS</a> developed
<a target="_blank" href="https://github.com/appc/spec/">
appc</a> with a rkt (pronounced "rocket") implementation
in their 
<a target="_blank" href="https://www.opencontainers.org/">
Open Containers Initiative</a> (OCI)


<hr />

## Installer download #

Docker was originally created for different flavors of Linux

   * Ubuntu
   * <a href="#Docker4Centos">CentOS</a>
   * BSDLinux
   * etc.

<a name="Docker4Mac"></a>

### Install Docker on Mac OSX #

<strong>Docker for Mac</strong> was added 2016 for installing Docker on Mac OSX.

   WARNING: The product is labeled Beta as of this writing (July 2016).
   If your Mac has OS X 10.10.3 Yosemite or newer,
   <strong>Docker on Mac</strong>
   runs as a <strong>native</strong> Mac application.

   TECHNICAL NOTE: Docker for Mac uses the
   <a target="_blank" href="https://github.com/docker/HyperKit/">
   HyperKit VM</a>
   ("xhyve") to virtualize the Docker Engine environment 

Docker for Mac replaces Docker Toolbox on the latest Mac operating sytem.

But Docker Toolbox is still used for older Mac operating systems (before Yosemite).

   NOTE: The version of Linux that comes with Mac isn't completely compatible with Linux.
   So an extra layer is needed to emulate a Docker host.
   That’s <a target="_blank" href="https://github.com/boot2docker/osx-installer/releases/tag/v1.6.0">
   Boot2Docker</a>.

0. If you've previously installed Boot2Docker or Docker for Mac, uninstall it
   by deleting it within your Applications folder.

0. Get to downloads folder for Mac at:<br />
   <a target="_blank" href="https://www.docker.com/products/docker#/mac">
   https://www.docker.com/products/docker#/mac</a>
   
   Note "Docker Toolbox" is no longer used, which depended on Virtualbox.
   At time of writing I had Virtualbox version 5.1.2 installed, 
   so can be left installed.
   <a target="_blank" href="https://docs.docker.com/engine/installation/mac/#/docker-for-mac">
   Docs here</a> 
   says VirtualBox prior to version 4.3.30 must NOT be installed (it is incompatible with Docker for Mac). 

   Alternately, install <a target="_blank" href="https://www.docker.com/products/docker-toolbox">
   https://www.docker.com/products/docker-toolbox</a>
   if you have an old edition of Mac
   running OS X 10.8 “Mountain Lion” or later.

0. Click "Get Docker for Mac" to download to your Downloads folder.
0. In Finder, navigate to you Download folder to double-click
   <strong>Docker.dmg</strong>

   PROTIP: Change the file name if you're keeping back versions.

   | Date of file | Version           | Download | Folder   |
   | -----------: | ----------------- | -------: | -------: | 
   | Oct 17, 2016 | Docker.dmg | 111 MB | 208.1 MB |
   | July 19, 2016 | Docker.dmg | 114.0 MB | 225.1 MB |
   | July 19, 2016 | Docker.dmg | 107.0 MB | 225.1 MB |
   | June 17, 2016 | 1.12.0-rc2-beta16 | 113.5 MB | 224.1 MB |

0. Double-click on Docker.dmg to open it.
0. Drag and drop the whale into the Applications folder.
0. Click Replace the previous version, if applicable.
0. Click X to dismiss the pop-up.
0. In the Applications folder, open the Docker app.
0. Click Next.
0. Click OK.
0. Input Apple password.
0. Click Got it!.

   <a target="_blank" href="https://docs.docker.com/engine/reference/commandline/cli/">
   TECHNICAL NOTE:</a> The Docker command line stores its configuration files in 
   a hidden directory <strong>.docker</strong> within your $HOME directory (cd ~).

0. Click the whale icon at the top of your Mac for this menu:

   ![docker mac 20161110-270x248](https://cloud.githubusercontent.com/assets/23315276/20192045/6e818ca4-a745-11e6-8c15-a1b808212344.jpg)

0. Click Preferences.
0. Uncheck "Automatically start Docker when you log in."<br />
   if you are not a frequent user.

0. Skip to <a href="#VerifyInstall">verify Docker install</a>.

   Obsolete instructions to install
   using 
   Homebrew cask:

   Linux kernel-specific features for the Docker daemon.

   Alternately, Docker 0.8 or newer can be run on Macs 
   thanks to a specially developed, lightweight VirtualBox VM. 

   To start this, use the "quickstart terminal"
   which fires up Virtualbox.

   https://www.youtube.com/watch?v=v1BfbZu8EMw


<a name="Docker4Windows"></a>

### Install Docker on Windows 10 #

The below enhances https://docs.docker.com/docker-for-windows/

CAUTION: A 64-bit machine is necessary.

0. Enable Microsoft Hyper-V necessary to run Docker for Windows.

   CAUTION: This renders ususable Oracle Virtual Box VMs running
   <a target="_blank" href="https://docs.docker.com/toolbox/overview/">
   Docker Toolbox</a>.

0. Upgrade Windows 10 to the <a target="_blank" href="https://blogs.windows.com/windowsexperience/2016/08/02/how-to-get-the-windows-10-anniversary-update/#3jvuXUzhTHYift0W.97">
   <strong>"Anniversay Update"</strong></a> 
   <a target="_blank" href="https://blogs.windows.com/windowsexperience/2016/08/02/how-to-get-the-windows-10-anniversary-update/#VjM80RVylUUJ9pJ6.99">1607 (KB3194798)</a>
   released October 11, 2016 or
   <a target="_blank" href="https://support.microsoft.com/en-us/help/12387/windows-10-update-history">
   more recent</a>.

   <a target="_blank" href="https://blogs.windows.com/windowsexperience/2016/08/02/new-video-series-this-week-on-windows-highlights-windows-10-anniversary-update/#dfSWt7CfzxgoJYIF.97">
   See the video</a>.

   In Settings > Updates & Security > Windows Update > Update &amp; Security > Check for Updates
   > Update.

0. At <a target="_blank" href="https://docs.docker.com/docker-for-windows/">
   https://docs.docker.com/docker-for-windows</a>,<br />
   Click "Get Docker for Windows (stable)" (not the more volatile Beta).

   This downloads InstallDocker.msi (105 MB),
   typically to your Downloads folder.

   NOTE: There is no Chocolatey module yet.

0. Double-click InstallDocker.msi to run the installer.

0. If you haven’t already downloaded the installer (InstallDocker.msi), you can get it here. It 

0. Follow the install wizard to accept the license, authorize the installer, and proceed with the install.

0. Authorize Docker.app with your system password when prompted, 
   since privileged access is needed to install networking components, 
   links to the Docker apps, and manage the Hyper-V VMs.

0. Click Finish on the setup complete dialog to launch Docker.

   The same <a href="#ModulesInstalled">modules are installed</a>.

0. Skip to <a href="#VerifyInstall">verify Docker install</a>.


<a name="Docker4Alpine"></a>

### Install Linux Alpine #

The Alpine Linux distribution (distro) is small that it has an edition for the Raspberry Pi.

0. At <a target="_blank" href="https://alpinelinux.org/">
   https://alpinelinux.org</a>

0. Click the iso file:

   | File Date  | Download          | Type  | Size MB |
   | ---------- | ----------------: | ----- | -------: |
   | 2016-09-28 | alpine-virt-3.4.4-x86_64.iso | Virtual | 39 MB |
   | 2016-09-28 | alpine-3.4.4-x86_64.iso | Standard | 85 MB |
   | 2016-09-28 | alpine-extended-3.4.4-x86_64.iso | Extended | 311 MB |

0. Verify a hash (SHA) from the website.
0. Use a utility that can read .iso files.

0. Skip to <a href="#VerifyInstall">verify Docker install</a>.

<a name="Docker4Centos"></a>

### Install Docker in CentOS #

   There are two methods for installing Docker on CentOS 7:

   1. Installing Docker on an existing installation of the operating system. 

   2. Spin up a server with Docker Machine which auto-installs Docker.


The Docker installation package available in the official CentOS 7 repository may not be the latest version. To get the latest and greatest version, install Docker from the official Docker repository.

0. First, update the package database:

   <tt><strong>
   sudo yum check-update
   </strong></tt>

   The response:

   <pre>
Failed to set locale, defaulting to C
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.n5tech.com
 * extras: mirror.pac-12.org
 * updates: mirror.math.princeton.edu
    </pre>

0. Add the official Docker repository, download the latest version of Docker, and install it:

   <tt><strong>
   curl -fsSL https://get.docker.com/ | sh
   </strong></tt>

   The response:

   <pre>
+ sh -c 'sleep 3; yum -y -q install docker-engine'
Failed to set locale, defaulting to C
warning: /var/cache/yum/x86_64/7/docker-main-repo/packages/docker-engine-selinux-1.11.2-1.el7.centos.noarch.rpm: Header V4 RSA/SHA512 Signature, key ID 2c52609d: NOKEY
Public key for docker-engine-selinux-1.11.2-1.el7.centos.noarch.rpm is not installed
Importing GPG key 0x2C52609D:
 Userid     : "Docker Release Tool (releasedocker) <docker@docker.com>"
 Fingerprint: 5811 8e89 f3a9 1289 7c07 0adb f762 2157 2c52 609d
 From       : https://yum.dockerproject.org/gpg
setsebool:  SELinux is disabled.
libsemanage.semanage_exec_prog: Child process /sbin/setfiles did not exit cleanly.
libsemanage.semanage_install_active: setfiles returned error code -1.
libsemanage.semanage_exec_prog: Child process /sbin/setfiles did not exit cleanly.
libsemanage.semanage_install_active: setfiles returned error code -1.
/usr/sbin/semodule:  Failed!
&nbsp;
If you would like to use Docker as a non-root user, you should now consider
adding your user to the "docker" group with something like:
&nbsp;
  sudo usermod -aG docker your-user
&nbsp;
Remember that you will have to log out and back in for this to take effect!
   </pre>

0. With installation complete, start the Docker daemon:

   <tt><strong>
   sudo systemctl start docker
   </strong></tt>

   No response is returned.

   NOTE: By default, docker commands require root privileges.
   So commands need to be prefixed with Linux sudo.


0. Verify it's running:

   <tt><strong>
   sudo systemctl status docker -l
   </strong></tt>

   The response:

   The output should be similar to the following, showing that the service is active and running:

   <pre>
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: active (running) since Wed 2016-07-27 22:37:40 UTC; 1min 10s ago
     Docs: https://docs.docker.com
 Main PID: 3158 (docker)
   Memory: 16.3M
   CGroup: /system.slice/docker.service
           ├─3158 /usr/bin/docker daemon -H fd://
           └─3161 docker-containerd -l /var/run/docker/libcontainerd/docker-containerd.sock --runtime docker-runc --start-timeout 2m
&nbsp;
Jul 27 22:37:40 centos-512mb-sfo2-01 docker[3158]: time="2016-07-27T22:37:40.656780521Z" level=warning msg="Running modprobe bridge br_netfilter failed with message: modprobe: WARNING: Module br_netfilter not found.\ninsmod /lib/modules/3.10.0-327.22.2.el7.x86_64/kernel/net/llc/llc.ko \ninsmod /lib/modules/3.10.0-327.22.2.el7.x86_64/kernel/net/802/stp.ko \ninsmod /lib/modules/3.10.0-327.22.2.el7.x86_64/kernel/net/bridge/bridge.ko \n, error: exit status 1"
Jul 27 22:37:40 centos-512mb-sfo2-01 docker[3158]: time="2016-07-27T22:37:40.673905283Z" level=info msg="Firewalld running: false"
Jul 27 22:37:40 centos-512mb-sfo2-01 docker[3158]: time="2016-07-27T22:37:40.749552123Z" level=info msg="Default bridge (docker0) is assigned with an IP address 172.17.0.0/16. Daemon option --bip can be used to set a preferred IP address"
Jul 27 22:37:40 centos-512mb-sfo2-01 docker[3158]: time="2016-07-27T22:37:40.812028054Z" level=warning msg="mountpoint for pids not found"
Jul 27 22:37:40 centos-512mb-sfo2-01 docker[3158]: time="2016-07-27T22:37:40.812680271Z" level=info msg="Loading containers: start."
Jul 27 22:37:40 centos-512mb-sfo2-01 docker[3158]: time="2016-07-27T22:37:40.812815226Z" level=info msg="Loading containers: done."
Jul 27 22:37:40 centos-512mb-sfo2-01 docker[3158]: time="2016-07-27T22:37:40.812841211Z" level=info msg="Daemon has completed initialization"
Jul 27 22:37:40 centos-512mb-sfo2-01 docker[3158]: time="2016-07-27T22:37:40.812872955Z" level=info msg="Docker daemon" commit=b9f10c9 graphdriver=devicemapper version=1.11.2
Jul 27 22:37:40 centos-512mb-sfo2-01 docker[3158]: time="2016-07-27T22:37:40.850984219Z" level=info msg="API listen on /var/run/docker.sock"
Jul 27 22:37:40 centos-512mb-sfo2-01 systemd[1]: Started Docker Application Container Engine.
   </pre>

0. Configure to git it to start at every server reboot:

   <tt><strong>
   sudo systemctl enable docker
   </strong></tt>

   NOTE: This only needs to be done once per instance.

   The response:

   <tt>
   Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to 
   /usr/lib/systemd/system/docker.service.
   </tt>

0. Skip to <a href="#VerifyInstall">verify Docker install</a>.


<hr />

<a name="VerifyInstall"></a>

## After install #

After installation, Docker commands are similar on all operating systems:

0. Open a Terminal shell window.

0. Get Docker version property:

   <pre><strong>
   docker --version
   </strong></pre>

   The response:
   
   <pre>
Docker version 1.12.3, build 6b644ec
   </pre>

   Notice "experimental" has been removed.

0. List all docker commands:

   <tt><strong>
   docker
   </strong></tt>

   The response:

   <pre>
Usage: docker [OPTIONS] COMMAND [arg...]
       docker [ --help | -v | --version ]
&nbsp;
A self-sufficient runtime for containers.
&nbsp;
Options:
&nbsp;
  --config=~/.docker              Location of client config files
  -D, --debug                     Enable debug mode
  -H, --host=[]                   Daemon socket(s) to connect to
  -h, --help                      Print usage
  -l, --log-level=info            Set the logging level
  --tls                           Use TLS; implied by --tlsverify
  --tlscacert=~/.docker/ca.pem    Trust certs signed only by this CA
  --tlscert=~/.docker/cert.pem    Path to TLS certificate file
  --tlskey=~/.docker/key.pem      Path to TLS key file
  --tlsverify                     Use TLS and verify the remote
  -v, --version                   Print version information and quit
&nbsp;
Commands:
    attach    Attach to a running container
    build     Build an image from a Dockerfile
    commit    Create a new image from a container's changes
    cp        Copy files/folders between a container and the local filesystem
    create    Create a new container
    deploy    Create and update a stack from a Distributed Application Bundle (DAB)
    diff      Inspect changes on a container's filesystem
    events    Get real time events from the server
    exec      Run a command in a running container
    export    Export a container's filesystem as a tar archive
    history   Show the history of an image
    images    List images
    import    Import the contents from a tarball to create a filesystem image
    info      Display system-wide information
    inspect   Return low-level information on a container, image or task
    kill      Kill one or more running container
    load      Load an image from a tar archive or STDIN
    login     Log in to a Docker registry.
    logout    Log out from a Docker registry.
    logs      Fetch the logs of a container
    network   Manage Docker networks
    node      Manage Docker Swarm nodes
    pause     Pause all processes within one or more containers
    plugin    Manage Docker plugins
    port      List port mappings or a specific mapping for the container
    ps        List containers
    pull      Pull an image or a repository from a registry
    push      Push an image or a repository to a registry
    rename    Rename a container
    restart   Restart a container
    rm        Remove one or more containers
    rmi       Remove one or more images
    run       Run a command in a new container
    save      Save one or more images to a tar archive (streamed to STDOUT by default)
    search    Search the Docker Hub for images
    service   Manage Docker services
    stack     Manage Docker stacks
    start     Start one or more stopped containers
    stats     Display a live stream of container(s) resource usage statistics
    stop      Stop one or more running containers
    swarm     Manage Docker Swarm
    tag       Tag an image into a repository
    top       Display the running processes of a container
    unpause   Unpause all processes within one or more containers
    update    Update configuration of one or more containers
    <strong>version</strong>   Show the Docker version information
    volume    Manage Docker volumes
    wait      Block until a container stops, then print its exit code
&nbsp;
Run 'docker COMMAND --help' for more information on a command.
   </pre>


0. Obtain the version number using a sub-command:

   <tt><strong>
   docker version
   </strong></tt>

   Sample response on the Mac:

    <pre>
Client:
 Version:      1.12.3
 API version:  1.24
 Go version:   go1.6.3
 Git commit:   6b644ec
 Built:        Wed Oct 26 23:26:11 2016
 OS/Arch:      darwin/amd64
&nbsp;
Server:
 Version:      1.12.3
 API version:  1.24
 Go version:   go1.6.3
 Git commit:   6b644ec
 Built:        Wed Oct 26 23:26:11 2016
 OS/Arch:      linux/amd64
   </pre>

   Sample response on Centos:

    <pre>
Client:
 Version:      1.11.2
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   b9f10c9
 Built:        Wed Jun  1 21:23:11 2016
 OS/Arch:      linux/amd64
&nbsp;
Server:
 Version:      1.11.2
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   b9f10c9
 Built:        Wed Jun  1 21:23:11 2016
 OS/Arch:      linux/amd64
   </pre>

   Sample response on Windows:

   <pre>
   Client:
   Version:      1.12.0
   API version:  1.24
   Go version:   go1.6.3
   Git commit:   8eab29e
   Built:        Thu Jul 28 21:04:48 2016
   OS/Arch:      windows/amd64
   Experimental: true
&nbsp;
   Server:
   Version:      1.12.0
   API version:  1.24
   Go version:   go1.6.3
   Git commit:   8eab29e
   Built:        Thu Jul 28 21:04:48 2016
   OS/Arch:      linux/amd64
   Experimental: true
   </pre>

0. Obtain status using the info sub-command:

   <tt><strong>
   docker info
   </strong></tt>

   An example of command output for docker info on Windows:

   <pre>
Containers: 0
 Running: 0
 Paused: 0
 Stopped: 0
Images: 0
Server Version: 1.12.3
Storage Driver: aufs
 Root Dir: /var/lib/docker/aufs
 Backing Filesystem: extfs
 Dirs: 0
 Dirperm1 Supported: true
Logging Driver: json-file
Cgroup Driver: cgroupfs
Plugins:
 Volume: local
 Network: host bridge overlay null
Swarm: inactive
Runtimes: runc
Default Runtime: runc
Security Options: seccomp
Kernel Version: 4.4.27-moby
Operating System: Alpine Linux v3.4
OSType: linux
Architecture: x86_64
CPUs: 4
Total Memory: 1.951 GiB
Name: moby
ID: 6SFI:4ZSJ:27OO:6L65:VZXB:MM6S:TIAT:MC7Z:CVNS:4ECH:N6AY:KTDJ
Docker Root Dir: /var/lib/docker
Debug Mode (client): false
Debug Mode (server): true
 File Descriptors: 15
 Goroutines: 27
 System Time: 2016-11-10T20:54:34.119254981Z
 EventsListeners: 1
No Proxy: *.local, 169.254/16
Registry: https://index.docker.io/v1/
WARNING: No kernel memory limit support
Insecure Registries:
 127.0.0.0/8
   </pre>


<a name="ModulesInstalled"></a>

### Modules installed #

   Installing Docker gives you not just the Docker service (daemon) 
   but also the docker command line utility, or the Docker client.

   Regardless of the OS, the installation provides: 

   * Docker Machine
   * Docker CLI client
   * <a href="#DockerEngine">Docker Engine</a>
   * <a href="#DockerCompose">Docker Compose</a>
   * <a href="#DockerSwarm">Docker Swarm</a>
   <br /><br />

0. See the list of supported drivers at<br />
   <a target="_blank" href="https://docs.docker.com/machine/drivers/">
   https://docs.docker.com/machine/drivers</a>



<hr />

## Extensions


<a name="DockerUCP"></a>

### Docker UCP (Universal Control Plane) #

   UCP enables you to control Docker environments through a 
   <strong>web interface</strong>.
   This is helpful if you want to steer clear of the command line. 

   You can use Docker UCP to deploy to various cloud solutions, 
   tie into your existing authentication infrastructure, 
   and in turn control user access.

   Dockur UCP also provides specialized monitoring.

   <a target="_blank" href="https://docs.docker.com/ucp/">
   https://docs.docker.com/ucp</a><br />
   has more information about Docker UCP.




<a name="DockerHello"></a>

## Run Hello Container #

   PROTIP: Similar to Python, most people run commands within a Docker machine
   (which is the whole point of installing Docker).

   This section describes how to run a Docker image, then remove it.

0. See if it can run anything:

   <tt><strong>
   docker run hello-world
   </strong></tt>

   This uses the default "library" user, so the command is equivalent to:

   <pre>
   docker run library/hello-world
   </pre>

   If you get this:

   <pre>
docker: Cannot connect to the Docker daemon. Is the docker daemon running on this host?.
See 'docker run --help'.
   </pre>

   If the image specified is not found, Docker gets it for you:

   <pre>
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
c04b14da8d14: Pull complete 
Digest: sha256:0256e8a36e2070f7bf2d0b0763dbabdd67798512411de4cdcf9431a1feb60fd9
Status: Downloaded newer image for hello-world:latest
&nbsp;
Hello from Docker!
This message shows that your installation appears to be working correctly.
&nbsp;
To generate this message, Docker took the following steps:
\1. The Docker client contacted the Docker daemon.
\2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
\3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
\4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.
&nbsp;
To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash
&nbsp;
Share images, automate workflows, and more with a free Docker Hub account:
 https://hub.docker.com
&nbsp;
For more examples and ideas, visit:
 https://docs.docker.com/engine/userguide/
   </pre>

   See https://docs.docker.com/docker-for-windows/


   ### Ubuntu inside Mac

0. To run the latest Ubuntu box inside your Mac:

   <tt><strong>
   docker run -ti ubuntu bash
   </strong></tt>

   Alternately, run version 14.04 of Ubuntu:

   <tt><strong>
   docker run --net=host -ti ubuntu:14.04 bash
   </strong></tt>

   After downloads, you should see a bash prompt such as:

   <pre>
root@ee355a835ff8:/# 
   </pre>

0. Get the version:

   <tt><strong>
   uname -a
   </strong></tt>

   Response:

   <pre>
Linux ee355a835ff8 4.4.27-moby #1 SMP Wed Oct 26 14:21:29 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
   </pre>

   NOTE: You can't run docker commands on this prompt because you're inside.

0. Press Control+C or type exit:

   <tt><strong>
   exit
   </strong></tt>



   <a name="DockerContainers"></a>

   ### List Docker Containers #

0. List Docker containers and their identifiers:

   <tt><strong>
   docker ps -a
   </strong></tt>

   Add -a shows inactive as well as the default active listing.
   (Kinda counter-intuitive)

   Widen your screen to avoid wrapping:

   <pre>
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS                                           NAMES
2289fc019878        nginxdemos/hello    "nginx -g 'daemon off"   32 minutes ago      Up 32 minutes               0.0.0.0:32769->80/tcp, 0.0.0.0:32768->443/tcp   trusting_euler
75ae035ab68b        hello-world         "/hello"                 39 minutes ago      Exited (0) 39 minutes ago                                                   serene_sammet
   </pre>

0. To list Docker images:

   <tt><strong>
   docker images
   </strong></tt>

   <pre>
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
nginxdemos/hello    latest              0ec165d1eb3a        12 hours ago        54.24 MB
ubuntu              latest              f753707788c5        4 weeks ago         127.2 MB
hello-world         latest              c54a2cc56cbb        4 months ago        1.848 kB
   </pre>

0. List Docker machines:

   <tt><strong>
   docker-machine ls
   </strong></tt>

   Example response:

   <pre>
NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER    ERRORS
default   -        virtualbox   Running   tcp://192.168.99.100:2376           v1.12.3   
   </pre>

   See https://docs.docker.com/machine/get-started/

0. Connect your shell to the new machine
   (per https://docs.docker.com/machine/reference/env/):

   <tt><strong>
   eval "$(docker-machine env default)"
   </strong></tt>

   No response is displayed becuase the command runs:

   <pre><strong>
   docker-machine env
   </strong></pre>

   which is:

   <pre>
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/mac/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
# Run this command to configure your shell: 
# eval $(docker-machine env)
   </pre>

   PROTIP: On a Mac, the docker-machine VM is called "default", existing in directory<br />
   /Users/&LT;username>/.docker/machine/machines/default/ 

0. See if the environment variables are set:

   <tt><strong>
   env | grep DOCKER
   </strong></tt>

0. To unset commands:

   <tt><strong>
   eval $(docker-machine env -u)
   </strong></tt>

   which runs:

   <pre>
unset DOCKER_TLS_VERIFY
unset DOCKER_HOST
unset DOCKER_CERT_PATH
unset DOCKER_MACHINE_NAME
# Run this command to configure your shell: 
# eval $(docker-machine env -u)
   </pre>



   ### Remove images

0. To remove an individual Docker image listed above (to free up disk space):

   <tt><strong>
   docker rmi hello-world
   </strong></tt>

   A common error response if you have not first

   <pre>
Error response from daemon: conflict: unable to remove repository reference "hello-world" (must force) - container 75ae035ab68b is using its referenced image c54a2cc56cbb
   </pre>


0. To stop all running docker containers:

   <tt><strong>
   docker stop $(docker ps -a -q)
   </strong>

0. To delete all containers in a single command (to save disk space):

   <tt><strong>
   docker rm $(docker ps -a -q)
   </strong></tt>




   ### No Error Report #

   PROTIP: Whenever an attempt to provision a Dockerized host using Docker Machine fails, 
   or Docker Machine crashes, some diagnostic information is sent automatically to a Docker account on Bugsnag. 

0. Disable this reporting by creating an empty file called no-error-report under your installations .docker/machine directory:

   <tt><strong>
   touch ~/.docker/machine/no-error-report
   </strong></tt>


   ### Start

0. Start again, you don't need to specify "default":

   <tt><strong>
   docker-machine start default
   </strong></tt>

0. Connect:

   <tt><strong>
   docker-machine ssh
   </strong></tt>


   <a name="DockerStop"></a>

   ## Stop #

0. Hard stop:

   <tt><strong>
   docker-machine stop
   </strong></tt>

   PROTIP: Those who use this a often create aliases to limit typing.
   For example, "dmon" for the above command.


<a name="DockerSearch"></a>

## DockerHub Search #

0. See the Officially supported repositories at:<br />
   <a target="_blank" href="https://hub.docker.com/explore/">
   https://hub.docker.com/explore</a>

   They include:

   * operating systems (ubuntu, centos)
   * database server base (redis, mongo, mysql, postgres, elasticsearch)
   * app server base (node, nginx, httpd)
   * blog app server base (wordpress, alpine)
   <br /><br />

0. Search for Ubuntu images on the free and public repository at <br />
   <a target="_blank" href="https://hub.docker.com/">
   https://hub.docker.com</a>

   <tt><strong>docker search ubuntu
   </strong></tt>
   
   The response (27 Jul 2016):

   <pre>
NAME                              DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
ubuntu                            Ubuntu is a Debian-based Linux operating s...   4343      [OK]       
ubuntu-upstart                    Upstart is an event-based replacement for ...   65        [OK]       
rastasheep/ubuntu-sshd            Dockerized SSH service, built on top of of...   30                   [OK]
torusware/speedus-ubuntu          Always updated official Ubuntu docker imag...   26                   [OK]
ubuntu-debootstrap                debootstrap --variant=minbase --components...   25        [OK]       
nickistre/ubuntu-lamp             LAMP server on Ubuntu                           8                    [OK]
nuagebec/ubuntu                   Simple always updated Ubuntu docker images...   6                    [OK]
nickistre/ubuntu-lamp-wordpress   LAMP on Ubuntu with wp-cli installed            6                    [OK]
nimmis/ubuntu                     This is a docker images different LTS vers...   5                    [OK]
maxexcloo/ubuntu                  Docker base image built on Ubuntu with Sup...   2                    [OK]
admiringworm/ubuntu               Base ubuntu images based on the official u...   1                    [OK]
darksheer/ubuntu                  Base Ubuntu Image -- Updated hourly             1                    [OK]
jordi/ubuntu                      Ubunt
u Base Image                               1                    [OK]
esycat/ubuntu                     Ubuntu LTS                                      0                    [OK]
datenbetrieb/ubuntu               custom flavor of the official ubuntu base ...   0                    [OK]
life360/ubuntu                    Ubuntu is a Debian-based Linux operating s...   0                    [OK]
konstruktoid/ubuntu               Ubuntu base image                               0                    [OK]
widerplan/ubuntu                  Our basic Ubuntu images.                        0                    [OK]
croscon/ubuntu                    Crosconized Ubuntu                              0                    [OK]
teamrock/ubuntu                   TeamRock's Ubuntu image configured with AW...   0                    [OK]
ustclug/ubuntu                    ubuntu image for docker with USTC mirror        0                    [OK]
smartentry/ubuntu                 ubuntu with smartentry                          0                    [OK]
dorapro/ubuntu                    ubuntu image                                    0                    [OK]
lynxtp/ubuntu                     https://github.com/lynxtp/docker-ubuntu         0                    [OK]
webhippie/ubuntu                  Docker images for ubuntu                        0                    [OK]
   <pre>

0. Widen the Terminal window so lines don't wrap.

0. Search for centos images on the free and public repository at <br />
   <a target="_blank" href="https://hub.docker.com">
   https://hub.docker.com</a>

   <tt><strong>docker search centos</strong></tt>
   
   The response (27 Jul 2016):

   <pre>
NAME                          DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
centos                        The official build of CentOS.                   2475      [OK]       
jdeathe/centos-ssh            CentOS-6 6.8 x86_64 / CentOS-7 7.2.1511 x8...   26                   [OK]
nimmis/java-centos            This is docker images of CentOS 7 with dif...   13                   [OK]
million12/centos-supervisor   Base CentOS-7 with supervisord launcher, h...   12                   [OK]
consol/centos-xfce-vnc        Centos container with "headless" VNC sessi...   10                   [OK]
torusware/speedus-centos      Always updated official CentOS docker imag...   8                    [OK]
nickistre/centos-lamp         LAMP on centos setup                            4                    [OK]
centos/mariadb55-centos7                                                      3                    [OK]
nathonfowlie/centos-jre       Latest CentOS image with the JRE pre-insta...   3                    [OK]
consol/sakuli-centos-xfce     Sakuli end-2-end testing and monitoring co...   2                    [OK]
timhughes/centos              Centos with systemd installed and running       1                    [OK]
darksheer/centos              Base Centos Image -- Updated hourly             1                    [OK]
blacklabelops/centos          CentOS Base Image! Built and Updates Daily!     1                    [OK]
ericuni/centos                centos dev                                      0                    [OK]
kz8s/centos                   Official CentOS plus epel-release               0                    [OK]
grossws/centos                CentOS 6 and 7 base images with gosu and l...   0                    [OK]
harisekhon/centos-scala       Scala + CentOS (OpenJDK tags 2.10-jre7 - 2...   0                    [OK]
grayzone/centos               auto build for centos.                          0                    [OK]
aguamala/centos               CentOS base image                               0                    [OK]
dmglab/centos                 CentOS with some extras - This is for the ...   0                    [OK]
jsmigel/centos-epel           Docker base image of CentOS w/ EPEL installed   0                    [OK]
januswel/centos               yum update-ed CentOS image                      0                    [OK]
ustclug/centos                 USTC centos                                    0                    [OK]
smartentry/centos             CentOS with smartentry                          0                    [OK]
repositoryjp/centos           Docker Image for CentOS.                        0                    [OK]
   <pre>


0. Alternately, if you want security and have money for license,
   a more secure commercial (paid) repository is at<br /> 
   <a target="_blank" href="https://www.docker.com/products/docker-trusted-registry">
   https://www.docker.com/products/docker-trusted-registry</a>

   A third alternative is<br >
   <a target="_blank" href="https://docs.docker.com/registry">
   https://docs.docker.com/registry</a>

0. Pull down an image from the tutum repository:

   <tt><strong>docker pull ubuntu</strong></tt>


   ### Remove image

0. To remove an image:

   <tt><strong>
   docker rmi ubuntu:trusty
   </strong></tt>

0. Run the latest version image pulled for nginx:

   <tt><strong>
   docker run -i -t nginx:latest /bin/bash
   </strong></tt>


<hr />

<a name="DockerMachine"></a>

## docker-machine install #

<a target="_blank" href="https://www.digitalocean.com/community/tutorials/how-to-provision-and-manage-remote-docker-hosts-with-docker-machine-on-centos-7">
See this</a>.

Docker Machine makes it easy to provision and manage multiple Docker hosts 
remotely from your personal computer. 

0. Type the command by itself for a list of sub-commands:

   <tt><strong>
   docker-machine
   </strong></tt>

   The response shows the sub-commands and options available:

   <pre>
Usage: docker-machine [OPTIONS] COMMAND [arg...]
&nbsp;
Create and manage machines running Docker.
&nbsp;
Version: 0.8.2, build e18a919
&nbsp;
Author:
  Docker Machine Contributors - <https://github.com/docker/machine>
&nbsp;
Options:
  --debug, -D           Enable debug mode
  --storage-path, -s "/Users/mac/.docker/machine" Configures storage path [$MACHINE_STORAGE_PATH]
  --tls-ca-cert           CA to verify remotes against [$MACHINE_TLS_CA_CERT]
  --tls-ca-key            Private key to generate certificates [$MACHINE_TLS_CA_KEY]
  --tls-client-cert           Client cert to use for TLS [$MACHINE_TLS_CLIENT_CERT]
  --tls-client-key          Private key used in client TLS auth [$MACHINE_TLS_CLIENT_KEY]
  --github-api-token          Token to use for requests to the Github API [$MACHINE_GITHUB_API_TOKEN]
  --native-ssh            Use the native (Go-based) SSH implementation. [$MACHINE_NATIVE_SSH]
  --bugsnag-api-token           BugSnag API token for crash reporting [$MACHINE_BUGSNAG_API_TOKEN]
  --help, -h            show help
  --version, -v           print the version
&nbsp;  
Commands:
  active    Print which machine is active
  config    Print the connection config for machine
  create    Create a machine
  env     Display the commands to set up the environment for the Docker client
  inspect   Inspect information about a machine
  ip      Get the IP address of a machine
  kill      Kill a machine
  ls      List machines
  provision   Re-provision existing machines
  regenerate-certs  Regenerate TLS Certificates for a machine
  restart   Restart a machine
  rm      Remove a machine
  ssh     Log into or run a command on a machine with SSH.
  scp     Copy files between machines
  start     Start a machine
  status    Get the status of a machine
  stop      Stop a machine
  upgrade   Upgrade a machine to the latest version of Docker
  url     Get the URL of a machine
  version   Show the Docker Machine version or a machine docker version
  help      Shows a list of commands or help for one command
&nbsp;  
Run 'docker-machine COMMAND --help' for more information on a command.
   </pre>

0. Widen the Terminal window so lines don't wrap.

0. List Docker machine instances:

   <strong><tt>
   docker-machine ls
   </strong></tt>

   The response is a heading above lines, if any:

   <pre>
   NAME   ACTIVE   DRIVER   STATE   URL   SWARM   DOCKER   ERRORS
   </pre>

0. List Docker machine Internet Protocol addresses:

   <strong><tt>
   docker-machine ip
   </strong></tt>

   The response:

   <pre>
192.168.99.100
   </pre>

   ### Create Docker machine

0. Using your Mac's Finder, look in your Applications folder for a Docker folder.
   In there is a <strong>Docker Quickstart Terminal</strong>.

   You can also invoke it by typing on the Mac's Search box.

   It creates a window containing:

   <pre>
Creating CA: /Users/mac/.docker/machine/certs/ca.pem
Creating client certificate: /Users/mac/.docker/machine/certs/cert.pem
Running pre-create checks...
(default) Default Boot2Docker ISO is out-of-date, downloading the latest release...
(default) Latest release for github.com/boot2docker/boot2docker is v1.12.3
(default) Downloading /Users/mac/.docker/machine/cache/boot2docker.iso from https://github.com/boot2docker/boot2docker/releases/download/v1.12.3/boot2docker.iso...
Creating machine...
(default) Copying /Users/mac/.docker/machine/cache/boot2docker.iso to /Users/mac/.docker/machine/machines/default/boot2docker.iso...
(default) Creating VirtualBox VM...
(default) Creating SSH key...
(default) Starting the VM...
(default) Check network to re-create if needed...
(default) Found a new host-only adapter: "vboxnet1"
(default) Waiting for an IP...
&nbsp;
                        ##         .
                  ## ## ##        ==
               ## ## ## ## ##    ===
           /"""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
           \______ o           __/
             \    \         __/
              \____\_______/
&nbsp;
docker is configured to use the default machine with IP 192.168.99.100
For help getting started, check out the docs at https://docs.docker.com
&nbsp;
bash: print: command not found
   </pre>

0. Create a Docker machine named node1 in the local Virtualbox, in debug mode:

   <tt><strong>
   docker-machine create -d virtualbox node1
   </strong></tt>

   Alternately, if you are running docker-machine on windows, you should use Hyper-V :

   <tt><strong>
   docker-machine create --driver hyperv vm
   </strong></tt>

<a name="DockerCommands"></a>

## Docker Commands #

0. There's a different version of each Docker module:

   <pre><strong>
   docker-compose --version
   docker-machine --version
   </strong></pre>

   The responses:

   <pre>
   docker-compose version 1.8.0, build d988a55
   docker-machine version 0.8.0, build b85aac1
   </pre>





<a name="DockerCompose"></a>

## Docker Compose #

See https://docs.docker.com/compose/install/.

Docker compose creates multiple containers with a single command. 

0. Type the command by itself for a list of sub-commands:

   <tt><strong>
   docker-compose
   </strong></tt>

   The response:

   <pre>
Define and run <strong>multi-container applications</strong> with Docker.
&nbsp;
Usage:
  docker-compose [-f <arg>...] [options] [COMMAND] [ARGS...]
  docker-compose -h|--help
&nbsp;
Options:
  -f, --file FILE             Specify an alternate compose file (default: docker-compose.yml)
  -p, --project-name NAME     Specify an alternate project name (default: directory name)
  --verbose                   Show more output
  -v, --version               Print version and exit
  -H, --host HOST             Daemon socket to connect to

  --tls                       Use TLS; implied by --tlsverify
  --tlscacert CA_PATH         Trust certs signed only by this CA
  --tlscert CLIENT_CERT_PATH  Path to TLS certificate file
  --tlskey TLS_KEY_PATH       Path to TLS key file
  --tlsverify                 Use TLS and verify the remote
  --skip-hostname-check       Don't check the daemon's hostname against the name specified
                              in the client certificate (for example if your docker host
                              is an IP address)
&nbsp;
Commands:
  build              Build or rebuild services
  bundle             Generate a Docker bundle from the Compose file
  config             Validate and view the compose file
  create             Create services
  down               Stop and remove containers, networks, images, and volumes
  events             Receive real time events from containers
  exec               Execute a command in a running container
  help               Get help on a command
  kill               Kill containers
  logs               View output from containers
  pause              Pause services
  port               Print the public port for a port binding
  ps                 List containers
  pull               Pulls service images
  push               Push service images
  restart            Restart services
  rm                 Remove stopped containers
  run                Run a one-off command
  scale              Set number of containers for a service
  start              Start services
  stop               Stop services
  unpause            Unpause services
  up                 Create and start containers
  version            Show the Docker-Compose version information
     </pre>

   TODO: An example docker-compose.yml
   <a target="_blank" href="https://sloppy.io/from-dev-to-prod-with-nodejs-and-hackathon-starter-using-docker-compose-part-1/">
   here</a>


<a name="DockerSwarm"></a>

## Docker Swarm #

Docker Swarm allows you to create and manage <strong>clustered</strong> Docker servers. 
to scale containers
by dispersing containers across multiple hosts.

Installing Docker Swarm launches a container that is used as
the Swarm Manager master to communicate to all the nodes in a Swarm cluster.

See https://docs.docker.com/swarm/

http://autopilotpattern.io/



## Additional notes on security #

Docker does have different security requirements which will be a hindrance. 
Security can be integrated but it does require knowledge of the Linux container environment.

https://blog.docker.com/2013/08/containers-docker-how-secure-are-they/


## Learning Resources #

Pluralsight's
<a target="_blank" href="https://app.pluralsight.com/paths/skills/docker">
Container Management using Docker skill path</a> of 
video tutorials by Nigel Poulton
(<a target="_blank" href="https://www.twitter.com/NigelPoulton/">@NigelPoulton</a>)


0. <a target="_blank" href="https://app.pluralsight.com/library/courses/docker-containers-big-picture/table-of-contents">
   Docker and Containers: The Big Picture</a>
   Dec 22, 2015 / 1h 47m

0. <a target="_blank" href="https://app.pluralsight.com/library/courses/docker-deep-dive/table-of-contents">
   Docker Deep Dive</a>
   Jan 28, 2015 / 5h 38m 2s

0. <a target="_blank" href="https://app.pluralsight.com/library/courses/docker-swarm-native-docker-clustering/table-of-contents">
   Docker Swarm: Native Docker Clustering</a>
   Mar 30, 2016 / 2h 22m 28s

0. <a target="_blank" href="https://app.pluralsight.com/library/courses/integrating-docker-with-devops-automated-workflows/table-of-contents">
   Integrating Docker with DevOps Automated Workflows</a>
   Sept 21, 2015 / 1h 1m 50s

0. <a target="_blank" href="https://app.pluralsight.com/library/courses/docker-web-development/table-of-contents">
   Docker for Web Developers</a>
   by Dan Wahlin
   28 Mar 2016 / 5h 19m
   
0. <a target="_blank" href="https://app.pluralsight.com/library/courses/play-by-play-docker-web-developers-john-papa-dan-wahlin/table-of-contents">
   Play by Play: Docker for Web Developers</a>
   (conversation between) John Papa and 
   Dan Wahlin (talking about Docker Toolbox)
   12 Jul 2016 / 1h 34m

## YouTub videos #

0. <a target="_blank" href="https://www.youtube.com/watch?v=vQSpztWcGmw">
   Continuous Delivery with Jenkins Workflow and Docker Explained</a>
   by Cloudbees at DevOpsTV channel

0. <a target="_blank" href="https://www.youtube.com/watch?v=is1o0Ol8LMc">
   Continuous Integration Using Docker</a>
   by DevOpsTV

0. <a target="_blank" href="https://www.youtube.com/watch?v=B6UvIL2WyTg">
   Moving from Jenkins to Docker for build pipelines from Matt Bostock</a>

0. <a target="_blank" href="https://www.youtube.com/watch?v=uLp9_MMnkUo">
   Continuous Delivery Pipeline with Docker and Jenkins</a>
   Javaforum Göteborg

0. <a target="_blank" href="https://www.youtube.com/watch?v=Q5POuMHxW-0">
   Introduction to Docker</a>
   by Twitter University
   47:14

0. <a target="_blank" href="https://www.youtube.com/watch?v=dCsGzEGW2BY">
   Jenkins 2 and Beyond</a>
   DevOpsTV

0. <a target="_blank" href="https://www.youtube.com/watch?v=M-rxJBdYIrw">
   Jenkins 2.0. What? When? What is in it for me?</a>
   on Praqma Channel

0. <a target="_blank" href="https://www.digitalocean.com/community/tutorials/">
   how-to-provision-and-manage-remote-docker-hosts-with-docker-machine-on-centos-7</a>

0. <a target="_blank" href="http://blog.serverbooter.com/blog/2014/03/07/docker-first-impressions/">
   Docker First Impressions on Ubuntu</a>


## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
