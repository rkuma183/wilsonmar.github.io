---
layout: post
title: "AI Ecosystem"
excerpt: "Here are the corporate overlords are making humans into robots"
tags: [machine learning, AI]
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

## Leading Companies #

Major organizations are in an arms race in offering 
Artificial intelligence and Machine Learning (ML) services in their clouds:

   * <a href="#MicrosoftML">Microsoft Cortana in Azure</a>
   * Facebook
   * Google
   * IBM Watson
   * Amazon Alexa
   <br />

Each of the above are cloud vendors hoping to cash in by charging for processing of other people's data.

Benedict Evans, the resident futurist at venture capital firm Andreessen Horowitz, 
observes in a <a target="_blank" href="http://ben-evans.com/benedictevans/2016/6/23/ai-apple-and-google">
recent blog post</a> that the future of AI remains opaque: 
"This field is moving so fast that it's not easy to say where the strongest leads necessarily are, nor to work out which things will be commodities and which will be strong points of difference,"


## Other companies

<a target="_blank" href="https://algorithmia.com/algorithms">
Algorithmia.com</a> provide API interfaces to algorithms offered by its partners.


<a target="_blank" href="https://gibhut.com/josephmisiti/awesome-machine-learning/">
awesome-machine-learning</a>
provides many links to resources, so they will not be repeated here.


## Arxiv

<a target="_blank" href="https://docs.google.com/spreadsheets/d/1xej5Nca2xUUtrZ1GCyPjFMqI9ZgNq_OhgnTxOOMQ2js/edit#gid=404493967">Arxiv Paper Analysis Worksheet (Responses) on Google Sheet</a>


<a name="MicrosoftML"></a>

## Microsoft

VIDEO:
<a target="_blank" href="https://www.youtube.com/watch?v=eUce2cB844s">
Hands-On with Azure Machine Learning

In 2014, Microsoft showed off its facial recognition capabilities with
<a target="_blank" href="https://www.how-old.net/">how-old.net">how-old.net</a>
to guess how old someone is. At conferences they built a booth that takes a picture.

In 2015, Microsoft unleashed the Tay chat bot.


### Algorithms from Azure

Below are various initiatives by MS (Microsoft) and other organizations:

<a name="x"></a>
<a name="y"></a>
<table border="1" cellpadding="4" cellspacing="0">
<tr align="bottom" align="left">
<th> Category </th><th> Algorithm </th><th> MS </th></tr>
<tbody>
<tr valign="top"><td rowspan="4"> Statistical Functions
  </td><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905933.aspx"> 
  Descriptive Statistics (Summarize Data)</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905917.aspx"> 
  Hypothesis Testing</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905819.aspx"> 
  Compute T-Test Linear Correlation</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905813.aspx"> Evaluate Probability Function Evaluation</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="3"> Recommendation (collaborative filtering)
  </td><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905987.aspx"> 
  Train Matchbox Recommender</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905970.aspx"> 
  Score Matchbox Recommender</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905954.aspx"> 
  Evaluate Recommender</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="8"> Regression
  </td><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906022.aspx"> 
  Bayesian Linear Regression</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905801.aspx"> 
  Boosted Decision Tree</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905862.aspx"> 
  Tree Decision Forest</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn913093.aspx"> 
  Fast Forest Quantile Regression</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905978.aspx"> 
  Linear Regression</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Neural Network Regression</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906029.aspx"> 
  Ordinal Regression</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Poisson Regression</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="1"> Clustering
  </td><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905944.aspx"> 
  K-means Clustering</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="3"> Anomaly Detection
  </td><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn913103.aspx">
  One-class Support Vector Machine</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn913053.aspx">Principal Component Analysis-based Anomaly Detection</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Time Series Anomaly Detection</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="8"> Two-class<br />Classification
  </td><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906036.aspx">
  Averaged Perceptron</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905930.aspx">
  Bayes Point Machine</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906025.aspx"> 
  Boosted Decision Tree</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906008.aspx"> 
  Decision Forest</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905976.aspx"> 
  Decision Jungle</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905994.aspx"> Logistic Regression</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905947.aspx"> Neural Network</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905835.aspx"> Support Vector Machine</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="6"> Multi-class Classification
  </td><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905810.aspx"> 
  Tune Model Hyperparameters</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906015.aspx"> Decision Forest</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905963.aspx"> Decision Jungle</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905853.aspx"> Logistic Regression</a> 
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906030.aspx"> 
  Neural Network</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905887.aspx"> 
  One-vs-all</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="2"> Text Analytics
  </td><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906018.aspx"> 
  Feature Hashing</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/mt712721.aspx"> 
  Named Entity Recognition Vowpal Wabbit (v8)</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="1"><a href="#CV">Computer Vision</a>
  </td><td><a href="#x"> OpenCV Library</a>
  </td><td><a href="#y"> Y</a>
  </td></tr>
