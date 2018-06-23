---
layout: post
title: "Kubernetes (K8s)"
excerpt: "Container engine for every cloud"
shorturl: "https://goo.gl/"
filename: kubernetes.md
modified:
tags: [google, cloud]
image:
# kubernetes-head-1900x500-472493.jpg
  feature: https://user-images.githubusercontent.com/300046/39955449-b791191e-558b-11e8-8bde-9042df1b66ab.jpg
  credit: Jeremy Thomas
  creditlink: https://www.flickr.com/photos/132218932@N03/page2
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This is a hands-on "deep dive" tutorial with commentary along the way, 
arranged in a sequence to make this complex material easier to understand quickly.

We begin with a "bottom-up" description of the architecture with a gradual reveal video:

## Why Kubernetes?

Kubernetes leverages efforts to "containerize" <a href="#micro-services">microservice app</a> (such as NginX, Redis, search, etc.) Dockerized into a virtual <strong>container</strong> image pulled from <strong>DockerHub</strong>.

PROTIP: Use security-vetted installers in Docker Enterprise, Quay, or an organization's own binary repository setup using Nexus or Artifactory. 

Kubernetes also works with <strong>rkt</strong> (pronounced "rocket") containers.
But this tutorial focuses on Docker.

![k8s-container-sets-479x364](https://user-images.githubusercontent.com/300046/33526550-6c98a980-d800-11e7-9862-ff202492e08b.jpg)
<!-- From https://app.pluralsight.com/library/courses/getting-started-kubernetes/exercise-files -->

Kubernetes automates <strong>resilience</strong> to containers by abstacting the network and storage of containers in replaceable "pods". Each pod can hold one or more Docker containers.
Within a pod, each container has a different <srtong>port number</strong>.
But containers??? in the same pod share the <strong>same IP address</strong>, hostname, Linux namespaces, cgroups, storage, and other resources.

<a target="_blank" title="from Yongbok Kim (who writes in Korean)" href="https://user-images.githubusercontent.com/300046/33525757-6fcd2624-d7f3-11e7-9745-79ce5f9600e9.jpg">
<img alt="k8s-arch-ruo91-797x451-104467" src="https://user-images.githubusercontent.com/300046/33525757-6fcd2624-d7f3-11e7-9745-79ce5f9600e9.jpg"></a>

This diagram is referenced throughout this tutorial, particularly in the <a href="#Details">Details section below</a>.

<em>It is by Yongbok Kim who presents <a target="_blank" href="https://translate.google.com/translate?hl=en&sl=ko&tl=en&u=http://www.yongbok.net/blog/google-kubernetes-container-cluster-manager/">
animations on his website</a>.</em>

Kubernetes replicates Pods across several worker <strong>nodes</strong> (VM or physical machines).

PROTIP: Kubernetes recently added <strong>auto-scaling</strong> based on metrics API measurement of demand. Before that, Kubernetes manages the instantiating, starting, stopping, updating, and deleting of a <strong>pre-defined number of pod replicas</strong> based on declarations in <strong>*.yaml</strong> files or interactive commands.

The number of pods replicated is based on <strong>deployment</strong> yaml files. 
Service yaml files specify what ports are used in deployments.

### Kublet

A <strong>Kublet</strong> agent program within each node constantly compares the status of pods against what is declared in yaml files, and starts or deletes pods as necessary to meet the request. 

This Kublet is automatically installed when they are <strong>created</strong>.

Each <strong>kubelet</strong> is called the "control pane" that runs nodes under its control.
Restarting Kublet itself depends on the operating system (Monit on Debian or systemctl on systemd-based systems).

### Master node

Nodes are joined to the master node using the <strong>kubeadm join</strong> command.

The master node itself is crated by the <strong>kubeadm init</strong> command which establishes folders 
and invokes the Kubernetes <strong>API server</strong>. That command is installed along with the 
<strong>kubectl</strong> package. There is a command with the same name used to obtain the <strong>version</strong>.
The kubectl <strong>get nodes</strong> command lists basic information about each node.
The <strong>describe</strong> command provides more detailed information.

   ### API Server

   The kubectl client communicates using REST API calls to an <strong>API Server</strong> 
   which handles authentication and authorization.

   <a name="Scheduler"></a>
   
   ## Scheduler

   The API Server puts nodes in "pending" state when it sends requests to bring them up and down to the <strong>Scheduler</strong> to do so only when there are enough resources available.
   The scheduler can operate according to a schedule.
   But whether it does or not are defined in rules obayed by the Scheduler about nodes called "Taints".
   Rules obayed by the Scheduler about pods are called "Tolerances".
   Such details are reaveled using the <strong>kubectl describe nodes</strong> command.
   
   <a name="#etcd"></a>

   ### etcd storage 

   The API Server and Scheduler persists their configuration and status information in a 
   <strong>ETCD cluster</strong> 
   <a target="_blank" href="https://coreos.com/etcd/docs/latest/getting-started-with-etcd.html">
   (from CoreOS)</a>.
   
   Kubernetes data stored in etcd includes jobs being scheduled, created and deployed, pod/service details and state, namespaces, and replication details.

   It's called a cluster because, for resiliancy, etcd replicates data across nodes. 
   This is why there is a minimum of two worker nodes per cluster. ???

   <a name="Controllers"></a>
   
   ### Controllers

   The <strong>Node controller</strong> assigns a CIDR block to newly registered nodes,
   then continually monitors node health. When necessary, it taints unhealthy nodes and
   gracefully evicts unhealthy pods. The default timeout is 40 seconds.

   Each node has a different IP address.

   Communications with outside callers occur through a single Virtual IP address (VIP) going through the <strong>kube-proxy</strong> which load balances traffic to <strong>deployments</strong>, which are load-balanced sets of pods within each node.

   Load balancing among nodes (hosts within a cloud) are handled by third-party port forwarding
   via Ingress controllers.

   ### Flannel 

   PROTIP: Kubernetes uses third-party services to handle load balancing and port forwarding through 
   <strong>ingress objects</strong> managed by an ingress controller.

   CNI (Container Network Interface) 
   
   Flannel.

   Other CNI vendors include Calico, Cilium, Contiv.

   ### HA Proxy cluster

   For network resiliency, <strong>HA Proxy cluster</strong> distributes traffic among nodes.

   ### cAdvisor

To collect resource usage and performance characteristics of running containers,
many install a pod containing <a target="_blank" href="https://github.com/google/cadvisor">Google's</a> Container Advisor (<strong>cAdvisor</strong>). It aggregates and exports telemetry to an <strong>InfluxDB</strong> database for visualization using <strong>Grafana</strong>.
Google's Heapster is also be used to send metrics to Google's cloud monitoring console.

<hr />

## Helm charts

The name Kubernetes is the ancient Greek word for people who pilot cargo ships -- "helmsman" in English. 
Thus the nautical references and why Kubernetes experts are called "captain" and why associated products have nautical themes, such as "Helm".

A Helm chart can be used to <a target="_blank" href="https://skillsmatter.com/skillscasts/10813-faas-and-furious-0-to-serverless-in-60-seconds-anywhere">
quickly create an OpenFaaS (Serverless) cluster</a> on your laptop.

   <pre>git clone https://github.com/openfaas/faas-netes && cd faas-netes
   kubectl apply -f ./namespaces.yml 
   kubectl apply -f ./yaml_armhf
   </pre>

## Topics

* <a href="#IAC">Infrastructure as code</a>
* Manage containers
* Naming and discovery
* Mounting storage systems
* Balancing loads
* Rolling updates
* Distributing secrets/config
* Checking application health
* Monitoring resources
* Accessing and ingesting logs
* Replicating application instances
* Horizontal autoscaling
* Debugging applications

Containers are declared by yaml such as this to run Alphine Linux Docker container:

   <pre>
apiVersion: v1
kind: Pod
metadata:
  name: alpine
  namespace: default
spec:
  containers:
  - name: alpine
    image: alpine
    command:
      - sleep
      - "3600"
    imagePullPolicy: IfNotPresent
  restartPolicy: Always
   </pre>

Kubernetes is written in the Go language, so it can run on Windows, Linux, and MacOS
(the need to install a JVM).

### Raspberry Pi

Read how the legendary Scott Hanselman <a target="_blank" href="https://www.hanselman.com/blog/HowToBuildAKubernetesClusterWithARMRaspberryPiThenRunNETCoreOnOpenFaas.aspx"> 
built Kubernetes on 6 Raspberry Pi nodes</a>, each with a 32GB SD card to a 1GB RAM ARM chip (like on smartphones).

<a target="_blank" href="https://www.hanselminutes.com/612/serverless-and-openfaas-with-alex-ellis">
Hansel talked with</a>
<a target="_blank" href="https://www.alexellis.io/">Alex Ellis</a> (<a target="_blank" href="https://twitter.com/alexellisuk/">@alexellisuk</a>)
keeps his <a target="_blank" href="https://gist.github.com/alexellis/fdbc90de7691a1b9edb545c17da2d975#file-prep-sh">
instructions with shell file</a> updated for <a target="_blank" href="https://blog.alexellis.io/serverless-kubernetes-on-raspberry-pi/">running on the Pis</a> to install <a target="_blank" href="https://openfaas.com/">OpenFaaS</a>.

CNCF Ambassador Chris Short developed the
<a target="_blank" href="https://rak8s.io/"> rak8s (pronounced rackets) library</a> to 
<a target="_blank" href="https://chrisshort.net/my-raspberry-pi-kubernetes-cluster/">make use of Ansible</a>.

Others:
   * https://blog.hypriot.com/getting-started-with-docker-on-your-arm-device/
   * https://blog.sicara.com/build-own-cloud-kubernetes-raspberry-pi-9e5a98741b49

<a name="Architecture"></a>

### Architecture diagram

<a target="_blank" href="https://translate.google.com/translate?hl=en&sl=ko&tl=en&u=http%3A%2F%2Fwww.yongbok.net%2Fblog%2F">
Yongbok Kim (who writes in Korean)</a> <a target="_blank" href="https://cdn.yongbok.net/ruo91/architecture/k8s/v1.1/kubernetes_architecture.png">posted (on Jan 24, 2016)</a> a master map of how all the pieces relate to each other:<br />
<small>Click on the diagram to pop-up a full-sized diagram</small>:
<a target="_blank" title="k8s_details-ruo91-2071x2645.png" href="https://user-images.githubusercontent.com/300046/33525160-4dc5931a-d7e7-11e7-8b83-9e373fc5ac7d.png">
<img alt="k8s_details-ruo91-350x448.jpg" src="https://user-images.githubusercontent.com/300046/33525167-7a5d3b9e-d7e7-11e7-8dd6-99694dc31782.jpg"></a>

BTW What are now called "nodes" were previously called minions. Apparently Google namers forgot about the existance of NodeJs,
which refers to nodes differently.

### Testing

End-to-end tests by those who develop Kubernetes are coded in Ginko and Gomega (because Kubernets is written in Go).
The Kubtest suite builds, stages, extracts, and brings up the cluster.
After testing, it dumps logs and tears down the test rig.

### Competitors

Other orchestration systems for Docker containers:

* Docker Swarm

* <a target="_blank" href="https://translate.googleusercontent.com/translate_c?depth=1&hl=en&rurl=translate.google.com&sl=ko&sp=nmt4&tl=en&u=https://www.yongbok.net/blog/apache-mesos-cluster-resource-management/&usg=ALkJrhjiggTWHQtSdhkl8jOvGnAx43NIQw">Mesos from Apache</a>, which runs other containers in addition to Docker. K8SM is a Mesos Framework developed for Apache Mesos to use Google's Kubernetes. <a target="_blank" href="https://translate.google.com/translate?hl=en&sl=ko&tl=en&u=http://www.yongbok.net/blog/how-to-install-kubernetes-mesos-framework-on-ubuntu/">Installation</a>.

* Rancher


## Open Sourced

<img align="right" alt="kubernetes-logo-125x134-15499.png" src="https://user-images.githubusercontent.com/300046/33524448-ca1d7e30-d7da-11e7-9358-45845910198c.png">
<a target="_blank" href="https://cloudplatform.googleblog.com/2016/07/from-Google-to-the-world-the-Kubernetes-origin-story.html">
This blog</a> and <a target="_blank" href="http://softwareengineeringdaily.com/2016/07/20/kubernetes-origins-with-craig-mcluckie/">podcast</a> 
notes that the Kubernetes logo has 7 sides because its initial developers were Star Trek fans:
The predecessor to Kubernetes was called Borg.
A key Borg character is called <a target="_blank" href="https://en.wikipedia.org/wiki/Seven_of_Nine">"7 of 9"</a>.

Kubernetes was created inside Google (using the [Golang](/Golang/) programming language)
and used for over a decade before being open-sourced in 2014 to the 
Cloud Native Computing Foundation (<a target="_blank" href="https://www.cncf.io/">cncf.io</a>).

### Skill certifications

On November 8, 2016 CNCF announced their 
<a target="_blank" href="https://www.cncf.io/certification/expert/">3-hour task-based Certified Kubernetes Administrator (CKA)</a> and 2-hour Application Developer (CKAD) exams. Each costs $300, taken <a target="_blank" href="http://www.examslocal.com/linuxfoundation/"> at home</a> using their Chrome extension from "Innovative Exams", which uses your laptop camera and microphone watching you use a virtual Ubuntu machine. No multiple choice questions.

CNCF is part of the Linux Foundation. It's a non-profit organization, thus the ".org".

1. Get an account at <a target="_blank" href="https://identity.linuxfoundation.org/">
   https://identity.linuxfoundation.org</a>

   PROTIP: The word "Kubernetes" is a registered trademark of the Linux Foundation, which maintains the website
   <a target="_blank" href="https://kubernetes.io">https://kubernetes.io</a> and
   source code at <a target="_blank" href="https://github.com/kubernetes/kubernetes">
   https://github.com/kubernetes/kubernetes</a>

   * v1.0 was committed on July 2015 within GitHub
   * v1.6 was led by a CoreOS developer.
   * v1.7 was led by Google.
   * v1.8 is led by a Microsoft employee (<a target="_blank" href="https://twitter.com/jaydumars?lang=en">Jaice Singer DuMars</a>) after Microsoft joined the CNCF July 2017.

2. Use your Linux Foundation credentials to sign-in at <a target="_blank" href="https://www.examslocal.com/">examslocal.com</a> to register for the exams.

Its Google heritage means Kubernetes is about scaling for a lot of traffic
with redundancies to achieve high availability (HA).

Kubernetes is often abbreviated as "k8s", with 8 replacing the number of characters between k and s.
Thus, https://k8s.io also works.


## Social

   * <a target="_blank" href="https://twitter.com/kubernetesio/">Twitter: @kubernetesio</a>
   * <a target="_blank" href="https://slack.k8s.io">https://slack.k8s.io</a>
   * <a target="_blank" href="https://plus.google.com/communities/115402602543170235291">
   Google+ Group: Kubernetes</a>
   * https://groups.google.com/forum/#!forum/kubernetes-announce for announcements
   * https://groups.google.com/forum/#!forum/kubernetes-dev for contributors to the Kubernetes project to discuss design and implementation issues.
   * https://stackoverflow.com/search?q=k8s+or+kubernetes for developers
   * https://serverfault.com/search?q=k8s+or+kubernetes for sysadmins.
   * https://groups.google.com/forum/#!forum/kubernetes-sig-scale
   * https://www.youtube.com/playlist?list=PL69nYSiGNLP1pkHsbPjzAewvMgGUpkCnJ&disable_polymer=true
   Kubernetes Google Community video chats

   * https://cloud.google.com/support/docs/issue-trackers to report bugs
   <br /><br />

   * <a target="_blank" href="https://www.KubeCon.io">KubeCon.io</a> Conferences (<a target="_blank" href="https://www.twitter.com/KubeConio/">#KubeConio</a>)


<a name="Install"></a>

## Installation options

There are several ways to obtain a running instance of Kubernetes.

<a target="_blank" href="http://docs.rancher.com/rancher/v1.5/en/quick-start-guide/">
Rancher</a> is a deployment tool for Kubernetes that also provides networking and load balancing support.
Rancher initially created it's own framework called Cattle to coordinate docker containers across multiple hosts, at a time when Docker was limited to running on a single host. 
Now Rancher's networking provides a consistent solution across a variety of platforms, especially on bare metal or standard (non cloud) virtual servers.
In addition to Kubernetes, Rancher enables users to deploy a choice of Cattle, Docker Swarm, Apache Mesos upstream project for DCOS (Data Center Operating System).
Rancher eventually become part of Docker Swarm.

Within https://github.com/kubernetes/kops AWS KOPS 


### Support in clouds

Being open-source has enabled Kubernetes to flourish on several clouds.

But one can run k8s containers in other clouds or within private data centers.

#### A) Clouds

See <a target="_blank" href="https://codefresh.io/kubernetes-guides/kubernetes-cloud-aws-vs-gcp-vs-azure/">
Kubernetes in the Cloud: AWS vs. GCP vs. Azure</a>

* <a href="#GKE">Google Kubernetes Engine (GKE)</a> is a container management SaaS product running within the Google Compute Platform (GCP) on top of Google Compute Engine providing machines.
GKE in GCP integration covers networking and VPC, monitoring, logging, and CI/CD.

* If you want to pay for Kubernetes support, <a target="_blank" href="
https://www.redhat.com/en/technologies/cloud-computing/openshift">
https://www.redhat.com/en/technologies/cloud-computing/openshift</a>
Red Hat® OpenShift is a container application platform that brings Docker and Kubernetes to the enterprise. 

* Kops for AWS (at <a target="_blank" href="https://github.com/kubernetes/kops">https://github.com/kubernetes/kops</a>)
enables multi-master, multi-AZ cluster setup and management of multiple instance groups.
See <a target="_blank" title="Oct 27, 2017 by Tristan Colgate-McFarlane" href="https://medium.com/qubit-engineering/kubernetes-up-integrated-authentication-5d2c908c2810">
"How Qubit built its production ready Kubernetes (k8s) environments"</a>

* <a target="_blank" href="https://aws.amazon.com/eks/">
Amazon Elastic Container Service for Kubernetes (Amazon EKS)</a>
was introduced December 2017 to run three Kubernetes masters across three Availability Zones in order to ensure high availability. EKS automatically detects and replaces unhealthy masters, and provides automated version upgrades and patching for the masters. So you don't have to choose appropriate instance types.
It of course leverages AWS Elastic Load Balancing, IAM authentication, Amazon VPC isolation, AWS PrivateLink access, and AWS CloudTrail logging. 

* <a target="_blank" href="https://blog.digitalocean.com/introducing-digitalocean-kubernetes/">
   https://blog.digitalocean.com/introducing-digitalocean-kubernetes</a>

* Madcore.ai

Other hosted solutions include the IBM cloud container service, Stackpoint, AppCode, KUBE2GO, MadCore, Platform 9, OpenShift Dedicated, OpenShift Online, Giant Swarm, etc.


#### Minikube offline

B) <a href="#Minikube">Minikube spins up a local environment on your laptop</a>.

   NOTE: Ubuntu on LXD offers a 9-instance Kubernetes cluster on localhost.

   PROTIP: CAUTION your laptop going to sleep may ruin minikube.

#### Server install

C) <a href="#Centos">install Kubernetes natively on CentOS</a>.

D) <a href="#DockerHub">Pull an image from Docker Hub</a> 
   within a Google Compute or AWS cloud instance.

