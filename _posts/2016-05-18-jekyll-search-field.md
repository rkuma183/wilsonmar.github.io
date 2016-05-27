---
layout: post
title: "Text Search within Jekyll websites"
excerpt: "Where did you write that?"
tags: [Jekyll, ElasticSearch, Search]
image:
# feature: pic blue lake searching 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14621985/1cdb6086-0584-11e6-9570-5cedb9f2385f.jpg
  credit: Braintree Books
  creditlink: http://www.braintreebooks.com/search.htm
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This tutorial is intended for "newbies", which also ensures completeness for the advanced.

This is a step-by-step tutorial on to setup your own free static website that provides a search box:

0. <a href="#repo"> Create a GitHub repository</a>
0. <a href="#Jekyll"> Add a Jekyll template</a>
0. <a href="#Ruby"> Install Ruby and Build gems</a>
0. <a href="#RunJekyll"> Run Jekyll locally</a>

0. <a href="#GitClient"> Install Git client</a>
0. <a href="#ConfigRemote"> Configure remote repo</a>

0. <a href="#SearchField"> Add Search Field</a>
0. <a href="#SearchCSS"> Add Search Field CSS</a>
0. <a href="#SearchField"> Add Search JavaScript</a>

0. <a href="#elasticsearch"> Setup Search API</a>
0. <a href="#libraries"> Code library links</a>

0. <a href="#config.yml"> In config.yml add gem in gem file</a
0. <a href="#gemfile"> In gem file add gem searchyll</a>

0. <a href="#searchyll"> Add searchyll as a dependency</a>
0. <a href="#article"> Add &LT;article&GT; tag in _layout/post.html</a>
0. To display, add a Javascript framework for client-side interaction via HTTP. I’m using React and Searchkit.

0. <a href="#Index">Index</a>
0. <a href="#Query"> Query</a>

<a name="repo"></a>

## Create a Repository #

http://github.com/

There are several ways GitHub generates websites.

   * account.github.io
   * account.github.io/project
   * Wiki within project

<a name="Jekyll"></a>

## Add a Jekyll template #

GitHub needs to have a distinctive structure of folders, files, and coding
so that GitHub can properly generate HTML from the files.

A template comes with all the CSS and JavaScript that GitHub recognizes.

If the template is on GitHub, click the Fork button.

<a name="GitClient"></a>

## Install Git Client #

There are several choices.


<a name="ConfigRemote"></a> 

## Configure remote repo #

On your local machine, create a folder.

If your template is in GitHub:

   git clone 

Alternately, if you purchased a template, copy it into the folder just created.

<a name="Ruby"></a>

## Install Ruby and Build gems #

0. In a Terminal window, fetch gems specified in the Gemfile:

   <tt><strong>
   bundle
   </strong></tt>

   The Gemfile.lock file generated defines the version being used of each gem.

<a name="RunJekyll"></a>

## Run Jekyll Locally #

Ensure you have a base version that works, run:

   <tt><strong>
   bundle exec jekyll serve --config _config.yml,_config-dev.yml
   </strong></tt>

BTW, Jekyll command options are detailed at:

   * <a target="_blank" href="https://jekyllrb.com/docs/configuration/">
   https://jekyllrb.com/docs/configuration/</a>


<a name="ArchiveRemote"></a> 

## Archive remote repo #

Archive in the cloud a base version to fall back to in case edits cause issues.

   <tt><strong>
   git add .<br />
   git commit
   </strong></tt>

See if there is a remote local defined:

   <tt><strong>
   git remote -v
   </strong></tt>

If there isn't, define one (replacing the URL with yours):
  
   <tt><strong>
   git remote add remote https://github.com/jetbloom/jetbloom.github.io
   </strong></tt>

Verify with another `git remote -v`.

Push commits to GitHub to verify the site running before customization.

   <tt><strong>
   git push
   </strong></tt>


<hr />

<a name="SearchField"></a>

## Add Search Field #

### Field on Menu #

Most typically want to add a search field among the menu bar at the top of each page.

In a Jekyll site, that would be <strong>head.html</strong>.

In the MinimalMistakes theme from March 2016, the page.html folder contains:

   \% include _navigation.html %}

   This file I found within the _includes folder.

I couldn't insert a field without having it wrap to the next line.

### Separate menu item #

So I added a "SEARCH" menu item in the template's _data/navigation.yml file, 
then created a folder at the root with the same name I specified: search.
Insid that folder I created a default.html file.

### Search providers #

The search index server can be setup several ways:

   * <a href="#BingSearch">Bing search form</a>
   * <a href="#GoogleSearch">Google Search form</a>
   * Yahoo

Each of these involve <a href="#SearchCSS"> changes to CSS</a> as well to suit your design tastes.


<a name="SearchCSS"></a>

### Search Field CSS Formatting #

It seems there are as many ways to store CSS in Jekyll sites as there are Jekyll sites.

Jekyll stores files it generates in the <strong>_sites</strong> folder. 
That's what site vistors download and display.

