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

<a name="elasticsearch"></a>

## Your Own Search Database #

It's relatively easy to add a search box to an online search engines
<a href="#BingSearch">Bing</a> or
<a href="#GoogleSearch">Google</a>.
I show you how below.

But the problem with using search engines is that you only get back what each has indexed.
And their use make the site seem cheap (because they are free).
However, they will do until you have time to go through the rest of this tutorial.

The advantage of using your own search database are:

   * results can be returned on the same page rather than sending your visitors away (a big deal)
   * Type-ahead find shows a list of auto-completes as characters are typed in the search field
   * Filter based on metadata in Jekyll front-matter (dates, categories, tags)
   * Fast queries
   * Full-text search
   * Highlight of words searched in results.

Options for setting up your own search database:

   * <a href="#Bonzai">Bonzai's hosted ElasticSearch service</a>
   * <a href="#Algolia">Algolia service</a>
   * Microsoft Azure DIY
   * Amazon's Elastic Cloud DIY

   The ones above are SaSS services. No server to setup.

   * Amazon EC2 (where you have to configure) DIY

   Common to each solution above is the need to sign-up on their website and get an API key.

Documentation for each solution usually provide instructions for using various 
   programming languages (Rails, Python, PHP) 
   as well as frameworks (Django, WordPress, Jekyll).

<hr />

This is a step-by-step tutorial on to setup your own free static website that provides a search box.

0. <a href="#repo"> Create a GitHub repository</a>
0. <a href="#Jekyll"> Add a Jekyll template</a>
0. <a href="#Ruby"> Install Ruby and Build gems</a>
0. <a href="#RunJekyll"> Run Jekyll locally</a>

0. <a href="#AddPosts"> Add Posts with Text</a>
0. <a href="#SearchField"> Add Search Field</a>
0. <a href="#SearchCSS"> Add Search Field CSS</a>
0. <a href="#SearchField"> Add Search JavaScript</a>

0. <a href="#GitClient"> Install Git client</a>
0. <a href="#ConfigRemote"> Configure remote repo</a>

0. <a href="#elasticsearch"> Setup Search API</a>
0. <a href="#libraries"> Code library links</a>

0. <a href="#config.yml"> Add gem in _config.yml file</a>
0. <a href="#gemfile"> Add gem in Gemfile</a>

0. <a href="#article"> Add article tag in _layout/post.html</a>
0. To display, add a Javascript framework for client-side interaction via HTTP. I’m using React and Searchkit.

0. <a href="#Index">Index</a>
0. <a href="#Query"> Query</a>

0. <a href="#JenkinsCI"> Jenkins</a>
0. <a href="#TravisCI"> Travis</a>

<hr />

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

0. If the template is on GitHub, click its Fork button to put it under your GitHub account.

   <a target="_blank" href="https://github.com/algolia/algoliasearch-jekyll-hyde">
   https://github.com/algolia/algoliasearch-jekyll-hyde</a>
   is good to use because a search box has been addedd to the original theme
   (by the legendary Mark Otto of GitHub).

   <a target="_blank" href="http://community.algolia.com/algoliasearch-jekyll-hyde/">
   Test drive a demo of it online</a>.

0. Click Settings if you want to rename the repo, such as <em>your_account_name</em>.github.io.
   

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

   Install is the default action.

   The Gemfile.lock file generated defines the version being used of each gem.

   Gems specified are pulled from the <a target="_blank" href="https://rubygems.org/gems/algoliasearch-jekyll/">
   Rubygems website</a>.

   Every time the list of gems changes, re-bundle again.

<a name="SiteVars"></a>

## Set Jekyll Site Variable Values #

Jekyll references file <strong>_config.yml</strong> at the top root folder.
Here is an example:

   <pre>
   url                      : https://wilsonmar.github.io
   host                     :         wilsonmar.github.io
   </pre>

If you click on a link, you will be sent to a URL based on the variable "url".

NOTE: Most Jekyll templates do not have the `host` variables add here.

The `url` variable should be the fully qualified domain name.

<a name="LocalSiteVars"></a>

## Define local variables #

Jekyll can run locally (on your laptop) to do what GitHub does in the cloud.