CAUTION: If you are in a large enterprise, confer with your security team before 
installing. They often have a repository such as Artifactory or Nexus where
installers are available after being vetted and perhaps patched
for security vulnerabilities.

See <a target="_blank" href="https://kubernetes.io/docs/setup/pick-right-solution/">
https://kubernetes.io/docs/setup/pick-right-solution</a>


<a name="Minikube"></a>

### Minikube

Minikube goes beyond Docker For Mac (DFM) and Docker for Windows (DFW)
and includes a node and a Master when it spins up in a local environment (such as your laptop).

CAUTION: At time of writing, <a target="_blank" href="https://github.com/kubernetes/minikube">https://github.com/kubernetes/minikube</a>
has 257 issues and 20 pending Pull Requests.

1. Install on a Mac Docker:
 
   <pre><strong>
   brew install docker-machine-driver-xhyve
   </strong></pre>

1. Install on a Mac Minikube:

   <pre><strong>
   brew install minikube -y
   </strong></pre>

2. Verify if its command works by getting the version:

   <pre>minikube version</pre>

3. Show the current context:

   <pre><strong>
   kubectl config current-context
   <pre><strong>

   The response on minikube is "minikube".

3. Start the service:

   On Mac:

   <pre>
   minikube start --vm-driver=xhyve
   </pre>

   On Windows:

   <pre>
   minikube start --vm-driver=hyperv
   </pre>

