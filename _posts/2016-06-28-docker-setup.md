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
to setup Docker on Mac OSX and CentOS.

Like a music DJ, I’ve carefully arranged the various videos and concepts 
into the sequence below 
so you don’t have to spend as much time making sense of this flood of material.

Sentences that begin with <strong>PROTIP</strong> are exclusive to this website, 
to point out a wisdom from experience
or fact that many miss.


## VMs vs. Docker #

<amp-img width="690" height="516" alt="dockervsvmhost 690x516-i36.png" 
src="https://cloud.githubusercontent.com/assets/20669891/17195327/e4f823fc-5411-11e6-9648-752a31fa03a8.png"></amp-img>

Virtual Memory duplicates the operating system kernel in every image.

Docker enables the read-only portion of a Linux operating system kernel 
to be shared among several images.
Each image has its own custom bin/lib folders.

Docker enables developers and system administrators 
<strong>port</strong> applications
across systems and machines easily, 
with all dependencies intact.

Docker containers are created using docker images, 
built by parsing a <strong>Dockerfile</strong> 
containing Docker commands.


## Dockerize apps #

"Dockerizing" an application is the process of converting an application to run within a Docker container.

Let's begin with an example.

0. Navigate to the folder containing a Dockerfile.

   NOTE: Creating the Dockerfile is called "dockerizing" a folder.

0. View the Dockerfile:

    <tt><strong>
    cat Dockerfile
    </strong></tt>

    Alternately, you may prefer to open the file using a text editor or IDE.

    The response:

    <pre>
FROM node:0.10.44-slim
&nbsp;
ADD . /home/demo/box/
&nbsp;
RUN cd /home/demo/box && npm install
&nbsp;
ENTRYPOINT ["/home/demo/box/boot.sh"]
   </pre>

   <a href="#BuildCommand">Skip to see this built</a>.

   ### Docker commands #

   * FROM sets the image to an operating system image. For options, do a 
   <a href="#DockerSearch">
   docker search</a>.
   * MAINTAINER defines the file's author
   * USER
   * ADD
   * ENV
   * EXPOSE the default port, such as 27017
   * CMD  ["--port 27017"]
   * WORKDIR
   * VOLUME
   * RUN commands to update the repository sources list, etc.
   * ENTRYPOINT sets default container command

   ### Dockerizing programming code #

   One of the advantages of using Docker is that an application can be deployed on several 
   operating systems.
   But different operating systems have different ways of specifying file paths such as:

   <tt>APP_CONFIG=/etc/dev.config</tt>

   Such files would contain API keys and flags to vary app behavior without requiring a re-deploy.

   PROTIP: Apps in Docker should be written in a way that references a file external to itself
   to obtain configuration data such as API keys.

   Contents in configuration files can be varied at run-time
   by a script that <strong>mounts different volumes</strong> containing the config file or
   by using a <strong>sed</strong> command which find a unique pattern in the file,
   then modifies the data.


   ### Common Logging #

   Also, rather than writing event information to a custom database,
   "cloud native" application programming code print to STDOUT/STDERR.
   This ensures application logs have a common format
   so that logs from other apps and monitoring utilities can all be co-mingled
   in a central logging system for historical analysis together by timeline.

   Logs can be acessed directly with the 
   `docker logs` command and by Docker API calls. 

   To simplify the dockerization process, some use 
   <a target="_blank" href="http://github.com/jwilder/dockerize/">
   the Dockerize utility</a> Jason Wilder wrote in Golang
   and describes <a target="_blank" href="http://jasonwilder.com/blog/2014/10/13/a-simple-way-to-dockerize-applications/">
   here</a>. It works by wrapping calls to apps using the ENTRYPOINT or CMD directives.


<hr />

## Installer download #

Docker was originally created for different flavors of Linux

   * Ubuntu
   * CentOS
   * etc.

Also BSDLinux.


### Install Docker on Mac OSX #

