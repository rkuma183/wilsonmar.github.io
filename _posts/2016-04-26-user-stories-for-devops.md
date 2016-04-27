---
layout: post
title: "DevOps User Stories"
excerpt: "The value we seek"
tags: [text to speech, JavaScript, programming]
image:
# feature: pic white winter bison standing among trees 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14860090/577d55be-0c64-11e6-8f93-6ded4a194ef1.jpg
  credit: Wallpaperswide.com
  creditlink: http://wallpaperswide.com/bison_in_winter-wallpapers.html
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />
{% include _toc.html %}

User stories have become the primary method used by agile teams for defining what value is provided by a system being built.

To facilitate <strong>estimation</strong>,
each user story defined below is a <strong>summary</strong> that fits on 3x5 inch index card,
following this prototype pattern:

      As a [role], I want to [do something] [with some frequency]
      so that I can/will [achieve some goal/objective].

The above is from the Mike Cohn book <a target="_blank" href="http://www.amazon.com/dp/0321205685?tag=tbrb-20&link_code=as3&creativeASIN=0321205685&creative=373489&camp=211189">
      User Stories Applied</a>.

## Personas

   * <a href="#Developer">Developer</a>
   * <a href="#Sysadmin">Sysadmin (ops)</a>
   * <a href="#Financial">Financial</a>

<a name="Developer"></a>

## Developer user stories

* As a developer, when <strong>starting</strong> with a new customer/project,
  I want to be able to be up and running (full working environment) in **less than 1 hour**.

* As a developer or end user I want to be able to request an environment and all supporting environments
   (with networking constructs) on demand or self serviced.

* As a developer, when I need to perform a very small (i.e. cosmetic) change,
   I want to be able to deploy it in less than 1 hour.

* As a developer, I want to understand the operational environment into which my application will be deployed.

* As a developer I need to understand **operational requirements** for my application (not just user requirements)
   (servers, IP addresses, sizes, apps, folders, files, etc.)

* As a developer, I need <strong>feedback</strong>
   from operations on the impacts of my application on the **operational environment**
   so I can improve its behavior over time.
   (memory usage, disk space, network bandwidth usage, etc.)

* As a developer, I want to be notified when <strong>application performance</strong>
   falls above or below applicable **thresholds**.

* As a developer, I want to be notified when applications **crash** or are consuming too many resources in a production environment.

* As a developer, I want to receive periodic reports on application usage so that I can see **trends over time**.

* As a developer,
I want to maintain build step configurations in <strong>only one location</strong>
to reduce the risk of configuration divergence.

<a name="Sysadmin"></a>

## System Admin user stories

* As a Sys Admin, I need to build relationships with the developers so I can have an open and positive relationship with them.

* As a Sys Admin, I want to have an **overview of the application architecture** so that
   I know which applications depend on which services.

* As a Sys Admin, I need to know what the developers are working on so I can provide operational requirements and prepare for application deployments.

* As a Sys Admin, I need to know what parts of the configuration **can be tuned**.

* As a Sys Admin, I need insight into the internal states and behavior of the applications that are deployed so I can operate and
   **tune** them most effectively.

* As a Sys Admin, I need to know / monitor the state of the application.

<a name="FinancialSponsor"></a>

## Financial sponsor stories

* As a Sponsor, I want to know the scope of various <strong>risks</strong> that exist
   (with and without DevOps),
   such as availability, latency, capacity, testability, etc.

* As a Sponsor, I want to know the extent risks have been mitigated.

* As a Sponsor, I want to know payback
   from the expense incurred and resulting risk reduction.


<a name="Fleshing"></a>

## Fleshing out stories

User stories are unique to each team due to different priorities.
So <strong>conversations</strong> about each is necessary,
so that
<strong>acceptance tests</strong>
define the details of each story.

Use cases usually contain multiple <strong>scenarios</strong>
(basic flow, alternate flows, exception flows).

User stories not fully flushed out or
too large to be completed in one iteration (or sprint)
are called "Epics".

The full list of user stories is the
**product backlog**.
The Product Owner holds planning sessions to
ensure that all relevant users stories
contain sufficient detail and prioritized
into releases or sprints.

<a name="QualityMetrics"></a>

## Quality metrics

To judge the "goodness" of each user story, teams often use criteria
with the acronym INVEST:

- [ ] **I**ndependent of dependencies other work (blocked waiting to get done).

- [ ] **N**egotiable rather than firm contracts about when they are implemented.
   (Negotiation of technical implementations can be facilitated by using the TeamCity Meta-Runner).

- [ ] **V**aluable to someone (end-user customers, business, developers, operations, etc.)

- [ ] **E**stimable in effort because a clear definition of what is in and out of scope makes for better estimates. 
   This includes build steps.
   This does not include limitless refactoring.

- [ ] **S**mall so they are not vague.

- [ ] **T**estable so what is considered "done" is clear to all.


## Basis for estimation

User stories are used as the basis for estimating, planning, and whether value was delivered to customers.

A key DevOps strategy is bringing small increments through into productive use,
which exposes process issues that need tuning.


## Resources

* http://brentmcconnell.com/2014/02/devops-user-stories/

* https://www.ibm.com/developerworks/community/blogs/c914709e-8097-4537-92ef-8982fc416138/entry/agile_in_practices_user_stories_explained2?lang=en

* https://www.thoughtworks.com/p2magazine/issue12/treat-devops-stories-like-user-stories/