3. Dashboard

   <pre>minikube dashboard</pre>

4. Stop the service:

   <pre>minikube stop</pre>

5. Recover space:

   <pre>minikube delete</pre>

   Kubectl 1.8 scale is now the preferred way to control graceful delete.

   Kubectl 1.8 rollout and rollback now support stateful sets ???


   <a name="kubectl"></a>

   ### kubectl CLI client install

   Kubernetes administrators use the <strong>`kubectl`</strong> (kube + ctl)
   the CLI tool running outside Kubernetes servers to control them. 
   It's automatically installed within Google cloud instances, but on Macs clients:

1. Install on a Mac:
 
   <pre><strong>
   brew install kubectl -y
   </strong></pre>

   <pre>
🍺  /usr/local/Cellar/kubernetes-cli/1.8.3: 108 files, 50.5MB
   </pre>

0. Verify
 
   <pre><strong>
   kubectl version --client
   </strong></pre>

   A sample response:

   <pre>
Client Version: version.Info{Major:"1", Minor:"10", GitVersion:"v1.10.1", GitCommit:"d4ab47518836c750f9949b9e0d387f20fb92260b", GitTreeState:"clean", BuildDate:"2018-04-13T22:27:55Z", GoVersion:"go1.9.5", Compiler:"gc", Platform:"darwin/amd64"}
   </pre>

   1. Check the status of the job using the kubectl describe command.

   2. When a job is complete, view its results:

   <pre>kubectl logs counter</pre>

   The API Server routes several <strong>kinds</strong> of <a href="#Ayaml-files">yaml declaration files</a>: Pod, Deployment of pods, Service, Job, Configmap.

   API primatives ???