<strong>Docker for Mac</strong> is the latest approach for installing Docker on Mac OSX.

   WARNING: The product is labeled Beta as of this writing.

   If your Mac has OS X 10.10.3 Yosemite or newer, (as of June 2016)
   <strong>Docker on Mac</strong>
   runs as a <strong>native</strong> Mac application.

   TECHNICAL NOTE: Docker for Mac uses 
   xhyve to virtualize the Docker Engine environment 
   <a target="_blank" href="https://github.com/docker/HyperKit/">
   HyperKit VM</a>.

0. If you've previously installed Boot2Docker or Docker for Mac, uninstall it
   by deleting the file in Applications.

   NOTE: The version of Linux that comes with Mac isn't completely compatible with Linux.
   So an extra layer is needed to emulate a Docker host, 
   and that’s <a target="_blank" href="https://github.com/boot2docker/osx-installer/releases/tag/v1.6.0">
   Boot2Docker</a>.

0. Click 
   <a target="_blank" href="https://docs.docker.com/docker-for-mac/">
   here</a> to download Docker for Mac.

   The most recent version of Virtualbox is 5.1.2, so can be left installed.
   NOTE: 
   <a target="_blank" href="https://docs.docker.com/engine/installation/mac/#/docker-for-mac">
   Docs here</a> 
   says VirtualBox prior to version 4.3.30 must NOT be installed (it is incompatible with Docker for Mac). 

   Alternately, install https://www.docker.com/products/docker-toolbox
   if you have an old edition of Mac
   running OS X 10.8 “Mountain Lion” or later.

0. Click "Get Docker for Mac" to download to your Downloads folder.
0. In Finder, navigate to you Download folder to double-click
   <strong>Docker.dmg</strong>

   | Date of file  | Version           | Download | Folder   |
   | ------------- | ----------------- | -------: | -------: | 
   | June 17, 2016 | 1.12.0-rc2-beta16 | 113.5 MB | 224.1 MB |
   | July 19, 2016 | Docker.dmg | 114.0 MB | 225.1 MB |

0. Double-click on Docker.dmg to open it.
0. Drag and drop to the Applications folder.
0. Click Replace the previous version, if applicable.
0. Click Open.
0. Click Next.
0. Click OK.
0. Input Apple password.
0. Click Got it!.
0. Skip to <a href="#VerifyInstall">verify install</a>.

   Obsolete instructions to install
   using 
   Homebrew cask:

   Linux kernel-specific features for the Docker daemon.

   Alternately, Docker 0.8 or newer can be run on Macs 
   thanks to a specially developed, lightweight VirtualBox VM. 

   <pre>
   brew install docker
   brew install boot2docker
   </pre>

   To start this, use the "quickstart terminal"
   which fires up Virtualbox.

### Install Docker in CentOS #

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
   Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /usr/lib/systemd/system/docker.service.
   </tt>

<hr />

<a name="VerifyInstall"></a>

## After install #

After installation, Docker commands are similar on all operating systems:

0. Open a Terminal shell window.

0. List all docker commands:

   <tt><strong>
   docker
   </strong></tt>

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

   NOTE: No dash in front of version (unlike commands in many other utilities).

   Sample response on the Mac:

    <pre>
Client:
Version:      1.12.0-rc2
API version:  1.24
Go version:   go1.6.2
Git commit:   906eacd
Built:        Fri Jun 17 20:35:33 2016
OS/Arch:      darwin/amd64
Experimental: true
&nbsp;
Server:
Version:      1.12.0-rc2
API version:  1.24
Go version:   go1.6.2
Git commit:   a7119de
Built:        Fri Jun 17 22:09:20 2016
OS/Arch:      linux/amd64
Experimental: true
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


   <a name="BuildCommand"></a>

   ## Build command #

0. View the build command:

   <tt><strong>
   docker build --help
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

0. Set the present working directory to the app folder containing a Dockerfile.

