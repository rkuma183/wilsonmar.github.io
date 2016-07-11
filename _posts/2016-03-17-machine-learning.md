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

## Companies #

Several organizations are in an arms race in offering 
Artificial intelligence and Machine Learning (ML) services in their clouds:

   * <a href="#MicrosoftML">Microsoft Cortana in Azure</a>
   * Google
   * IBM Watson
   * Amazon Alexa
   <br />

Each of the above are cloud vendors hoping to cash in by charging for processing.

Other companies:

<a target="_blank" href="https://algorithmia.com/algorithms">
Algorithmia.com</a> provide API interfaces to algorithms offered by its partners.


<a target="_blank" href="https://gibhut.com/josephmisiti/awesome-machine-learning/">
awesome-machine-learning</a>
provides many links to resources, so they will not be repeated here.


### Turi (Dato) Python algorithms #

<a target="_blank" href="https://dato.com/products/create/">
GraphLab Create</a> from Dato 
provides scalable "pre-implemented" ML algorithms 
using Python installed using Anaconda.
Entire courses on its use is at

   * https://www.coursera.org/learn/ml-foundations
   * https://www.turi.com/learn/userguide/
   * https://www.turi.com/products/create/docs/
   * https://github.com/learnml/machine-learning-specialization
   * https://www.coursera.org/learn/ml-clustering-and-retrieval/supplement/iF7Ji/software-tools-you-ll-need-for-this-course

When the one-year free license is over, consider 
scikit-learn</a>, 
which also uses Python with Anaconda.

For matrix operations, use the <a target="_blank" href="http://www.numpy.org/">
Numpy</a> open-source Python library for fast performance with data that fits in memory.
<a target="_blank" href="https://docs.scipy.org/doc/numpy-dev/user/quickstart.html">
Quickstart</a>.

Benedict Evans, the resident futurist at venture capital firm Andreessen Horowitz, 
observes in a <a target="_blank" href="http://ben-evans.com/benedictevans/2016/6/23/ai-apple-and-google">
recent blog post</a> that the future of AI remains opaque: 
"This field is moving so fast that it's not easy to say where the strongest leads necessarily are, nor to work out which things will be commodities and which will be strong points of difference,"


## "Hard" ML #

Below are various initiatives by MS (Microsoft) and other organizations:

<a name="x"></a>
<a name="y"></a>
<table border="1" cellpadding="4" cellspacing="0">
<tr align="bottom" align="left">
<th> Category </th><th> Algorithm </th><th> MS </th></tr>
</tbody>
<tr valign="top"><td rowspan="4"> Statistical Functions
  </td><td><a href="#x"> Descriptive Statistics</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Hypothesis Testing</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> T-Test Linear Correlation</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Probability Function Evaluation</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="1"> Recommendation
  </td><td><a href="#x"> Matchbox Recommender</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="8"> Regression
  </td><td><a href="#x"> Bayesian Linear Regression</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Boosted Decision</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Tree Decision Forest</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Fast Forest Quantile Regression</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Linear Regression</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Neural Network Regression</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Ordinal Regression</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Poisson Regression</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="1"> Clustering
  </td><td><a href="#x"> K-means Clustering</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="3"> Anomaly Detection
  </td><td> One-class Support Vector Machine</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x">Principal Component Analysis-based Anomaly Detection</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Time Series Anomaly Detection</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="8"> Two-class<br />Classification
  </td><td> Averaged Perceptron</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x">Bayes Point Machine</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Boosted Decision Tree</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Decision Forest</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Decision Jungle</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Logistic Regression</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Neural Network</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Support Vector Machine</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="5"> Multi-class Classification
  </td><td><a href="#x"> Decision Forest</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Decision Jungle</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Logistic Regression</a> 
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Neural Network</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> One-vs-all</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="2"> Text Analytics
  </td><td><a href="#x"> Feature Hashing</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Named Entity Recognition Vowpal Wabbit</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="1"><a href="#CV">Computer Vision</a>
  </td><td><a href="#x"> OpenCV Library</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="1"><a href="#Voice">Voice</a>
  </td><td><a href="#x"> Text to Speech</a>
  </td><td><a href="#y"> Cortana</a>
  </td></tr>
