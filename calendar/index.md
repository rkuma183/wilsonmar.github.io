---
layout: page
title: Please send me an appointment
tags: [calendar, contact, Jekyll]
comments: true
image:
# pic white calendar 1900x500-c28.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/16904663/5adbca78-4c57-11e6-9fa7-973731b8927a.jpg
  credit:
  creditlink:
---
{% include _toc.html %}

Pick a time from my <a target="_blank" href="https://www.google.com/calendar/embed?src=wilsonmar%40gmail.com">
<strong>public Google calendar</strong> at<br />
<a target="_blank" href="https://www.google.com/calendar/embed?src=wilsonmar%40gmail.com">
https://www.google.com/calendar/embed?src=wilsonmar%40gmail.com</a>

NOTE: I usually am up by 4 am Pacific Time (5 am Mountain, 6 am Central, 7 am Eastern).

0. The yellow column is today. Scroll to see the red line which marks the current time.

0. Be aware of the time zone at the lower left corner of the screen.

0. Click on the <u><strong>This Week</strong></u> blue link at the upper right corner.

   ![google-calendar-week-256x41](https://cloud.githubusercontent.com/assets/300046/26534343/5618a71c-43f1-11e7-9ea8-d721acb5fc42.png)

0. Switch back and forward between your own calendar and this one to identify a mutually open time.

NOTE: In this calendar I keep only the times I cannot move.
I have a separate calendar I use to plan my day.


## Events #

Next May, I'll be in Orlando, Florida for 
<strong><a target="_blank" href="https://stareast.techwell.com/">
StarEast</a></strong>. It's one of a <a target="_blank" href="https://www.techwell.com/software-conferences/star-software-testing-conferences">
series</a>.

   * <strong><a target="_blank" href="https://starwest.techwell.com/program/tutorial/how-testers-master-git-and-github/">
   Git and GitHub full-day Tuesday</a></strong>.
   You'll leave with a new free blog website!

   * <strong><a target="_blank" href="https://starwest.techwell.com/program/preconference-training/mastering-hp-loadrunner-performance-testing-starwest-2016">
   Performance Testing 2-days Sunday & Monday</a></strong>.

<a target="_blank" href="https://blog.hubspot.com/marketing/google-calendar-invites-in-email-marketing">
NOTE</a>: "Add this to your Google Calendar" links are constructed manually:
   ![calendar-url-709x85](https://user-images.githubusercontent.com/300046/29994825-65e696ea-8f96-11e7-8620-226fe9b8f45c.jpg)


## Update Jekyll Theme with Calendar
The author pane at the left of this theme was updated to add Calendar under the email link.

0. First, I searched for the Calendar icon in FontAwesome (it's "fa-calendar" at http://fontawesome.io/icon/calendar/).

0. Next, had to encode "@" to "%40" in the URL, based on http://shopify.github.io/liquid/filters/replace/.

0. Finally, this was pasted into the <strong>_author-bio.html</strong> file within the <strong>_includes</strong> folder:

   <pre><code>
   &#123;% if author.email %}<a href="https://www.google.com/calendar/embed?src=<br>
      &#123;&#123; author.email | replace: "@", "%40" }}"<br>
      class="author-social" target="_blank"><br>
      &LT;i class="fa fa-fw fa-calendar">&LT;/i> Calendar</a><br>
   &#123;% endif %}
   </code></pre>


## Load .ics files into Google Calendar
If you clicked on a "Add to your calendar" link and ended up receiving an .ics file in your Downloads folder, here's what to do.

If you have Outlook, just click on the file.

If you use Google Calendar, import the .ics file:

0. If a ZIP file, unzip it and import each .ics file individually.

0. Open <a target="_blank" href="https://calendar.google.com/">Google Calendar</a>.

   Note: You can only import from a computer, not a phone or tablet.

0. Click click the Settings gear button at the top right.

0. Select Settings.

0. Click to open the blue <u>Calendars</u> tab.

0. Scroll down to click the blue <u>Import calendars</u> tab.

0. Click <strong>Choose File</strong> to open a dialog.

0. Select the Downloads folder.

0. Sort by the Date Modified if you don't see the .ics file.

0. Click to select the .ics file, then Open.

0. Choose which calendar to add the imported events to. By default, events will be imported into your primary calendar.

0. Click Import.

0. Click Close the dialog.

0. Click the browser's back button (or press Alt+left arrow) to return to the calendar.

0. Switch to the Finder or File Explorer and <strong>delete the .ics file</strong> (Move to Trash on Macs).

NOTE: This is a modification of 
<a target="_blank" href="https://support.google.com/calendar/answer/37118?hl=en">
this article</a>.


## Most Creative Time Each Day

A "chronotype" is the propensity of a person to sleep and wake at particular times during a 24 hour period. It's biologically set.
There is wide variation when various famous creatives go about various aspects of their lives, <a target="_blank" href="https://podio.com/site/creative-routines">
visualized by this</a>, based on the 
<a target="_blank" href="http://masoncurrey.com/Daily-Rituals/">
book Daily Rituals</a> by Mason Currey:

<a target="_blank" href="https://podio.com/site/creative-routines">
<img alt="fig rainbow creative_routines partial" src="https://cloud.githubusercontent.com/assets/300046/14229206/bd6c04d4-f8ea-11e5-900a-b2cde317237b.jpg" width="465" height="201"></a><!-- full 976x532 -->

Which circadian (daily) pattern do you prefer?

The site allows <strong>interactive</strong> selection of specific activities
(sleep, creative work, admin, food/leisure, exercise, other).

<a target="_blank" href="http://www.businessinsider.com/different-chronotypes-have-separate-dna-sleep-cycle-circadian-rhythm-genes-2015-9">
BusinessInsider.com reports that</a>
an individual preference for morning or evening is determined by the <strong>chronotype</strong> of
each person's unique DNA.

<a target="_blank" href="https://www.quora.com/I-want-to-study-but-I-waste-my-whole-day-without-doing-anything-significant-I-really-want-to-study-but-I-am-unable-to-concentrate-What-should-I-do/answer/Nupur-Joshi-1">This response on Quora</a>
recommends "Start waking up at 5 in the morning and drink water immediately"
and write down answers to these daily questions:

1. What did I get done today? 

2. What did I do for my family today?

3. Did I exercise today?

4. Did I care for my friends today?

5. What am I grateful for today?

6. What are the three good things about today?

7. How can I make tomorrow better?

8. How much money did I spend today?

Kinda like a personal scrum.

> If you feel you don't have enough time in the day, stop watching TV and social media.


## Activities by month over 4 years

Within the <a target="_blank" href="http://www.timetoast.com/timelines/the-history-of-the-beatles">full timeline</a> of the Beatles,
the years 1963-66 were the "Beatlemania" years.
<a target="_blank" href="https://mostcontagious.wordpress.com/2010/01/21/the-beatles-visualized-like-never-before/">
This infographic</a> annotates the 
<a target="_blank" href="http://chartingthebeatles.com/#schedule">
orginal concept</a> by Michael Deal 
which illustrates the group's work activities, month-by-month:

<a target="_blank" href="hhttps://mostcontagious.files.wordpress.com/2010/01/beatles.jpg">
<img alt="fig black beatles 4 year schedule" src="https://cloud.githubusercontent.com/assets/300046/14229397/26bc50c4-f8f0-11e5-9a74-879d530b6eef.jpg" width="1297" height="1026"></a>

Over the years, the group did less touring and performing (in green).

> Does this chart say anything else to you?

<hr />

A similar format is used at<br />
<a target="_blank" href="https://timelinestoryteller.com/app/">
https://timelinestoryteller.com/app</a>

<a target="_blank" href="https://www.youtube.com/watch?v=aBi8M3DehQ0">
How Ben Franklin Structured His Day</a>
