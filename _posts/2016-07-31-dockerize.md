---
layout: post
title: "Dockerize apps"
excerpt: "Define how little bits work together"
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

The object of this tutorial is to get you to confidently create
Dockerfile and 
docker-compose files
which define how Docker instantiate containers across several operating systems.

{% include _intro.html %}


## Basic Concepts #

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

   <a href="#VerifyInstall">Skip to see this built</a>.

   ### Docker builder instructions #
   
   \# ("pound sign") begins a comments line or a directive.

   * FROM sets the image to an operating system image. For options, do a 
   <a href="#DockerSearch">. This must be the first line.
   docker search</a>.
   * MAINTAINER defines the file's author
   * USER
   * ARG user1=someuser # referenced by --build-arg user=what_user in docker build
   * ARG CONT_IMG_VER 
   * ENV CONT_IMG_VER ${CONT_IMG_VER:-v1.0.0}
   * ENV foo /bar
   * ENV def=$abc
   * WORKDIR ${foo}    # sets working directory to /bar
   * VOLUME /tmp
   * ADD . $foo        # add . /bar to file system
   * COPY \$foo /quux 

   * HEALTHCHECK--interval=5m --timeout=3s \<br />
     CMD curl -f http://localhost/ || exit 1
   * CMD ["--port 27017"] # provides defaults to executing container
   * CMD ["/usr/bin/wc","--help"] # executable and parameter
   * EXPOSE 27017 # sets the port to listen

   * RUN bash -c 'touch /app.jar' # updates the repository sources list, etc.
   * ENTRYPOINT ["top", "-b"] # sets default container commands
   * ONBUILD RUN /usr/local/bin/python-build --dir /app/src
   * STOPSIGNAL SIGKILL # sets the system call signal that will be sent to the container to exit.
   <br /><br />

   See <a target="_blank" href="https://docs.docker.com/engine/reference/builder/">
   https://docs.docker.com/engine/reference/builder</a>
   
   More examples at <a target="_blank" href="https://docs.docker.com/engine/examples/">
   https://docs.docker.com/engine/examples</a>

   <a target="_blank" href="https://docs.docker.com/engine/reference/builder/#/exec-form-entrypoint-example">
   This</a> Dockerfile shows use of the ENTRYPOINT to run Apache in the foreground (i.e., as PID 1):

   <pre>
FROM debian:stable
RUN apt-get update && apt-get install -y --force-yes apache2
EXPOSE 80 443
VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
   </pre>

   An example for Java on WebLogic:

   <pre>
FROM kmandel/java:8
VOLUME /tmp
#ADD ${project.build.final}.jar app.jar
ADD my-api.jar app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","<a target="_blank" href="http://www.thezonemanager.com/2015/07/whats-so-special-about-devurandom.html">-Djava.security.egd=file:/dev/./urandom</a>","-jar","/app.jar"]
   </pre>



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


   ### .dockerignore #

   The .dockerignore file is like a .gitignore file,
   but specifies items for Docker to ignore in the Dockerfile.

   See https://docs.docker.com/engine/reference/builder/#/dockerignore-file


<a name="DockerCompose"></a>

## Docker Compose #

Docker compose creates multiple containers with a single operation. 

See https://docs.docker.com/compose/

0. Define attributes of Docker host in environment variables:

   * DOCKER_HOST
   * DOCKER_TLS_VERIFY
   * DOCKER_CERT_PATH

See https://docs.docker.com/v1.11/compose/compose-file/



## More resources #

Blogs on this topic:

   * http://thediscoblog.com/blog/2014/05/05/dockerfiles-in-a-jiffy/



## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