<a name="Centos"></a>

### CentOS

   <pre>
cat &LT; /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
   </pre>
   Also:
   <pre>
cat <  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
   </pre>

<a name="Ubuntu"></a>

### Ubuntu

1. On Ubuntu, install:

   <pre>apt install -y docker.io</pre>

2. To make sure Docker and Kublet are using the same systemd driver:

   <pre>cat &LT;&LT;EOF >/etc/docker/daemon.json
   {
     "exec-opts": ["native.cgroupdriver=systemd"]
   }
   EOF</pre>

3. Install the keys:

   <pre>curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -</pre>

4. sources:

   <pre>cat &LT;&LT;EOF >/etc/apt/sources.list.d/kubernetes.list
   &LT;deb http://apt.kubernetes.io/ kubernetes-xenial main
   &LT;EOF</pre>

5. To download new sources:

   <pre>apt update</pre>

6. To download the programs:

   <pre>apt install -y kubelet kubeadm kubectl</pre>

<hr />

<a name="Details"></a>

## Details

This section further explains the <a href="#Architecture">architecture diagram above</a>.

<!-- https://linuxacademy.com/cp/guides/download/refsheets/guides/refsheets/linuxacademy-kubernetesadmin-archdiagrams-1_1516737832.pdf -->

As described by the <a target="_blank" href="https://linuxacademy.com/cp/modules/view/id/155">
Linux Academy's CKA course</a> -- 05:34:43 of videos by Chad Miller (<a target="_blank" href="https://twitter.com/OpenChad/">@OpenChad</a>) provides <a target="_blank" href="https://linuxacademy.com/cp/exercises/view/id/670/module/155">this sequence of commands</a>

