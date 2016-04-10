---
layout: post
title: "LoadRunner JavaScript Coding"
excerpt: "Sample code and tutorial here"
tags: [JavaScript, Load Testing, LoadRunner]
author: anil_mainali
image:
  feature: pic brown running horses 1900x500.jpg
  credit: Steve Mckinzie
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

[This tutorial](/loadrunner-javascript-coding/)
 is one in a <strong>series</strong> about coding of JavaScript 
within LoadRunner.

> This can get complicated. But help is just a phone call away.
  Call in the experts. Call us.


## Why Script LoadRunner in JavaScript language?

Writing in JavaScript is more comfortable to some.

> JavaScript code requires more memory and CPU to run than C code
  within LoadRunner load generators.
  About 50% more is the estimate.

### Obtain Sample Script with Utilities

0. Go to <a target="_blank" href="https://github.com/wilsonmar/LoadRunner">
   github.com/wilsonmar/LoadRunner</a>
   and either click <strong>Download ZIP</strong> then unzip it or
   fork the repo and clone it to your desktop if you would like changes.

   NOTE: This repo is actively improved over time,
   so forking and cloning is the recommended approach.

0. Use Finder or File Explorer to view a folder containing a sample
   script coded in JavaScript:

   <strong>WJS1_sample_WJS1250_v01</strong>

  This sample script contains a library of functions that provide both
  examples of JavaScript coding and 
  provides useful utilities.

> Use of some library functions such as md5 and SHA1
  for OAuth2 are explained in a separate tutorial by Wilson Mar.

To create a script folder containing your own application test code,
the options are:

1. Add your own application test code into this sample script.

2. Open a C-script saved immediately after recording and
   re-generate it into JavaScript,
   then copy the sample utility file into it.

3. Create a new folder, 
   then copy the sample library file into it, 
   as explained in the next section:

Alternately:

### Generate new script folder

To use VuGen to generate a LoadRunner script in JavaScript: 

1. Create a File as protocol <strong>Web HTTP/HTML</strong>.

2. Switch to Windows Explorer to see that 
   <strong>Action.js</strong> was created (rather than Action.c).
   Then switch back to VuGen.

3. In menu Record > Recording Options > Script, 
   click the drop-down for Scripting Language 
   to change from C to JavaScript.

   #### Config wi_library_init in vuser_init

0. In General: Script, to the right of
   "Generate think time greater than threshold",
   double-click on the number (default 3) and change it to 0.

0. In the <strong>vuser_init</strong> file, add a call to 
   identify environment variables for the run:

   {% highlight JavaScript %}
   function vuser_init(){
      var rc=0;
      rc=wi_library_init();
      return rc;
   }
   {% endhighlight %}

What follows is a hands-on tutorial to show you the most important edits to make to LoadRunner scripts. 

> I write programs that makes these edits for you. Call me!


### Generate Recording to Recording File

PROTIP: Record into a file which is not executed so that whatever is generated can be gradually copy and pasted into a working script. And the script continues to be runnable after generation

NOTE: Not all script protocols are able to record within an existing script. Only scripts for Web, Java, WAP, Oracle NCA, or RTE Vuser script can be recorded this way.

NOTE: Each script file listed in the Action list is a separate 
.js file within the script folder. 

CHALLENGE: Create a separate action file to receive generated code which is never executed.

1. Right-click on Actions in the Solution Explorer at the left.

2. Select Create New Action… from the pop-up.

3. Type "Recording". 

4. Press OK to dismiss the dialog. 

   The Recording.js file should appear among vuser_init, Action, etc.

### Remove custom files from Run-Time Logic

CHALLENGE: Remove extra custom files (such as Recording) 
from Run Logic so that it does not get executed automatically by LoadRunner.

1. Press F4 or menu Replay.

2. Click on Run-Time Settings 

3. Click Run Logic. 

4. Right-Click on Recording. 

5. Select <strong>Remove Item</strong>.

6. Click OK to dismiss the dialog.

7. Press Ctrl+Shift+F4 or menu File.

8. Click Save to save the script.

9. Make a recording using WebTours (after starting it).

