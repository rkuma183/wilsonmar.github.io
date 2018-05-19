---
layout: post
title: "Testing AI"
excerpt: "What can possibly go wrong with robots smarter than humans?"
tags: [Python, Machine Learning]
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

{% include _toc.html %}

## Humans are limited and replaceable

While many organizations are still working toward a <strong>"mobile-first"</strong>
approach to design (rather than "desktop-first" or "mainframe-first" design),
some companies at the "bleeding edge" are moving to
<strong>"AI first"</strong> design.

For example, Foxconn, is now assemblying iPhones using most mechanical robots rather than human robots.
Tesla, BMW, and other auto manufacturers make heavy use of mechanical robots.

Simerlerly, Uber drivers are human until they are replaced by driverless cars.

Robots are at par with Olympic atheletes in
<a target="_blank" href="https://www.kuka.com/en-de/about-kuka/brand/timo-boll-the-duel/">
table tennis</a>.

<a target="_blank" href="https://www.forbes.com/sites/bernardmarr/2017/01/30/grammy-nominee-alex-da-kid-creates-hit-record-using-machine-learning/#4b2a311e2cf9">
Hit songs are written</a> with emotional insights gained from
scraping millions of conversations, newspaper headlines and speeches”
"Not Easy" reached number four in the iTunes Hot Tracks chart, and number six in the alternative chart, within 48 hours of its release.

In offices, the trend is to replace people reading lines on screens.
Instead of creating lines on various charts for analysis by people 
   to make decisions,
   computers are making decisions.

> "Machines will be capable, within 20 years, of doing any work a man can do." 
--Herbert Simon (1916-2001), Nobel Laureate

This is because a human can only focus on a few things at a time.

Because humans cannot respond quick enough,
instead of sending alerts for people to take action,
computers are beginning to take action automatically.

Self-driving cars by Tesla, comma.ai, and others
are a manifestation of this trend.

A lot can also happen in a few seconds within a computer.
So vigilant actions such as <a target="_blank" href="http://www.csoonline.com/article/3163458/security/how-ai-is-stopping-criminal-hacking-in-real-time.html">scanning for malware</a>
need to be done <strong>real-time</strong>.

A program can look for patterns in behavior and alert people to new threats detected.

In operation of computers, <strong>configuration settings</strong>
are increasingly being updated by programs 
instead of people <strong>editing</strong> files.

The point of these apocalyptic pronouncements is that AI and Machine Learning will probaly
not be embrased with open arms in organizations where executive see their human army
with disdain.

To reduce the likelihood of robots being undermined by the human workforce,
management needs to <strong>prove</strong> that it's not a "zero sum game" but that rising demand for
services would result only in planned displacement of people to different human roles.

Those different roles are available only when the organization is growing and will continue to grow.

## No rules

Traditionally, programmers hand-code rules to detect and respond to known threats.

But this has not kept up.

AI (neural networks in particular) 
can now discover, in real-time, 
threats such as malware installation, phishing attacks, and brute-force intrusions
which <strong>programmers did not anticipate</strong>.

They can do that because Big Data systems enable the analysis of massive floods of data quickly.
Many computers in the cloud (with fast Google Fiber network links) 
now process data faster than in the past.

The increased scope of AI's processing capabilities now means it can 
analyze many more variables quickly.
For example, to identify malware, an AI program can quickly scan every email for phising by
looking for clues such as the originating IP address, word choice and phrasing, 
and many other factors.

## Predictions from Swarm

AI can be designed to make <strong>prediction</strong> 
based on data analyzed.

Startup Unanimous A.I. (<a target="_blank" href="http://unu.ai/what-is-unu/">uni.ai</a>) 
has, since 2015, been making accurate predictions like who will win contests
such as the Superbowl, March Madness, US presidential debates, the Kentucky Derby superfecta, Academy Awards, etc.
It has been more accurate than individual experts.

