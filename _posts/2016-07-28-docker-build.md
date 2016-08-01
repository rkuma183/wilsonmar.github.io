---
layout: post
title: "Docker build"
excerpt: "Make little bits working together"
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

{% include _intro.html %}

   <a name="BuildCommand"></a>

## Build command #

0. View the build command which carries out specifications in Dockerfile
   to package an image to run within Docker containers:

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


## Hello world #

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
 <a target="_blank" href="https://hub.docker.com/">https://hub.docker.com</a>
&nbsp;
For more examples and ideas, visit:
 <a target="_blank" href="https://docs.docker.com/engine/userguide/">https://docs.docker.com/engine/userguide/</a>
   </pre>

0. Examine docker processes:

   <tt><strong>
   docker exec -it test ps aux
   </strong></tt>

<hr />

0. List images downloaded:

   <tt><strong>
   docker images
   </strong></tt>

   The response:

   <pre>
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
centos              latest              50dae1ee8677        8 days ago          196.7 MB
hello-world         latest              c54a2cc56cbb        3 weeks ago         1.848 kB
node                0.10.44-slim        f73347dab179        12 weeks ago        192.6 MB
   </pre>

   The "centos" image contains CentOS with no apps installed.

   The "node" image contains CenOS with Node installed, but no custom Node apps.

   PROTIP: You won't find Docker images on your local folder. See
   <a target="_blank" href="http://stackoverflow.com/questions/19234831/where-are-docker-images-stored-on-the-host-machine">
   Where are docker images stored?</a>

   See https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-centos-7

0. PROTIP: Evaluate a third-party tool to display visualizations of image data:

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


## Run container #

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


   ### Exit Docker #

0. Optionally, to exit out:

   <tt><strong>
   exit
   </strong></tt>

## Compose #

0. Define a <strong>base docker-compose.yml</strong> to create a new configuration.

0. Define a <strong>production.yml</strong> file to selectively override specific
   the original Compose file.

0. Override the base file with elements of the production.yml file:

   <tt><strong>
   docker-compose -f docker-compose.yml -f production.yml up -d
   </strong></tt>

   See https://docs.docker.com/v1.11/compose/extends/#different-environments
   

## Link repo to Docker Hub #

   ### Setup Docker Hub #

0. <a target="_blank" href="https://hub.docker.com/">
   https://hub.docker.com</a>

0. If you don't have a Docker account already, <strong>Sign-up</strong> for an account
   and click the "Confirm your email" button in the email with subject
   "Please confirm email for your Docker ID‏".

0. Link Docker Hub to your GitHub account.
   Click on your photo at the upper right. Select Settings,
   "Linked Accounts &amp; Services".

   If you're already linked, an "Unlink" appears.
   Proceeding as if there isn't.

0. CAUTION: Select "Public and Private" means Docker can see your private repositories.

   PROTIP: Open a another set of GitHub and Docker accounts based on another email account
   to work only with public-facing repos for this exercise.

0. At the top menu, pull down the <strong>Create</strong> menu to select
   "Create Automated Build". Click the Github button.

   NOTE: The above is covered by a segment in 
   <a target="_blank" href="https://app.pluralsight.com/player?course=integrating-docker-with-devops-automated-workflows&author=nigel-poulton&name=integrating-docker-with-devops-automated-workflows-m4&clip=0&mode=live">
   this Pluralsight video</a>.

0. Click on the repo.
0. Type in a short description and click Create.
0. Under the "Docker Pull Command" at the right pane:

   <tt><strong>
   docker pull wilsonmar/99bottles-jmeter
   </strong></tt>

   Notice the target isn't a URL but an account name.

0. Copy and paste the command above.

   The response if you're in the right folder for Docker:

   <pre>
Using default tag: latest
Pulling repository docker.io/wilsonmar/99bottles-jmeter
Tag latest not found in repository docker.io/wilsonmar/99bottles-jmeter
   </pre>



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




## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