<tr valign="top"><td rowspan="1"><a href="#VoiceRecognition">Voice</a>
  </td><td><a href="#x"> Text to Speech</a>
  </td><td><a href="#y"> Cortana</a>
  </td></tr>
<tr valign="top"><td rowspan="1"><a href="#Translation">Translation</a>
  </td><td><a href="#x"> Language Translation</a>
  </td><td><a href="#y"> Cortana</a>
  </td></tr>
</tbody></table> 

<a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906033.aspx">
A-Z List of Machine Learning Studio Modules</a>
from Microsoft Azure
lists basic database and UI features such as forms,
which means it's building standard computing functions on top of AI capabilities.

<a target="_blank" href="https://www.youtube.com/watch?v=02R-lZYccEY">
Machine Learning Algorthms - Part 1</a>

http://aka.ms/enterprisecloudebook

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


<a name="VoiceRecognition"></a>

## Voice Recognition

   * <a target="_blank" href="https://cloud.google.com/speech/">
   Google Cloud Speech API</a>, which powers Google’s own voice search and voice-enabled apps. 

   * <a target="_blank" href="http://www.techrepublic.com/article/microsofts-ai-can-now-understand-speech-better-than-humans/">
   Microsoft says its Cortana is as accurate as human transcriptionists</a>

## Speech to Text


## NLP Sentiment Analysis #

   Analyze text for positive or negative sentiment (opinion),
   based on a training database of potential word meanings,
   which involved Natural Language Processing:

   * https://algorithmia.com/algorithms/nlp/SentimentAnalysis

   * IBM's algorithm

   Andrew W. Trask,
   PhD student at University of Oxford
   Deep Learning for Natural Language Processing
   authored Grokking Deep Learning.

   Use Bag of words and
   Word2vec
   transform words into vectors.
   Use TFLearn, a Python library for quickly building networks.

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


Python 3.6 has formatted strings


## Conda

Conda is similar to virtualenv and pyenv, other popular environment managers.

   https://virtualenv.pypa.io/en/stable/

   https://github.com/yyuu/pyenv

https://www.continuum.io/downloads

   conda install numpy pandas matplotlib

   conda install jupyter notebook

0. List the packages installed, with its version number and
   what version of Python:

   conda list



### Conda Environments

0. Create new environment for Python, specifying packages needed:

   conda create -n my_env python=3 numpy pandas

0. Enter an environment on Mac:

   source activate my_env

   On Windows:

   activate my_env

   When you're in the environment, the environment's name 
   appears in the prompt:

   (my_env) ~ $. 

0. Leave the environment

   source deactivate 

   On Windows, it's just deactivate.

0. Get back in again.

0. Create an enviornment file by piping the output from an export:

   conda env export > some_env.yaml

   When sharing your code on GitHub, it's good practice to make an environment file and include it in the repository. This will make it easier for people to install all the dependencies for your code. I also usually include a pip requirements.txt file using pip freeze (learn more here) for people not using conda.

0. Load an environment metadata file:

   conda env create -f some_env.yaml

0. List environments created on your machine:

   conda env list

0. Remove an environment:

   conda env remove -n some_env

Read:

   * https://conda.io/docs/using/index.html

   * https://jakevdp.github.io/blog/2016/08/25/conda-myths-and-misconceptions/


## More

   Jupyter notebooks
