---
layout: post
title: "Machine Learning"
excerpt: "Yes, it will be smarter than you"
tags: [HTML, personalization, machine learning, ML]
image:
# feature: pic green matrix hallway 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14623876/07afd066-0593-11e6-933a-2e596511ac67.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

Several organizations are in an arms race in Artificial intelligence.

   * Amazon
   * Google
   * Microsoft 
   <br /><br />

Cloud vendors, especially, are hoping to cash in by charging for processing.

<a target="_blank" href="https://gibhut.com/josephmisiti/awesome-machine-learning/">
awesome-machine-learning</a>
provides many links to resources, so they will not be repeated here.

<a target="_blank" href="https://dato.com/products/create/">
GraphLab Create</a> from Dato 
provides scalable "pre-implemented" ML algorithms 
using Python installed using Anaconda.
Entire courses on its use is at

   * https://www.coursera.org/learn/ml-foundations
   * https://dato.com/learn/userguide/
   * https://dato.com/products/create/docs/
   * https://github.com/learnml/machine-learning-specialization
   * https://www.coursera.org/learn/ml-clustering-and-retrieval/supplement/iF7Ji/software-tools-you-ll-need-for-this-course

When the one-year free license is over, consider 
scikit-learn, also using Python with Anaconda.

For matrix operations, use the <a target="_blank" href="http://www.numpy.org/">
Numpy</a> open-source Python library for fast performance with data that fits in memory.
<a target="_blank" href="https://docs.scipy.org/doc/numpy-dev/user/quickstart.html">
Quickstart</a>.

## Initiatives #

Below are various initiatives

<a target="_blank" href="https://algorithmia.com/algorithms">algorithmia.com</a>

## Conversions

   Some utilities may involve conventional lookups of data:

   * https://algorithmia.com/algorithms/alixaxel/CoordinatesToTimezone

   * https://algorithmia.com/algorithms/Geo/ZipData

   * https://algorithmia.com/algorithms/Geo/ZipToState

   * https://algorithmia.com/algorithms/Geo/LatLongDistance

   * https://algorithmia.com/algorithms/Geo/LatLongToUTM

   * https://algorithmia.com/algorithms/util/ip2hostname

   * https://algorithmia.com/algorithms/opencv/ChangeImageFormat (from jpg to png)

## Translation

   * Google Translate API 
   has been working on websites for years.

## Image Recognition

   * https://algorithmia.com/algorithms/z/ColorPalettefromImage

   * Google Cloud Vision API

   * DJI on 

   * https://algorithmia.com/algorithms/opencv/FaceDetection
  then https://algorithmia.com/algorithms/opencv/CensorFace

   * https://algorithmia.com/algorithms/ocr/RecognizeCharacters OCR

   Some of these make use of <strong>OpenCV</strong> (CV = Computer Vision).

## Voice Recognition

   * <a target="_blank" href="https://cloud.google.com/speech/">
   Google Cloud Speech API</a>, which powers Google’s own voice search and voice-enabled apps. 

## Speech to Text


## Sentiment Analysis #

   Analyze text for positive or negative sentiment, based on a training database of potential word meanings:

   * https://algorithmia.com/algorithms/nlp/SentimentAnalysis

   * IBM

## Document (article) Search #

   <strong>TF-IDF = Term Frequency - Inverse Document Frequency</strong>
   emphasizes important words (called a vector)
   which appear rarely in the corpus searched (rare globally).
   which appear frequently in document (common locally)
   Term frequency is measured by word count (how many occurances of each word).

   The IDF to downweight words is the log of #docs divided by 1 + #docs using given word.

   Cosine similarity normalizes vectors
   so small angle thetas identify similarity.

   Normalizing makes the comparison invariant to the number of words.
   The common compromise is to cap maximum word count.


## Data Manipulation #

<a target="_blank" href="https://github.com/dato-code/SFrame">
SFrame</a> is an open-source, highly-scalable Python library for data manipulation. 
Unlike <a target="_blank" href="http://pandas.pydata.org/">
Pandas</a>, SFrame is not limited to datasets which can fit in memory, 
so it can deal with large datasets, even on a laptop.



## Footnotes

https://www.wikiwand.com/en/Deep_learning

