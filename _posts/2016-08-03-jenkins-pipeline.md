---
layout: post
title: "Jenkins 2 Pipeline"
excerpt: "Slave nodes are now stylish agents"
tags: [Jenkins, setup]
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

This article shows you how to install and configure Jenkins version 2 for Continuous Delivery (CD) as well as Continuouse Integration (CI)
using <a href="#Groovy">Groovy DSL scripts</a>.

{% include _intro.html %}

## What is CD? #

The <a target="_blank" href="https://en.wikipedia.org/wiki/Continuous_delivery">
definition from Wikipedia:</a>

"Continuous Delivery (CD) is a software engineering approach
in which teams produce software in short cycles,
ensuring that the software can be reliably released at any time.
It aims at building, testing, and releasing software 
faster and more frequently.
The approach helps reduce the cost, time, and risk of
deliverying changes by allowing for
more incrementaal updates to applications in production.
A straightforward and repeatable
deployment process is important for continuous delivery."


## Jenkins2 highlights #

The objective of Jenkins2 is to install with a 
<a href="#RecommendedPlugins">recommended set of plugins</a>
(a more "curated" experience than v1)
that cover 80% of use cases out of the box.

Summary of Jenkins2 features: [36:00]

* Introduce “pipeline” as a new type in Jenkins (to Freestyle)
* Multiple SCM repositories in each job
* Entire pipeline as text code in SCM (GitHub)

* DRY (Do not Repeat Yourself) - Reusable components and flow
* Jobs share global library to share scripts, functions, variables
* Extendable DSL with loops, logic

* Jobs can wait for user input before continuing
* <a href="#DurableTaskPlugin">
Durable tasks</a> keep running while master restarts [41:33]
* Jobs starting in one agent can switch to another
* Parallel execution of arbitrary build states
<br /><br />

<a target="_blank" href="https://www.youtube.com/watch?v=emV60CcDVV0&t=49m47s">
Pipeline</a>:

* Ensuring reproducible builds
* Sharing build artifacts thrughout the pipeline
* Choosing the right granularity for each job
* Parllelizing and joining jobs
* Gates and approvals
* Visualizing the pipeline
* Organizing and securing jobs
* Good practice: versioning your Jenkins configuration
<br /><br />

[53:44]

### Find and Select Jenkins Plugins #

Here is a generic set of steps to install a plug-in.

The assumtion here is that you have followed 
[Jenkins Setup](/jenkins-setup/) to install the latest version of Jenkins,
which went Version 2 April 26, 2016 after over 10 years at v1.

0. Click **Manage Jenkins** on the left menu of the Dashboard screen.

   <amp-img width="362" height="285" alt="jenkins createuser_01b-362x285-t69" src="https://cloud.githubusercontent.com/assets/300046/17301184/f763c996-57d2-11e6-8b28-1faf907a3b60.png"></amp-img>

0. Click **Manage Plugins** to http://.../pluginManager/

   <amp-img width="650" height="53" alt="jenkins manage plugins 2016-08-01-650x53-i11.jpg" src="https://cloud.githubusercontent.com/assets/300046/17295483/95b3f7d4-57b9-11e6-94af-d8183f3ec77d.jpg"></amp-img>

0. Click **Installed** tab to view what has been installed already.
0. Click **Available** tab to http://.../pluginManager/available
0. Click **Advanced** tab and scroll to the bottom to see the 
   Update Site URL for the source of plugins listed:

   <pre>
   http://updates.jenkins-ci.org/update-center.json
   </pre>

   Notice the host name from "jenkins-ci.org" to "jenkins.io".

   NOTE: You can upload a plugin file with the file extension <strong>.hpi</strong> to folder
   &LT;jenkinsHome>/plugins/

   On a Mac, the jenkinshome is <strong>~/.jenkins</strong>.