But when a link is clicked on a site <a href="#RunJekyll">running Jekyll locally</a>, 
the user is taken to whatever host value is specified by the url variable, such as:

   ```
   url                      : https://wilsonmar.github.io
   ```

We want to go to a local site such as:

   ```
   url                      :  http://localhost:4001/
   ```

Thus, we need to overrides the public url.

0. Create a <strong>_config-dev.yml</strong> file to override values while operating locally.

   <pre>
url: http://localhost:4001
analytics:
  provider: false
comments:
  disqus:
    shortname            : ""
       </pre>

   NOTE: Port 4000 is the default port Jekyll.


<a name="RunJekyll"></a>

## Run Jekyll Locally #

0. To ensure you have a base version that works locally, run:

   <tt><strong>
   bundle exec jekyll serve --config _config.yml,_config-dev.yml --port 4001
   </strong></tt>

   The sample response:

   <pre>
            Source: /Users/mac/gits/jetbloom/jetbloom.github.io
       Destination: /Users/mac/gits/jetbloom/jetbloom.github.io/_site
      Generating... 
                    done.
 Auto-regeneration: enabled for '/Users/mac/gits/jetbloom/jetbloom.github.io'
    Server address: http://127.0.0.1:4001/
  Server running... press ctrl-c to stop.
   </pre>

   If an error message appears about port 4000 (the default), it may be because two dashes need to precede the port parameter keyword.

   On a Mac, "ctrl-c" means hold down the control key and press C.

0. Switch to an internet browser to open the server address:

   http://127.0.0.1:4001/

   BTW, other configuration options:

   * <a target="_blank" href="https://jekyllrb.com/docs/configuration/">
   https://jekyllrb.com/docs/configuration/</a>


   PROTIP: Create a shell script to save time typing the long command.

   Create a file named 4001.sh
   in a folder in the system path so it can be defined in one place, then executed from any folder.

   In each folder, define run permissions: chmod a+x 4001.sh

   Run it: ./4001.sh

<a name="ArchiveRemote"></a> 

## Archive remote repo #

PROTIP: Make a small change, then add and commit.

Archive in the cloud a base version to fall back to in case edits cause issues.

   <tt><strong>
   git add .<br />
   git commit -m"Add sample posts"
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

<a name="AddPosts"></a>

## Add Posts with Text #

   If you installed Algolia's sample Hyde theme, note no posts are in it to search on.
   We are using that repo as an example of coding and configuration settings.

<a name="SearchField"></a>

## Add Search Field #

### Field on Menu #

Most typically want to add a search field among the menu bar at the top of each page.

In a Jekyll site, that would be <strong>head.html</strong>.

In the MinimalMistakes theme from March 2016, the page.html folder contains:

   {% highlight text %}{% raw %}
  {% include _navigation.html %}{% endraw %}{% endhighlight %}

   This file I found within the _includes folder.

NOTE: I couldn't insert a field without having it wrap to the next line.

### Separate menu item #

So I added a "SEARCH" menu item in the template's _data/navigation.yml file, 
then created a folder at the root with the same name I specified: search.
Insid that folder I created a default.html file.


<a name="SearchCSS"></a>

## Search Field CSS Formatting #

Each option involves <a href="#SearchCSS"> changes to CSS</a> as well to suit your design tastes.

It seems there are as many ways to store CSS in Jekyll sites as there are Jekyll sites.

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

## Bing Search Form #

Sample HTML:

{% highlight html %}{% raw %}
<div class="searchbox">
  <form method="get" action="http://www.bing.com/search">
    <input id="searchinput" type="text" placeholder="Search..." name="q" value="" /> 
    <input type="hidden" name="q1" value="site:{{ site.url }}" />
  </form>
</div>{% endraw %}{% endhighlight %}

0. Copy the HTML below and paste it in the file.

0. Add these lines (but with your url and host name) if they are not already defined.

0. PROTIP: Use an appropriate hero graphic, if your page design uses one.

0. Save the change and adjust the CSS.

0. Add, commit, and push to GitHub.

0. Do a sample search.

    CAUTION: Visitors to your site are directed out to the Bing search page.
    So this approach feeds visitors to Bing.

