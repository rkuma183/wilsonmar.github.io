---
layout: post
title: "508 Accessibility - for blind and visually impaired"
excerpt: "Information to help tools work for all users"
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


   <a target="_blank" href="http://libguides.gallaudet.edu/content.php?pid=119476&sid=1029190" 
                         alt="Statistics of deaf population">195,697,202 people in the US are deaf.</a>

   <a target="_blank" href="http://www.who.int/mediacentre/factsheets/fs282/en/" 
                         alt="38 million blind is statistics for Visually impaired population">38 million blind in US, 246 with low vision, 285 million worldwide are vision impaired.</a>
						 
   <a target="_blank" href="https://nfb.org/blindness-statistics" 
                         alt="Statistics of Blind impaired population">7,327,800 blind people since 2013</a>
						 
   <a target="_blank" href="http://www.colourblindawareness.org/colour-blindness/" 
                         alt="Statistics of color blind population">2.7 million people (mostly male) have some form of color blindness.</a>

## Validate websites for errors or warnings
  
<a target="_blank" href="http://www.powermapper.com/products/sortsite/ads/acc-section-508/?gclid=CMfzl_Lg38wCFVUkgQodQ8YA4A" 
                         alt="SortSite evaluates websites for accessibility">
PowerMapper's SortSite</a> accessibility tool audits an entire site for compliance with web accessibility 
standards without the grind of manual testing. Enter the name of your website and click "Test Site". After done, click "View Report".
   
<a target="_blank" href="http://sipt07.si.ehu.es/evalaccess2/index.html" 
      alt="EvalAccess evaluates a website for Accessibility based on standards compliance.">EvalAccess evaluates web accessibility </a> 
is a Free Web Service tool.  It shows errors and warnings based on Priority 1, 2, 3 and results of errors and warnings per priority. It provides a description of what it believes is wrong,
the HTML element or attribute with issue and line of code.  It may not be the most user-friendly access tool, it can help designers and developers to clean up their site:
   
<a target="_blank" href="https://fae.disability.illinois.edu/anonymous/?Anonymous%20Report=/" 
      alt="Functional Accessibility Evaluator tool evaluates a website for Accessibility based on 508 standards.">Functional Accessibility Evaluator referred to FAE </a>		
evaluates website based on 508 Guidelines**.  There are five categories: Navigation and Orientation, Text Equivalents, Scripting, Styling and HTML Standards.  The overall performance
per category is a percentage, divided between Pass, Warning and Fail thus enabling specifica areas with the most issues:

<a target="_blank" href="http://achecker.ca/checker/" 
      alt="AChecker checks single HTML pages for accessibility standards.">AChecker tool checks single HTML page for conformance with accessibility standards. </a> 
				 
> Let me help you evaluate these tools. Contact me!


## Checklists for 508 Compliance

<a target="_blank" href="http://www.hhs.gov/web/section-508/making-files-accessible/checklist/ppt/index.html" 
                         alt="Checklist for evaluating PowerPoint documents">Checklist for Web Content Accessibility Guidelines </a>
   
<a target="_blank" href="http://www.hhs.gov/web/section-508/making-files-accessible/checklist/html/index.html" 
                         alt="Checklist for improving HTML code">Checklist for HTML Accessibility</a>

<a target="_blank" href="http://www.hhs.gov/web/section-508/making-files-accessible/checklist/pdf/index.html" 
                         alt="Checklist for evaluating PDF documents">Checklist for PDF File 508 Compliance</a>
						 
<a target="_blank" href="http://www.hhs.gov/web/section-508/making-files-accessible/checklist/excel/index.html" 
                         alt="Checklist for changing Excel documents">Checklist of Excel Document 508 Compliance</a>
                         
<a target="_blank" href="http://www.hhs.gov/web/section-508/making-files-accessible/checklist/ppt/index.html" 
                         alt="Checklist for evaluating PowerPoint documents">Checklist for PowerPoint Document 508 Compliance</a>
   
<a target="_blank" href="http://webaim.org/standards/508/checklist" 
                         alt="Checklist listing the 508 standards and Pass and Fail criteria">Checklist for 508 Standards with Pass and Fail criteria</a>
   
## Firefox and Chrome Add-ons

<a target="_blank"https://chrome.google.com/webstore/detail/accessibility-developer-t/fpkknkljclfencbdbgkenhalefipecmb?hl=en" 
                         alt="Extension that can be added to Google Chrome to help developers with Accessibility errors in an audit">Accessibility Developer Tools extension for Chrome </a>
adds an Accessibility audit and an Accessibility sidebar pane in the Elements tab to your Chrome Develop Tools.  To use the audit: go to the Audits tab and click Run.  The audit results will appear
as a list of rules which are violated by the page with one or more elements on the page shown as a result for each rule. :

<a target="_blank"https://chrome.google.com/webstore/detail/axe/lhdoppojpmngadmnindnejefpokejbdd" 
                         alt="aXe is an Extension added to Chrome for developers with no false positive for Accessibility issues">aXe is Accessibility defects extension for Chrome.</a> 		