0. Build an image referencing the Dockerfile in the present working directory:

   <tt><strong>
   sudo docker build -t dv_0.2.1 .
   </strong></tt>

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



   ### Hello world #

   The Docker organization has a "hello world" app defined at<br />
   https://github.com/docker-library/hello-world<br />
   with docs at<br />
   https://github.com/docker-library/docs/tree/master/hello-world

0. Verify access to DockerHub by obtaining a "hello world" app from it:

   <tt><strong>
   docker run hello-world
   </strong></tt>

   If the image is not available locally, it is pulled from Dockerhub:

   <pre>
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
c04b14da8d14: Pull complete 
Digest: sha256:0256e8a36e2070f7bf2d0b0763dbabdd67798512411de4cdcf9431a1feb60fd9
Status: Downloaded newer image for hello-world:latest
   </pre>

   Output from the hello-world program:

   <pre>
Hello from Docker!
This message shows that your installation appears to be working correctly.
&nbsp;
To generate this message, Docker took the following steps:
 1\. The Docker client contacted the Docker daemon.
 2\. The Docker daemon pulled the "hello-world" image from the Docker Hub.
 3\. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4\. The Docker daemon streamed that output to the Docker client, which sent it
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

0. List images downloaded:

   <tt><strong>
   docker images
   </strong></tt>

   The response:

   <pre>
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
centos              latest              50dae1ee8677        8 days ago          196.7 MB
dv_0.2.1            latest              5bb9d72b9e60        13 hours ago        203.4 MB
hello-world         latest              c54a2cc56cbb        3 weeks ago         1.848 kB
node                0.10.44-slim        f73347dab179        12 weeks ago        192.6 MB
   </pre>

   PROTIP: You won't find Docker images on your local folder. See
   <a target="_blank" href="http://stackoverflow.com/questions/19234831/where-are-docker-images-stored-on-the-host-machine">
   Where are docker images stored?</a>

   See https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-centos-7

0. Use a third-party tool to display visualizations of image data:

   <a target="_blank" href="https://github.com/justone/dockviz">
   dockviz</a> presents Docker image and container information in graphic form
   to help you understand what's going on inside the system.
   <amp-img width="400" height="134" alt="ci dockviz 20160728-400x134-i36.png" 
   src="https://cloud.githubusercontent.com/assets/20669891/17217583/af51e066-5499-11e6-8726-eaf461b9174c.jpg">
   </amp-img>

   <a target="_blank" href="https://imagelayers.io/">
   ImageLayers.io</a> is an Adobe Flash site that
   shows how each command in Dockerfile contributes to the final Docker image,
   and discover which layers are shared by multiple images.
   It presents an ImageLayers badge about the size of an image, and how many layers it is composed of.


   ## Build image #

See <a target="_blank" href="https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images">
"Docker Explained: Using Dockerfiles to Automate Building of Images"</a>a>


   ## Jenkins invoke image build #

   TODO: Next


   ### Run container #


0. List the parameters:

   <tt><strong>
   docker run \-\help
   </strong></tt>

   The response:

   <pre>