Its software platform (called UNU) milks conclusions not from algorithms, but
from the "collective wisdom" 
of group of <strong>breathing people</strong> who
influence each other by their vote, in real-time, like a Ouiji board.
(
<img src="https://tr1.cbsistatic.com/hub/i/2017/02/24/a92880f2-212c-4803-b6bd-f4e0f4de67ba/d865deed94d9ad5d8c68778d636a2c58/qqz8bt9.gif" alt="qqz8bt9.gif">


## The role of humans

In the above scenarios, the role of human operators is to
make sure the data sets fed into an AI engine are accurate and robust. 

Data quality is more important than ever to weed out <strong>false positives</strong>.
The old adage "garbage in garbage out" applies even more today.
Systems can only be as intelligent as the data it analyzes. 

More importantly, <strong>good AI adapts</strong> rules to deal with new conditions (threats).

AI may do that by analyzing judgements human experts make.


## "Sophomoric"

<a target="_blank" href="https://www.youtube.com/watch?v=M2IebCN9Ht4">
VIDEO: Deep Neural Networks are Easily Fooled</a>
by Evolving AI Lab

When an early-model Tay chatbot was first introduced in 2015,
Microsoft shut it down a week after launch because
it began spewing out racist and sexist texts
because it lacked the filter that most human kids learn from parents.


## Good enough, isn't

Another difference with AI is that testing cannot achieve one-to-one correspondance between
input requirements and resulting outcomes.

This is because the fundamental approach to Machine Learning is essentially <strong>guesswork</strong>.
This is why people celebrated when 90% accuracy was achieved.

Machine Learning does not approach problems like a double-entry accounting system,
where dollars and cents are supposed to balance out every time.

> One does not bring an accounting system to a gunfight playing first-person shooter games.

Artificial Intelligence programs have beaten world champions in Jeopardy, chess, go, poker, and other games because of algorithms which aim to <strong>learn new rules rather than following rules mechanically</strong>. 

The assumed standard for production deployment among AI today seems to be if the machine can beat the best humans, it's good enough for everyone.

PROTIP: Define the <strong>hard requirements</strong> for a system, and test to ensure it's met, regardless of the technology used to build it.


## Don't just split data for evaluation

The now standard approach to testing AI is to divide the universe of a large dataset into two groups.
Usually 70% of the dataset is used for training and
the remaining 30% of the dataset is reserved for evaluating the training.

But I argue here that this is not enough.

PROTIP: Engineer "sythetic" outlier examples among the data used to evaulate the trained model.
This is what testers have always done.

The case in point is an AI system that is about as serious as it gets -- 
the system that recommends to judges how long a sentence to give convicts.
That system was used for years before an investigative reporter (from Propublica) analyzed the <strong>impact</strong> discovered that African Americans and the poor were systematically given harsher sentences than whites and well-to-do citizens.

"Garbage in, garbgse out" still applies here.

## Systematically evaluate for bias

One aspect of making judgement about the efficacy of AI results is analyzing whether it has <strong>biases</strong> against factors that were <strong>not part of data processed by the AI system</strong>. 

Race, gender, disability status, and other basis for discrimination should not be considered for hiring.
But the information is collected along with every job application so that bias can be analyzed later.

PROTIP: Collect data that can possibly bias even though it is not among data processed by Machine Learning.

Again, one cannot approach evaulating the <strong>total impact</strong> of an AI system simply by looking at only the data the AI system used.

Working with data "outside the system" is the "creative" role of "higher thinking" which humans can do well.

## Cultural conditions

But humans need to be emboldened by management to be bold enough to recognize and publicly name "elephants in the room".

An organization's "cultural history" can and often does limit whether its members feel enabled to speak up.


## Normalizing Data

<a target="_blank" href="https://docs.microsoft.com/en-us/azure/machine-learning/studio-module-reference/normalize-data">https://docs.microsoft.com/en-us/azure/machine-learning/studio-module-reference/normalize-data</a></p>

<a target="_blank" href="http://howto.commetrics.com/methodology/statistics/normalization/">http://howto.commetrics.com/methodology/statistics/normalization/</a></p>


<a target="_blank"  href="https://reference.wolfram.com/language/ref/Tanh.html">
https://reference.wolfram.com/language/ref/Tanh.html</a>
TanH gives the hyperbolic tangent of z
based on the natural logarithm of a rational number.

<p>ZScore<br />
<a target="_blank"  href="http://stattrek.com/statistics/dictionary.aspx?definition=z-score">http://stattrek.com/statistics/dictionary.aspx?definition=z-score</a><br />


### Min Max

<a target="_blank"  href="https://www.quora.com/What-is-the-meaning-of-min-max-normalization">https://www.quora.com/What-is-the-meaning-of-min-max-normalization</a>

### PCA


PCA let you train a model using existing imbalanced data.

<a target="_blank"  href="https://docs.microsoft.com/en-us/azure/machine-learning/studio-module-reference/principal-component-analysis">https://docs.microsoft.com/en-us/azure/machine-learning/studio-module-reference/principal-component-analysis</a>
Creates an anomaly detection model using Principal Component Analysis

<a target="_blank" href="https://stackoverflow.com/questions/9590114/importance-of-pca-or-svd-in-machine-learning">
https://stackoverflow.com/questions/9590114/importance-of-pca-or-svd-in-machine-learning</a>


### Singular Value Decomposition (SVD)

<a target="_blank" href="http://andrew.gibiansky.com/blog/mathematics/cool-linear-algebra-singular-value-decomposition/">http://andrew.gibiansky.com/blog/mathematics/cool-linear-algebra-singular-value-decomposition/</a>

### Canonical-correlation analysis (CCA)

<a target="_blank" href="https://en.wikipedia.org/wiki/Canonical_correlation">
https://en.wikipedia.org/wiki/Canonical_correlation</a>

<a href="http://andrew.gibiansky.com/blog/mathematics/cool-linear-algebra-singular-value-decomposition/">http://andrew.gibiansky.com/blog/mathematics/cool-linear-algebra-singular-value-decomposition/</a>

### Develop Machine Learning Models

<p>Team Data Science<br />
<a target="_blank"  href="https://docs.microsoft.com/fi-fi/azure/machine-learning/team-data-science-process/python-data-access">https://docs.microsoft.com/fi-fi/azure/machine-learning/team-data-science-process/python-data-access</a></p>

### K-Means

<a target="_blank"  href="https://www.datascience.com/blog/k-means-clustering">https://www.datascience.com/blog/k-means-clustering</a></p>

### Confusion Matrix

<a target="_blank"  href="http://www.dataschool.io/simple-guide-to-confusion-matrix-terminology/">http://www.dataschool.io/simple-guide-to-confusion-matrix-terminology/</a>

<a target="_blank"  href="https://en.wikipedia.org/wiki/Confusion_matrix">https://en.wikipedia.org/wiki/Confusion_matrix</a>

### F1 score

<a target="_blank"  href="https://en.wikipedia.org/wiki/F1_score">https://en.wikipedia.org/wiki/F1_score</a>

### Ordinal Regression

<a target="_blank"  href="https://en.wikipedia.org/wiki/Ordinal_regression">https://en.wikipedia.org/wiki/Ordinal_regression</a>

### Poisson regression

<a target="_blank"  href="https://en.wikipedia.org/wiki/Poisson_regression">https://en.wikipedia.org/wiki/Poisson_regression</a>

### Mean Absolute Error and Root Mean Squared Error

<a target="_blank"  href="http://www.eumetrain.org/data/4/451/english/msg/ver_cont_var/uos3/uos3_ko1.htm">http://www.eumetrain.org/data/4/451/english/msg/ver_cont_var/uos3/uos3_ko1.htm</a>

### Cross Validation

<a target="_blank" href="https://towardsdatascience.com/cross-validation-in-machine-learning-72924a69872f">https://towardsdatascience.com/cross-validation-in-machine-learning-72924a69872f</a>

## Output

Model training produces a <strong>checkpoint file</strong> that contains a 
model which already has parameters output from traning.
Using checkpoint files means we can get straight to applying the model.

## Technical Debt

https://www.ca.com/us/rewrite/articles/agile/accelerating-velocity-and-customer-value-with-agile-and-devops.register.html


## Coding

https://www.youtube.com/watch?v=KkwX7FkLfug
Neural Net in C++ Tutorial on Vimeo
vinh nguyen

https://www.youtube.com/watch?v=AyzOUbkUf3M
The Next Generation of Neural Networks
GoogleTechTalks

https://www.youtube.com/watch?v=oYbVFhK_olY
Deep Learning with Neural Networks and TensorFlow Introduction
by sentdex

https://www.youtube.com/watch?v=ujBiM9stPHU
Neural Network Calculation (Part 1): Feedforward Structure
Jeff Heaton


## OpenAI

https://www.amazon.com/Deep-Learning-Adaptive-Computation-Machine/dp/0262035618
Deep Learning (Adaptive Computation and Machine Learning series)</a>
by Ian Goodfellow, 	
Yoshua Bengio, and 
Aaron Courville (of OpenAI)
"is the only comprehensive book on the subject." 


## Articles

http://www.computerworld.com/article/3163145/data-analytics/how-to-root-out-bias-in-your-data.html

https://medium.com/@jaredpolivka/machine-learning-with-humans-in-the-loop-lessons-from-stitchfix-300672904f80#.4n5ub8pt6


https://www.youtube.com/watch?v=zwm2C3V35Fw
Artificial Intelligence - The Apex Technology of the Information Age: Goldman Sachs' Heath Terry
2:41 general talk


## More

This is one of a series on AI, Machine Learning, Deep Learning, Robotics, and Analytics:

{% include ai_links.html %}
