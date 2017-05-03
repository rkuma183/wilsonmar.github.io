---
layout: post
title: "Amazon Lex (AI Chatbots)"
excerpt: "Make a robot talk to you"
tags: [apple, mac, setup]
shorturl: "https://goo.gl/fQ1Kl0"
image:
  feature: https://cloud.githubusercontent.com/assets/300046/14583248/4b20c578-03d9-11e6-8f7a-c860b666bc73.jpg
  credit: Wall Street Journal
  creditlink: http://graphics.wsj.com/job-market-tracker/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

Amazon Lex works through an Alexa Echo and Alexa's natural language understanding
to hold <strong>natural voice conversational interactions</strong> 
with yoru chatbot programs running on Amazon Lamba (serverless) programs.

The framework remembers the user's context (what occurred before
and user's perferences).

The marketing page for Lex is at:

   <a target="_blank" href="https://aws.amazon.com/lex/">
   https://aws.amazon.com/lex</a>

   Videos:

   * <a target="_blank" href="https://www.youtube.com/watch?v=tAKbXEsZ4Iw">
   Introducing Amazon Lex: Service for Building Voice/Text Chatbots</a> [20:20] Mar 6, 2017
   by Hira Niranjan, Solutions Architect

   * <a target="_blank" href="https://www.youtube.com/watch?v=l6EfeKc1Ark">
   Building Serverless Chat Bots</a> Sep 8, 2016 
   by Leo Zhandanovsky, Amazon Solutions Architect
   says "ChatOps is an approach to communicate that allows teams to collaborate and manage their (work) from a chat room". 

   * <a target="_blank" href="https://www.youtube.com/watch?v=-8bSCyPAE44">
   Announcing Amazon Lex - January 2017</a> [28:32]
   by Vikram Anbazhagan in AWS Online Tech Talks

   * <a target="_blank" href="https://www.youtube.com/watch?v=I5OlTMLinio">
   Introducing Amazon Lex (MAC304)</a>
   at AWS re:Invent 2016

   * <a target="_blank" href="https://www.youtube.com/watch?v=iVmsEsBKnL8">
   Enhance Your Mobile Apps with AI Using Amazon Lex (MBL307)</a>
   at AWS re:Invent 2016

   * awschatbot.devpost.com


## Conversational Commerce

Instead of using an Alexa program name, users can say:

   * "Alexa, I would like to pick up flowers"
   * "Alexa, I would like to order a ride"
   * "Alexa, I would like to see a dentist"

   * https://www.youtube.com/watch?v=Yj9QSTofUF4
   Conversational commerce (not just Lex)

Competitors include:

  * <a target="_blank" href="https://www.youtube.com/watch?v=MTCc4d-RXP0">
  IBM Watson Conversation</a>


## Create a Lex chatbot

   https://www.youtube.com/watch?v=7uG9cuxNo5k&list=PLMOAUQOzO6UxpMbGpwG8WGRKgGCNrm0Ix

0. Lex Console

   <a target="_blank" href="https://console.aws.amazon.com/lex/">
   https://console.aws.amazon.com/lex</a>

   Alternately, you can select Lex from the full Services menu among 

   Amazon's AI services at
   <a target="_blank" href="https://aws.amazon.com/amazon-ai/">
   https://aws.amazon.com/amazon-ai</a>


### Some Personality

I'd like to put in some <strong>personality</strong>, like I'm having a conversation with a comic:

   * Insults from Don Rickles or Sheakespeare or Mark Twain.
   * Self-Deprecating humor like Rodney Dangerfield.
   * Funny Observerations like from Jerry Seinfeld or Sarah Silverman or other comics.
   * Dead-pan like that "Bueller" guy.
   * Sexual inuendos like from Mae West.

   * A British (butler) accent with <strong>sarcasm</strong> as I'm doing a banking task.

   * An <strong>encouraging</strong> response like a grandma.


## In Settings:

### Slots - Usage

AWS Lambda runs bot code for tasks such as data retrieval, updates, and custom logic.



### Voices

   Female:

   * Joanna sounds the most natural to me.
   * Salli
   * Kimberly has a bit of a raspy voice
   * Kendra is a deeper voice, the most "athoratative" to me.
   * Ivy sounds like a young girl

   Male:

   * Justin sounds like a young boy
   * Joey 

   Initial release are in English US voices, a subset of voices from 
   https://aws.amazon.com/documentation/polly/
   Amazon Polly is a Text-to-Speech (TTS) cloud service that converts text into lifelike speech.

   https://aws.amazon.com/blogs/aws/polly-text-to-speech-in-47-voices-and-24-languages/

   Used on website https://germanverbs.lang.global/

0. Write a long sentence of your own and hear it pronounced and saved into an mp3 file on:

   <a target="_blank" href="https://console.aws.amazon.com/polly/home/SynthesizeSpeech">
   https://console.aws.amazon.com/polly/home/SynthesizeSpeech</a>

   QUESTION: Can additional custom lexicons be specified like in https://console.aws.amazon.com/polly/home/Lexicons


## Channels

"Channels" send data to other applications, such as Facebook, Slack, or Twilio to send SMS or email.

These all use IAM Role AWSServiceRoleForLexChannels


### Slack channel

Do this first. This is free. And you can keep it private.
It's not behind a firewall/VPN.
It's better and easier than IRC.
It has built-in archival of communications.

0. Get the mobile app for Slack:

  * https://play.google.com/store/apps/details?id=com.Slack&hl=en
  * https://itunes.apple.com/app/slack-team-communication/id618783545

0. Pick an outgoing Slack webhook

   They make use of normal HTTP requests with a JSON payload.

0. Integrate Slack with integrations 

   * When there is a commit to GitHub, send to Slack.

   * PagerDuty, JIRA, NewRelic, DataDog.

   * Meekan.com - schedule meetings
   * Yeobot for SQL queries against AWS account metadata
   * Burnerapp.com SMS/voicemail to slack, two-way
   * Statuspage.io - integrate public and private status feeds

0. Create a Slack channel to receive incoming Slack webhooks:

   https://slack.com/create#email

   Docs: https://get.slack.help/hc/en-us/articles/201402297-Create-a-channel

0. Secure your Slack with two-factor authentication

0. Scope AWS IAM policies


## Facebook 

This is free.

## Twilio to send SMS or email

This costs money.

## Others?

Twitter? Skype? LinkedIn? Yammer? WhatsApp?



## Do it

IAM role
<strong>AWSServiceRoleForLexBots</strong>