0. View the <a target="_blank" href="http://wiki.jenkins-ci.org/display/JENKINS/Plugins">
   Wiki on Plugins</a>.

   PROTIP: The wide variety of plugins is why Jenkins is popular.


   * http://www.praqma.com/stories/top-jenkins-plugins/
   * http://zeroturnaround.com/rebellabs/top-10-jenkins-featuresplugins/
   * https://uttamkini.com/2012/12/01/jenkins-plugins-that-every-team-must-use/
   * http://www.hugeinc.com/ideas/perspective/list-of-useful-jenkins-plugins
   * http://devops.com/2015/01/15/15-must-jenkins-plugins-increase-productivity/
   * https://wiki.jenkins-ci.org/display/JENKINS/Plugin+Installation+Statistics
   is broken
   <br /><br />

0. Click on a category (such as ".NET Development") to contract or expand items in each category.

   PROTIP: There are dozens of categories, so it may be easier to search for plugins by name
   or from the list of categories online at <br />
   <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Plugins">
   https://wiki.jenkins-ci.org/display/JENKINS/Plugins</a>

   ### Install Green Balls icon plugin #

0. In the Filter field at the upper right of the screen, type "Green Balls",
   which is one of the most popular among DevOps people who can't stand that 
   the Jenkins default for healthy (successful) is blue, not green.
   (<a target="_blank" href="https://jenkins.io/blog/2012/03/13/why-does-jenkins-have-blue-balls/">
   due to a historical/cultural artifact</a>).

   PROTIP: When a plugin is installed, Jenkins removes that plugin among the "Available"
   and shows the plugin among the "Installed".
   
0. When you click the name of a plug-in you'll be sent to another website, such as:<br />
   <a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/Green+Balls">
   https://wiki.jenkins-ci.org/display/JENKINS/Green+Balls</a>

0. Return to the previous screen: Hit the browser return key or command + left arrow.

   PROTIP: Instead of clicking plugin names, right-click to 
   <strong>open link in New Tab</strong> on your browser
   so a tab with the Jenkins icon remains among browser tabs.

0. Return to the root console page (by clicking "Jenkins" at the upper left corner).

0. Click "S" among "S M L" under the icons to show Small icons.


## Jenkins 2 Pipeline Plugin #

Instead of manually clicking through the Jenkins UI, the 
<a target="_blank" href="https://jenkins.io/solutions/pipeline/">
Pipeline plugin</a> in Jenkins 2
reads a text-based <strong>Jenkinsfile</strong>
<a href="#Groovy">Groovy script code</a> checked into source control.

   ### Install Pipeline Plugin #

0. Install the "Pipeline" (in Manage Jenkins, Manage Plugins, Available) at<br />
   https://wiki.jenkins-ci.org/display/JENKINS/Pipeline+Plugin

   NOTE: This was part of Cloudbees licenced features,
   but released in open edition.

0. Right-click to open in a new tab the 
   "See Pipeline as Code with Jenkins for more details" "link at<br />
   <a target="_blank" href="https://jenkins.io/solutions/pipeline/">
   https://jenkins.io/solutions/pipeline</a>

0. Return to the root console page (by clicking "Jenkins" at the upper left corner).

0. Click <strong>New Item</strong> at http://.../view/All/newJob

0. Enter item name and click "Pipeline", then OK. ("Orchestrates long-running activities that can span multiple build slaves. Suitable for building pipelines (formerly known as workflows) and/or organizing complex activities that do not easily fit in free-style job type.").

   ### Build triggers #

0. Among Build Triggers click "Build when a change is pushed to GitHub".

0. Click "GitHub project". 

0. For Project url: https://github.com/hotwilson/box.git

   NOTE: The word "slave" and "node" and "computer"
   have been replaced with the word "agent".

0. Click "Advanced" and type the Display name, "Box" in our example.

   ### Pipeline Groovy #

0. Click "Pipeline" tab to bring that section up.

0. Select from the "try sample" pull down "Hello World".

   <a name="SampleGroovy"></a>

   ### Sample Groovy script #

   <pre>
node {
   stage 'Stage 1'
   echo 'Hello World 1'
   stage 'Stage 2'
   echo 'Hello World 2'
}
   </pre>

   A <strong>node</strong> is a unit of work 
   processed by Jenkins <strong>agents</strong>.

   Notice that unlike Java code, there are <strong>no semicolons</strong>.

   PROTIP: Information about the Jenkins DSL (Domain-Specific Language) is
   at link to ???
   The DSL is extendable.

