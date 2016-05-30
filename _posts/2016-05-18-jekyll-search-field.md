---
layout: post
title: "Text Search within Jekyll websites"
excerpt: "Make a website with a search box"
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

The first objective of this document is that you create a nicely formatted free personal blog with a search box.

This tutorial is written so "newbies" can follow step-by-step.

PROTIP tags mark where suggestions for higher productivity and security that many advanced programmers may not know.

If you want to <strong>add</strong> search capabilities (using ElasticSearch service) to an existing Jekyll theme,
see an upcoming blog by Andrew Krug 

<a name="QueryTest"></a>

## Test drive search on theme's demo site #

0. Click this link to go to our theme's demo website on-line:

   <a target="_blank" href="http://community.algolia.com/algoliasearch-jekyll-hyde/">
   http://community.algolia.com/algoliasearch-jekyll-hyde/</a>

   The formatting of this site is what you'll have as your blog 
   after following instructions in this tutorial.

0. Type in the search field a single letter such as "L".

   * Do results appear as you type? It should.

   * Do you need to click a submit button? No.

   * Are results highlighted within the normal presentation rather than with a different format, such as with Bing or Google search?

0. Click another link (Home) and try search term "Love craxy" (with a capital letter and a misspelling).

   * Is it "typo tolerant" ("crazy" is found even though it was typed in wrong as "craxy").

   * Are capital letters and lower case letters equivalent?

   Thus, as far as search goes, the theme presented is rather complete. Well, almost.
 
   <a name="404Search"></a>

   ### 404 Search Redirect #

0. Change the URL to a post that should not exist, such as: 

   <a target="_blank" href="http://community.algolia.com/algoliasearch-jekyll-hyde/">
   http://community.algolia.com/algoliasearch-jekyll-hyde/<strong>whatever</strong></a>

   * Are you redirected to a search page with "whatever" in the search field? 
   No.
   <br /><br />
   NOTE: <a target="_blank" href="https://github.com/algolia/algoliasearch-jekyll-hyde/issues/4">
   I've filed an issue to request this feature</a>.


### Additional features #

We are using a <strong>pre-formatted theme</strong> rather than design-your-own,
which takes much more time and expertise.

Some features on other blogs that can be added include:

* Request for visitor email to subscribe.
* Comments such as Disqus
* Commenting buttons to create a post on Twitter, Facebook, Google+, etc.
* Social buttons to the author's eminations on Twitter, Facebook, etc.

* Email form to provide feedback
* Site XML file for Google Search to discover
* Google Analytics
* Google ads

* Minify HTML, CSS, and JavaScript files
* etc.

However, this article does take a "deep dive" into the intracacies of programming HTML and CSS
in the context of this Jekyll framework, to begin equipping you to add features to your site:

* Custom icons appearing on website tabs

<hr />

## Step-by-step instructions #

Here are the steps setup your own free static website that provides a search box.

0. <a href="#GitHubAccount"> Create a GitHub account</a>
0. <a href="#ForkRepo"> Clone a Jekyll template</a>
0. <a href="#Ruby"> Install Ruby and Build gems</a>
0. <a href="#RunJekyll"> Run Jekyll locally</a>
0. <a href="#RunJekyllScript">Create a Script to Run Jekyll Locally</a>

0. <a href="#BuildIndex">Add step to build index</a>
0. <a href="#AddPosts"> Add Posts with Text</a>
0. <a href="#Query"> Query test</a>

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

0. <a href="#BuildIndex">Build Index</a>
0. <a href="#BuildCI">Build Continuous Integration</a>

<hr />

<a name="GitHubAccount"></a>

## Create a GitHub Account #

In this tutorial, we refer to <em>your_account</em> as the account name you created in GitHub.

If you already have an account, skip this section.

0. Click on this URL to open an internet browser to: 

   <a target="_blank" href="http://github.com/">github.com</a>

0. Sign-up.

0. Confirm your email. 


<a name="ForkRepo"></a>

## Fork and rename the Jekyll template #

Templates provide pre-formatted CSS and JavaScript.
Themes are available from a variety of sources.

We like Jekyll over WordPress, Drupal, and other frameworks because unlike them others,
Jekyll's blog entries are stored in text files rather in a database.
This makes it easier to switch Jekyll themes.