The Amplify Jekyll template has this in the <strong>head.html</strong> within its _includes folder:

   {% highlight text %}{% raw %}
  <style amp-custom>
  {% capture include_to_scssify %}
    {% include styles.scss %}
  {% endcapture %}
  {{ include_to_scssify | scssify }}
  </style>{% endraw %}{% endhighlight %}

   Many Jekyll templates use SASS, 
   which expands style codes in sass files to generate CSS used in websites.


   Alternately, the Minimal Jekyll template's <strong>_head.html</strong> file's _includes folder contains this line:

   {% highlight html %}
   <link rel="stylesheet" href="{{ site.url }}/assets/css/main.css">{% endhighlight %}

   NOTE: Variables beginning with `site.` is defined to the right of "url:" within file _config.yml for the site.

   PROTIP: The <strong>main.css</strong> file is the file name generated by SASS.

0. Open the styles.scss in a text editor.

   The bourbon/bourbon and syntax-highlighting imported at the top of the file are popular mixins.
   They were downloaded.

0. Copy and paste the custom css below onto the bottom of the file:

   {% highlight css %}
   .searchbox {
     float:right;
     width: 50%;
     padding: 3px;
     border:0;
     outline: none;
     vertical-align: bottom;
   }
   #searchinput {
     width:100%;
   }{% endhighlight %}

3\. Save the changes.

4\. Adjust as you like after adding HTML that makes use of these definitions.

   For example,
   the `float:right` positions the field at the far right, where most websites have a search box.
   If there is something already there, you will have to change this CSS.
   
   * <a target="_blank" href="https://www.toptal.com/css/sass-mixins-keep-your-stylesheets-dry">
   More about SASS mixins</a>

   * A popular SASS library is 
   bourbon

<a name="BingSearch"></a>

### Bing Search Form #

0. Copy the HTML below and paste it in the file.

{% highlight html %}{% raw %}
<div class="searchbox">
  <form method="get" action="http://www.bing.com/search">
    <input id="searchinput" type="text" placeholder="Search..." name="q" value="" /> 
    <input type="hidden" name="q1" value="site:{{site.production_url}}" />
  </form>
</div>
{% endraw %}{% endhighlight %}

   NOTE: The `site.production_url` variable is defined within file _config.yml.

   ```
   url                      : https://wilsonmar.github.io
   productoin_url           : https://wilsonmar.github.io
   host                     :         wilsonmar.github.io
   ```

2\. Add these lines (but with your url and host name) if they are not already defined.

3\. PROTIP: Use an appropriate hero graphic, if your page design uses one.

4\. Save the change and adjust the CSS.

<a name="GoogleSearch"></a>

### Google Search Form #

This goes in head.html in the menu bar so it appears on every page:

{% highlight html %}
<form onSubmit="google_search()">
<input type="text" name="q" id="q" value="" />
<input type="submit" value="search" onClick="return google_search()" />
</form>{% endhighlight %}

The use of an onClick function means JavaScript needs to be defined.

This can be put before the &LT;body> section.

{% highlight html %}
<script type="text/javascript">
function google_search(){
   window.location = "http://www.google.com/search?q=site:{{ site.production_url }}+" + encodeURIComponent(document.getElementById("q").value);
}
</script>{% endhighlight %}

   The production_url is variable replaced with with the external host name searchable after Jekyll runs.

0. Save the change and adjust the CSS.


<a name="elasticsearch"></a>

## Your Own Search Database #

The problem with using search engines is that you only get back what each has indexed.

And their use make the site seem cheap (because they are free).
However, they will do until you have time to go through the rest of this tutorial.

Here are how you can use you own search database:

   * Microsoft Azure DIY
   * Amazon EC2 (where you have to configure) DIY
   * Amazon's Elastic Cloud DIY
   * <a href="#Bonzai">Bonzai's hosted ElasticSearch service</a>
   * <a target="_blank" href="https://youtu.be/ivMML1J4ABY">Algolia service</a>


   Common to each solution is the need to sign-up on their website and get an API key.

   Documentation for each solution usually provide instructions for using various 
   programming languages (Rails, Python, PHP) 
   as well as frameworks (Django, WordPress, Jekyll).




<a name="Alogolia"></a>

### Alogolia hosted service #

   <amp-youtube data-videoid="ivMML1J4ABY" layout="responsive" width="480" height="270">
   </amp-youtube>

https://github.com/algolia/algoliasearch-jekyll


<a name="Bonzai"></a>

### Bonzai hosted ElasticSearch service #

I heard about this service from <a target="_blank" href="https://youtu.be/Rsc0Mmp1qc8">
Allison at JekyllConf</a>

   <amp-youtube data-videoid="Rsc0Mmp1qc8" layout="responsive" width="480" height="270">
   </amp-youtube>

&nbsp;

<a target="_blank" href="http://allizad.com/2016/05/06/elasticserch-for-jekyll/index.html">
Allison blogged about the steps to use Bonzai</a>.

0. At <a target="_blank" href="https://bonzai.io/">bonzai.io</a>
   open an account.
