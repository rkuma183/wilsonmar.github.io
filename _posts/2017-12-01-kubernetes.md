---
layout: post
title: "Kubernetes (K8s)"
excerpt: "Container engine"
shorturl: "https://goo.gl/"
filename: kubernetes.md
modified:
tags: [google, cloud]
image:
# feature: pic blue black stars spin 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14621973/fe6e21a6-0583-11e6-9a94-a969a51759b6.jpg
  credit: Jeremy Thomas
  creditlink: https://www.flickr.com/photos/132218932@N03/page2
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This page is being actively worked on, so please pardon the "dust".

This is a tutorial presented as a hands-on workshop with commentary along the way.
Here, you do something, then the command and responses are explained.

![k8s_arch-ruo91-ani-800x450](https://user-images.githubusercontent.com/300046/33525509-1eb3964c-d7ee-11e7-87d2-10385a3e7a82.gif)

<a target="_blank" href="https://translate.google.com/translate?hl=en&sl=ko&tl=en&u=http%3A%2F%2Fwww.yongbok.net%2Fblog%2F">
Yongbok Kim (who writes in Korean)</a> <a target="_blank" href="https://cdn.yongbok.net/ruo91/architecture/k8s/v1.1/kubernetes_architecture.png">posted (on Jan 24, 2016)</a> a master map of how all the pieces relate to each other:<br />
<small>Click on the diagram to pop-up a full-sized diagram</small>:
<a target="_blank" title="k8s_details-ruo91-2071x2645.png" href="https://user-images.githubusercontent.com/300046/33525160-4dc5931a-d7e7-11e7-8b83-9e373fc5ac7d.png">
<img alt="k8s_details-ruo91-350x448.jpg" src="https://user-images.githubusercontent.com/300046/33525167-7a5d3b9e-d7e7-11e7-8dd6-99694dc31782.jpg"></a>



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



## Terminology background

Kubernetes automates the deployment and scaling of containers within pods arranged in clusters.

Kubernetes is called an "orchestrator" of <a href="#micro-services">micro-service apps</a> and utilities that run on containers built using Docker or rkt.

Kubernetes is often abbreviated as "k8s", with 8 replacing the number of characters between k and s.

Kubernetes is the ancient Greek word for "helmsman" (people who pilot cargo ships). 
Thus the nautical references and why k8s experts are called "captain" and why associated product have nautical themes,
such as "helm".

<img align="right" alt="kubernetes-logo-125x134-15499.png" src="https://user-images.githubusercontent.com/300046/33524448-ca1d7e30-d7da-11e7-9358-45845910198c.png">
<a target="_blank" href="https://cloudplatform.googleblog.com/2016/07/from-Google-to-the-world-the-Kubernetes-origin-story.html">
This blog</a> and <a target="_blank" href="http://softwareengineeringdaily.com/2016/07/20/kubernetes-origins-with-craig-mcluckie/">podcast</a> about origins note
that the Kubernetes logo has 7 sides because its developers are Star Trek fans:
The predecessor to Kub was called Borg.
A key Borg character is called "7 of 9".


### Open Sourced

Google created Kubernetes (using Golang) 
for internal use over a decade before open-sourcing it to CNCF in 2014.

"Kubernetes" is a registered trademark of the Linux Foundation, which maintains the website
<a target="_blank" href="https://kubernetes.io">https://kubernetes.io</a> and
source code at

   <a target="_blank" href="https://github.com/kubernetes/kubernetes">
   https://github.com/kubernetes/kubernetes</a>

   * v1.0 was committed on July 2015 within GitHub
   * v1.6 was led by a CoreOS developer.
   * v1.7 was led by Google.
   * v1.8 is led by a Microsoft employee (Jaice Singer DuMars specifically) after Microsoft joined the CNCF July 2017.

### OpenShift support

If you want to pay for Kubernetes,
<a target="_blank" href="
https://www.redhat.com/en/technologies/cloud-computing/openshift">
https://www.redhat.com/en/technologies/cloud-computing/openshift</a>
Red Hat® OpenShift is a container application platform that brings Docker and Kubernetes to the enterprise. 

### Social media

   * <a target="_blank" href="https://twitter.com/kubernetesio/">Twitter: @kubernetesio</a>
   * <a target="_blank" href="https://slack.k8s.io">https://slack.k8s.io</a>

### Competitors

https://codefresh.io/kubernetes-guides/kubernetes-cloud-aws-vs-gcp-vs-azure/
Kubernetes in the Cloud: AWS vs. GCP vs. Azure


<a name="Install"></a>

## Options for deployment

There are several ways to obtain a running instance of Kubernetes,
listed from easiest to most difficult:

A) "Kubernetes Engine" is a container management SaaS product running within the Google Compute Platform (GCP) on top of Google Compute Engine providing machines. It was previously called Google Container Engine (GKE). 

   But one can run k8s containers in other clouds or within private data centers.

