---
layout: post
title: "Scaled Agile"
excerpt: "Simple if you are an expert"
tags: [GitHub]
image:
# pic green easter island 2 hillside 1920x1080
  feature: https://cloud.githubusercontent.com/assets/300046/15217452/d8d04062-1818-11e6-9a57-215db66655d2.jpg
  credit: Audley Travel
  creditlink: https://www.youtube.com/watch?v=Sq8qZoEr0nw&t=1m12s
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This page contains my notes about working with 
the Scaled Agile Framework for enterprises (or SAFe), which are
<a href="#proven">proven</a> success patterns for implementing Lean-Agile software and 
systems development at enterprise scale,
in the <em>context</em> of using CA Agile Central.

The on-line tool was renamed from 
<strong>Rally</strong> after CA bought it in 2015. CA offers online classes at 
<a target="_blank" href="https://ondemand.agileu.com/">
https://ondemand.agileu.com</a>

   * https://rally1.rallydev.com/slm/doc/webservice
   * https://github.com/RallyTools/

Version 1.0 of SAFe was published in 2011<br />
[SAFe V3.0](#v3) was released July 28, 2014.
The framework's name was changed in January 2016 to<br />
"SAFe 4.0 for Lean Software and Systems Engineering" 


## V4 

<a target="_blank" href="http://www.scaledagileframework.com/">
<img alt="safe v4" src="https://cloud.githubusercontent.com/assets/300046/22977298/0b828744-f35c-11e6-9b7d-78e3ec3965aa.png" width="650">
</a>

PROTIP: To make sure I've clicked through all the positions on the above diagram at
<a target="_blank" href="http://www.scaledagileframework.com/">
http://www.scaledagileframework.com</a>,
I made this alpabetical list of links:

0. <a href="http://www.scaledagileframework.com/about/" target="_blank">About SAFe</a>
0. <a href="http://www.scaledagileframework.com/agile-release-train/" target="_blank">Agile Release Train (ART)</a>
 provides architectural, engineering, and User Experience guidance to help teams build systems that support current and upcoming user and business needs.
Each ART is a long-lived, self-organizing team of Agile Teams, a virtual organization (5 – 12 teams) that plans, commits, and executes together to a single Vision, Roadmap, and Program Backlog. 
0. <a href="http://www.scaledagileframework.com/agile-architecture/" target="_blank">Agile Architecture</a>
0. <a href="http://www.scaledagileframework.com/agile-teams/" target="_blank">Agile Team</a>
0. <a href="http://www.scaledagileframework.com/architectural-runway" target="_blank">Architectural Runway</a>
0. <a href="http://www.scaledagileframework.com/budgets/" target="_blank">Budgets</a>
0. <a href="http://www.scaledagileframework.com/built-In-quality/" target="_blank">Built-In Quality</a>
0. <a href="http://www.scaledagileframework.com/business-owners/" target="_blank">Business Owners</a>

0. <a href="http://www.scaledagileframework.com/features-and-capabilities/" target="_blank">Capabilities</a>
0. <a href="http://www.scaledagileframework.com/capex-and-opex/" target="_blank">CapEx and OpEx</a>
0. <a href="http://www.scaledagileframework.com/communities-of-practice/" target="_blank">Communities of Practice</a>
0. <a href="http://www.scaledagileframework.com/customer/" target="_blank">Customer</a>

0. <a href="http://www.scaledagileframework.com/devops/" target="_blank">DevOps</a>
0. <a href="http://www.scaledagileframework.com/develop-on-cadence-release-any-time/" target="_blank">Develop on Cadence</a>
0. <a href="http://www.scaledagileframework.com/economic-framework/" target="_blank">Economic Framework</a>

0. <a href="http://www.scaledagileframework.com/enablers/" target="_blank">Enablers</a> (spikes)
0. <a href="http://www.scaledagileframework.com/enablers/" target="_blank">Enabler Capability</a>
0. <a href="http://www.scaledagileframework.com/enablers/" target="_blank">Enabler Epic</a>
0. <a href="http://www.scaledagileframework.com/enablers/" target="_blank">Enabler Feature</a>

0. <a href="http://www.scaledagileframework.com/enterprise/" target="_blank">Enterprise</a>
0. <a href="http://www.scaledagileframework.com/enterprise-architect/" target="_blank">Enterprise Architect</a>
0. <a href="http://www.scaledagileframework.com/epic-owner/" target="_blank">Epic Owners</a>

0. <a href="http://www.scaledagileframework.com/features-and-capabilities/" target="_blank">Feature</a>

0. <a href="http://www.scaledagileframework.com/inspect-and-adapt/" target="_blank">Inspect and Adapt</a> (Problem Statement, Fishbone Root Cause Diagram, Pareto Chart)
0. <a href="http://www.scaledagileframework.com/innovation-and-planning-iteration/" target="_blank">Innovation and Planning Iteration</a>
0. <a href="http://www.scaledagileframework.com/implementing/" target="_blank">Implementing</a>

0. <a href="http://www.scaledagileframework.com/iterations/" target="_blank">Iterations</a>
0. <a href="http://www.scaledagileframework.com/iteration-execution/" target="_blank">Iteration Execution</a>
0. <a href="http://www.scaledagileframework.com/iteration-goals/" target="_blank">Iteration Goals</a>
0. <a href="http://www.scaledagileframework.com/iteration-planning/" target="_blank">Iteration Planning</a>
0. <a href="http://www.scaledagileframework.com/iteration-retrospective/" target="_blank">Iteration Retrospective</a>

0. <a href="http://www.scaledagileframework.com/innovation-and-planning-iteration/" target="_blank">Innovation and Planning Iteration</a>
0. <a href="http://www.scaledagileframework.com/lean-agile-mindset/" target="_blank">Lean-Agile Mindset</a>
0. <a href="http://www.scaledagileframework.com/lean-agile-leaders/" target="_blank">Lean-Agile Leaders</a>

0. <a href="http://www.scaledagileframework.com/metrics/" target="_blank" id="metrics">Metrics</a>
0. <a href="http://www.scaledagileframework.com/milestones/" target="_blank">Milestones</a>
0. <a href="http://www.scaledagileframework.com/model-based-systems-engineering/" target="_blank">Model-Based Systems Engineering (MBSE)</a>

0. <a href="http://www.scaledagileframework.com/nonfunctional-requirements/" target="_blank">Non-Functional Requirements (NFRs)</a>

0. <a href="http://www.scaledagileframework.com/pi-objectives/" target="_blank">PI Objectives</a>
0. <a href="http://www.scaledagileframework.com/pi-planning/" target="_blank">PI Planning</a>

0. <a href="http://www.scaledagileframework.com/product-owner/" target="_blank">Product Owner (PO)</a>
0. <a href="http://www.scaledagileframework.com/product--and-solution-management/" target="_blank">Product Management</a>

0. <a href="http://www.scaledagileframework.com/epic/" target="_blank">Portfolio Business Epic</a>
0. <a href="http://www.scaledagileframework.com/portfolio-backlog/" target="_blank">Portfolio Backlog</a>
0. <a href="http://www.scaledagileframework.com/portfolio-kanban/" target="_blank">Portfolio Kanban</a>
0. <a href="http://www.scaledagileframework.com/portfolio-level/" target="_blank">Portfolio Level</a>

0. <a href="http://www.scaledagileframework.com/pre-and-post-pi-planning/" target="_blank">Pre and Post PI Planning</a>
0. <a href="http://www.scaledagileframework.com/product--and-solution-management/" target="_blank">Product Management (PM)</a>

0. <a href="http://www.scaledagileframework.com/program-and-value-stream-backlogs/" target="_blank">Program Backlog</a>
0. <a href="http://www.scaledagileframework.com/epic/" target="_blank">Program Epics</a>
0. <a href="http://www.scaledagileframework.com/program-and-value-stream-kanbans/" target="_blank">Program Kanban</a>
0. <a href="http://www.scaledagileframework.com/program-increment/" target="_blank">Program Increment (PI)</a>
0. <a href="http://www.scaledagileframework.com/program-level/" target="_blank">Program Level</a>
0. <a href="http://www.scaledagileframework.com/pi-objectives/" target="_blank">Program PI Objectives</a>
0. <a href="program-portfolio-management/" target="_blank">Program Portfolio Management</a>

0. <a href="http://www.scaledagileframework.com/refactoring/">Refactoring</a>
0. <a href="http://www.scaledagileframework.com/release/" target="_blank">Release</a>
0. <a href="http://www.scaledagileframework.com/develop-on-cadence-release-any-time/" target="_blank">Release Any Time</a>
0. <a href="http://www.scaledagileframework.com/release-train-engineer-and-value-stream-engineer/" target="_blank">Release Train Engineer</a>
0. <a href="http://www.scaledagileframework.com/release/" target="_blank">Release</a>
0. <a href="http://www.scaledagileframework.com/release-management/" target="_blank">Release Management</a>
0. <a href="http://www.scaledagileframework.com/roadmap/" target="_blank">Roadmap</a>

0. <a href="http://www.scaledagileframework.com/safe-core-values/" target="_blank">SAFe Core Values</a>
0. <a href="http://www.scaledagileframework.com/safe-lean-agile-principles/" target="_blank">SAFe Lean-Agile Principles</a>
0. <a href="http://www.scaledagileframework.com/scrum-master/" target="_blank">Scrum Master</a>
0. <a href="http://www.scaledagileframework.com/scrumxp/" target="_blank">ScrumXP</a>
0. <a href="http://www.scaledagileframework.com/shared-services/" target="_blank">Shared Services</a>

0. <a href="http://www.scaledagileframework.com/solution/" target="_blank">Solution</a>
0. <a href="http://www.scaledagileframework.com/system-and-solution-architect-engineering/" target="_blank">Solution Architect/Engineering</a>
0. <a href="http://www.scaledagileframework.com/solution-context/" target="_blank">Solution Context</a>
0. <a href="http://www.scaledagileframework.com/solution-demo/" target="_blank">Solution Demo</a>
0. <a href="http://www.scaledagileframework.com/solution-intent/" target="_blank">Solution Intent</a>
0. <a href="http://www.scaledagileframework.com/product-and-solution-management/" target="_blank">Solution Management</a>

0. <a href="http://www.scaledagileframework.com/spikes/">Spikes</a>
0. <a href="http://www.scaledagileframework.com/strategic-themes/" target="_blank">Strategic Themes</a>
0. <a href="http://www.scaledagileframework.com/story/" target="_blank">Stories</a>

0. <a href="http://www.scaledagileframework.com/supplier/" target="_blank">Supplier</a>
0. <a href="http://www.scaledagileframework.com/system-and-solution-architect-engineering/" target="_blank">System Architect/Engineering</a>
0. <a href="http://www.scaledagileframework.com/system-demo/" target="_blank">System Demo</a>
0. <a href="http://www.scaledagileframework.com/system-team/" target="_blank">System Team</a>

0. <a href="http://www.scaledagileframework.com/team-backlog/" target="_blank">Team Backlog</a>
0. <a href="http://www.scaledagileframework.com/team-demo/" target="_blank">Team Demo</a>
0. <a href="http://www.scaledagileframework.com/team-kanban/" target="_blank">Team Kanban</a>
0. <a href="http://www.scaledagileframework.com/team-level/" target="_blank">Team Level</a>
0. <a href="http://www.scaledagileframework.com/pi-objectives/" target="_blank">Team PI Objectives</a>

0. <a href="http://www.scaledagileframework.com/user-experience/" target="_blank">User Experience (UX)</a>

0. <a href="http://www.scaledagileframework.com/value-streams/" target="_blank">Value Streams</a>
0. <a href="http://www.scaledagileframework.com/program-and-value-stream-backlogs/" target="_blank">Value Stream Backlog</a>
0. <a href="http://www.scaledagileframework.com/value-stream-coordination/" target="_blank">Value Stream Coordination</a>
0. <a href="http://www.scaledagileframework.com/release-train-engineer-and-value-stream-engineer/" target="_blank">Value Stream Engineer</a>
0. <a href="http://www.scaledagileframework.com/epic/" target="_blank">Value Stream Epics</a>
0. <a href="http://www.scaledagileframework.com/program-and-value-stream-kanbans/" target="_blank">Value Stream Kanban</a>
0. <a href="http://www.scaledagileframework.com/value-stream-level/" target="_blank">Value Stream Level</a>
0. <a href="http://www.scaledagileframework.com/pi-objectives/" target="_blank">Value Stream PI Objectives</a>

0. <a href="http://www.scaledagileframework.com/vision/" target="_blank">Vision</a>
0. <a href="http://www.scaledagileframework.com/wsjf/" target="_blank">Weighted Shortest Job First (WSJF)</a>

   A quote is offered in each abstract above.

   The Rally / CA Agile Central tool adds these concepts:

0. A <strong>defect suite</strong> groups defects together
0. Work items refer to Tasks
0. Work Product

0. Rank among items in lists
0. Expedite flag
0. Test Sets
0. Test Case (TC)
0. Changesets
0. Tags
0. Dependencies of Task Predecessors and Successors 
0. Flows (CA Flowdock)

   > There are so many concepts in the framework becuase it incorporates concepts from many others
   (Deming, Ishikawa, Agile, Scrum, XP, Lean, Kanban, etc.).

   ### Projects in CA

   PROTIP: The word "project" is absent from the SAFEe vocabulary.
   In many ways, the Project Management Institute's frameworks lost out because of its 
   <strong>temporary</strong> focus (the definition of "project")
   vs. SAFEe's implicit assumption of continuing permanance.

0. Each "Workspace" holds projects for each organization in CA Agile Central. 
0. QUESTION: Project in CA is "Capability" in SAFe, such as "Shopping website" and "Shopping team".

   ### Change Management in CA
   
   The Rally / CA Agile Central tool adds change management fields:

0. Affected Customers
0. Affects Doc
0. Attachments
0. Change Author
0. Closed Date
0. Creation Date
0. In Progress Date
0. Watches for specific work items
0. Requests


   > PROTIP: <strong>Standardize abbreviations</strong> to avoid confusion while making more content in item descriptions.

   PROTIP: <a target="_blank" href="https://quizlet.com/189009605/flashcards/">
   Memorize the acronyms (in parentheses) using my Quizlet of flash cards</a>. 
   Click on the term's text for it to be pronounced out loud.
   Click above a term to see its definition (and visa versa).
   Click the star to mark ones you want to see again.
   Click the right button for the next flash card.


### v3

![safe 3](https://cloud.githubusercontent.com/assets/300046/22976730/0599916c-f35a-11e6-9c21-24efee6ba9af.jpg)

<a target="_blank" href="http://www.scaledagileframework.com/whats-new-in-safe-40/">
Changes from v3 to v4</a>
incorporates "Lean" principles and terms.



### Competitors

A competitor to SAFe is <em>Daikibo</em> ("large scale" in Japanese),
trademarked by Cognizant consultants.


QUIZ: Does the Product Owner size backlog items along with delivery team members?<br />
No.

   > I think part of the reason for the success of the SAFe framework is that it directs
   the work of many roles in the organization, not just to
   only developers or only quality assurance people or only project managers, etc.


<a name="proven"></a>

## Miraculous results?

Several <a href="https://www.ScaledAgileFramework.com/case-studies">
case studies</a> and the
<a href="http://www.scaledagileframework.com/about/">
About page</a> claim significant improvements:

   * 20 – 50% increase in productivity
   * 50%+ increases in quality
   * 30 – 75% faster time to market
   * Measurable increases in employee engagement and job satisfaction

Introductions to the framework by Dean Leffingwell, in several media:

   * <a target="_blank" href="https://www.youtube.com/watch?v=ANE2_79m9ZE">
   Video in 8 minutes SAFe® Foundations 4.0</a>
   * <a target="_blank" href="https://www.youtube.com/channel/UC-n4Mb-Bu5Pgl0z5L1jyhSQ"> 
   Video in 22:52 minutes</a> by Dean Leffingwell
   * <a target="_blank" href="http://www.scaledagileframework.com/videos-and-presentations">
   PowerPoint of 33 slides with talk script in notes</a>
   * <a target="_blank" href="http://www.slideshare.net/ScaledAgile/safe-foundations-40">
   PDF at SlideShare.com</a>
   * Book: Agile Software Requirements: Lean Requirements Practices for Teams, Programs, and the Enterprise. Addison-Wesley, 2011

<a target="_blank" href="http://www.scaledagileframework.com/guidance/">
Guidance Articles</a>


## Cadence (timing)

Agile Teams typically consist of <strong>5-9 people</strong> 
who work in Program Increments (PIs) of <strong>10 weeks</strong> consisting of
5 <strong>two-week</strong> sprints,
using XP (Extreme Programming) methods.

The mid-range planning timebox contains releases of 3-months each.

"Develop on Cadence, Release Any Time."

<strong>Deployments</strong> bring Release finished deliverables to customers.

<a target="_blank" href="https://ondemand.agileu.com/node/5551/take">
CA's tutorial</a> (at [0:23]) recommends estimating <strong>6 hours</strong>
per regular day from each team member.


## Status

CA's <strong>Kanban Board</strong> has these default columns of task <strong>Kanban states</strong>:

   0. Backlog
   0. On Deck
   0. Ready to Pull
   0. Building
   0. Accepted
   0. Released

In CA's Personal Work <strong>Burndown Chart</strong>, blue columns of ToDo's vs. green columns of Accepted items <<strong>remaining</strong> at the end of each day:<br />
![agile-central burndown chart 519x428](https://cloud.githubusercontent.com/assets/300046/23099676/17f74c32-f62a-11e6-8e53-1cb489361e0b.jpg)

The <strong>Burn-up</strong> Chart CA defines as "work delivered (completed) during the release -- to proactively anticipate whether the release scope will be delivered". The black line shows total work planned.

There are also burn-up and burndown charts by Story, Iteration Scope, and Release.

BLAH: Do new items added during each day get highlighted in the Chart? Not in CA.

CA's Defect Repair Work board (by Team) has these statuses:

   0. Submitted
   0. Open
   0. Fixed
   0. Closed

ANALOGY: "Points" within the context of one Agile team or project are like airline points.
Points for one airline don't have the same value with another airline.

CA's <strong>Velocity Chart</strong> displays the baseline estimate of how many points planned for
each iteration within a release:

<img width="539" alt="agile-central velocity report 1078x496" src="https://cloud.githubusercontent.com/assets/300046/23103624/34a98b3c-f67b-11e6-89a6-b066177a4f54.png">

CA does not project into the future.

QUESTION: Why is "Not Accepted" included in an iteration bar?


### Levels Backlog 

PROTIP: The hierarchy of levels (Team, Program, and Portfolio):

0. <a href="http://www.scaledagileframework.com/portfolio-backlog/" target="_blank">Portfolio Backlog</a>
of <a href="http://www.scaledagileframework.com/epic/" target="_blank">Business and Enabler Epics</a> 
in the Portfolio Kanban addressing Strategic Themes 

0. <a href="http://www.scaledagileframework.com/program-and-value-stream-backlogs/" target="_blank">Value Stream Backlog</a>

0. <a href="http://www.scaledagileframework.com/program-and-value-stream-backlogs/" target="_blank">Program Backlog</a> of User Stories?

0. <a href="http://www.scaledagileframework.com/team-backlog/" target="_blank">Team Backlog</a>
contain tasks.

0. Defects

QUIZ: Is there a Product Backlog with User Stories?<br />
No.

QUIZ: Are Tasks a backlog item?<br />
No.

The top level labeled "Economic" for organizations over a 100 people.

Blocked status shows up in CA Agile Central Pie Charts 
but not in the Cumulative chart.

![agile-central cumulative chart 650x603](https://cloud.githubusercontent.com/assets/300046/23099658/76bed38a-f629-11e6-966d-fd50ba051f28.jpg)


## Tracking Hierarchies

The different hierarchies can be confusing.

CA's Track menu, where many use within CA Agile Central, has a hierachy of status by
Iteration, Team, Release, and Work Product:

![agile-central delivery list track menu 154x166](https://cloud.githubusercontent.com/assets/300046/23097998/74243062-f600-11e6-89d0-6b2701175d22.jpg)

CA's Iteration status board has these statuses:

   0. Idea
   0. Defined
   0. In-Progress
   0. Completed
   0. Accepted

However, where does one go in CA Agile Central to see the <strong>Roadmap</strong> status
illustrated by this conceptual Venn diagram from a CA tutorial,
which shows each Day within a Sprint within a Release within a Product Roadmap within a Product Vision:

![agile hierarchy ca-rally 650x389](https://cloud.githubusercontent.com/assets/300046/23099620/d0b3791e-f628-11e6-822b-bf9cc0a0fb08.jpg)

Alternately, this conceptual hierarchy shows Tasks within one-week Stories within multi-week Stories (Epics) 
under a Portfolio <strong>feature</strong> under
a Portfolio <strong>initiative</strong>:

![agile hierarchy ca-rally 650x461](https://cloud.githubusercontent.com/assets/300046/23098041/0f42e912-f601-11e6-841b-f4294349fa83.jpg)

CA's Notification Rules can be to these <strong>Work Product Types</strong>:

<img width="258" alt="agile-center notification select 516x234" src="https://cloud.githubusercontent.com/assets/300046/23098162/f85a9926-f604-11e6-89f7-9fef8f78b2a6.png">


### Quality metrics

Clicking "Quality" in CA's menu reveals the <strong>Test Plan</strong>.

> I think CA's menu should be "Testing" instead of "Quality" because Quality
encompasses more than just testing.

From Mark Richards https://t.co/Jrn218N0D5

![safe v4 quality metrics](https://cloud.githubusercontent.com/assets/300046/22980017/34363ac8-f366-11e6-9479-2f62b6def000.jpg)


## Principals

http://www.scaledagileframework.com/safe-lean-agile-principles/

0. Take an economic view

   Measure EMV.
   incremental value delivery.
   shortest time.

0. Apply systems thinking (complex interactions)

   It's a systems problem, not a people problem.

0. Assume variability; preserve options (cone of uncertainty)

0. Build incrementally with fast, integrated learning cycles
0. Base milestones on objective evaluation of working systems
0. Visualize and limit WIP, reduce batch sizes, and manage queue lengths
0. Apply cadence (timing), synchronize with cross-domain planning
0. Unlock the intrinsic motivation of knowledge workers
0. Decentralize decision-making


## Planning

http://cloud.huit.harvard.edu/files/hcs/files/iam_and_safe.pdf

v4 inserted a Value Train for large enterprises.

Definition of Done (DoD)


## Teams

In SAFe, a Systems Team is a specialised team responsible for maintaining the development 
<strong>environment</strong> used by Agile development Teams and 
for <strong> end-to-end solutions testing</strong>.

PROTIP: SAFe does not address directly how people get bonuses and raises,
which can have major impact.

Dashboards for different roles are reached in CA Agile Central's home icon:<br />
![agile-central dashboards 400x245](https://cloud.githubusercontent.com/assets/300046/23099761/07763542-f62c-11e6-951a-ad25c8a9b2c0.jpg)



## Other Information

<a target="_blank" href="https://en.wikipedia.org/wiki/Scaled_Agile_Framework">
https://en.wikipedia.org/wiki/Scaled_Agile_Framework</a>


   * https://www.youtube.com/watch?v=RLBReQXQcvY in 8 slides
   * https://www.youtube.com/watch?v=RXzurBazN-I in 7 minutes
   * https://www.youtube.com/watch?v=-744CZ3V1E0
   * https://www.youtube.com/watch?v=TolNkqyvieE


https://www.youtube.com/watch?v=V71bGAxGAd8