0. Specify a cluster name.
0. Review the pricing.
0. In Access tab, copy the <strong>access key</strong> (such as "abcdq7pbkd").
0. In Manage tab, copy the REST API call, such as:

   https://whygq7pbkd:vh70yz954n@jetbloom-2189350326.us-west-2.bonsai.io

0. Paste the URL in a browser. The result is, for example:

   ```
\{
  "status" : 200,
  "name" : "Stonecutter",
  "cluster_name" : "elasticsearch",
  "version" : \{
    "number" : "1.7.5",
    "build_hash" : "7b17af8ebc9cde792eebd2c18a5dc06f5029c64f",
    "build_timestamp" : "2016-03-23T18:33:33Z",
    "build_snapshot" : false,
    "lucene_version" : "4.10.4"
  },
  "tagline" : "You Know, for Search"
\}
   ```

Next, get your Jekyll site to send the call from a search box, and display the results.


<a name="libraries"></a>

## Code library links #

In the <strong>head.html</strong> file, add under the <head tag:

   {% highlight html %}
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="js/tabletop.js"></script>
    <script type="text/javascript" src='js/sheetsee.js'></script>{% endhighlight %}

* JQuery

* Tabletop

* Sheetsee

* https://facebook.github.io/react/

* http://www.searchkit.co/

https://github.com/omc/searchyll

   Save and exit, then add, commit, and push to GitHub to ensure that the site still works.


<a name="article"></a>

## article tag #

1\. Use a text editor to open <strong>index.html</strong>.

   Notice there is a for loop through post objects. 
   Each post in the loop is within an &LT;article HTML5 tag:

   ```
    \% for post in paginator.posts %\}
      &LT;article class="post" itemscope itemtype="http://schema.org/BlogPosting" role="article">
   ```

   Individual post files are within the <strong>_posts</strong> folder.

   Close the file without changes.

2\. Open an .md file within the  _posts folder.

   The .md means "Markdown" format. Each such file are automatically converted to .html by GitHub.

   The three dashes at the top defines the "front matter".

   ```
   ---
   layout: post
   ```

   The "post" value is what we came to find.

   Close the file without changes.

3\. Navigate to folder <strong>_layouts</strong>.

4\. Edit file <strong>page.html</strong>.

   Make content searchable by wrapping it between beginning and ending article HTML5 tags. 

   ```
   &LT;article&GT;
   \{\{ content }}
   &LT;/article&GT;
   ```

  Save the edits and exit.

5\. Use a text editor to open **default.html** within folder _layouts.

   Notice there is a for loop through post objects. 

   ```
<!DOCTYPE html>
<html ⚡ lang="en">
  \% include head.html %}
  <body>
    \% include header.html %}
    \ content }}
  </body>
</html>
   ```

<a name="config.yml"></a>

## Edit _config-dev.yml  #

Two configuration files are necessary in Jekyll because, 
unlike websites powered by WordPress,
GitHub only does parsing into HTML.

The configuration file that GitHub uses is <strong>_config.yml</strong>.
It contains a full URL:

   ```
   url:  "https://wilsonmar.github.io"
   ```

Jekyll runs locally (on your laptop) to do what GitHub does in the cloud.

The <strong>_config-dev.yml</strong> overrides the url with:

   ```
   url:  http://localhost:4000/
   ```

   Port 4000 is the default port Jekyll.

This override is specified when <a href="#RunJekyll">running Jekyll locally</a>, such as:

   <tt><strong>
   jekyll serve --config _config.yml,_config-dev.yml
   </strong></tt>

0. Use a text editor to open <strong>_config-dev.yml</strong>.
0. Add a dependency in gem and add elasticsearch variables.

   ```
   gems:
     - jekyll-paginate
     - searchyll

   elasticsearch:
     url: "http://localhost:9200/"
     number_of_shards: 1                       # Optional.
     number_of_replicas: 1                     # Optional.
     index_name: "jekyll"                      # Optional.
     default_type: "post"                      # Optional.
   ```

  Save the edits and exit.

0. Use a text editor to open <strong>_config.yml</strong>.
0. Add only elasticsearch variables.

<a name="gemfile"></a>

## Gemfile #

0. Use a text editor to open **Gemfile** (no file extension).
0. Add at the bottom of the file:

   <tt><strong>
   gem 'jekyll'<br />
		...<br />
   gem "searchyll"
   </strong></tt>

0. In a Terminal window, fetch gems specified in the Gemfile:

   <tt><strong>
   bundle
   </strong></tt>

   The Gemfile.lock file generated defines the version being used of each gem.

<a name="Index"></a>

### Index Search Words #

Many developers setup a way to invoke a task runner when a file change is detected.

From Allison's blog:

Searchyll indexes on build, so you can index to your cluster locally by running:

  $ BONSAI_URL="https://user_name:password@trial-jekyll-1468587631.us-east-1.bonsai.io" jekyll build

Or, if you’re going to use it in your deploy:

  $ BONSAI_URL="https://user_name:password@trial-jekyll-1468587631.us-east-1.bonsai.io" bin/deploy


<a name="Query"></a>

## Query #

Type in a query string.

Watch it auto-complete with results.

<a name="ViewLogs"></a>

## View Logs #

On the search service webpage.