0. Click Save for the item screen.

   ### Build Now for Stage View #

0. Double-click on "Build Now" (in rapid succession).

   A sample response:

   <amp-img width="490" height="277" alt="jenkins2 build hello-world-490x277-i38.png" src="https://cloud.githubusercontent.com/assets/300046/17341552/59559492-58b2-11e6-84a1-f1acade300ae.png"></amp-img>
   NOTE: Text in headings were specified in state keywords in the Groovy script above.

   PROTIP: Only click once on Jenkins links or two executions will result from a double-click.

0. Cursor over one of the "ms" numbers (for milliseconds or thousands of a second) 
   in the green area and 
   click the Log button that appears.

   A pop-up appears with the text specified by the echo command within the Groovy script.

0. Click the "X" at the upper-right of the dialog to dismiss it.

0. To remove the menu on the left, click "Full Stage View".

   PROTIP: The "full stage view" will be needed when there are more stages going across the screen.

   ### Build History #

0. To return to the menu with Build History, <br />
   click the item/job name in the breadcrumbs or press command+left arrow.

0. Click one of the jobs in the Build History section in http://.../job/box/5/

   Notice the number in the URL corresponds to the number listed.

   PROTIP: The time of the run is the server's time, not your local time on your laptop.

0. Click "Console Output" for log details created from that run.


<a name="InfrastructureAsCode"></a>

## Multi-branch Infrastructure as Code #

Instead of Jenkins types Freestyle and Pipeline,
select <strong>Multi-branch</strong>.




<a name="DurableTaskPlugin"></a>

## Durable Task Plugin #

For long-running build runs at <br />
https://wiki.jenkins-ci.org/display/JENKINS/Durable+Task+Plugin

"Library offering an extension point for processes which can run outside of Jenkins yet be monitored."


### Restart Jenkins server #

0. PROTIP: Restart Jenkins by changing the URL from:

   <pre>
   http://.../pluginManager/installed
   </pre>

   to

   <pre>
   http://.../restart
   </pre>

0. Click Yes to "Are you sure".

0. "Please wait while Jenkins is restarting".


### Safe Restart Plugin #

Some install the 
<a target="_blank" href="https://wiki.jenkins-ci.org/display/JENKINS/SafeRestart+Plugin"> 
SafeRestart plug-in</a> which adds the <strong>Restart Safely</strong> option to the 
<a title="jenkins saferestart_plugin" href="https://cloud.githubusercontent.com/assets/300046/12584913/9681b1d2-c3fe-11e5-9359-e51fc5809734.png">
Jenkins left menu</a> to avoid needing to be at the server console at all.


## Monitoring #

@jenx_monitor
is a A Jenkins build server monitor for Mac OS X, powered by MacRuby. This app sits in your status bar and reports the status of all your Jenkins builds.



## Texual info about Pipeline #

* <a target="_blank" href="https://jenkins.io/doc/pipeline/">
   https://jenkins.io/doc/pipeline = Getting Started with Pipeline</a>
* https://jenkins.io/solutions/pipeline/
* https://wiki.jenkins-ci.org/display/JENKINS/Pipeline+Plugin
* https://github.com/jenkinsci/pipeline-plugin/blob/master/README.md#introduction
* https://jenkins.io/blog/2015/12/03/pipeline-as-code-with-multibranch-workflows-in-jenkins/

Arnaud Heritier (@aheritier, aheitier)
(Support Team Manager at Cloudbees)

   * https://speakerdeck.com/aheritier/introduction-to-jenkins-2-at-parisjug-2016
   Slidedeck from Paris JUG June 2016 points to
   <a target="_blank" href="https://groups.google.com/d/msg/jenkinsci-dev/vbXK7jjekFw/BievO0UxBgAJ"> Kohsuke's 25 Sep 2015 proposal for Jenkins 2.0</a>.


