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

The object of this document is that you create a free website with a search field.

This tutorial is intended for "newbies", which also ensures completeness for the advanced.

#### Search engine #

It's relatively easy to add a search box to an online search engines (<a href="#BingSearch">Bing</a>,
<a href="#GoogleSearch">Google</a>, etc.).
I show you how below.

But the problem with using public search engines is that you only get back what each has indexed.
And their use make the site seem cheap (because they are free).
However, they will do until you have time to go through the rest of this tutorial.

#### Custom search engine #

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
   as well as frameworks (Django, WordPress, Jekyll, etc.).

This tutorial focuses on using Jekyll hosted on GitHub.com and edited locally on your own machine.

<hr />

This is a step-by-step tutorial on to setup your own free static website that provides a search box.

0. <a href="#repo"> Create a GitHub repository</a>
0. <a href="#Jekyll"> Clone a Jekyll template</a>
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

<a name="repo"></a>

## Create a Repository #

http://github.com/

There are several ways GitHub generates websites.

   * account.github.io
   * account.github.io/project
   * Wiki within project

<a name="Jekyll"></a>

## Clone a Jekyll template #

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

   <tt><strong>
   mkdir ~/gits
   cd gits
   </strong></tt>

   On Mac and Linux, the ~ (tilde) character designates the current user's home folder.

   Repos are created within this folder.

If your template is in GitHub:

   git clone https://github.com/...

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
Here is an example (a "fully qualified" domain name):

   <pre>
   url                      : https://wilsonmar.github.io
   </pre>

This variable value is embedded in HTML so that when a link is clicked,
the user is taken to whatever host value is specified by the variable `url`.

But this is meant for use when hosted publicly (on GitHub).

For development use,
Jekyll can also be <a href="#RunJekyll">run locally</a> (on your laptop) to do what GitHub does in the cloud.

But when we run locally, we want to go to the local site url such as:

   ```
   url                      :  http://localhost:4001/
   ```

Thus, we need to override the url variable value during local use.

0. Use a text editor to create a <strong>_config-dev.yml</strong> file.
0. Copy and paste the text below (to override values while operating locally):

   {% highlight yml %}
url: http://localhost:4001

analytics:
  provider: false

comments:
  disqus:
    shortname            : ""
  {% endhighlight %}

If you don't have analytics or use disqus on your site, leave them out.

NOTE: Port 4000 is Jekyll's default port.


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

### Add Posts with Text #

   Some themes contain no posts to search on. So you would have to add some .md (markdown) files.

   Algolia's sample Hyde theme does come with sample posts.

   We are using that repo as an example of coding and configuration settings.

<a name="404Search"></a>

### 404 Search Redirect #

Change the URL to a post that should not exist, such as: 

   http://<em>your_account</em>.github.io/whatever.

   * Are you redirected to a search page with the post name ("whatever") in the search field?
   NOTE: <a target="_blank" href="https://github.com/algolia/algoliasearch-jekyll-hyde/issues/4">
   An issue has been filed to request this feature</a>.


<a name="Query"></a>

### Query test #

Type in the search field a letter such as "L".

* Do results appear as you type?

Click home and try search term "love craxy" with a misspelling.

* Is it "typo tolerant"?

* Are capital letters and lower case letters equivalent?
 
* Do you like the way it looks?

   Would you rather have the background around text appear in a different color?

* Do results highlight contents in context of the website rather than taking you to another website with different branding?

<hr />

xxx

<a name="SearchField"></a>

## Add Search Field in sidebar HTML #

   NOTE: Jekyll stores files it generates in the <strong>_sites</strong> folder. 
   That's what site vistors download and display.
   Each <strong>index.html</strong> served to vistors who go to the URL is generated from several files.
   It may not be mimified so we can still read it without additional processing.

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

   The three dashes in the first line begins the "front matter" which Jekyll processes.

   <pre>
   ---
   layout: post
   title: Let's start the adventure
   </pre>

   The `post` value in `layout: post` means that the **post.html** file in the **_layouts** folder is used to format text in the file.
   Text in the file replaces the tag: 

      &#123;&#123; content }}
   
   In the **_includes** folder of the Algolia template are the head.html, footer.html, and sidebar.html.

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

### head.html #

When a web page (index.html) is loaded by an internet browser at the client end,
contents of the `<head>` are processed first.

The Algolia Jekyll theme defines that code in the **head.html** file.

That includes `<link` statements to bring in JavaScript and CSS files.

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

The Algoria theme keeps CSS and JavaScript within a <strong>public</strong> folder.
   A separate <strong>algoria.css</strong> file contains styling for both the search box and search results.

   Notice it is raw CSS, with no SASS processing.

   Many Jekyll templates use SASS, 
   which expands style codes in sass files to generate CSS used in websites.
   
Resources:

   * <a target="_blank" href="https://www.toptal.com/css/sass-mixins-keep-your-stylesheets-dry">
   More about SASS mixins</a>

   * A popular SASS library is 
   bourbon

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


### For Allison's Bonzai #

Searchyll indexes on build, so you can index to your cluster locally by running:

  BONSAI_URL="https://user_name:password@trial-jekyll-1468587631.us-east-1.bonsai.io" jekyll build

Or, if you’re going to use it in your deploy:

  BONSAI_URL="https://user_name:password@trial-jekyll-1468587631.us-east-1.bonsai.io" bin/deploy

TODO: Explain what this means.


<a name="ViewLogs"></a>

## View Logs and Metrics #

On the search service webpage.


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