1. Select "CloudNativeKubernetes" sandboxes.
1. Select the first instance as the "Kube Master".
1. Login that server (user/123456).
1. Change the password as prompted on the Ubuntu 16.04.3 server.

   <a name="MasterDeploy"></a>
   
   ### Deploy Kubernetes master node

1. Use this command to deploy the <strong>master node</strong> which controls the other nodes. 
   So it's <a href="#MasterDeploy">deployed first</a> which invokes the <strong>API Server</strong>

   <pre>sudo kubeadm init --pod-network-cidr=10.244.0.0/16</pre>

   ![kubernetes-nodes-363x120-20150](https://user-images.githubusercontent.com/300046/39900888-328f060e-5482-11e8-89eb-14439d7db270.jpg)

   The address is the default for <strong>Flannel</strong>.

   <a name="FlowDiagram"></a>

   ### Flow diagram

   ![k8s-services-flow-847x644-100409](https://user-images.githubusercontent.com/300046/33525135-9b69e09a-d7e6-11e7-857f-513e8582d450.jpg)

   The diagram above is by <a target="_blank" href="https://www.slideshare.net/walterliu7/kubernetes-workshop-78554820"
   title="Kubernetes Workshop published Aug 4, 2017">Walter Liu</a>

   ### Flannel for Minikube

   When using Minikube locally, a CNI () is needed. 
   So setup <a target="_blank" href="https://github.com/coreos/flannel">
   Flannel from CoreOS</a> using the open source Tectonic Installer (<a target="_blank" href="https://twitter.com/TectonicStack/">@TectonicStack</a>). 
   It configures a IPv4 "layer 3" network fabric designed for Kubernetes.

   The response suggests several commands:

1. Create your .kube folder:

   <pre>mkdir -p $HOME/.kube</pre>

1. Copy in a configuration file:

   <pre>sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config</pre>

1. Give ownership of "501:20":

   <pre>sudo chown $(id -u):$(id -g) $HOME/.kube/config</pre>

1. Make use of CNI:

   <pre>sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.1/Documentation/kube.flannel.yml</pre>

   The response:

   <pre>clusterrole "flannel" created
clusterrolebinding "flannel" created
serviceaccount "flannel" created
configmap "kube-flannel.cfg" created
daemonset "kube-flannel.ds" created
   </pre>

   configmaps in cfg files are used to define <strong>environment variables</strong>.

1. List pods created:

   <pre>kubectl get pods --all-namespaces -o wide</pre>

   Specifying wide output adds the IP address column

   Included are pods named:
   * api server (aka "master") accepts kubectl commands
   * <a href="#etcd">etcd</a> (cluster store) for HA (High Availability) in control pane
   * controller to watch for changes and maintain desired state
   * dns (domain name server)
   * proxy load balances across all pods in a service
   * scheduler watches api server for new pods to assign work to new pods
   <br /><br />
   
   System administrators control the <strong>Master node</strong>
   UI in the cloud or write scripts that invoke 
   <a href="#kubectl">kubectl command-line client program</a>
   that controls the <strong>Kubernetes Master</strong> node.

   
   ### Proxy networking

   The Kube Proxy communicates only with Pod admin. whereas Kubelets communicate with individual pods as well.

   Each node has a Flannel and a proxy.

   The Server obtains from Controller Manager ???

1. Switch to the webpage of servers to Login to the next server.
1. Be root with <tt>sudo -i</tt> and provide the password.
1. Join the node to the master by pasting in the command captured earlier, as root:

   <pre>kubeadm join --token ... 172.31.21.55:6443 --discovery-token-ca-cert-hash sha256:...</pre>

   Note the above is one long command. So you may need to use a text editor.

   Deployments manage Pods. 

   Every Pod has a unique IP. There is one IP Address per Pod.
   In other words, containers within a Pod share a network namespace. 

   Every <strong>container</strong> has its own unique <strong>port number</strong> within its pod's IP.

   ![kubernetes-ports-381x155-19677](https://user-images.githubusercontent.com/300046/39901343-1484c54c-5485-11e8-8a2d-2681f819c4ce.jpg)

1. Switch to the webpage of servers to Login to the 3rd server. 
1. Again Join the node to the master by pasting in the command captured earlier:
1. Get the list of nodes instantiated:

   <pre><strong>kubectl get nodes</strong></pre>

1. To get list of events sorted by timestamp:

   <pre>kubectl get events --sort-by='.metadata.creationTimestamp'</pre>

1. Create the initial log file so that Docker mounts a file instead of a directory:

   <pre>
   touch /var/log/kube-appserver.log
   </pre>

1. Create in each node a folder:

   <pre>
   mkdir /srv/kubernetes
   </pre>

1. Get a utility to generate TLS certificates:

   <pre>
   brew install easyrsa
   </pre>

1. Run it:

   <pre>
   ./easyrsa init-pki
   </pre>

   <a name="MasterIP"></a>
   
   ### Master IP address

1. Run it:

   <pre>
   MASTER_IP=172.31.38.152
   echo $MASTER_IP
   </pre>

1. Run it:

   <pre>
   ./easyrsa --batch "--req-cn=${MASTER_IP}@`date +%s`* build-ca nopass
   </pre>

   ### Watchers
   
   To register watchers on specific nodes.???
   Kubernetes supports TLS certifications for encryption over the line.

   REST API CRUD operations are used 
   For authorization, Kubernetes supports Role Base Access Control (RBAC),
   (ABAC), and Webhook.
   Admission ???


1. Put in that folder (in each node):

   * basic_auth.csv user and password
   * ca.crt - the certificate authority certificate from pki folder
   * known_tokens.csv kublets use to talk to the apiserver
   * kubecfg.crt - client cert public key
   * kubecfg.key - client cert private key
   * server.cert - server cert public key from issued folder
   * server.key - server cert private key
   <br /><br />

1. Copy from API server to each master node:

   <pre><strong>
   cp kube-apiserver.yaml  /etc/kubernetes/manifests/
   </strong></pre>

   The kublet compares its contents to make it so, uses the manifests folder to create kube-apiserver instances.

1. For details about each pod:

   <pre><strong>
   kubectl describe pods
   </strong></pre>

   ### Expose

   ### Deploy service

1. To deploy a service:

   <pre>kubectl expose deployment *deployment-name* [options]</pre>

<hr />

   ### Volumes
   
   Containers also share attached data <strong>volumes</strong> available within each Pod.

   <a href="#kubelet">Kubelet agents</a>

   HAProxy
   VRRP (Virtual Router Redundancy Protocol)
   http://searchnetworking.techtarget.com/definition/VRRP
   automatically assigns available Internet Protocol routers to participating hosts.

   A Persistent Volume (PV) is a provisioned block of storage for use by the cluster. 

   A Persistent Volume Claim (PVC) is a request for that storage by a user, and once granted, is 
   used as a "claim check" for 

   Recycling policies are Retain (keep the contents) and Recycle (Scrub the contents).


## configmap

## Activities

1. To drain a node out of service temporarily for maintenance:

   <pre>kubectl drain node3.mylabserver.com --ignore-daemonsets</pre>

   ### DaemonSets

   daemonsets (ds) 

   Usually for system services or other pods that need to physically reside on every node in the cluster, such as for network services. They can also be deployed only to certain nodes using labels and node selectors.

1. To return to service:

   <pre>kubectl uncordon node3.mylabserver.com</pre>


<a name="micro-services"></a>

## Sample micro-service apps

The repo is based on work from others, 
especially Kelsy Hightower, the Google Developer Advocate.

   * https://github.com/kelseyhightower/app - an example 12-Factor application. 
   * https://hub.docker.com/r/kelseyhightower/monolith - Monolith includes auth and hello services.
   * https://hub.docker.com/r/kelseyhightower/auth - Auth microservice. Generates JWT tokens for authenticated users.
   * https://hub.docker.com/r/kelseyhightower/hello - Hello microservice. Greets authenticated users.
   * https://hub.docker.com/r/ngnix - Frontend to the auth and hello services.

These sample apps are manipulated by
https://github.com/kelseyhightower/craft-kubernetes-workshop

1. Install
2. Create a Node.js server
3. Create a Docker container image
4. Create a container cluster
5. Create a Kubernetes pod
6. Scale up your services

1. Provision a complete Kubernetes cluster using Kubernetes Engine.
2. Deploy and manage Docker containers using kubectl.
3. Break an application into microservices using Kubernetes' Deployments and Services.

This "Kubernetes" folder contains scripts to implement what was described in the
<a target="_blank" href="https://run.qwiklab.com/focuses/7044">
"Orchestrating the Cloud with Kubernetes"</a> hands-on lab
which is part of the <a taget="_blank" href="https://run.qwiklab.com/quests/29">
"Kubernetes in the Google Cloud" quest</a>.

<a name="IAC"></a>

## Infrastructure as code

1. Use an internet browser to view 

   <a target="_blank" href="https://github.com/wilsonmar/DevSecOps/blob/master/Kubernetes/k8s-gcp-hello.sh">
   https://github.com/wilsonmar/DevSecOps/blob/master/Kubernetes/k8s-gcp-hello.sh</a>

   The script downloads a repository forked from googlecodelabs:
   https://github.com/wilsonmar/orchestrate-with-kubernetes/tree/master/kubernetes

   ### Declarative
   
   This repository contains several kinds of .yaml files, which can also have the extension .yml.
   Kubernetes also recognizes .json files, but YAML files are easier to work with.

   The files are call "Manifests" because they declare the desired state.


2. Open an internet browser tab to view it.

   ### reverse proxy to front-end

   The web service consists of a front-end and a proxy served by the NGINX web server configured using two files in the `nginx` folder:

   * frontend.conf
   * proxy.conf
   <br /><br />
   
   These are explained in detail at https://www.digitalocean.com/community/tutorials/how-to-configure-nginx-as-a-web-server-and-reverse-proxy-for-apache-on-one-ubuntu-14-04-droplet

   ### SSL keys

   SSL keys referenced are installed from the `tls` folder:

   * ca-key.pem - Certificate Authority's private key
   * ca.pem - Certificate Authority's public key
   * cert.pem - public key
   * key.pem - private key

<a name="yaml-files"></a>

## Kind yaml files

The kinds of yaml files:

   ### Deployments

   * auth.yaml
   * frontend.yaml
   * hello-green.yaml
   * hello-canary.yaml
   * hello.yaml

   ### pods

   * healthy-monolith.yaml configures "livenessProbe" (in folder healthz) and "readinessProbe" (in folder readiness) on port 81
   * monolith.yaml
   * secure-monolith.yaml

   ### services

   * auth.yaml
   * frontend.yaml
   * hello-blue.yaml
   * hello-green.yaml
   * hello.yaml
   * monolith.yaml

   Label

<a name="GKE"></a>

### How Google Kubernetes Engine works

![kubernetes-pods-599x298-35069](https://user-images.githubusercontent.com/300046/31013696-81d30fc0-a4d4-11e7-9852-36be55b74499.jpg)

https://google-run.qwiklab.com/focuses/639?parent=catalog

PROTIP: For GKE we disable all legacy authentication, enable RBAC (Role Based Access Control), and enable IAM authentication.

Pods are defined by a <a href="#Manifest">manifest file</a> 
read by the <strong>apiserver</strong> which deploys nodes.

Pods go into "succeeded" state after being run because
pods have short lifespans -- deleted and recreated as necessary.

The <a target="_blank" href="https://cloud.google.com./container-engine/docs/replicationcontrollers/">
replication controller</a> automatically adds or removes pods to comply with the specified number of pod replicas declared are running across nodes.
This makes GKE "self healing" to provide high availability and reliability with
"autoscaling" up and down based on demand.

In <a target="_blank" href="https://x-team.com/blog/introduction-kubernetes-architecture/">this diagram</a>:


From the https://kubernetes.io/docs/user-guide/kubectl-cheatsheet/

0. List all pods, including in the system namespace:

   <pre><strong>
   kubectl get nodes --all-namespaces
   </strong></pre>



<a name="Manifest"></a>

## pod.yml manifests

<a target="_blank" href="https://github.com/timstclair/kube-contrib/blob/master/devel/manifests/cadvisor-pod.yaml">An example (cadvisor)</a>:

   <pre>
apiVersion: v1
kind: Pod
metadata:
  name:   cadvisor
spec:
  containers:
    - name: cadvisor
      image: google/cadvisor:v0.22.0
      volumeMounts:
        - name: rootfs
          mountPath: /rootfs
          readOnly: true
        - name: var-run
          mountPath: /var/run
          readOnly: false
        - name: sys
          mountPath: /sys
          readOnly: true
        - name: docker
          mountPath: /var/lib/docker
          readOnly: true
      ports:
        - name: http
          containerPort: 8080
          protocol: TCP
      args:
        - --profiling
        - --housekeeping_interval=1s
  volumes:
    - name: rootfs
      hostPath:
        path: /
    - name: var-run
      hostPath:
        path: /var/run
    - name: sys
      hostPath:
        path: /sys
    - name: docker
      hostPath:
path: /var/lib/docker
   </pre>


<a name="rc"></a>

### Replication rc.yml

The `rc.yml` (Replication Controller) defines the number of replicas and 

   <pre>
apiVersion: v1
kind: ReplicationController
metadata:
  name: cadvisor
spec:
  replicas: 5
  selector:
     app hello
  template:
    metadata:
      labels:
        app: hello-world
  spec:
    containers:
    - name: hello
      image: account/image:latest
      ports:
        containerPort: 8080
   </pre>

0. Apply replication:

   <pre><strong>
   kubectl apply -f rc.yml
   </strong></pre>

   The response expected:

   <pre>
   replicationcontroller "hello" configured
   </pre>

0. List, in wide format, the number of replicated nodes:

   <pre><strong>
   kubectl get rc -o wide
   </strong></pre>

   <pre>
   DESIRED, CURRENT, READY
   </pre>

0. Get more detail:

   <pre><strong>
   kubectl describe rc
   </strong></pre>


<a name="ServiceYml"></a>

### Service rc.yml

The `svc.yml` defines the services:

   <pre>
apiVersion: v1
kind: Service
metadata:
  name: hello-svc
    labels:
      app: hello-world
spec:
  type: NodePort
  ports:
  - port: 8080
    protocol: TCP
  selector:
    app: hello-world
   </pre>

   PROTIP: The selector should match the pods.xml.

   One type of service is load balancer within a cloud:

   <pre>
apiVersion: v1
kind: Service
metadata:
  name: la-lb-service
spec:
  selector:
    app: la-lb
  ports:
  - port: 80
    protocol: TCP
    targetPort: 9376
  type: LoadBalancer
  clusterIP: 10.0.171.223
  loadBalancerIP: 78.12.23.17
   </pre>

0. To create services:

   <pre><strong>
   kubectl create -f svc.yml
   </strong></pre>

   The response expected:

   <pre>
   service "hello-svc" created
   </pre>

0. List:

   <pre><strong>
   kubectl get svc
   </strong></pre>

0. List details:

   <pre><strong>
   kubectl describe svc hello-svc
   </strong></pre>

0. List end points addresses:

   <pre><strong>
   kubectl describe ep hello-svc
   </strong></pre>


<a name="DeploymentYml"></a>

### Deploy yml

The `deploy.yml` defines the deploy:

   <pre>
apiVersion: apps/v1beta2
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
  spec:
    containers:
    - name: nginx
      image: nginx:1.7.9
      ports:
      - containerPort: 80
        protocol: TCP
    nodeSelector:
      net: gigabit
   </pre>

   Deployment wraps around <strong>replica sets</strong>, a newer version of doing rolling-update on Replication Controller. Old replica sets can revert roll-back by just changing the deploy.yml file.

   PROTIP: Don't run apt-upgrade within containers, which breaks the image-container relationship controls.

1. Retrieve the yaml for a deployment:

   <pre>kubectl get deployment nginx-deployment -o yaml</pre>

   Notice the "RollingUpdateStrategy: 25% max unavilable, 25% max surge".

1. Begin rollout of a new desired version from the command line:

   <pre>kubectl set image deployment/nginx-deployment nginx=nginx:1.8</pre>

   Alternately, edit the yaml file to nginx:1.9.1 and:

   <pre>kubectl apply -f nginx-deployment.yaml</pre>

1. View Rollout a new desired version:

   <pre>kubectl rollout status deployment/nginx-deployment</pre>

1. Describe the yaml for a deployment:

   <pre>kubectl describe deployment nginx-deployment</pre>

1. List the DESIRED, CURRENT, UP-TO-DATE, AVAILABLE:

   <pre>kubectl get deployments </pre>

1. List the DESIRED, CURRENT, UP-TO-DATE, AVAILABLE:

   <pre>kubectl get deployments </pre>

1. List the history:

   <pre>kubectl rollout history deployment/nginx-deployment --revision=3</pre>

1. Backout the revision:

   <pre>kubectl rollout undo deployment/nginx-deployment --to-revision=2</pre>


<a name="SecurityContext"></a>

### Security Context

The `security.yml` defines a secrurity context pod:

   <pre>
apiVersion: v1
kind: Pod
metadata:
  name: security-context.pod
spec:
  securityContext:
    runAsUser: 1000
    fsGroup: 2000
  volumess:
  - name: sam-vol
    emptyDir: {}
  containers:
  - name: sample-container
    image: gcr.io/google-samples/node-hello:1.0
    volumeMounts:
    - name: sam-vol
      mountPath: /data/demo
    securityContext:
      allowPrivilegeEscalation: false
   </pre>

1. Create the pod:

   <pre>kubectl create -f security.yaml</pre>
   
   This can take several minutes.

1. Enter the security context:

   <pre>kubectl exec -it security-context-pod -- sh</pre>
   
1. See the users:

   <pre>ps aux</pre>

1. See that the group is "2000" as specified:

   <pre>cd /data && ls -al</pre>

1. Exit the security context:

   <pre>exit</pre>

1. Delete the security context:

   <pre>kubectl delete -f security.yaml</pre>


<a name="Kubelet"></a>

## Kubelet Daemonset.yaml

Kubelets instantiate pods -- each a set of containers running under a single IP address,
the fundamental units nodes.

A Kubelet <strong>agent program</strong> is installed on each server
to watch the apiserver and register each node with the cluster.


PROTIP: Use a DaemonSet when running clustered Kubernetes with static pods to run a pod on every node. Static pods are managed directly by the kubelet daemon on a specific node, without the API server observing it. 

   * https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/

A DaemonSet ensures that all (or some) Nodes run a copy of a Pod. 
As nodes are added to the cluster, Pods are added to them. 
As nodes are removed from the cluster, those Pods are garbage collected. 

Deleting a DaemonSet will clean up the Pods it created.
Some typical uses of a DaemonSet are:

   * running a cluster storage daemon, such as glusterd, ceph, on each node.
   * running a logs collection daemon on every node, such as fluentd or logstash.
   * running a node monitoring daemon on every node, such as Prometheus Node Exporter, collectd, Datadog agent, New Relic agent, or Ganglia gmond.

1. Start kubelet daemon:

   <pre><strong>
   kubelet --pod-manifest-path=<em>the directory</em> 
   </strong></pre>

   This periodically scans the directory and creates/deletes static pods as yaml/json files appear/disappear there. 

   Note: Kubelet ignores files starting with a dot when scanning the specified directory.

   PROTIP: By default, Kubelets exposes endpoints on port <strong>10255</strong>.

   Containers can be Docker or rkt (pluggable)

   /spec, /healthz reports status.

The container engine pulls images and stopping/starting containers.

   * https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/


### CNI

The Controller Network Interface (CNI) is installed using 
basic cbr0 using the bridge and host-local CNI plugins.

The CNI plugin is selected by passing Kubelet the command-line option:

   <pre>
   --network-plugin=cni 
   </pre>

See https://kubernetes.io/docs/concepts/cluster-administration/network-plugins/


## Learning resources

Nigel Poulton (@NigelPoulton, nigelpoulton.com)

   * <a target="_blank" href="https://app.pluralsight.com/library/courses/getting-started-kubernetes/exercise-files">
   Getting Started with Kubernetes</a> 22 May 2017

   * Book "Docker for Sysadmins".


## Make your own K8s

Kelsey Hightower, in <a target="_blank" href="https://github.com/kelseyhightower/kubernetes-the-hard-way">
https://github.com/kelseyhightower/kubernetes-the-hard-way</a>, 
shows the steps of how to create Compute Engine yourself:

   * Cloud infrastructure firewall and load balancer provisioning
   * setup a CA and TLS cert gen.
   * setup TLS client bootstrap and RBAC authentication
   * bootstrap a HA etcd cluster
   * bootstrap a HA Kubernetes Control Pane
   * Bootstrap Kubernetes Workers
   * Config K8 client for remote access
   * Manage container network routes
   * Deploy clustesr DNS add-on
   <br /><br />

http://post.oreilly.com/rd/9z1z07qqefah7igu9ftil9os3s666asu5a6lfhh1eko
Kubernetes adventures on Azure, Part 1 (Linux cluster)
Having read several books on Kubernetes, Ivan Fioravanti, writing for Hackernoon, says it's time to start adventuring in the magical world of Kubernetes for real! And he does so using Microsoft Azure. Enjoy the step-by-step account of his escapade (part 1).

## Qwiklab

https://run.qwiklab.com/searches/lab?keywords=Build%20a%20Slack%20Bot%20with%20Node.js%20on%20Kubernetes&utm_source=endlab&utm_medium=email&utm_campaign=nextlab

The 8 labs covering 8 hours of the
<a target="_blank" href="https://webinars-run.qwiklab.com/quests/29">
Kubernetes in the Google Cloud Qwiklab quest</a>

## References

by Adron Hall:

   * <a target="_blank" href="https://www.pelo.tech/blog/running-kubernetes/">
   Kubernetes with Gcloud and Terraform</a> April 5, 2017

   * <a target="_blank" href="http://blog.adron.me/articles/setting-up-gcp-container-cluster/">
   Setting up a GCP Container Cluster - Part I</a> January 31, 2017.

Julia Evans

   * https://jvns.ca/categories/kubernetes/

Drone.io


http://www.nkode.io/2016/10/18/valuable-container-platform-links-kubernetes.html

https://medium.com/@ApsOps/an-illustrated-guide-to-kubernetes-networking-part-1-d1ede3322727

https://cloud.google.com/solutions/heterogeneous-deployment-patterns-with-kubernetes

https://cloud.google.com/solutions/devops/

https://docs.gitlab.com/ee/install/kubernetes/gitlab_omnibus.html

https://www.terraform.io/docs/providers/aws/guides/eks-getting-started.html


## Social

https://kubernetes.io/community/

<a target="_blank" href="https://www.youtube.com/watch?v=i425aTrW6Gg">
Solutions Engineering Hangout: Terraform for Instant K8s Clusters on AWS EKS</a>
by HashiCorp

## More

This is one of a series on AI, Machine Learning, Deep Learning, Robotics, and Analytics:

{% include ai_links.html %}
