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

The object of this tutorial is to succintly present, 
with step-by-step instructions (but without much marketing hype),
how to setup and make use of Docker on Mac OSX and CentOS.

## Flavors #

<amp-img width="690" height="516" alt="dockervsvmhost 690x516-i36.png" 
src="https://cloud.githubusercontent.com/assets/20669891/17195327/e4f823fc-5411-11e6-9648-752a31fa03a8.png"></amp-img>

Virtual Memory duplicates the operating system kernel in every image.

Docker enables the read-only portion of operating system kernel to be shared among several images.
Each image has its own Bin/Libs.


## Download #

Docker was originally created for different flavors of Linux

   * Ubuntu
   * CentOS
   * etc.

The version of Linux that comes with Mac isn't compatible. 
So an extra layer needs to emulate a Docker host, 
and that’s <strong>Boot2Docker</strong> from
https://github.com/boot2docker/osx-installer/releases/tag/v1.6.0.


On https://docs.docker.com/engine/installation/mac/

0. If your Mac has OS X 10.10.3 Yosemite or newer, (as of June 2016)
   <strong>Docker on Mac</strong>
   runs as a native Mac application and uses 
   xhyve to virtualize the Docker Engine environment 
   HyperKit VM from
   <a target="_blank" href="https://github.com/docker/HyperKit/">
                            https://github.com/docker/HyperKit/</a>

   VirtualBox prior to version 4.3.30 must NOT be installed (it is incompatible with Docker for Mac). Docker for Mac will error out on install in this case. Uninstall the older version of VirtualBox and re-try the install.

0. From <a target="_blank" href="https://docs.docker.com/docker-for-mac/">
   https://docs.docker.com/docker-for-mac</a>
   click on the link to download file <strong>Docker.dmg</strong> 

Alternately, if 

0. In Finder, navigate to you Download folder to double-click
<strong>Docker.dmg</strong> from
113.5 MB.


   | Date          | Version           | Download | Folder   |
   | ------------- | ----------------- | -------: | -------: | 
   | June 17, 2016 | 1.12.0-rc2-beta16 | 113.5 MB | 224.4 MB |

0. Double-click on Docker.dmg
0. Drag and drop.



0. Click Open.



0. Click Next.



0. Click OK.
0. Input Apple password.
0. Click Got it!.


Alternatively, 
   install with Homebrew and cask it’s even easier.

   Linux kernel-specific features for the Docker daemon.

   Alternately, Docker 0.8 or newer can be run on Macs 
   thanks to a specially developed, lightweight VirtualBox VM. 

   <pre>
   brew install docker
   brew install boot2docker
   </pre>

## Install Docker in CentOS #

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

   ## Verify install #

0. Open a Terminal shell window.

   <tt><strong>
   docker version
   </strong></tt>

   NOTE: No dash in front of version (unlike many Ruby commands).

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

0. List all docker commands:

   <tt><strong>
   docker
   </strong></tt>

0. Ensure access to DockerHub by running a "hello world" app:

   <tt><strong>
   docker run hello-world
   </strong></tt>

   Since the image is not available locally, it is pulled from Dockerhub:

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
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
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

0. Run the container just downloaded in a Mac:

   <tt><strong>
   docker run -it ubuntu bash
   </strong></tt>

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

0. Optionally, to install MariaDB:

   <tt><strong>
   yum install mariadb-server
   </strong></tt>

0. Optionally, to exit out:

   <tt><strong>
   exit
   </strong></tt>

0. List Docker images:

   <tt><strong>
   docker images
   </strong></tt>

   See https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-centos-7

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

   <pre>

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


There are two methods for installing Docker on CentOS 7. One method involves installing it on an existing installation of the operating system. The other involves spinning up a server with a tool called Docker Machine that auto-installs Docker on it.


<a name="DockerMachine"></a>

## docker-machine install #



0. Type the command by itself for a list of sub-commands:

   <tt><strong>
   docker-machine
   </strong></tt>

   The response:

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

0. List Docker machines available:

   <strong><tt>
   docker-machine ls
   </strong></tt>

0. Create a Docker machine named node1 in the local Virtualbox:

   <tt><strong>
   docker-machine create -d virtualbox node1
   </strong></tt>


<a name="DockerCompose"></a>

## Docker Compose #

See https://docs.docker.com/compose/install/.

To create multiple containers with a single command. 

0. Type the command by itself for a list of sub-commands:

   <tt><strong>
   docker-compose
   </strong></tt>

   An example docker-compose.yml  le is as follows:



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



## docker build --help #

   <tt><strong>
   docker build \-\-help
   </strong></tt>


<a name="DockerUCP"></a>

## Docker UCP (Universal Control Plane) #

UCP enables you to control your Docker environment through a web interface, which is
helpful if you want to steer clear of the command line. 

You can use Docker UCP to deploy to various cloud solutions, tie into your existing authentication infrastructure, and in turn control user access.
More information about Docker UCP can be found at https://docs.docker.com/ ucp/.



## Additional notes:

Docker does have different security requirements which will be a hindrance for Shippable. 
Security can be integrated but it does require knowledge of the Linux container environment.

https://blog.docker.com/2013/08/containers-docker-how-secure-are-they/