Usage:  docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
Run a command in a new container
Options:
      --add-host value              Add a custom host-to-IP mapping (host:ip) (default [])
  -a, --attach value                Attach to STDIN, STDOUT or STDERR (default [])
      --blkio-weight value          Block IO (relative weight), between 10 and 1000
      --blkio-weight-device value   Block IO weight (relative device weight) (default [])
      --cap-add value               Add Linux capabilities (default [])
      --cap-drop value              Drop Linux capabilities (default [])
      --cgroup-parent string        Optional parent cgroup for the container
      --cidfile string              Write the container ID to the file
      --cpu-percent int             CPU percent (Windows only)
      --cpu-period int              Limit CPU CFS (Completely Fair Scheduler) period
      --cpu-quota int               Limit CPU CFS (Completely Fair Scheduler) quota
  -c, --cpu-shares int              CPU shares (relative weight)
      --cpuset-cpus string          CPUs in which to allow execution (0-3, 0,1)
      --cpuset-mems string          MEMs in which to allow execution (0-3, 0,1)
  -d, --detach                      Run container in background and print container ID
      --detach-keys string          Override the key sequence for detaching a container
      --device value                Add a host device to the container (default [])
      --device-read-bps value       Limit read rate (bytes per second) from a device (default [])
      --device-read-iops value      Limit read rate (IO per second) from a device (default [])
      --device-write-bps value      Limit write rate (bytes per second) to a device (default [])
      --device-write-iops value     Limit write rate (IO per second) to a device (default [])
      --disable-content-trust       Skip image verification (default true)
      --dns value                   Set custom DNS servers (default [])
      --dns-opt value               Set DNS options (default [])
      --dns-search value            Set custom DNS search domains (default [])
      --entrypoint string           Overwrite the default ENTRYPOINT of the image
  -e, --env value                   Set environment variables (default [])
      --env-file value              Read in a file of environment variables (default [])
      --expose value                Expose a port or a range of ports (default [])
      --group-add value             Add additional groups to join (default [])
      --health-cmd string           Command to run to check health
      --health-interval duration    Time between running the check
      --health-retries int          Consecutive failures needed to report unhealthy
      --health-timeout duration     Maximum time to allow one check to run
      --help                        Print usage
  -h, --hostname string             Container host name
  -i, --interactive                 Keep STDIN open even if not attached
      --io-maxbandwidth string      Maximum IO bandwidth limit for the system drive (Windows only)
      --io-maxiops uint             Maximum IOps limit for the system drive (Windows only)
      --ip string                   Container IPv4 address (e.g. 172.30.100.104)
      --ip6 string                  Container IPv6 address (e.g. 2001:db8::33)
      --ipc string                  IPC namespace to use
      --isolation string            Container isolation technology
      --kernel-memory string        Kernel memory limit
  -l, --label value                 Set meta data on a container (default [])
      --label-file value            Read in a line delimited file of labels (default [])
      --link value                  Add link to another container (default [])
      --link-local-ip value         Container IPv4/IPv6 link-local addresses (default [])
      --log-driver string           Logging driver for container
      --log-opt value               Log driver options (default [])
      --mac-address string          Container MAC address (e.g. 92:d0:c6:0a:29:33)
  -m, --memory string               Memory limit
      --memory-reservation string   Memory soft limit
      --memory-swap string          Swap limit equal to memory plus swap: '-1' to enable unlimited swap
      --memory-swappiness int       Tune container memory swappiness (0 to 100) (default -1)
      --name string                 Assign a name to the container
      --network string              Connect a container to a network (default "default")
      --network-alias value         Add network-scoped alias for the container (default [])
      --no-healthcheck              Disable any container-specified HEALTHCHECK
      --oom-kill-disable            Disable OOM Killer
      --oom-score-adj int           Tune host's OOM preferences (-1000 to 1000)
      --pid string                  PID namespace to use
      --pids-limit int              Tune container pids limit (set -1 for unlimited)
      --privileged                  Give extended privileges to this container
  -p, --publish value               Publish a container's port(s) to the host (default [])
  -P, --publish-all                 Publish all exposed ports to random ports
      --read-only                   Mount the container's root filesystem as read only
      --restart string              Restart policy to apply when a container exits (default "no")
      --rm                          Automatically remove the container when it exits
      --runtime string              Runtime to use for this container
      --security-opt value          Security Options (default [])
      --shm-size string             Size of /dev/shm, default value is 64MB
      --sig-proxy                   Proxy received signals to the process (default true)
      --stop-signal string          Signal to stop a container, SIGTERM by default (default "SIGTERM")
      --storage-opt value           Set storage driver options per container (default [])
      --sysctl value                Sysctl options (default map[])
      --tmpfs value                 Mount a tmpfs directory (default [])
  -t, --tty                         Allocate a pseudo-TTY
      --ulimit value                Ulimit options (default [])
  -u, --user string                 Username or UID (format: <name|uid>[:<group|gid>])
      --userns string               User namespace to use
      --uts string                  UTS namespace to use
  -v, --volume value                Bind mount a volume (default [])
      --volume-driver string        Optional volume driver for the container
      --volumes-from value          Mount volumes from the specified container(s) (default [])
  -w, --workdir string              Working directory inside the container
     </pre>