The theme we are using in this tutorial is based on a fork of 
the <a target="_blank" href="http://hyde.getpoole.com/">
Hyde theme template</a>, which is among the most popular 
partly because it is created by the legendary <a target="_blank" href="https://twitter.com/mdo">
Mark Otto</a>, Director of Design at GitHub.

   * Mobile friendly design and development

   * Easily scalable text and component sizing with rem units in the CSS

The steps:

0. Click the link below to open an internet browser with our base theme:

   <a target="_blank" href="https://github.com/algolia/algoliasearch-jekyll-hyde">
   https://github.com/algolia/algoliasearch-jekyll-hyde</a>

   This theme adds a search box to the Hyde theme by adding
   additional HTML, CSS, configuration settings, and JavaScript programming.

   We will examine each change below.

0. Click its <strong>Fork</strong> button to put it under your GitHub account.

0. Click the <strong>Settings</strong> tab to rename the repo, as <em>your_account_name</em>.github.io.

   In other words, if your account name is "wilsonmar", you would rename the repo to wilsonmar.github.io.
   
   NOTE: "github.io" means the site is hosted by GitHub, which does not charge (unlike GoDaddy or other hosting provider).

   PROTIP: Sites hosted on GitHub.io can still have a custom name such as "wilsonmar.com".

Next, we'll download the repository.

<a name="GitClient"></a>

## Install Git Client #

There are several choices.

   * Mac machine already have a command-line Git client.




<a name="ConfigRemote"></a> 

## Create a local repo #


0. Open a Terminal Shell Window.

0. PROTIP: Create a folder to hold all Git repositories.
   Change directory into it:

   <tt><strong>
   mkdir ~/gits<br />
   cd gits
   </strong></tt>

   On Mac and Linux, the ~ (tilde) character designates the current user's home folder.

   Repos are created within this folder.

0. Since you cloned:

   <tt><strong>
   git clone https://github.com/<em>your_account</em>/<em>your_account</em>.github.io
   </strong></tt>

   NOTE: This mechanism includes a .git folder that contains all the history in the creation of the template.

<a name="Ruby"></a>

## Install Ruby and Build gems #

Text in Jekyll sites are written in "Markdown" format which Jekyll converts to HTML 
that site vistors download and display on their internet browsers.

The programming for Jekyll to do that is written in the Ruby programming language.

0. [Install the Ruby program compiler](/ruby-on-apple-mac-osx/)

   Gems contain Ruby programs in a way that can be easily installed.

0. Use a text editor to open the <strong>Gemfile</strong>.

   <pre>
   source 'https://rubygems.org'

   gem 'jekyll', '~> 2.5'

   group :jekyll_plugins do
     gem 'algoliasearch-jekyll', '~> 0.4'
   end
   </pre>

   NOTE: If you are adding search capability to an existing site,
   you would add gem specifications to this file.

0. Click the URL to visit:

   NOTE: Gems specified are pulled from the <a target="_blank" href="https://rubygems.org/">
   Rubygems website</a>. 

0. Search for <strong>algoliasearch-jekyll</strong>:

   <a target="_blank" href="https://rubygems.org/gems/algoliasearch-jekyll/">
   https://rubygems.org/gems/algoliasearch-jekyll/</a>

   Notice the dependencies.

0. In a Terminal window, have dependency gems automatically fetched based on the Gemfile and dependencies:

   <tt><strong>
   bundle
   </strong></tt>

   Install is the default action.

   The <strong>Gemfile.lock</strong> file generated defines the version being used of each gem.


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

<a name="RunJekyllScript"></a>

### Create a Script to Run Jekyll Locally #

PROTIP: Create a script instead of typing in the long command, to save time and avoid mistakes.

#### Run script for Mac and Linux #

0. Use a text editor program to create a file named 4001.sh</strong>.

0. Save the file in the root folder of the Jekyll repository.

0. Open a Terminal instance and navigate to that repository.
0. Define run permissions: 

   <tt><strong>
   chmod a+x 4001.sh
   </strong></tt>

0. Open a Terminal instance to run it: 

   <tt><strong>
   ./4001.sh
   </strong></tt>

#### Run script for Windows #

0. Use a text editor program to create a file named 4001.cmd</strong>.

0. Save the file in the root folder of the Jekyll repository.

0. Open cmd program and navigate to that Jekyll folder.

0. Run it: 

   <tt><strong>
   4001.cmd
   </strong></tt>


<a name="AddPosts"></a>

