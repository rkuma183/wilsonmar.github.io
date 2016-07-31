---
layout: post
title: "GitHub REST API"
excerpt: "You talkin to me?"
tags: [devops]
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

## Overview and History

cURL is used by many documents when describing REST API.

## Install

On a Mac, instead of downloading cURL from 
`http://curl.haxx.se/download.html`
and tr zxf the downloaded file, do this from a Terminal:

   <tt><strong>
   brew install curl
   </strong></tt>

## GitHub API

GitHub provides a well-known API that accepts a lot of traffic.

### Don't use http

Begin by:

   <tt><strong>
   curl api.github.com
   </strong></tt>

Connection fused:

   <tt><strong>
   http://api.github.com
   </strong></tt>

   <pre>
   curl: (7) Failed to connect to api.github.com port 80: Connection refused
   </pre>

### Use https for HATEOAS

   <tt><strong>
   https://api.github.com
   </strong></tt>

The following is returned so a client has a menu of follow-up
commands:

<pre>
{
  "current_user_url": "https://api.github.com/user",
  "current_user_authorizations_html_url": "https://github.com/settings/connections/applications{/client_id}",
  "authorizations_url": "https://api.github.com/authorizations",
  "code_search_url": "https://api.github.com/search/code?q={query}{&page,per_page,sort,order}",
  "emails_url": "https://api.github.com/user/emails",
  "emojis_url": "https://api.github.com/emojis",
  "events_url": "https://api.github.com/events",
  "feeds_url": "https://api.github.com/feeds",
  "followers_url": "https://api.github.com/user/followers",
  "following_url": "https://api.github.com/user/following{/target}",
  "gists_url": "https://api.github.com/gists{/gist_id}",
  "hub_url": "https://api.github.com/hub",
  "issue_search_url": "https://api.github.com/search/issues?q={query}{&page,per_page,sort,order}",
  "issues_url": "https://api.github.com/issues",
  "keys_url": "https://api.github.com/user/keys",
  "notifications_url": "https://api.github.com/notifications",
  "organization_repositories_url": "https://api.github.com/orgs/{org}/repos{?type,page,per_page,sort}",
  "organization_url": "https://api.github.com/orgs/{org}",
  "public_gists_url": "https://api.github.com/gists/public",
  "rate_limit_url": "https://api.github.com/rate_limit",
  "repository_url": "https://api.github.com/repos/{owner}/{repo}",
  "repository_search_url": "https://api.github.com/search/repositories?q={query}{&page,per_page,sort,order}",
  "current_user_repositories_url": "https://api.github.com/user/repos{?type,page,per_page,sort}",
  "starred_url": "https://api.github.com/user/starred{/owner}{/repo}",
  "starred_gists_url": "https://api.github.com/gists/starred",
  "team_url": "https://api.github.com/teams",
  "user_url": "https://api.github.com/users/{user}",
  "user_organizations_url": "https://api.github.com/user/orgs",
  "user_repositories_url": "https://api.github.com/users/{user}/repos{?type,page,per_page,sort}",
  "user_search_url": "https://api.github.com/search/users?q={query}{&page,per_page,sort,order}"
}
</pre>

## Follow-on commands on GitHub

Copy the user command:

   <tt><strong>
   curl http://api.github.com/user/wilsonmar
   </strong></tt>

   The response:

   <pre>
{
  "login": "wilsonmar",
  "id": 300046,
  "avatar_url": "https://avatars.githubusercontent.com/u/300046?v=3",
  "gravatar_id": "",
  "url": "https://api.github.com/users/wilsonmar",
  "html_url": "https://github.com/wilsonmar",
  "followers_url": "https://api.github.com/users/wilsonmar/followers",
  "following_url": "https://api.github.com/users/wilsonmar/following{/other_user}",
  "gists_url": "https://api.github.com/users/wilsonmar/gists{/gist_id}",
  "starred_url": "https://api.github.com/users/wilsonmar/starred{/owner}{/repo}",
  "subscriptions_url": "https://api.github.com/users/wilsonmar/subscriptions",
  "organizations_url": "https://api.github.com/users/wilsonmar/orgs",
  "repos_url": "https://api.github.com/users/wilsonmar/repos",
  "events_url": "https://api.github.com/users/wilsonmar/events{/privacy}",
  "received_events_url": "https://api.github.com/users/wilsonmar/received_events",
  "type": "User",
  "site_admin": false,
  "name": "Wilson Mar",
  "company": "JetBloom",
  "blog": "wilsonmar.github.io",
  "location": null,
  "email": "wilsonmar@gmail.com",
  "hireable": true,
  "bio": null,
  "public_repos": 103,
  "public_gists": 9,
  "followers": 24,
  "following": 48,
  "created_at": "2010-06-08T16:42:06Z",
  "updated_at": "2016-04-03T10:04:43Z"
}
   </pre>

## Resources

* http://amunsen.com (Mike Amunsen)

* http://groups.google.com/forum/#!forum/api-craft

* http://theapidesignbook.com 

* http://restfest.org
  annual conference in Greenville, SC late September
  records videos.



## More on DevOps #

This is one of a series on DevOps:

{% include devops_links.html %}