A) <a href="#Minikube">Minikube spins up a local environment on your laptop</a>.

B) <a href="#DockerHub">Pull an image from Docker Hub</a> 
   within a Google Compute or AWS cloud instance.

C) <a href="#Dockerfile">Use a Dockerfile to build your own Docker image containing Kubernetes</a>.

D) <a href="Homebrew">Use Homebrew to install Kubernetes natively on you Mac</a>.

E) <a href="#BinaryInstall">Download installer to install locally</a>.

CAUTION: If you are in a large enterprise, confer with your security team before 
installing. They often have a repository such as Artifactory or Nexus where
installers are available after being vetted and perhaps patched
for security vulnerabilities.


<a name="Minikube"></a>

### Minikube

Minikube goes beyond Docker For Mac (DFM) and Docker for Windows (DFW)
and includes a node and a Master when it spins up a local environment.

CAUTION: At time of writing, https://github.com/kubernetes/minikube
has 257 issues and 20 pending Pull Requests.

1. Install on a Mac:
 
   <pre><strong>
   brew install docker-machine-driver-xhyve
   </strong></pre>

   <pre><strong>
   brew install minikube -y
   </strong></pre>

   BLAH: On Nov 9, 2017 I got an error message doing the above.

minikube version

On Mac:
   minikube start --vm-driver=xhyve
On Windows:
   minikube start --vm-driver=hyperv

minikube dashboard

minikube stop

minikube delete



## kubectl CLI client install

Running outside Kubernetes servers is <strong>`kubectl`</strong> (kube + ctl), 
the CLI tool for k8s. It's automatically installed within Google cloud instances.

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

Kubectl 1.8 scale is now the preferred way to control graceful delete.

Kubectl 1.8 rollout and rollback now support stateful sets ???


<a name="micro-services"></a>

## Sample micro-service apps

I have built a GitHub repository containing example apps and utilities that process them at:

   <a target="_blank" href="https://github.com/wilsonmar/DevSecOps/Kubernetes">
   https://github.com/wilsonmar/DevSecOps/Kubernetes</a>

The remainder of this tutorial refers to files in this repository.

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

   ### Infrastructure as code

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

   These are explained in detail at https://www.digitalocean.com/community/tutorials/how-to-configure-nginx-as-a-web-server-and-reverse-proxy-for-apache-on-one-ubuntu-14-04-droplet

   ### SSL keys

   SSL keys referenced are installed from the `tls` folder:

   * ca-key.pem - Certificate Authority's private key
   * ca.pem - Certificate Authority's public key
   * cert.pem - public key
   * key.pem - private key


   Deployments

   * auth.yaml
   * frontend.yaml
   * hello-green.yaml
   * hello-canary.yaml
   * hello.yaml

   pods

   * healthy-monolith.yaml configures "livenessProbe" (in folder healthz) and "readinessProbe" (in folder readiness) on port 81
   * monolith.yaml
   * secure-monolith.yaml

   services

   * auth.yaml
   * frontend.yaml
   * hello-blue.yaml
   * hello-green.yaml
   * hello.yaml
   * monolith.yaml


   Label

   ### Current context

   <pre><strong>
   kubectl config current-context
   <pre><strong>