## Add Posts with Text #

   Some themes contain no posts to search on. So you would have to add some .md (markdown) files.

   Algolia's sample Hyde theme comes with sample posts.

   This tutorial examples the sample theme's files to learn coding and configuration techniques.


<a name="Query"></a>

### Query test #


<hr />

<a name="SearchField"></a>

## Add Search Field in HTML #

Different templates use varying techniques to provide a form field for visitors to specify search terms.

### index.html #

0. Navigate down the folders to an index.html file and open it in a text editor.
   
   All content files are named **index.html** so visitors don't have to type in the .html file extension.
   This is better for SEO (Search Engine Optimization).

0. Press Ctrl+F to search for `<article class="post">`
   a <a target="_blank" href="http://mdn.beonex.com/en/HTML/Element/article.html">HTML5 standard tag</a>
   to designate content (and not navigation and other fluff).

   NOTE: Content shown on Jekyll websites are defined as individual files within the <strong>_posts</strong> folder.
   The underline in the name means that the folder is not transferred into the _site folder.

   Post files have file names ending with ".md" to designate markdown formatting.
   Jekyll processes such files into index.html files.

   The three dashes in the first line begins the <a target="_blank" href="http://jekyllrb.com/docs/frontmatter/">
   front matter"</a> which Jekyll processes.

   <pre>
   ---
   layout: post
   title: Let's start the adventure
   </pre>

   The `post` value in `layout: post` means that the **post.html** file in the **_layouts** folder is used to format text in the file.
   Text in the file replaces the tag: 

      &#123;&#123; content }}
   
In the **_includes** folder of the Algolia template are the head.html, footer.html, and sidebar.html.

### head.html #

When a web page (index.html) is loaded by an internet browser at the client end,
contents of the `<head>` are processed first.

The Algolia Jekyll theme defines that code in the **head.html** file.

That includes `<link` statements to bring in JavaScript and CSS files.

### sidebar.html #

The **sidebar.html** file contains what is within the `<div class="sidebar">` tag positioned to the left of content on every page.

The search field is in that file:

   <pre>
&LT;input type="text" class="algolia__input js-algolia__input" 
autocomplete="off" 
name="query" 
placeholder="Search in this site..." />
   </pre>

   TODO: Explain Notice there is no JavaScript "onClick" function here.

   That's because JavaScript functions have been invoked when the website was loaded to watch for changes in classes
   <strong>algolia__input</strong> and <strong>js-algolia__input</strong>.



### footer.html #

The **footer.html** file contains what goes before the `</body>` tag at the bottom of every page.

The Algoria template also defines JavaScript variables and populates them with values from the _config.xml file:

 {% highlight text %}{% raw %}
  <script>
  window.ALGOLIA_CONFIG = {
    'applicationId': '{{ site.algolia.application_id }}',
    'indexName': '{{ site.algolia.index_name }}',
    'apiKey': '{{ site.algolia.read_only_api_key }}',
    'baseurl': '{{ site.baseurl }}'
  }
</script>{% endraw %}{% endhighlight %}

   

 {% highlight text %}{% raw %}