## Info about Pipeline #

   <amp-img width="650" height="261" alt="jenkins cd flow 650x261-i15.jpg" src="https://cloud.githubusercontent.com/assets/300046/17418538/45f540d2-5a56-11e6-8730-39528384e435.jpg"></amp-img>
   From 

If you prefer videos, these are specifically about Jenkins 2.0+

by author Jesse Glick (<a target="_blank" href="https://twitter.com/tyvole/">@tyvole</a>)

Pipeline author Jesse Glick (<a target="_blank" href="https://twitter.com/tyvole/">@tyvole</a>)

   * <a target="_blank" href="https://www.youtube.com/watch?v=_aLPahlSFHU">
   Jenkins Workflow: security model &amp; plugin compatibility
   Aug 2015</a>

Jenkins creator Kohsuke Kawaguchi (Creator of Jenkins and CTO of Cloudbees)
<a target="_blank" href="https://www.youtube.com/channel/UCT_pjuBAYn6Sm_u4YJt59Rw">
YouTube channel</a> :

   * <a target="_blank" href="https://www.youtube.com/watch?v=emV60CcDVV0/">
   Jenkins 2.0 Virtual Conf. (take 2) 
   4 May 2015</a>

      * Grow with you from simple to complex
      * Text-based, in your VCS
      * Handle lots of jobs without repetition
      * Survive Jenkins restart
      * Brings next level of reuse to Jenkins

   * <a target="_blank" href="https://www.youtube.com/watch?v=2eVyc_n8i1c/">
   on 7 Oct 2015</a>



   * <a target="_blank" href="https://www.youtube.com/watch?v=fl5xfqtiNko/">
   Jenkins 2.0 Virtual Conf. 2015</a>

