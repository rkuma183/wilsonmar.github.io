---
layout: post
title: "Evangelist Job Description"
excerpt: "Just apply. They can always just ignore you."
modified:
tags: []
image:
# feature: pic black white must be willing to relocate to sf 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14621966/ee85d7a2-0583-11e6-923c-a58327524273.jpg
  credit: 
  creditlink: 
comments: true
company: XYZ
key_tech: MongoDB
role: Developer Advocate
passion: marketing and evangelism 
job_type: developer
targets: developers
languages: Go, NodeJs, Python, and Ruby
platforms: Amazon (AWS), Azure, and Google
tools: Git, Maven, Gradle, Groovy, Chef, Kubernetes, etc.
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

Yes, this is an example of both a job description for a Developer Evangelist. 

But this is also an example of how variables can be used in the markup text residing in GitHub. The author of this page added <tt>targets: developers</tt> in the header at the top of the authoring file which is not presented to readers. Within the body of the article's text is inserted <tt>{{ page.targets }}</tt>. When Jekyll reads this markup to generates HTML, it substitutes the variable with the data value from the header.

<pre>
We are looking for a {{ page.role }} with a passion for {{ page.passion }} to join us in attracting and maintaining the interest of {{ page.targets }} of {{ page.languages }} using {{ page.tools }}.
</pre>

Values are obtained at the top of the page containing:

<pre>
company: XYZ
key_tech: MongoDB
role: Developer Advocate
passion: marketing and evangelism 
job_type: developer
targets: developers
languages: Go, NodeJs, Python, and Ruby
platforms: Amazon (AWS), Azure, and Google
tools: Git, Maven, Gradle, Groovy, Chef, Kubernetes, etc.
---
   </pre>

The result:

## The role

We are looking for a {{ page.role }} with a passion for {{ page.passion }} who will join us in attracting and maintaining the interest of {{ page.targets }} of {{ page.languages }} using {{ page.tools }}.

You know the concerns, interests, demographics, and cultures of {{ page.targets }},
and you have creative ideas around how we can connect deeply and effectively with them.

As a key member of our small, rapidly growing marketing team, 
you will <strong>be the face and voice</strong> of {{ page.company }} to {{ page.targets }}. 

You will be the go to person for telling our story to the market - 
on stage at events, during industry-wide webcasts, and in conference rooms at the largest companies. 

As both a product and customer expert, you will also be the sales force's key marketing contact to help develop effective account specific go-to-market strategies. 

The successful candidate is an engaging communicator, passionate about technology, 
and loves interacting with clients and prospects. 

We’re seeking not only a great presenter but an excellent listener, who is curious about the needs and concerns of our prospects and customers.

You'll be exposed to the major cloud platforms, as we currently run on 
{{ page.platforms }}, and have integrated with all of the major Platform-as-a-Service providers (Heroku et al.).

* Up to 70% travel is required of this role.


## Responsibilities

Your key responsibilities toward building a following of passionate <strong>{{ page.targets }}</strong> 
include the following during a day in the life:

* Identify strategies and opportunities to bring content and perspective to both <strong>{{ page.targets }}</strong> and executives who manage them.

* Plan content and campaigns (with <strong>partners</strong>) that leverage time and expense to achieve the most returns.

* Identify <strong>trends data</strong> in order to position {{ page.company }} as a thought leader, both online and offline.
 
* Seek out and write up <strong>use cases</strong> (solution briefs) to demonstrate best practices.

* Analyze <strong>new features and capabilities</strong> to present them as useful and compelling.

* <strong>Publish blog posts and tutorials</strong> and <strong>speak at meetups and conferences</strong> to highlight best practices and offer a fresh perspective.

* Champion users’ needs internally by providing invaluable feedback to the sales, product, and engineering teams.

* Craft attention-getting yet informative <strong>posts in social networks</strong> and <strong>create blog and video content</strong> to attract and grow interest.

* Use and create <strong>open source projects</strong> so {{ page.targets }} can adopt the company's offerings quicker and more confidently.

## The ideal candidate 

* Has done a similar job before in this industry, with sharable examples of previous speaking opportunities, conference speaker feedback, and/or recorded webcast delivery. 

* Has built a visible online presence via social media, blogs, forums, GitHub repos and/or community involvement.

* Experience as a current or former {{ page.job_type }} with one or more apps published in an app marketplace 
   (Google Play, Apple Store, Windows Store, Office Store, iTunes, etc.)

* Ability to <strong>code demos</strong> in {{ page.languages }}.

* Familiarity using tools ({{ page.tools }}).

* Can confidently <strong>moderate discussions</strong> among technical and non-technical groups.

* Possess one or more {{ page.job_type }} certifications.

* A keen interest in trying their hand at the business side, with potential aspirations for marketing, business development, sales, or product leadership roles in the future.


## Bonus points

You get bonus points if:

 * You are a tinkerer! Show us any personal projects you’ve worked on, GitHub projects you’ve forked, etc.
 
 * You are naturally inclined to provide unbelievable customer service and enjoy teaching and helping others.

 * You are in love with {{ page.key_tech }}.

 * Measurable competency with application servers, scripting, and network infrastructure

 * Experience in a startup and growth-stage environments

 * Developed a "maturity model".
 

## What we offer

* A unique opportunity to play a critical crossover technical/ business role 
at a high-growth company in a rapidly emerging open source infrastructure category.

* In five years, the chance to say you “got in early” into one of the pioneers!
* Equity

* Matching 401(K) plans 
* 100% employer paid premiums for medical, dental, life insurance, disability
* Flexible vacation - take time off when you need it

* Free lunches, dinners, and fully stocked snacks & beverages
* Commuter benefits for public transit and bicycle commuters
* Shower facilities in the building
* Wellness initiatives (incentive programs, fitness classes)
* Free gym membership with shuttle service, onsite cardio gym, company organized and sponsored sports and leagues.
* Free parking (We pay for parking tickets in San Francisco’s Mission District, too.)

* Lounge areas with ping pong, foosball, pinball, and arcade games
* Monthly happy hours
* Company ski trips, boat parties, BBQs, happy hours, game nights ... just to name a few!
* Volunteer opportunities and extra PTO for community work.

* Casual dress code

* MacBook (fully loaded)
* Employee development opportunities 

## Summary

BS in STEM degree, developer experience, ability to code demos, excellent written and presentations.


## Footnote

This page was created as an example using page-specific Liquid variables in Jekyll Markdown front-matter.

## More on Technical Evanglism #

This post is one of a (planned) series:

{% include evangelist_links.html %}

