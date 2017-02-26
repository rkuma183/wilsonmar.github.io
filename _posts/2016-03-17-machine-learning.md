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

Major organizations are in an arms race in offering 
Artificial intelligence and Machine Learning (ML) services in their clouds:

   * <a href="#MicrosoftML">Microsoft Cortana in Azure</a>
   * Google
   * IBM Watson
   * Amazon Alexa
   * Facebook
   <br />

Each of the above are cloud vendors are hoping to cash in by charging for processing.

Benedict Evans, the resident futurist at venture capital firm Andreessen Horowitz, 
observes in a <a target="_blank" href="http://ben-evans.com/benedictevans/2016/6/23/ai-apple-and-google">
recent blog post</a> that the future of AI remains opaque: 
"This field is moving so fast that it's not easy to say where the strongest leads necessarily are, nor to work out which things will be commodities and which will be strong points of difference,"


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

When the one-year free license is over, note
scikit-learn also uses Python with Anaconda.

## Definitions

An <strong>instance</strong> is the aspect about which you want to make a prediction. 

A <strong>label</strong> is an answer for a prediction task ­- 
­either the answer produced by a machine learning
system, or the right answer supplied in training data. For example, the label for a web page
might be "about cats".

A <strong>features</strong> is a property of an instance used in a prediction task. 
For example, a web page might
have a feature "contains the word 'cat'".

A <strong>feature Column</strong> is a set of related features, 
such as the set of all possible countries in which users might live. 
An example may have one or more features present in a feature column. A
feature column is referred to as a “namespace” in the VW system (at Yahoo/Microsoft), or a
field.
Example: An instance (with its features) and a label.

A <strong>model</strong> is a statistical representation of a prediction task. 
Models trained using examples so they can be used to make predictions.

A <strong>metric</strong> is a number that you care about. May or may not be directly optimized.

An <strong>objective</strong> is a metric that an algorithm is trying to optimize.

A <strong>pipeline</strong> the infrastructure surrounding a machine learning algorithm. 
It includes gathering the data from the front end, 
putting it into training data files, 
training one or more models, and
exporting the models to production.


## Python libraries for ML

For matrix operations, use the <a target="_blank" href="http://www.numpy.org/">
Numpy</a> open-source Python library for fast performance with data that fits in memory.
<a target="_blank" href="https://docs.scipy.org/doc/numpy-dev/user/quickstart.html">
Quickstart</a>.

tweepy (http://www.tweepy.org)

csv (https://pypi.python.org/pypi/csv)

textblob (https://textblob.readthedocs.io/en/dev/)

keras (https://keras.io)


## "Hard" ML #

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

https://www.nervanasys.com/demystifying-deep-reinforcement-learning/


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

   <a target="_blank" href="http://neuralnetworksanddeeplearning.com/chap1.html">
   Handwriting recognition book</a> and
   <a target="_blank" href="https://github.com/mnielsen/neural-networks-and-deep-learning">
   GitHub</a>
   for Neural Networks and Deep Learning
   by Michael Nielsen


   http://www.deeplearningbook.org
   by Ian Goodfellow, Yoshua Bengio, and Aaron Courville.


<a name="VoiceRecognition"></a>

## Voice Recognition

   * <a target="_blank" href="https://cloud.google.com/speech/">
   Google Cloud Speech API</a>, which powers Google’s own voice search and voice-enabled apps. 

   * <a target="_blank" href="http://www.techrepublic.com/article/microsofts-ai-can-now-understand-speech-better-than-humans/">
   Microsoft says its Cortana is as accurate as human transcriptionists</a>

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

Regression works on numbers.<br />
Classification works on strings.

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

   <pre>
   conda install numpy pandas matplotlib

   conda install jupyter notebook

   conda install -c https://conda.binstar.org/menpo opencv
   </pre>

0. Can't find it? Look among all users and <strong>operating systems supported</strong>

   <pre>
   anaconda search -t conda pygame
   </pre>

   On a Mac 
   https://anaconda.org/tlatorre/pygame
   is not recognized because it's only for Linux.

   On Stack Overflow a user recommends on that supports
   Windows 32 and 64, MacOS, and Linux:

   <pre>
   conda install -c cogsci pygame=1.9.2a0
   </pre>

   Alternatively:

   <pre><strong>
   pip install pygame
   </strong></pre>

   

0. Copy a user/package to show more info:

   <pre>
   anaconda show USER/PACKAGE
   </pre>

0. List the packages installed, with its version number and
   what version of Python:

   <pre>
   conda list
   </pre>



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

0. Leave the environment (like exit):

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

0. Add a package



   ### OpenCV

   <a target="_blank" href="http://stackoverflow.com/questions/23119413/how-to-install-python-opencv-through-conda">
   SO on Install on Windows 8</a>

   anaconda show menpo/opencv3

   conda install --channel https://conda.anaconda.org/menpo opencv3

   FFMPEG codec

0. Test within Python >>> :

   <pre>
   import cv2
   print(cv2.__version__)
   </pre>

   The response should be:

   <pre>3.1.0</pre>

   ### Customization

0. Install readline to do autocompletion in Jupyter notebooks by hitting `tab`

   conda/pip install readline

   Readline comes with anaconda 


Read:

   * https://conda.io/docs/using/index.html

   * https://jakevdp.github.io/blog/2016/08/25/conda-myths-and-misconceptions/

   * http://cola.github.io

## More

   http://martin.zinkevich.org/rules_of_ml/rules_of_ml.pdf