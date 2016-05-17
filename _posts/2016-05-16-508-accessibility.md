---
layout: post
title: "508 Accessibility - for blind and visually impaired"
excerpt: "Informationt to help tools work for all users"
tags: [HTML, personalization, jekyll]
author: cindy_garlick
image:
  feature: https://cloud.githubusercontent.com/assets/300046/14624073/7b96364a-0594-11e6-9643-06decef9dbfd.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This post explains how to verify whether websites are "508 Compliant". 
Compliance is to regulations requiring websites to be accessible to the deaf, hard-of-hearing, and visually impaired.

## Why? #

This is a bigger issue than many think:

* 195,697,202 people in the US are deaf.
   <a target="_blank" href="http://libguides.gallaudet.edu/content.php?pid=119476&sid=1029190" 
                         alt="Statistics of deaf population">*</a>

* 39 million people in the US are blind, 246 have low vision, 285 million worldwide are visually impaired.
   <a target="_blank" href="http://www.who.int/mediacentre/factsheets/fs282/en/" 
                         alt="Statistics of Visually impaired population">*</a>

??? Blind statistics             shows 7,327,800 people since 2013:
   * <a target="_blank" href="https://nfb.org/blindness-statistics" 
                         alt="Statistics of Blind impaired population">*</a>

* 2.7 million people (mostly male) have some form of color blindness.
   <a target="_blank" href="http://www.colourblindawareness.org/colour-blindness/" 
                         alt="Statistics of color blind population">*</a>

## Validate websites for errors or warnings
  
<a target="_blank" href="http://www.powermapper.com/products/sortsite/ads/acc-section-508/?gclid=CMfzl_Lg38wCFVUkgQodQ8YA4A" 
                         alt="SortSite evaluates websites for accessibility">
PowerMapper's SortSite</a> accessibility tool audits an entire site for compliance with web accessibility 
standards without the grind of manual testing. Enter the name of your website and click "Test Site". After done, click "View Report".
   
**EvalAccess is a Free Web Service tool for evaluating web accessibility**.  It shows errors and warnings based on Priority 1, 2, 3
and gives you results of how many errors and warnings it found per priority. It provides a description of what it believes is wrong,
the HTML element or attribute with the issue and which line around where it is found in the code.  It may not be the most user-friendly
access tool, it can help designers and developers to clean up their site:
   * <a target="_blank" href="http://sipt07.si.ehu.es/evalaccess2/index.html" 
                         alt="EvalAccess evaluates a website for Accessibility based on standards compliance.">Dingus</a>

*Functional Accessibility Evaluator referred to FAE evaluates a website based on 508 Guidelines**.  The results are broken into five
categories: Navigation and Orientation, Text Equivalents, Scripting, Styling and HTML Standards.  The judging of the overall performance
in each category is a percentage, divided between Pass, Warning and Fail enabling focusing on specifica areas with the most issues. Only 
the issues with Violation, Manual Check required and Passed give you further details.:
   * <a target="_blank" href="https://fae.disability.illinois.edu/anonymous/?Anonymous%20Report=/" 
                         alt="Functional Accessibility Evaluator tool evaluates a website for Accessibility based on 508 standards.">Dingus</a>						 

> Let me help you evaluate these tools. Contact me!


## Checklists for 508 Compliance

Checklist for Web Content Accessibility Guidelines that provides checkpoints to evaluate for compliance:
   * <a target="_blank" href="http://www.hhs.gov/web/section-508/making-files-accessible/checklist/ppt/index.html" 
                         alt="Checklist for evaluating PowerPoint documents">Dingus</a>
Checklist for HTML Accessibility:
   * <a target="_blank" href="http://www.hhs.gov/web/section-508/making-files-accessible/checklist/html/index.html" 
                         alt="Checklist for improving HTML code">Dingus</a>
Checklist for PDF File 508 Compliance:
   * <a target="_blank" href="http://www.hhs.gov/web/section-508/making-files-accessible/checklist/pdf/index.html" 
                         alt="Checklist for evaluating PDF documents">Dingus</a>
Checklist of Excel Document 508 Compliance:
   * <a target="_blank" href="http://www.hhs.gov/web/section-508/making-files-accessible/checklist/excel/index.html" 
                         alt="Checklist for changing Excel documents">Dingus</a>
Checklist for PowerPoint Document 508 Compliance:
   * <a target="_blank" href="http://www.hhs.gov/web/section-508/making-files-accessible/checklist/ppt/index.html" 
                         alt="Checklist for evaluating PowerPoint documents">Dingus</a>
Checklist for 508 Standards with Pass and Fail criteria:
   * <a target="_blank" href="http://webaim.org/standards/508/checklist" 
                         alt="Checklist listing the 508 standards and Pass and Fail criteria">Dingus</a>
   