0. Run the container just downloaded in a Mac:

   <tt><strong>
   docker run -it ubuntu bash
   </strong></tt>

   PROTIP: Mac uses ubuntu commands.

   The response:

   <pre>
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
43db9dbdcb30: Pull complete 
2dc64e8f8d4f: Pull complete 
670a583e1b50: Pull complete 
183b0bfcd10e: Pull complete 
Digest: sha256:c6674c44c6439673bf56536c1a15916639c47ea04c3d6296c5df938add67b54b
Status: Downloaded newer image for ubuntu:latest
root@27eb89b0dc54:
   </pre>

   Wait for "Pull complete" for all the dependencies.

   Alternately, on a CentOS machine:

   <tt><strong>
   docker run -it centos bash
   </strong></tt>

   The response:

   <pre>
Unable to find image 'centos:latest' locally
latest: Pulling from library/centos
8c3d77a518cb: Pull complete 
Digest: sha256:7b754086d2c7d74ac39dc0a2545d7b06d4266f873d502feb5b3e8bfca27c5dd8
Status: Downloaded newer image for centos:latest
   </pre>

   WARNING: The terminal prompt has changed
   because you are now <strong>inside</strong> the container.


0. Optionally, to exit out:

   <tt><strong>
   exit
   </strong></tt>

<hr />


   ## Modules installed #

   Installing Docker gives you not just the Docker service (daemon) 
   but also the docker command line utility, or the Docker client.

   Regardless of the OS, the installation provides: 

   * Docker Engine, 
   * Docker CLI client, 
   * Docker Compose, and 
   * Docker Machine.

   * Docker Swarm.
   <br /><br />

0. See the list of supported drivers at<br />
   <a target="_blank" href="https://docs. docker.com/machine/drivers/">
   https://docs. docker.com/machine/drivers</a>



<a name="DockerUCP"></a>

## Docker UCP (Universal Control Plane) #

UCP enables you to control your Docker environment through a web interface, which is
helpful if you want to steer clear of the command line. 

You can use Docker UCP to deploy to various cloud solutions, tie into your existing authentication infrastructure, and in turn control user access.
More information about Docker UCP can be found at https://docs.docker.com/ ucp/.



<a name="DockerSearch"></a>

## DockerHub Search #

0. Search for Ubuntu images on the free and public repository at <br />
   https://hub.docker.com.

   <tt><strong>docker search ubuntu</strong></tt>
   
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
   https://hub.docker.com.

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

0. Get more information for a specific Docker image in<br />
   https://hub.docker.com

   <tt><strong>docker search centos --no-trunc</strong></tt>
   
   The response (27 Jul 2016):

   <pre>
   </pre>

0. Alternately, if you have money for a license,
   a more secure commercial (paid) repository is at<br /> 
   <a target="_blank" href="https://www.docker.com/products/docker-trusted-registry">
   https://www.docker.com/products/docker-trusted-registry</a>

   A third alternative is<br >
   https://docs.docker.com/registry

0. Pull down an image from the tutum repository:

   <tt><strong>docker pull ubuntu</strong></tt>

0. To remove an image:

   <tt><strong>
   docker rmi ubuntu:trusty
   </strong></tt>

0. Run the latest version image pulled for nginx:

   <tt><strong>
   docker run -i -t nginx:latest /bin/bash
   </strong></tt>


   There are two methods for installing Docker on CentOS 7:

   1. Installing Docker on an existing installation of the operating system. 

   2. Spin up a server with Docker Machine which auto-installs Docker.


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
Version: 0.8.0-rc2, build 4ca1b85
&nbsp;
Author:
  Docker Machine Contributors - <https://github.com/docker/machine>