<script id="algolia__template" type="text/template">
% raw %}
  <div class="algolia__result">
    <a class="algolia__result-link" href="{{ full_url }}#algolia:{{ css_selector }}">{{{ _highlightResult.title.value }}}</a>
    {{#posted_at}}
    <div class="algolia__result-date">{{ posted_at_readable }}</div>
    {{/posted_at}}
    <div class="algolia__result-text">{{{ _highlightResult.text.value }}}</div>
  </div>
% endraw %}
</script>
<script id="algolia__template--no-results" type="text/template">
  No results found.
</script>{% endraw %}{% endhighlight %}


### JavaScript #

The <strong>onLinkClick</strong> JavaScript function invoked 
is defined in the <strong>algolia.js</strong> file within
the public/js folder.

* onQueryChange

* onResult

* renderResults

* getAnchorSelector

* scrollPageToSelector

The above in turn reference functions in libraries pulled in from the internet:

   {% highlight html %}
<script src="//cdn.jsdelivr.net/jquery/2.1.4/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/algoliasearch/3.6.0/algoliasearch.min.js"></script>
<script src="//cdn.jsdelivr.net/algoliasearch.helper/2.1.0/algoliasearch.helper.min.js"></script>
<script src="//cdn.jsdelivr.net/hogan.js/3.0.2/hogan.min.js"></script>
<script src="//cdn.jsdelivr.net/momentjs/2.10.3/moment.min.js"></script>
<script src="/algoliasearch-jekyll-hyde/public/js/algolia.js"></script>{% endhighlight %}




<a name="SearchCSS"></a>

## Search Field CSS Formatting #

It seems there are as many ways to store CSS in Jekyll sites as there are Jekyll sites.

Each option involves <a href="#SearchCSS"> changes to CSS</a> as well to suit your design tastes.

The Algoria theme keeps CSS and JavaScript within a folder named <strong>public</strong>.
   A separate <strong>algoria.css</strong> file contains styling for both the search box and search results.

   Notice it is raw CSS, with no SASS processing.

   Many Jekyll templates use SASS, 
   which expands style codes in sass files to generate CSS used in websites.
   
 Additional resources about SASS:

   * <a target="_blank" href="https://www.toptal.com/css/sass-mixins-keep-your-stylesheets-dry">
   More about SASS mixins</a>

   * A popular SASS library is 
   bourbon


<a name="HydeChanges"></a>

#### Theme adjustments #

Some themes pre-code alternative CSS that can be selected.

<a target="_blank" href="https://github.com/poole/hyde">
   https://github.com/poole/hyde</a>
   explains some changes in the format of the site's layout.
   To change the color scheme of the site to green and flip the menu to the right side,
   change <strong>_layouts/default.html</strong> from:

   `<body class="theme-base-09">`

   to:

   `<body class="theme-base-0b layout-reverse">`

The disadvantage of this convenience is that the CSS file can become "bloated", and require longer to load by visitors.

<hr />

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

0. Add, commit to set a save point.

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

A free account of up to 10,000 requests per day is available from
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

   <amp-img width="651" height="143" alt="algolia-app-id-651x143-71pct"
layout="responsive" src="https://cloud.githubusercontent.com/assets/300046/15627136/be0ed046-2497-11e6-93d3-6ab5183661f2.jpg"></amp-img>

   &nbsp;

0. Copy the value of
   the Application ID and API KEY 
   (by clicking on the icon to the right of each value or
   highlight each value and press Ctrl_C).





   #### Create index #

   Records are not added via the GUI website.

   A Jekyll plugin (from Algolia or another) 
   extracts every paragraph of text (between `<p>` and `</p>` tags) from HTML files generated by the jekyll build command.
   This approach of reading the final HTML pages instead of markdown text works with any markdown parser 
   and custom plugin.

   The plugin also adds metadata context to each paragraph before pushing the lot to the Algolia index in the cloud.


NOTE: With Aloglia, an index does not need to be created.

0. Specify a name, such as prod_ARTICLE.

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

   #### Define JavaScript #

JavaScript executed 


<a name="BuildIndex"></a>

## Build index locally #

PROTIP: A <a href="#RunJekyll">custom shell script to invoke Jekyll</a> 
can also enable additional processing to be invoked automatically.

In this case, parse text for indexing and push index entries to Algolia API servers.

Add to the bottom of the 40001 run script this line:

   <tt><strong>
   ALGOLIA_API_KEY=’your_write_api_key’ jekyll algolia push
   </strong></tt>

0. Use an internet browser to go the Dashboard to your account on the Algoria.com website.
0. Copy the API key to your machine's Clipboard.
0. Switch back to the text editor to replace ’your_write_api_key’ from the Clipboard.
0. Save the file and run again (as described above).

0. If you don't want to expose your API key to the world, 
   keep the 4001 script file only in your local git repository and not in the public GitHub
   by adding the file's name to the repo's <strong>.gitignore</strong> file.

One way to tell the plugin what this key is, is to define it as a global variable right before calling the command (ALGOLIA_API_KEY="XXXX"). Another way is to create a file named _algolia_api_key in the same folder as the _config.yml file.

But with any of these methods, having the file not in the public make sense since
GitHub doesn't do algolia push anyway. 
It's only done locally or by a "Continuous Integration" server (such as Jekins, Travis, or Circle).


<a name="ViewLogs"></a>

## View Logs and Metrics #

On the search service Dashboard:


<a name="BuildCI"></a>

## Update indexes in Continuous Integration #

PROTIP: Update indexes using a continuous integration server
set to automatically push data and reindex upon save.

There are several CI servers:

TODO: Add CI settings instructions.

* Jenkins
* Cloudbees SaaS running Jenkins
* TravisCI
* CircleCI