<a name="GKE"></a>

### How Kubernetes Engine works

Kubernetes 

![kubernetes-pods-599x298-35069](https://user-images.githubusercontent.com/300046/31013696-81d30fc0-a4d4-11e7-9852-36be55b74499.jpg)

Pods are defined by a <a href="#Manifest">manifest file</a> 
read by the <strong>apiserver</strong> which deploys nodes.

Nodes were previously called "minions" who do work.
Apparently Google namers forgot about the existance of NodeJS.

Pods abstact the network and storage of containers. 
So each <strong>pod</strong> can hold one or more containers, all of which <strong>share the same IP address</strong>, hostname, namespaces, and other resources. 

Pods go into "succeeded" state after being run because
pods have short lifespans -- deleted and recreated as necessary.

Each container has a different port.
Containers within the same pod are on the same localhost.

Pods are replicated across several Compute Engine nodes.

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

   Included are pods named:
   * api server (aka "master") accepts kubectl commands
   * <a href="#etcd">etcd</a> (cluster store) for HA (High Availability) in control pane
   * controller to watch for changes and maintain desired state
   * dns (domain name server)
   * proxy load balances across all pods in a service
   * scheduler watches api server for new pods to assign work to new pods
   <br /><br />

0. List app pods in the default namespace:

   <pre><strong>
   kubectl get nodes
   </strong></pre>

0. For more details:

   <pre><strong>
   kubectl describe pods
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



### Replication rc.yml

The `rc.yml` (Replication Controller) defines the number of replicas and 

   <pre>
apiVersion: v1
kind: ReplicationController
metadata:
  name:   cadvisor
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

0. Create services:

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
apiVersion: v1beta
kind: Deployment
   </pre>

Deployment wraps around <strong>replica sets</strong>, a newer version of doing rolling-update on Replication Controller. Old replica sets can revert roll-back by just changing the deploy.yml file.


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


<a name="#etcd"></a>

### etcd storage 

etcd provides a reliable way to notify the rest of the cluster about configuration changes for
shared configuration and service discovery.

Data stored by Kubernetes in etcd includes jobs being scheduled, created and deployed, pod/service details and state, namespaces and replication information, etc.

etcd provides a REST API for CRUD operations as well as an interface to register watchers on specific nodes.

etcd is a simple, distributed, consistent key-value store.


### CNI

The Controller Network Interface is installed using 
basic cbr0 using the bridge and host-local CNI plugins.

https://kubernetes.io/docs/concepts/cluster-administration/network-plugins/

The CNI plugin is selected by passing Kubelet the command-line option:

   <pre>
   --network-plugin=cni 
   </pre>


## Learning resources

Nigel Poulton (@NigelPoulton, nigelpoulton.com)

   * <a target="_blank" href="https://app.pluralsight.com/library/courses/getting-started-kubernetes/exercise-files">
   Getting Started with Kubernetes</a> 22 May 2017

   * Book "Docker for Sysadmins".


## Make your own K8s

Kelsey Hightower, in https://github.com/kelseyhightower/kubernetes-the-hard-way, 
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


## References

<a target="_blank" href="https://www.slideshare.net/walterliu7/kubernetes-workshop-78554820"
title="Kubernetes Workshop published Aug 4, 2017 by Walter Liu">
This diagram</a>
![k8s-services-flow-847x644-100409](https://user-images.githubusercontent.com/300046/33525135-9b69e09a-d7e6-11e7-857f-513e8582d450.jpg)


customers were paying for a lot of CPUs, but their utilization rates were extremely low because they were running VMs.



https://twitter.com/TectonicStack?refsrc=email