&nbsp;
Options:
  --debug, -D                 Enable debug mode
  --storage-path, -s "/Users/mac/.docker/machine"  Configures storage path [$MACHINE_STORAGE_PATH]
  --tls-ca-cert               CA to verify remotes against [$MACHINE_TLS_CA_CERT]
  --tls-ca-key                   Private key to generate certificates [$MACHINE_TLS_CA_KEY]
  --tls-client-cert              Client cert to use for TLS [$MACHINE_TLS_CLIENT_CERT]
  --tls-client-key               Private key used in client TLS auth [$MACHINE_TLS_CLIENT_KEY]
  --github-api-token                Token to use for requests to the Github API [$MACHINE_GITHUB_API_TOKEN]
  --native-ssh                Use the native (Go-based) SSH implementation. [$MACHINE_NATIVE_SSH]
  --bugsnag-api-token               BugSnag API token for crash reporting [$MACHINE_BUGSNAG_API_TOKEN]
  --help, -h                  show help
  --version, -v                  print the version
&nbsp;  
Commands:
  active    Print which machine is active
  config    Print the connection config for machine
  create    Create a machine
  env       Display the commands to set up the environment for the Docker client
  inspect      Inspect information about a machine
  ip        Get the IP address of a machine
  kill         Kill a machine
  ls        List machines
  provision    Re-provision existing machines
  regenerate-certs   Regenerate TLS Certificates for a machine
  restart      Restart a machine
  rm        Remove a machine
  ssh       Log into or run a command on a machine with SSH.
  scp       Copy files between machines
  start        Start a machine
  status    Get the status of a machine
  stop         Stop a machine
  upgrade      Upgrade a machine to the latest version of Docker
  url       Get the URL of a machine
  version      Show the Docker Machine version or a machine docker version
  help         Shows a list of commands or help for one command
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

0. Create a Docker machine named node1 in the local Virtualbox, in debug mode:

   <tt><strong>
   docker-machine create -d virtualbox node1
   </strong></tt>


   <a name="DockerContainers"></a>

   ### Docker Containers #

0. List Docker containers and their identifiers:

   <tt><strong>
   docker ps -a
   </strong></tt>

   Add -a shows inactive as well as the default active listing.
   (Kinda counter-intuitive)

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
Define and run multi-container applications with Docker.
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



## .dockerignore #

.dockerignore is like a .gitignore file,
but specifies items to ignore in the Docker file.




## No Error Report #

PROTIP: Whenever an attempt to provision a Dockerized host using Docker Machine fails, 
or Docker Machine crashes, some diagnostic information is sent automatically to a Docker account on Bugsnag. 

0. Disable this reporting by creating an empty file called no-error-report under your installations .docker/machine directory:

   <tt><strong>
   touch ~/.docker/machine/no-error-report
   </strong></tt>


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

https://www.youtube.com/watch?v=vQSpztWcGmw
Continuous Delivery with Jenkins Workflow and Docker Explained
by Cloudbees at DevOpsTV channel

https://www.youtube.com/watch?v=is1o0Ol8LMc
Continuous Integration Using Docker
DevOpsTV
1,444 views

https://www.youtube.com/watch?v=B6UvIL2WyTg
Moving from Jenkins to Docker for build pipelines from Matt Bostock
MeetupvideoUK

https://www.youtube.com/watch?v=uLp9_MMnkUo
Continuous Delivery Pipeline with Docker and Jenkins
Javaforum Göteborg
46:41

https://www.youtube.com/watch?v=Q5POuMHxW-0
Introduction to Docker
Twitter University
47:14

https://www.youtube.com/watch?v=dCsGzEGW2BY
Jenkins 2 and Beyond
DevOpsTV

https://www.youtube.com/watch?v=M-rxJBdYIrw
Jenkins 2.0. What? When? What is in it for me?
Praqma Channel