<a name="GoogleSearch"></a>

## Google Search Form #

This goes in head.html in the menu bar so it appears on every page:

{% highlight html %}
<form onSubmit="google_search()">
<input type="text" name="q" id="q" value="" />
<input type="submit" value="search" onClick="return google_search()" />
</form>{% endhighlight %}

The use of an onClick function means JavaScript needs to be defined.

This can be put before the `<body>` section.

{% highlight html %}
<script type="text/javascript">
function google_search(){
   window.location = "http://www.google.com/search?q=site:{{ site.url }}+" + encodeURIComponent(document.getElementById("q").value);
}
</script>{% endhighlight %}

   The url is a variable replaced with with the external host name searchable after Jekyll runs.

0. Save the change and adjust the CSS.

0. Add, commit, and push to GitHub.

0. Do a sample search.

    CAUTION: Visitors to your site are directed out to the Bing search page.
    So this approach feeds visitors to Bing.


<a name="Bonzai"></a>

## Bonzai hosted ElasticSearch service #

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

0. To verify whether the URL works, paste it in a browser. 
The result is, for example:

{% highlight json %}{% raw %}
{
  "status" : 200,
  "name" : "Stonecutter",
  "cluster_name" : "elasticsearch",
  "version" : {
    "number" : "1.7.5",
    "build_hash" : "7b17af8ebc9cde792eebd2c18a5dc06f5029c64f",
    "build_timestamp" : "2016-03-23T18:33:33Z",
    "build_snapshot" : false,
    "lucene_version" : "4.10.4"
  },
  "tagline" : "You Know, for Search"
}{% endraw %}{% endhighlight %}

   NOTE: Some REST APIs return a list of follow-on calls available,
   following principles of <a target="_blank" href="https://en.wikipedia.org/wiki/HATEOAS/"> HATEOAS</a>
   (Hypermedia as the Engine of Application State). This site is not one of them.

Next, get your Jekyll site to send the call from a search box, and display the results.

Try the request using a curl command ???

<a name="Algolia"></a>

## Algolia hosted service #

A free account of up to 10,000 requests per day is available from<br />
<a target="_blank" href="https://www.algolia.com/">
Algolia.com</a>.

   <amp-youtube data-videoid="ivMML1J4ABY" layout="responsive" width="480" height="270">
   </amp-youtube>

This video is by Tim Carry (tim@algolia.com).

This tutorial fills in some steps missing in his
<a target="_blank" href="https://blog.algolia.com/instant-search-blog-documentation-jekyll-plugin/">
   blog article</a>.

0. Sign-up at <a target="_blank" href="https://www.algolia.com/">
Algolia.com</a> (you can use your GitHub credentials).
0. Specify name and region. Their UI has a cool list of live ping response times to various regions:

   <amp-img media="(min-width: 386px)" width="386" height="346" 
layout="responsive" src="https://cloud.githubusercontent.com/assets/300046/15621061/7779e1b0-241b-11e6-977a-0aeeb0a5c1d2.jpg"></amp-img>

0. Look at the email for links to their thorough
<a target="_blank" href="https://www.algolia.com/demos/">demos</a> and
<a target="_blank" href="https://www.algolia.com/doc">tutorials (doc)</a>,
which populates your instance with example of actors.

0. When you sign-in again, you get the <a target="_blank" href="https://www.algolia.com/dashboard">
Dashboard</a>.

   #### Create index #

0. Click the pink NEW INDEX button at the upper right.

0. Specify a name, such as prod_ARTICLE.

   Records are not added via the GUI website.

   NOTE: Jekyll stores files it generates in the <strong>_sites</strong> folder. 
   That's what site vistors download and display.

   A Jekyll plugin from Algolia extracts every paragraph of text (between `<p>` and `</p>` tags) from HTML files generated by the jekyll build command.
   This approach of reading the final HTML pages instead of markdown text works with any markdown parser 
   and custom plugin.

   The plugin also adds metadata context to each paragraph before pushing the lot to the Algolia index in the cloud.


   #### Populate _config.yml with identifers #