Automated testing tools must return zero false positives, so that you know what problems you must fix.  This extension uses aXe javascript library 
and is the third generation of accessibility rules for HTML-based user interfaces and is open source.
    				 
   
## Link or Sanity Validation

<a target="_blank" href="https://validator.w3.org/" 
      alt="Checklist for evaluating links on a web page">Markup HTML and XHTML Validation Tool</a>

<a target="_blank" href="https://validator.w3.org/checklink" 
      alt="Checklist for evaluating links on a web page">Link Checker Open Source </a>	  
looks for issues in links, anchors and referenced objects on a webpage, CSS style sheet. Enter your webpage, click Summary Only and Check linked documents recursively, change depth to 1 or 2/
    
<a target="_blank" href="https://www.totalvalidator.com/index.html" 
      alt="Free Tool to check HTML, accessibility validator, spell check, and broken links validator for a website">Total Validator is FREE HTML Validator </a>		
an accessibility validator, spell checker, broken links checker. This tool can be downloaded for Windows, Mac, Linux, and browsers like Google Chrome and Firefox.
    

## Mobile device tool validation

<a target="_blank" href="https://validator.w3.org/mobile/" 
      alt="Tool on checks website for mobile friendliness">W3c mobileOK checker</a>
performs tests to determine level of mobile friendliness and compatibility**. Enter the web address you want evaluated.
It counts failures broken down by severity and category of failures.
It will break down each error by severity, description, best practice that failed along with details as to why, how, where when it can identify it 
and more information to explain the severity of that issue addressed. Drill down next to Where, it will either give you the
link where it found the error or every link that triggered the error: 
    
<a target="_blank" href="http://ready.mobi/" 
      alt="Tool on web that evaluates website for mobile users">mobiReady checks to see if your website works on multiple size devices </a>
including 1024x768, 375x667, 320x533 and 240x320.
    

## Assisted Devices for Hearing-impaired or Visually-impaired

<a target="_blank" href="http://www.nvaccess.org/download/" 
      alt="Free Tool for blind and visually impaired to read text on screen translated into 43 languages in 120 countries">NonVisual Desktop Access also known as NVDA is Free and Open Source </a>
and enables blind and visually impaired people to use computers using computerized voice. You can control what is read to you by moving the cursor to the relevent area of text with a mouse or the arrows on the 
keyboard.  NVDA provides education and employment for many blind people.  NVDA also provides access to social networking, online shopping, banking
and news. NVDA has been translated into 43 languages and is used by more than 120 countries.
    
<a target="_blank" href="http://www.windoweyesforoffice.com/" 
      alt="Window Eyes is a Screen Reader free for Microsoft Office 2010, 2013 and 2016 versions">Window Eyes is FREE screen reader for Microsoft products </a>
to provide people who are blind, visually-impaired or print disabled with completely functionality compatible with Microsoft Office 2010, 2013 and 2016.

<a target="_blank href="https://www.nidcd.nih.gov/health/assistive-devices-people-hearing-voice-speech-or-language-disorders"
      alt="Article about Assisted Devices for Hearing, Speech, Voice and Language Impairments">Article discussing various Assisted devices"

## HTML coding for accessibility

1. In URL links provide words to describe what the link is about to the visual impaired. For example:

   ```
   <a alt="One of most well known websites to buy products by auction or buy now at this price" href="http://www.ebay.com">
   ```
   
2. Images should describe the picture using words.  For example:

   ```
   <a alt="blue winter landscape with rainbow" href="URL ...
   ```

3. Turn on captioning in videos on YouTube or Vimeo:

   ```
   <a_target="_blank" href="URL" cc_load_policy="1"></a>
   ```
   
4. Add label for type="radio", for example:

   ```
   <fieldset>
    <h1>Salutation</h1>

    <label for="salutation_mr">Mr <input id="salutation_mr" name="salutation" type="radio" value="mr"><label>

    <label for="salutation_mrs">Mrs <input id="salutation_mrs" name="salutation" type="radio" value="mrs"><label>

    <label for="salutation_miss">Miss <input id="salutation_miss" name="salutation" type="radio" value="miss"><label>

    <label for="salutation_ms">Ms <input id="salutation_miss" name="salutation" type="radio" value="ms"><label>
</fieldset>
   ```
5. Emphasis do not use italic as it causes reading issues, better to use es{..}  or  strong{...}

   ```
   strong{
   font-weight: bold;
   }
   ```
   
6. Anytime you use a website, make sure if it should be http:// or https://
7. Anytime you use a website, check to see if there should be a / at the end of the website name
8. Anytime the link your using redirects, it slows down the application, update the link to the correct location periodically.
9. <a target="_blank" href="http://ready.mobi/" 
      alt="Tool on web that evaluates website for mobile users">Accessible Techniques for HTML Tables </a> 
