---
layout: post
title: "Samsung IoT Cloud"
excerpt: "It can take it"
tags: [Clouds, IoT]
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

[![Gitter](https://badges.gitter.im/wilsonmar/wilsonmar.github.io.svg)](https://gitter.im/wilsonmar/wilsonmar.github.io?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

{% include _toc.html %}

This is a hands-on narrated tour on how to make use of Samsung's IoT cloud.

It helps if you have already absorbed the tutorial about 
[IoT ideas](/iot-ideas/).

{% include _intro.html %}

<hr />

## Explore #

Samsung calls its ARTIK Cloud 
a "data exchange platform that enables any device or sensor to push its data to the cloud".

   QUESTION: What does ARTIK stand for?

0. In an internet browser, look at<br />
   <a target="_blank" href="https://www.artik.io/overview/">
   <strong>https://www.artik.io/overview</strong></a><br />
   which sells developers into writing ARTIK modules.

0. In a new tab/window, look at<br /><a target="_blank" href="https://artik.cloud">
   <strong>https://artik.cloud</strong></a>
   is the Samsung's home product page.

0. Type your email to Sign up for their newsletters.

0. Click PRICING to see that Hobbyists get free access, but data is kept only 3 months.

   PROTIP: Part of the design and task of any system is analytics over time.
   I suggest that you extract the information for display on 
   Tableau.

0. Click <a target="_blank" href="https://artik.cloud">
   SIGN-UP</a>.

0. Click <a target="_blank" href="https://developer.artik.cloud/">
   DEVELOPER</a> on the right side of the menus to get you<br />
   <a target="_blank" href="https://developer.artik.cloud/">
   <strong>https://developer.artik.cloud</strong></a>

0. https://developer.artik.io/documentation/tutorials/

The above you only need to do once.

   ### Samsung projects #

*   <a target="_blank" href="https://www.hackster.io/monica/getting-started-with-artik-cloud-grove-weather-station-e0b4e3?ref=part&ref_id=9403&offset=0">
   demo on hackster.io</a>

*   <a target="_blank" href="https://www.artik.io/blog/cloud/">
   artik.io/blog/cloud</a>
   has lots of great articles about applications.

   <a target="_blank" href="http://bit.ly/ACHackJJ">
   Samsung's Challenge</a>
   sends participants $100 to sign up


## Add Samsung device type #

0. If you select DASHBOARD > DEVICE TYPES from the website, you get to click another button
   to really add NEW DEVICE TYPE at <br /><a target="_blank" href="https://developer.artik.cloud/dashboard/devicetypes/new">
   <strong>https://developer.artik.cloud/dashboard/devicetypes/new</strong></a>
   
   This is for adding types of devices.

   There is also a list at<br />
   <a target="_blank" href="https://artik.cloud/works-with/">
   https://artik.cloud/works-with</a>

   The wish list of device types to include:<br />
   <a target="_blank" href="https://artik.cloud/challenge/most-wanted-devices/">
   https://artik.cloud/challenge/most-wanted-devices</a>

0. To select a known device type, open a new tab/window at<br />
   <a target="_blank" href="https://artik.cloud/my/new_device">
   <strong>https://artik.cloud/my/new_device</strong></a><br />
   to look at the many device types ARTIK already supports.

   QUESTION: Is there a menu from the website that takes you here?

0. Scroll to select <strong>SAMI Gear Fit</strong>.

   The device is used in<br /><a target="_blank" href="https://developer.artik.cloud/documentation/introduction/hello-world.html">
   https://developer.artik.cloud/documentation/introduction/hello-world.html</a><br />
   which steps you through connecting a "SAMI Gear Fit" type device 
   even though one doesn't need a physical device.

0. PROTIP: Add a number in the name suggested. You may have more than one, 
   or want different variations later.

0. Click CONNECT DEVICE...

   This takes you to<br /><a target="_blank" href="https://artik.cloud/my/devices">
   <strong>https://artik.cloud/my/devices</strong></a>


   ### Samsung API console #

0. Open yet another tab/window<br /><a target="_blank" 
   href="https://developer.artik.cloud/api-console/">
   <strong>https://developer.artik.cloud/api-console</strong></a><br />

0. Click "Accept" to allow Samsung the permissions listed:

   <pre>
The application API Console is requesting the following permissions to be granted:
&nbsp;
Read all your data.
Write and modify all your data.
Read data from devices of types:
Send data to devices of types:
Read your profile information
Internal use only. Edit your profile information
   </pre>

0. Click "Accept" to dismiss the cookie message at the bottom.

   <a name="APIdomains"></a>

   ### APIs #

   Notice the rich set of objects among the granular API calls:

   * users and their devices and device types and properties
   * devices and their tokens
   * devicetypes of manifests with versions and properties
   * messages
   * messages export
   * notifications by subscription
   * rules
   * trials for applications
   * trial devices and devicetypes
   * trial invitations to participants by administrators
   <br /><br />

> Let me know if this artwork helps you visualize Samsung's API:

   <amp-img layout="responsive" alt="iot-samsung-api-v01 650x323-132kb.png" width="650" height="323" src="https://cloud.githubusercontent.com/assets/300046/18029854/41b426f6-6c61-11e6-8e78-a6fa272d00f8.png"></amp-img>
   Words in bold are the first level names in the path.
   Words in italics are variables.

   TODO: Create illustration programmatically using http://apispots.com/projects/swaggered/

   <a target="_blank" href="https://developer.artik.cloud/documentation/introduction/the-manifest.html">
   The Manifest</a> is used to interpret the content so that it can be stored properly, or be sent to targeted devices correctly. 

### Get Samsung user access token #

   PROTIP: A full description of Samsung's REST API is 
   <a target="_blank" href="https://developer.artik.cloud/documentation/api-reference/rest-api.html">
   here</a>.  

0. Click the "GET" associated with /users/self.

0. Click TRY IT! button for the website to issue a request using the
   <strong>API endpoint</strong> shown:

   <pre><strong>
   https://api.artik.cloud/v1.1/users/self
   </strong></pre>

   The request's HTTP header contains the OAuth2 calculated by the client JavaScript:

   <pre>
    "Content-Type": "application/json",
    "Authorization": "Bearer 471dd09f20f140888a650f3aeec70xxx"
   </pre>

   <a target="_blank" href="https://developer.artik.cloud/documentation/api-reference/">
   The docs</a> say messages sent to ARTIK Cloud may not be bigger than 
   <strong>1 KB</strong>.

   QUESTION: How long does the 32-character token live?

   A access token can be used (refreshed) for <a target="_blank" href="https://developer.artik.cloud/documentation/introduction/authentication.html#refresh-a-token">
   up to 14 days</a>.

   The response HTTP header contains HATEOS?

   <pre>
   {
    "allow": "*",
    "content-type": "application/json; charset=utf-8",
    "x-rate-limit-limit": "100/1000",
    "x-rate-limit-reset": "1472315008/1472342400",
    "x-rate-limit-remaining": "99/999",
    "access-control-allow-origin": "*",
    "access-control-allow-headers": "Origin, X-Requested-With, Content-Type, Accept, Referer, User-Agent, Authorization",
    "access-control-allow-methods": "POST, GET, PUT, DELETE, OPTIONS",
    "date": "Sat, 27 Aug 2016 16:22:28 GMT",
    "content-length": "249",
    "connection": "close"
    }
   </pre>

   PROTIP: Have your client read the "x-rate-limit-remaining": ("99/999")
   and not send more traffic if it's down to zero.

   THANK YOU Samsung.
   Many other API services do not have this useful feature.

   <a name="SamsungUserId"></a>

   #### userId = saIdentity #

   The response HTTP body reflects information about the user:

   <pre>
{
    "data": {
        "id": "075fddff2a984cda87f2d718f4d04xxx",
        "name": "sa4fb30b78564a73884af4e03dcc40xx",
        "email": "wilsonmar@gmail.com",
        "fullName": "WILSON MAR",
        "saIdentity": "<strong>pigg1dynic</strong>",
        "accountType": "SAMSUNG",
        "createdOn": 1470056152000,
        "modifiedOn": 1470056152000
    }
}
   </pre>

   The "createdOn" and "modifiedOn" are the number of milliseconds since 
   1/1/1970 (the epoch). The last 3 of the 13 digits are always zeros.

   PROTIP: Convert back to human-readable date/time,
   use the online tool at <a target="_blank" href="http://www.epochconverter.com/">
   <strong>http://www.epochconverter.com</strong></a>

0. Highlight the id's value from the response for use later in this tutorial.

   Developers working on API client code would copy the id to a <strong>properties</strong>
   file such as the one in folder
   <a target="_blank" href="https://github.com/artikcloud/artikcloud-java/blob/master/src/test/resources/artik.properties">
   src/test/resources/artik.properties</a>

   <pre>
user1.id=04ddbd35d57d4d7b8f07f219c44457b2
user1.name=maneesh
user1.fullname=Maneesh Sahu
user1.token=fa460261b858484583097ecb331faaa8
user1.email=maneesh.sahu@ssi.samsung.com
user1.aid=b6951bf387b84f63b38911ae35d65e28
user1.createdon=1406839290000
   </pre>

   The same file also contains id and tokens for each device.


   ### Samsung Device Simulator #

   Docs about this is <a target="_blank" href="https://developer.artik.cloud/documentation/tools/device-simulator.html">
   here</a>, which states:

0. Make sure you have Java <strong>JDK v8 update 77 or higher</strong>.
   In a Terminal shell window:

   <tt><strong>
   java -version
   </strong></tt>

   The response:

   <pre>
Java(TM) SE Runtime Environment (build 1.8.0_74-b02)
Java HotSpot(TM) 64-Bit Server VM (build 25.74-b02, mixed mode)
   </pre>

   Upgrade if necessary.
   See my [Java install on Mac tutorial](/java-on-apple-mac-osx/).

0. Download Samsung's Device Simulator Java program from<br />
    <a target="_blank" href="https://developer.artik.cloud/documentation/downloads/device-simulator.jar">
    https://developer.artik.cloud/documentation/downloads/device-simulator.jar</a><br />
    into your Downloads folder.

0. Open a new Terminal window, navigate to the Downloads folder to 
   construct the command, 

   <tt><strong>
   cd ~/Downloads<br />
   java -jar device-simulator.jar -token=
   </strong></tt>

0. Temporarily return to the API webpage to copy and 
   paste the 32-character user id token highlighted earlier.

   If you get the message "Error: Unable to access jarfile device-simulator.jar",
   do a pwd to see if the jar file is there to use.


   The response begins with this ASCII art:

   <pre>
    _         _   _ _  __   ____ _                 _ 
   / \   _ __| |_(_) |/ /  / ___| | ___  _   _  __| |
  / _ \ | '__| __| | ' /  | |   | |/ _ \| | | |/ _` |
 / ___ \| |  | |_| | . \  | |___| | (_) | |_| | (_| |
/_/   \_\_|   \__|_|_|\_\  \____|_|\___/ \__,_|\__,_|
Welcome to ArtiK Cloud Device Simulator console
   </pre>   

   An example of the rest of the response:

   <pre>
Hello sa4fb30b78564a73884af4e03dcc40xx! your UID is 075fddff2a984cda87f2d718f4d04xxx and your email is wilsonmar@gmail.com :)
Please enter a valid command or ? for help.
java.io.UnsupportedEncodingException: utf-
  at sun.nio.cs.StreamEncoder.forOutputStreamWriter(StreamEncoder.java:61)
  at java.io.OutputStreamWriter.<init>(OutputStreamWriter.java:100)
  at jline.console.ConsoleReader.<init>(ConsoleReader.java:231)
  at jline.console.ConsoleReader.<init>(ConsoleReader.java:221)
  at jline.console.ConsoleReader.<init>(ConsoleReader.java:209)
  at simulator.Console.init(Console.java:64)
  at simulator.Main.main(Main.java:14)
   </pre>

   QUESTION: If the "data: id" token was entered,
   the response is:

   <pre>
cloud.artik.client.ApiException: Unauthorized
  at cloud.artik.client.ApiClient.handleResponse(ApiClient.java:838)
  at cloud.artik.client.ApiClient.execute(ApiClient.java:773)
  at cloud.artik.api.UsersApi.getSelfWithHttpInfo(UsersApi.java:115)
  at cloud.artik.api.UsersApi.getSelf(UsersApi.java:102)
  at simulator.Console.whoami(Console.java:203)
  at simulator.Console.init(Console.java:59)
  at simulator.Main.main(Main.java:14)
The access token is not valid or expired.
Please enter a valid command or ? for help.
java.io.UnsupportedEncodingException: utf-
  at sun.nio.cs.StreamEncoder.forOutputStreamWriter(StreamEncoder.java:61)
  at java.io.OutputStreamWriter.<init>(OutputStreamWriter.java:100)
  at jline.console.ConsoleReader.<init>(ConsoleReader.java:231)
  at jline.console.ConsoleReader.<init>(ConsoleReader.java:221)
  at jline.console.ConsoleReader.<init>(ConsoleReader.java:209)
  at simulator.Console.init(Console.java:64)
  at simulator.Main.main(Main.java:14)
macs-MacBook-Pro-4:Downloads mac$ 
   </pre>

   If successful, commands can be entered.

   <tt><strong>
   ?
   </strong></tt>

   ### Samsung User Properties #

0. Highlight and copy into your Clipboard (with Ctrl+C)
   the value of <a href="#SamsungUserId">"id"
   ("075fddff2a984cda87f2d718f4d04xxx" in the example above)</a>.
   
   This is what the API calls your <strong>userId</strong>.

   <a target="_blank" href="https://developer.artik.cloud/documentation/introduction/administrative-apis.html">
   The application ID is specified in the JSON payload.</a>


   ### Samsung cloud connectors #

   At time of writing, the clouds at https://artik.cloud/works-with/ 
   include most of the early cloud APIs:

   * OpenWeatherMap
   * Nettamo (France) indoor face recognition cameras and CO2 sensor stations h
   
   * Foursquare
   * Twitter
   
   * FitBit
   * iHealth
   * Jawbone
   * Moves
   * Runkeeper
   * Withings.com smartwatches and scales
   
   * Nest Thomstate (Google)
   * Philips Hue

https://developer.artik.cloud/documentation/introduction/authentication.html#authorization-code-method

   ### Rules #

   ### Trials #

   An ARTIK Cloud trial is a way for a trial administrator (user) 
   to invite other users to share their data 
   for a controlled amount of time and set of device types.

   https://github.com/samsungsamiio/sami-trials-webapps
   by 
   http://developer.samsungsami.io/
   which now redirects to https://developer.artik.cloud/

   <a target="_blank" href="https://developer.artik.cloud/documentation/advanced-features/data-collection-with-trials.html">
   Docs about this</a> are under the "Advanced" section.

   ### View charts #

   ### Export from ARTIK #

<hr />

### Samsung Social #

<a target="_blank" href="https://twitter.com/@ARTIKCLoud/">
Twitter: @ARTIKCLoud</a>

Email: <a target="_blank" href="mailto:developer@artik.cloud">developer@artik.cloud</a><br />
answered by Developer Evangelists<br />
<a target="_blank" href="https://www.linkedin.com/in/jswatton/">
   Jeanine (Swatton) Jue</a>

* <a target="_blank" href="https://www.linkedin.com/in/yujingwu">
   Dr. Yujing Wu</a> (@yujingwu)

LinkedIn shows Samsung America being based in Seattle and Bellevue, Washington.
Smart Home in Mountain View, California.
Home Appliances in Rigefield Park, New Jersey and Minneapolis, Minnesota.

*  <a target="_blank" href="https://www.artik.io/blog/cloud/">
   artik.io/blog/cloud</a>
   is the user forum.





## More on IoT #

This is one of a series on IoT:

{% include iot_links.html %}