0. Use a text editor to open the <strong>_config.yml</strong> file and paste in this under the gems: section:

   <pre>
   gems:
     - algoliasearch-jekyll

   algolia:
     application_id: 'EILX55I5BP'
     index_name:     'jekyll_PROD'
     read_only_api_key: '4f4c22ee357217a585b443282cadc2b0'
     excluded_files:
      - 404.html
      - index.html
       </pre>

0. At the Algolia website, click the <strong>API Keys</strong> icon at the left.
0. Copy the Application ID value into the Clipboard by clicking the icon to its left, or highlight the text and press command+C to copy.

   <amp-img width="651" height="143" alt="algolia-app-id-651x143-71pct"
layout="responsive" src="https://cloud.githubusercontent.com/assets/300046/15627136/be0ed046-2497-11e6-93d3-6ab5183661f2.jpg"></amp-img>

   &nbsp;

0. Back to the file, double-click on the application_id value to highlight and press command+V to paste from the Clipboard.

   #### Define Index for _config.yml #

0. Return to the Dashboard and click the <strong>Indices</strong> icon on the left icon menu.

0. Click on the index name within the sausage ("getstarted_actors" in the example).

   <amp-img media="(min-width: 386px)" width="536" height="157" alt="algolia index 536x157"
layout="responsive" src="https://cloud.githubusercontent.com/assets/300046/15623898/51fb4024-2438-11e6-9d12-a03cf345957d.jpg"></amp-img>

   &nbsp;

0. In the drop-down, highlight the text and press command + C to copy to the Clipboard.

0. Switch to _config.yml and double-click 'your_index_name' to highlight it, the press command + V to replace it with the Clipboard.

0. Save the file.

   #### Add Gem to Gemfile and Bundle #

0. Edit the Gemfile to add under section gems:

   <pre>
group :jekyll_plugins do
  gem 'algoliasearch-jekyll', '~> 0.7.0'
end
   </pre>

   The gem downloaded from Rubygems.org was obtained from:

   <a target="_blank" href="https://github.com/algolia/algoliasearch-jekyll/">
   github.com/algolia/algoliasearch-jekyll</a>

0. Use an internet browser to go to that GitHub repo and click Watch.

0. Switch back to Terminal to <a href="#Bundle">bundle the site again</a>.

0. <a href="#Run">Run Jekyll again</a>.

   #### Define Write API #

0. On the Algolia website, click the API Keys icon.

0. Click the pink NEW API Key button at the upper right.

0. Type a Description value.

0. Check Add Records.

0. Click Generate.

0. Click the copy icon next to the newly generated API key for Operation addObject.

0. In the Terminal, type this (replacing "your_write_api_key") with the contents of Clipboard:

   <tt><strong>
   ALGOLIA_API_KEY='your_write_api_key' jekyll algolia push
   </strong></tt>


<a name="CustomSearchForm"></a>

### Custom Search Form #

0. Copy the HTML below and paste it in the file.

{% highlight html %}{% raw %}
<div class="searchbox">
  <form method="get" action="http://???">
    <input id="searchinput" type="text" placeholder="Search..." name="q" value="" /> 
    <input type="hidden" name="q1" value="site:{{site.url}}" />
  </form>
</div>{% endraw %}{% endhighlight %}


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

   {% highlight html %}{% raw %}
    {% for post in paginator.posts %\}
      <article class="post" itemscope itemtype="http://schema.org/BlogPosting" role="article">{% endraw %}{% endhighlight %}

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

   {% highlight html %}{% raw %}
   <article>
   {{ content }}
   </article>{% endraw %}{% endhighlight %}

  Save the edits and exit.

5\. Use a text editor to open **default.html** within folder _layouts.

   Notice there is a for loop through post objects. 

   {% highlight html %}{% raw %}
<!DOCTYPE html>
<html ⚡ lang="en">
  {% include head.html %}
  <body>
    {% include header.html %}
    {{ content }}
  </body>
</html>{% endraw %}{% endhighlight %}

<a name="config.yml"></a>

## Edit _config-dev.yml  #

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


<a name="JenkinsCI"></a>

## Jenkins CI #

Set to automatically push data and reindex upon save.


<a name="TravisCI"></a>

## Travis CI #

Set to automatically push data and reindex upon save.