<tr valign="top"><td rowspan="1"><a href="#Translation">Translation</a>
  </td><td><a href="#x"> Text to Speech</a>
  </td><td><a href="#y"> Cortana</a>
  </td></tr>
</tbody></table> 

<hr />

## Conversions

   Some utilities may involve conventional lookups of data:

   * https://algorithmia.com/algorithms/alixaxel/CoordinatesToTimezone

   * https://algorithmia.com/algorithms/Geo/ZipData

   * https://algorithmia.com/algorithms/Geo/ZipToState

   * https://algorithmia.com/algorithms/Geo/LatLongDistance

   * https://algorithmia.com/algorithms/Geo/LatLongToUTM

   * https://algorithmia.com/algorithms/util/ip2hostname

   * https://algorithmia.com/algorithms/opencv/ChangeImageFormat (from jpg to png)

<a name="Translation"></a>

## Translation #

   * Google Translate API 
   has been working on websites for years.


<a name="CV"></a>

## Image Recognition / Computer Vision #

   * https://algorithmia.com/algorithms/z/ColorPalettefromImage

   * <a target="_blank" href="https://cloud.google.com/vision/">Google Cloud Vision API</a>

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


<a name="MicrosoftML"></a>

## Microsoft Azure Machine Learning #

<a target="_blank" href="https://azure.microsoft.com/en-us/services/machine-learning/">
https://azure.microsoft.com/en-us/services/machine-learning</a>
offers free plans

   * Guest Workspace for 8 hours on https://studio.azureml.net/Home/ViewWorkspaceCached/...

   * Registered free workspaces with 10 GB storage
   can scale resources to increase experiment execution performance.

All their plans offer:

   * Stock sample datasets
   * R and Python script support
   * Full range of ML alogorithms
   * Predictive web services


Follow 
<a target="_blank" href="https://azure.microsoft.com/en-us/documentation/articles/machine-learning-create-experiment/">
this machine learning tutorial</a>
to use Azure Machine Learning Studio to
create a linear regression model that predicts the price of 
an automobile based on different variables such as make and technical specifications. 
Then iterate on a simple predictive analytics experiment after

0. Enter Microsoft's Learning Studio:

   As per <a target="_blank" href="https://channel9.msdn.com/Blogs/Windows-Azure/Getting-Started-with-Azure-Machine-Learning-Step1?ocid=player">
   this video</a>:

   https://studio.azureml.net/?selectAccess=true&o=2

0. Look at examples in the 
   <a target="_blank" href="http://gallery.cortanaintelligence.com/?r=legacy">
   Cortana Intelligence Gallery</a>

0. Take the introductory tutorial:

   <a target="_blank" href="http://gallery.cortanaintelligence.com/Collection/Introduction-to-Machine-Learning-with-Hands-On-Labs-1">
   Introduction to Machine Learning with Hands-On Labs</a>

0. Create a model

0. Prepare Data:

   As per <a target="_blank" href="https://channel9.msdn.com/Blogs/Windows-Azure/Preprocessing-Data-in-Azure-ML-Studio?ocid=player">this video</a>
   using

   - Clean Missing Data - Clip Outliers
   - Edit Metadata
   - Feature Selection
   - Filter
   - Learning with Counts
   - Normalize Data
   - Partition and Sample
   - Principal Component Analysis
   - Quantize Data
   - SQLite Transformation
   - Synthetic Minority Oversampling Technique

0. Train the model

   * Cross Validation
   * Retraining
   * Parameter Sweep

0. Score and test the model

0. Make predictions with Elastic APIs

   - Request-Response Service (RRS) Predictive Experiment - Batch Execution Service (BES)
   - Retraining API
 


https://azure.microsoft.com/en-us/documentation/articles/machine-learning-studio-overview-diagram/


## Footnotes

https://www.wikiwand.com/en/Deep_learning