## Firefox and Chrome Add-ons

**Accessibility Developer Tools extension for Chrome** which will add an Accessibility audit and an Accessibility sidebar pane in the
Elements tab to your Chrome Develop Tools.  To use the audit: go to the Audits tab and click Run.  The audit results will appear
as a list of rules which are violated by the page with one or more elements on the page shown as a result for each rule. :
   * <a target="_blank"https://chrome.google.com/webstore/detail/accessibility-developer-t/fpkknkljclfencbdbgkenhalefipecmb?hl=en" 
                         alt="Extension that can be added to Google Chrome to help developers with Accessibility errors in an audit">Dingus</a>

**aXe is an extension for Chrome** which will find Accessibility defects on your web site by using the aXe Chrome extension.  Automated testing
tools must return zero false positives, so that you know what problems you must fix.  They must also be lightweight and fast without requiring
external resources.  This extension is based on the aXe javascript library and is the third generation of accessibility rules for HTML-based
user interfaces that differentiates itself from other approaches and rules and is open source.:
    * <a target="_blank"https://chrome.google.com/webstore/detail/axe/lhdoppojpmngadmnindnejefpokejbdd" 
                         alt="aXe is an Extension added to Chrome for developers with no false positive for Accessibility issues">Dingus</a> 						 
   
## Tools to check links and sanity on a webpage

**Markup Validation Tool** checks the markup validity for HTML and XHTML pages:
   * <a target="_blank" href="https://validator.w3.org/" 
                         alt="Checklist for evaluating links on a web page">Dingus</a>

**Link Checker Open Source** looks for issues in links, anchors and referenced objects on a webpage, CSS style sheet.
Enter your webpage, click Summary Only and Check linked documents recursively, change depth to 1:
   * <a target="_blank" href="https://validator.w3.org/checklink" 
                         alt="Checklist for evaluating links on a web page">Dingus</a>
						 
**Total Validator** is a Free tool with HTML validator, an accessibility validator, spell checker, broken links checker. 
This tool can be downloaded for Windows, Mac, Linux, and for browsers such as Google Chrome and Firefox.
   * <a target="_blank" href="https://www.totalvalidator.com/index.html" 
                         alt="Free Tool to check HTML, accessibility validator, spell check, and broken links validator for a website">Dingus</a>


## Tool to check website for mobile devices

**W3c mobileOK checker performs tests to determine level of mobile friendliness and compatibility**. Enter the web address you want evaluated.
It will provide a count of failures broken down by severity and category of failures at the top of report.
It will break down each error by severity, description, best practice that failed along with details as to why, how, where when it can identify it 
and more information to explain the severity of that issue addressed. WHen you click on the arrow to drill down next to Where, it will either give you the
link where it found the error or every link that triggered the error: 
  * <a target="_blank" href="https://validator.w3.org/mobile/" 
                         alt="Tool on checks website for mobile friendliness">Dingus</a>

**mobiReady checks to see if your website works on multiple size devices** including 1024x768, 375x667, 320x533 and 240x320.
  * <a target="_blank" href="http://ready.mobi/" 
                         alt="Tool on web that evaluates website for mobile users">Dingus</a>

## Tools which can be used by Hearing-impaired or Visually-impaired

**NonVisual Desktop Access also known as NVDA is Free and Open Source** and enables blind and visually impaired people to use computers.  It reads the text on the screen in a 
computerized voice.  You can control what is read to you by moving the cursor to the relevent area of text with a mouse or the arrows on the 
keyboard.  NVDA provides education and employment for many blind people.  It also provides access to social networking, online shopping, banking
and news. NVDA has been translated into 43 languages and is used by more than 120 countries.
   * <a target="_blank" href="http://www.nvaccess.org/download/" 
                         alt="Free Tool for blind and visually impaired to read text on screen by users for users to enjoy">Dingus</a>

**Window-Eyes - has a FREE screen reader for Windows PC to provide people who are blind, visually-impaired or print disabled with completely
functionality compatible with Microsoft Office 2010, 2013 and 2016.
  * <a target="_blank" href="http://www.windoweyesforoffice.com/" 
                         alt="Screen Reader free for Microsoft Office 2010, 2013 and 2016 versions">Dingus</a>

## HTML coding for accessibility

1. In URL links provide words to describe what the link is about to the visual impaired. For example:

   ```
   <a alt="blue winter landscape with rainbow" href="URL ...
   ```

2. Turn on captioning in videos on YouTube or Vimeo:

   ```
   <a_target="_blank" href="URL" cc_load_policy="1"></a>
   ```

3. Anytime you use a website, make sure if it should be http:// or https://
4. Anytime you use a website, check to see if there should be a / at the end of the website name
5. Anytime the link your using redirects, it slows down the application, update the link to the correct location.