<a target="_blank" href="https://se.linkedin.com/in/robertsandell/">
Robert "Bobby" Sandell</a>
(<a target="_blank" href="<a target="_blank" href="https://www.rsandell.com/">rsandell.com</a>), 
Software Engineer at Cloudbees Stockholm since June 2010
has these videos:

   * <a target="_blank" href="https://www.youtube.com/watch?v=_iFtmp72p_E">
   Jenkins pipeline plugin demo</a>

   * <a target="_blank" href="https://www.youtube.com/watch?v=M-rxJBdYIrw">
   Jenkins 2.0. What? When? What is in it for me?</a>

Jim Leitch

   * <a target="_blank" href="https://www.youtube.com/watch?v=th_0jGRTnJ4">
   Jenkins 2.0 What's is new?</a>

James Nord

   * <a target="_blank" href="https://www.youtube.com/watch?v=PsgQ4v4aBhA">
   Jenkins 2.0 and Beyond (and Q&A)</a>


<a name="InfrastructureAsCode"></a>

## Infrastructure as code #

Having infrastructure defined in text code
enables experimentation (using experimental branches).

This improves quality by making use of 
<strong>code review</strong> features in GitHub.

Having infrastructure specifications in the same repository
ensures that changes are automatically reflected.

https://github.com/jenkinsci/pipeline-examples

* Run several repos within an organization within GitHub.

<a target="_blank" href="https://www.youtube.com/watch?v=emV60CcDVV0&t=1h6m7s">
Jesse on GitHub</a>


<a name="Groovy"></a>

## Groovy Scripts #

The official documentation page for Apache Groovy is <br />
<a target="_blank" href="http://www.groovy-lang.org/documentation.html#gettingstarted">
http://www.groovy-lang.org/documentation.html#gettingstarted</a>

<a target="_blank" href="https://gradle.org/">
Gradle</a> was built using Groovy
because it can handle larger projects than Maven,
which Gradle replaces.

Step Reference is at https://.../job/box/pipeline-syntax/html


### CPS Global Library #

<a target="_blank" href="https://www.youtube.com/watch?v=emV60CcDVV0&t=44m52s">
This video</a> introduces the
<a target="_blank" href="https://www.wikiwand.com/en/Continuation-passing_style">
Continuation Passing Style</a>
of "functional programming".
This means that, unlike the direct style people have been coding,
CPS functions return another function.

http://...pipeline-syntax/ has a snippet generator


### Tokenize environment variable #

<a target="_blank" href="https://github.com/jenkinsci/pipeline-examples/blob/master/pipeline-examples/github-org-plugin/access-repo-information.groovy">
Here</a> is an example of a Groovy script file access-repo-information.groovy.
Like other Groovy files, it has in the first line `#!groovy`.

   <pre>
#!groovy
&nbsp;
    tokens = "${env.JOB_NAME}".tokenize('/')
    org = tokens[0]
    repo = tokens[1]
    branch = tokens[2]
   </pre>

`${env.JOB_NAME}` retrieves environment variable JOB_NAME which contains the Git path
"org/repo/branch" among github-organization-plugin jobs.

`tokenize` extracts out text between the slash character specified
into an array named "tokens".


### Time stamp wrapper #

<a target="_blank" href="https://github.com/jenkinsci/pipeline-examples/blob/master/pipeline-examples/timestamper-wrapper/timestamperWrapper.groovy">
Here</a> is an example of invoking a build wrapper 
that adds a time stamp to echos :

   <pre>
wrap([$class: 'TimestamperBuildWrapper']) {
   </pre>


### Color wrapper Stage View #

<a target="_blank" href="https://github.com/jenkinsci/pipeline-examples/blob/master/pipeline-examples/ansi-color-build-wrapper/AnsiColorBuildWrapper.groovy">
Here</a> an example of adding color using Unicode:

   <pre>
       wrap([$class: 'AnsiColorBuildWrapper']) {
        // Just some echoes to show the ANSI color.
        stage "\u001B[31mI'm Red\u001B[0m Now not"
       }
   </pre>


<a name="ParallelJobs"></a>

### Parallel jobs #

<a target="_blank" href="https://github.com/jenkinsci/pipeline-examples/blob/master/pipeline-examples/jobs-in-parallel/jobs_in_parallel.groovy">
Here</a> is an example of how to run several jobs in parallel.
Define array "branches" for execution by in a 
"parallel" command which executes all items in the array at the same time.

   <pre>
def branches = [:]
&nbsp;
for (int i = 0; i < 4; i++) {
  def index = i //if we tried to use i below, it would equal 4 in each job execution.
  branches["branch${i}"] = {
    build job: 'test_jobs', parameters: [[$class: 'StringParameterValue', name: 'param1', value:
      'test_param'], [$class: 'StringParameterValue', name:'dummy', value: "${index}"]]
    }
}
parallel branches
   </pre>

The for loop interrates 4 times through the array (0, 1, 2, 3),
each containing a "build job" command.

param1 : an example string parameter for the triggered job.

dummy: a parameter used to prevent triggering the job with the same parameters value. 
This parameter has to accept a different value each time the job is triggered.
WQ//we have to assign it outside the closure or it will run the job multiple times with the same parameter "4"
//and jenkins will unite them into a single run of the job


<a target="_blank" href="https://github.com/jenkinsci/pipeline-examples/blob/master/pipeline-examples/get-build-cause/getBuildCause.groovy">
Here</a> is a definition pulling in 
<a target="_blank" href="http://javadoc.jenkins-ci.org/hudson/model/class-use/Cause.html">cause</a> info available to Freestyle build jobs as a 
$CAUSE variable 

   <pre>
// Get all Causes for the current build
def causes = currentBuild.rawBuild.getCauses()

// Get a specific Cause type (in this case the user who kicked off the build),
// if present.
def specificCause = currentBuild.rawBuild.getCause(hudson.model.Cause$UserIdCause)
   </pre>

<a target="_blank" href="https://github.com/jenkinsci/pipeline-examples/blob/master/pipeline-examples/parallel-from-grep/parallelFromGrep.groovy">
Here</a> is an alternative.




### Slack notification REST API #

<a target="_blank" href="https://github.com/jenkinsci/pipeline-examples/blob/master/pipeline-examples/slacknotify/slackNotify.groovy">
This</a> script imports Goovy's built-in library to output Json using the "JsonOutput.toJson" class.method.
The JSON output is the body (payload) of a REST API call to Slack.com made using the Linux curl command:

   <pre>
import groovy.json.JsonOutput
def notifySlack(text, channel) {
    def slackURL = 'https://hooks.slack.com/services/xxxxxxx/yyyyyyyy/zzzzzzzzzz'
    def payload = JsonOutput.toJson([text      : text,
                                     channel   : channel,
                                     username  : "jenkins",
                                     icon_emoji: ":jenkins:"])
    sh "curl -X POST --data-urlencode \'payload=${payload}\' ${slackURL}"
}
   </pre>

// Add whichever params you think you'd most want to have
// replace the slackURL below with the hook url provided by
// slack when you configure the webhook


### IRC notification #

<a target="_blank" href="https://github.com/jenkinsci/pipeline-examples/blob/master/pipeline-examples/ircnotify-commandline/ircNotify.groovy">
This</a> snippet for just the "notify" stage shows how to
invoke a Bash shell command ("sh") to use the "nc" (netcat)
command (on the last line below).

   <pre>
stage "notify"
&nbsp;
node {    
    sh ''' 
        MSG='This is the message here'
        SERVER=irc.freenode.net
        CHANNEL=#mictest
        USER=mic2234test
        (
        echo NICK $USER
        echo USER $USER 8 * : $USER
        sleep 1
        #echo PASS $USER:$MYPASSWORD                                                                                      &nbsp;                                                    
        echo "JOIN $CHANNEL"
        echo "PRIVMSG $CHANNEL" :$MSG
        echo QUIT
        ) | nc $SERVER 6667
    '''
}
   </pre>

The shell command above first defines environment variables,
then between (parentheses) specifies the commands
piped into the nc command.

The "nc" (netcat) command is built into most Linux servers (including Mac OSX).
It's used instead of Telnet here.

A <a target="_blank" href="http://phil.lavin.me.uk/tag/irc-with-netcat/">
"raw" connection</a> is established on default port 6667.
Your enterprise network may not allow it.

You need to modify the "This is the message here" text to 
a variable updated internally in the script
based on results of the previous stage.

Also modify values to variables CHANNEL and USER.

$MYPASSWORD comes from outside the script.

* Command "NICK" sets the user nickname.
* Command "PRIVMSG" sets the private message.
<br />



## Remote Loader Plugin #

<a target="_blank" href="https://www.youtube.com/watch?v=emV60CcDVV0&t=46m01s">
This video</a> introduces this feature.

A pipline Groovy file can be loaded from any repo within a pipeline,
like what "include" statements do.

<a target="_blank" href="https://github.com/jenkinsci/pipeline-examples/blob/master/pipeline-examples/load-from-file/pipeline.groovy">
This</a> shows how to "include" a file
instead of duplicating code.

   <pre>
node {
    // Load file from the current directory:
    def externalMethod = load("externalMethod.groovy")
    externalMethod.lookAtThis("Steve")

    def externalCall = load("externalCall.groovy")
    externalCall("Steve")
}
   </pre>


The
<a target="_blank" href="https://github.com/jenkinsci/pipeline-examples/blob/master/pipeline-examples/load-from-file/externalMethod.groovy">
externalMethod.groovy</a> file contains:

   <pre>
// Methods in this file will end up as object methods on the object that load returns.
def lookAtThis(String whoAreYou) {
    echo "Look at this, ${whoAreYou}! You loaded this from another file!"
}
   </pre>

The
<a target="_blank" href="https://github.com/jenkinsci/pipeline-examples/blob/master/pipeline-examples/load-from-file/externalCall.groovy">
externalCall.groovy</a> file contains:

   <pre>
def call(String whoAreYou) {
    echo "Now we're being called more magically, ${whoAreYou}, thanks to the call(...) method."
}
   </pre>


<a target="_blank" href="https://github.com/jenkinsci/pipeline-examples/blob/master/pipeline-examples/load-from-file/loadFromGithub.groovy">
This</a> shows how to "include" a file
instead of duplicating code.

   <pre>
#!groovy
&nbsp;
apply from: 'https://raw.githubusercontent.com/org-name/repo-name/master/subfolder/Jenkinsfile?token=${env.GITHUB_TOKEN}'
   </pre>

In this example, the "org-name", "repo-name" are replaced with actuals.

The "GITHUB_TOKEN" is a variable so its value is not exposed in code.



### Shell Git command #

<a target="_blank" href="https://github.com/jenkinsci/pipeline-examples/blob/master/pipeline-examples/gitcommit/gitcommit.groovy">
Here</a> is an example of doing a Bash shell call to
invok git commands on the Git client on Jenkins agent machines.
This sends STDOUT output to a file (in workspace) named "GIT_COMMIT":

   <pre>
sh('git rev-parse HEAD > GIT_COMMIT')
             git_commit=readFile('GIT_COMMIT')
short_commit=git_commit.take(6)
&nbsp;
sh('cd src && git rev-parse HEAD > GIT_COMMIT')
             git_commit=readFile('src/GIT_COMMIT')
short_commit=git_commit.take(6)
   </pre>

The <a target="_blank" href="https://git-scm.com/docs/git-rev-parse">
git rev-parse</a> command
is a internal Git utility to parse (pick out) revision/object names from a Git repo.
This is done after Git has done a checkout to establish the branch and specific commit
because the output is a SHA1 hash of the HEAD such as
"2b9a2833bc3c6bc8e7b7344e8178ce98e29ebe4b".

Such information was previously exposed to freestyle jobs by the Git plugin exposing environment variables.
But not to a Pipeline job. Thus the need for shell commands.

`git_commit.take(6)` extracts the first six characters to create a short SHA,
much like what Git does because a smaller number of characters are enough to uniquely identify a specific commit.


### Color wrapper Stage View #

<a target="_blank" href="https://github.com/jenkinsci/pipeline-examples/blob/master/pipeline-examples/push-git-repo/pushGitRepo.Groovy">
Here</a> an example of pushing changes to Git from inside Pipeline.

   <pre>
withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'MyID', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD']]) {
    sh("git tag -a some_tag -m 'Jenkins'")
    sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@<REPO> --tags')
}
   </pre>

This approach requires the repository to be setup in Jenkins to be authenticated to the repo (GitHub)
using username and password rather than other methods.

A <a target="_blank" href="https://issues.jenkins-ci.org/browse/JENKINS-28335">
open JIRA</a> requests getting the GitPublisher Jenkins functionality working with Pipeline.

TODO: For SSH private key authentication, try the sshagent step from the SSH Agent plugin.


### Git stash #

https://github.com/jenkinsci/pipeline-examples/blob/master/pipeline-examples/unstash-different-dir/unstashDifferentDir.groovy

uses the Git stash command
to move text among Jenkins nodes.



## IntelliJ IDE Auto-complete #

<a target="_blank" href="https://www.youtube.com/watch?v=emV60CcDVV0&t=46m01s&t=40m50s">
.gdsl file for IntelliJ IDE code completion</a> begins like this:

   <pre>
//The global script scope
def ctx = context(scope: scriptScope())
contributor(ctx) {
method(name: 'build', type: 'Object', params: [job:'java.lang.String'], doc: 'Build a job')
   </pre>


## Contributions #

Contributions are at GitHub repo:<br />
<a target="_blank" href="https://github.com/jenkins-infra/jenkins.io/">
https://github.com/jenkins-infra/jenkins.io</a>

* http://todobackend.com/


## Latest Info about Jenkins #

Follow <a target="_blank" href="https://twitter.com/jenkins_release/">
@jenkins_release</a>
This bot tweets Jenkins plugin releases.

Tweet to 
<a target="_blank" href="https://twitter.com/jenkinsci/">
@jenkinsci</a> about
<a target="_blank" href="https://twitter.com/#jenkins2/">
#Jenkins2</a>

CloudBees Verified account
@CloudBees

<a target="_blank" href="https://twitter.com/jenkinsconf/">
@jenkinsconf</a>
is the handle for Jenkins World, 
Sep 13-15 in Santa Clara, CA

@changelog
New podcast every Friday! Sign up for our weekly and nightly emails. Open source moves fast. Keep up.


## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