10. Login as "jojo" with password "bean".
   Click Flights.
   In "Find Flights", click "Sign Off", then Stop recording.

  ![designstudio](https://cloud.githubusercontent.com/assets/10678180/14401664/43a45932-fdde-11e5-9e3a-b3cf5108a61e.png)

11.After code generation is done, Design Studio screen pops up.

12.Review the dynamic values. For example: Look this userSession value:

   ```
   118266.392466586zAiDDcHpfzcfDztQQpQzfDHf
   ```

   To understand the context of these values,
   use a text editor to read the recording generation log 
   and search for it.

13.Select those that need to be correlated and click on Correlate.

    NOTE: Design Studio can be reached manually by 
    clicking the ‘Design Studio’ button in the toolbar or 
    in the Design menu.

14.Run the generated script.

   NOTE: In Recording Options dialog. Automatic correlations are enabled/disabled by selecting the ‘Correlation Scan’ checkbox under     General > Code Generation.
   
   NOTE: Most application recordings require additional
   manual changes after recording.

<a name="CreateCustomScripts"></a>

### Create custom script files

PROTIP: Generally, it's best to leave the automatically 
created Action.js file with the fewest custom lines. 
This would reserve use of Action for more flexibility in the future.

0. Create a use case file to hold custom functions
   using the steps to create a file above. An example is
   WJS1_Access (if you are not building from the sample script).

   PROTIP: Specify a standard naming convention such as
   "WJS1" for the app under test, etc.

   Use cases for the Web Tours (WT3_) application include:

   * WT3_Tour
   * WT3_Booking

   PROTIP: With JavaScript, you also need to add custom files as
   an Extra File so functions within them are recognized.

0. Right-click on Extra Files in the Solution Explorer and
   select <strong>Add Files to Script ...</strong>.

0. Select the custom file.

CAUTION: Deleting an entry under Extra Files, 
that physical file is deleted from the file system as well.


### Create custom Access functions

You are likely able to use the typical functions defined
within WJS1_Access by doing a Replace-All command to
your custom app name.

* WJS1_Access_Landing()

* WJS1_Access_SignUp_error()
* WJS1_Access_SignUp()

* WJS1_Access_SignIn()
* WJS1_Access_SignIn_error()

* WJS1_Access_SignOut()
* WJS1_Access_Reset_Password()

Negative test cases of errors may be useful because error conditions
may cause performance issues. But these are usually
held for development until
additional time becomes available for scripting.

<hr />

## Basic edits to scripts

What follows are explorations of LoadRunner's JavaScript,
which is based on the
<a target="_blank" href="http://www.ecma-international.org/ecma-262/5.1/#sec-15.8.2.14">
ECMAScript 5.1 standard</a> followed by HTML4 browsers
such as IE8.

* <a href="#CustomCalls"> Code call details in a custom file</a>
* <a href="#HandleErrors"> Design error handling</a>
* <a href="#Randomize"> Randomize execution</a>
* <a href="#AddParameters"> Add Parameters (Variables)</a>
* <a href="#VerifyResponses"> Verify response returned</a>
* <a href="#ControlOutputMessage"> Control Message Output</a>

* <a href="#MakeParameterURL"> Make Parameter for URL</a>

> In addition to these basic ones, 
  several TODO items are covered in private advanced courses.
  Call me to take the class.


<a name="DesignRunTypes"></a>

<a name="CustomCalls"></a>

### Code call details in a custom file

PROTIP: Most experienced LoadRunner engineers hand-craft calls.
They use code generated from recordings to analyze coding patterns.

Rather than leaving all the details of calls in the Action.js file,
details are moved to a separate file such as WJS1_Access,
leaving high-level calls such as this:

   ```
   rc=WJS1_Access_landing( "T01_landing","http://contoso.net/",100);
   ```

PROTIP: Name functions beginning with the names of the file within which
they are defined.


<a name="HandleErrors"></a>

### Design error handling 

PROTIP: Define a strategy for how to deal with errors,
especially during stress test runs.
LoadRunner can be set to stop on error.

On blocking errors such as landing and login,
create a return code variable to receive values returned from
functions called, then if an error occured, return execution up
to the caller rather than continue to the next statement.

The simplest example is in the sample Action file:

   {% highlight JavaScript %}
   var rc=0;
   rc=WJS1_Access_landing( "T01_landing","http://hp.com/",100);
   if( rc != 0 ){ return rc; }
   {% endhighlight %}

LoadRunner can be programmed to exit at several levels.

<a name="Randomize"></a>

### Randomize execution

There are some situations where requests are not executed 100%
but occassionally.
The code here can be used to execute something 72.3% of the time.
That static number can be substituted with another number or a variable.

{% highlight html %}
  var trans_random_number = 72.3;
      wi_random_seed = Math.random() * 100 ;
  if( wi_random_seed <= trans_random_number ){
    lr.outputMessage(">> Within range. wi_random_seed = " + wi_random_seed + " <= " + trans_random_number );
    // Do stuff.
  }else{
    lr.outputMessage(">> Out of range. wi_random_seed = " + wi_random_seed + " NOT <= " + trans_random_number );
  }
{% endhighlight %}

The seed is between 0 and 100 because the number obtained from the 
JavaScript randomizer is a number between zero and 1,
multiplied by 100.

The <strong>wi_random_seed</strong> variable is defined when
the <strong>wi_library_init()</strong> function within the wi_library 
is executed within vuser_init.

To obtain distribution, consider 
<a target="_blank" href="http://jsfiddle.net/dje3z093/1/">
this</a> technique that produces a "bell curve" of numbers 
clustered around .5 between 0 and 1.


### Adjust link retrieval mode 

A request generated looks like this:

{% highlight html %}
web.url(
{
    name : 'index.htm', 
    url : 'http://127.0.0.1:1080/WebTours/index.htm', 
    targetFrame : '', 
    resource : 0, 
    recContentType : 'text/html', 
    referer : '', 
    snapshot : 't1.inf', 
    mode : 'HTML'
}
);
{% endhighlight %}

A value in referer is not needed because the Web Tours sample application does not use it.

NOTE: The `mode: HTML` activates a feature of LoadRunner which 
scans the html returned and issue requests for 
links to CSS, JavaScript, images, etc.

(Images specified within CSS are not retrieved this way)

CHALLENGE: Change to `mode: HTTP` for LoadRunner to NOT request links as well.
Generate just individual resource requests during recording by setting:

   <img src="/images/LR1250 Recording Recording option 1034x204.png">



<a name="ControlOutputMessage"></a>

### Control Message Output

NOTE: Message text in message functions are built using concatenation.

   {% highlight JavaScript %}
   ++ lr.outputMessage(">> Logged-in=" + lr.evalString( "{UserIds_userid}" ));
   {% endhighlight %}

PROTIP: Specify a special set of characters at the front of output messages
so they are easy to identify among potentially many output lines.

CHALLENGE: Look in Help for other types of messages.


<a name="ForcePrint"></a>

### Force print then restore logging level

The function above is defined within 
<strong>wi_library.js</strong> in GitHub:

0. In the vuser_init file, this call establishes values one time
   at the beginning of script execution:

   wi_library_init();

0. Under that in vuser_init, this call prints out log values:

   wi_msg_level_print( wi_msg_level_at_entry );

   A sample response:

   {% highlight html %}
   Run-Time Settings > Log DebugMessage level=0.
   [_] Enable logging =1.
   Send messages:
       [X] Always =512.
   Detail level:
   [X] Standard log =16.
       [_] Parameter substitution =4.
       [_] Data returned by server =2
       [_] Advanced trace =8
   {% endhighlight %}

Examine the code in wi_library.js. 
This set of functions can be used anywhere in the script to
force display out output messages even though logged is set off.

   {% highlight html %}
   wi_msg_force_print();
   lr.outputmessage(...);
   wi_msg_restore_print();
   {% endhighlight %}


<a name="MakeParameterURL"></a>

### Make Parameter for URL

Scripts are used in several environments,
each of which have a different URL.
There are several options for doing that.

1. Define an Attribute which can be 

2. Capture the value of the attribute in case
   it is varied in
   run-time Settings without editing the script.

3. Search and replease all recorded script from:

   http://127.0.0.1:1080

   to a variable that holds the value, such as:

   varURL

   REST API calls call the full path an <strong>end point</strong>.



<a name="VerifyResponses"></a>

### Verify response returned

How do you know whether the correct screen was returned?

PROTIP: After each user action, use script code to verify whether response from the server is what is expected (positive or negative).

Add code to scan the stream after receipt to identify a string of text:

{% highlight html %}
web.regFind(
{
   text : 'Find Flight', 
   search : 'Body'
}
);
{% endhighlight %}

Run the script both ways so you see the output either way.

NOTE: An error is raised immediately if the text is not found,
but at where the request is made, not at this script line 
which registers the capture during request execution.


### Register Find String 

Add a foundcount to the call:

{% highlight html %}
web.regFind(
{
    text : 'Find Flight', 
    foundcount : 'departDate_isfound',
    search : 'Body'
}
);
{% endhighlight %}

CHALLENGE: Look at the Help screen for the function to come up with a way to  
fail if the text is found (such as an error message).



### Capture Parameter Extended

To have LoadRunner count the number of times it finds text in the input stream:

{% highlight html %}
web.regSaveParamEx(
{
    paramName : 'departDate', 
    lb : 'name=\"departDate\" value=\"', 
    rb : '\"', 
    scope : 'Body', 
    requestUrl : '*/reservations.pl*'
}
);
{% endhighlight %}

The code to take action depending on what is in the variable updated. 

NOTE: LoadRunner automatically creates the paramName parameter
specified.


<a name="ControlStop"></a>

### Control whether to stop on error

Some test run scenarios do not want to end if an error occurs,
so use a variable named rc (return code) 
when returning control up the call hierarchy rather than stopping: 

{% highlight html %}
var rc=0;
    rc = wi.web.image( "Search Flights Button", "Search Flights Button" );
if( rc != 0 ){
    lr.outputMessage(">> ERROR Logged-in=" + lr.evalString( "{UserIds_userid}" ));
    // Handle error here.
    return rc;
}else{
    lr.outputMessage(">> Logged-in=" + lr.evalString( "{UserIds_userid}" ));
    return rc;
}
{% endhighlight %}


The variable rc (return code) is set at the front of the function  
so the function can return a status.

Unlike C, there is no LR_PASS in JavaScript, so we need to use 0.



### Generic Start and End Transaction Functions

PROTIP: Replace think-time functions with a generic function:

   wi.StartTrans( pCurrentTrans, in_rc );

Add a call to end transaction:

   rc = wi.EndTrans( pCurrentTrans, in_rc );

### Start and End Transaction Names

PROTIP: Specify Start and End transactions using a parameter
so the code is more easily pastable and there is no danger of typos,
avoiding the most common cause of runs being aborted.

{% highlight html %}
var pCurrentTrans = 'WT3_T22_Travel_Search_Flight';

lr.startTransaction(pCurrentTrans);

...

lr.endTransaction(pCurrentTrans, lr.AUTO);
{% endhighlight %}

Parametizing transaction names is needed to make generic functions
that reduce the amount of coding. The less coding lines, the smaller the script's memory footprint.
Smaller scripts allow for more Vusers to fit into available memory on load generator machines.

PROTIP: Start transaction immediately before web request functions
to avoid having data preparating time be counted in the transaction time.


> There is a utility program (in both Python and Perl)
  which parses code generated by LoadRunner
  so the script makes use of wi library functions.

### Additional JavaScript libraries

These are of interest. I haven't tested them yet.
So please let me know what you find.

* <a target="_blank" href="http://momentjs.com/">
  Moment.js</a> is a lightweight JavaScript date library for parsing, manipulating and formatting dates.

* <a target="_blank" href="http://momentjs.com/timezone/">
  Moment.js/timezone</a> parses and displays dates in any timezone.

* <a target="_blank" href="http://www.boilerjs.com/">
  boilerjs.com</a>
  which provides 115 methods to make it easier to work with arrays, collections, functions, numbers, objects, and strings. It's the JavaScript equivalent of a Swiss Army Knife.

* Underscore.js

* <a target="_blank" href="https://github.com/caolan/async">
  github.com/caolan/async</a>
  provides around 70 functions that include the usual 'functional' suspects (map, reduce, filter, each…) as well as some common patterns for asynchronous control flow (parallel, series, waterfall…).

NOTE: To save space (and memory while running),
mimify JavaScript to remove "white space" such as spaces and tabs.

<hr />

### Get Image by Screen Name

LoadRunner can generate script code like this based on the text of the link
(rather than the URL of the link):

{% highlight html %}
web.image(
{
name : 'Search Flights Button', 
alt : 'Search Flights Button', 
snapshot : 't3.inf'
}
);
{% endhighlight %}



### Submit form to Sign-up

To submit an HTML form:

{% highlight html %}
web.submitForm(
{
name : 'login.pl_2', 
snapshot : 't11.inf', 
itemData :  [
{name : 'username', value : '{UserIds_userid}'},
{name : 'password', value : '{UserIds_pwd}'},
{name : 'passwordConfirm', value : '{UserIds_pwd}'},
{name : 'firstName', value : ''},
{name : 'lastName', value : ''},
{name : 'address1', value : ''},
{name : 'address2', value : ''},
{name : 'register.x', value : '53'},
{name : 'register.y', value : '3'}
]
}
);
{% endhighlight %}

Some of the fields, such as register.x, can be marked hidden within the form
captured by LoadRunner.

### Submit data to POST Sign-in

{% highlight html %}
web.submitData(
{
name : 'login.pl', 
action : '{pProtocolHostPort}/cgi-bin/login.pl', 
method : 'POST', 
recContentType : 'text/html', 
referer : '{pProtocolHostPort}/cgi-bin/nav.pl?in=home', 
snapshot : 't2.inf', 
mode : 'HTML', 
itemData : 
    [
    { name : 'userSession', value : '{userSession}' }, 
    { name : 'username', value : '{UserIds_userid}' }, 
    { name : 'password', value : '{UserIds_pwd}' }, 
    { name : 'JSFormSubmit', value : 'on' }, 
    { name : 'login.x', value : '42' }, 
    { name : 'login.y', value : '8' }
    ]
  }
);
{% endhighlight %}


## Additional topics

* To keep memory use low, instead of large parameter files,
  use VTS (Virtual Table Service) on a separate machine.


## Resources to Learn JavaScript

There are many tutorials which teach JavaScript string manipulation and other topics:

* <a target="_blank" href="http://freecodecamp.com">freecodecamp.com</a>
  has learners use tutorials on codeacademy.com and other sites, then adds
  quizzes, all for free.

