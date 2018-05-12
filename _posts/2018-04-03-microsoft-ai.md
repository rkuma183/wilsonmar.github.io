---
layout: post
title: "Microsoft AI"
excerpt: "How to run Cortana AI on Microsoft's Azure cloud"
tags: [microsoft, machine learning, AI]
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

This article provides an overview of use Microsoft's AI (Artificial Intelligence) offering, which include Machine / Deep Learning capabilities running on the Azure cloud.

## History

In 2014, Microsoft showed off its facial recognition capabilities with
<a target="_blank" href="https://www.how-old.net/">how-old.net</a>
to guess how old someone is. At conferences they built a booth that takes a picture.

In 2015, Microsoft unleashed the Tay chat bot, then brought it down after hackers submitted enough racial slurs that fooled the system into that was normal. 

Two divisions within Microsoft offes AI:

* <a target="_blank" href="https://www.microsoft.com/en-us/research/project/machine-learning-edge/">
The research division</a>, headed by Harry Shum, is putting AI into Bing, Cortana, ambient computing, and robotics.

* With the "computing fabric" led by <a target="_blank" href="https://www.linkedin.com/in/guthriescott/">Scott Guthrie</a>, makes AI services available for those building customizable machine learning with speech, language, vision, and knowledge services. Tools offered include Cognitive Services and Bot Framework, deep-learning tools like Azure Machine Learning, Visual Studio Code Tools for AI, and Cognitive Toolkit.
Microsoft's Azure IoT Edge (at <a target="_blank" href="https://github.com/Azure/ai-toolkit-iot-edge"> https://github.com/Azure/ai-toolkit-iot-edge</a>) brings AI and machine learning to the edge of networks, such as in the field and on factory floors.

Microsoft is also investing in AI-powered hardware. At Build 2018, Microsoft announced <a target="_blank" href="https://www.microsoft.com/en-us/research/publication/serving-dnns-real-time-datacenter-scale-project-brainwave/">Project Brainwave</a> to run Google's Tensorflow AI code and Facebook's Caffe2, and Microsoft's <a href="#CNTK">Cognitive Toolkit</a>. Its use of field programmable gate arrays (FPGA) enable it perform AI calculations reportedly is five times faster than Google's TPU hardware.

XiaoIce, a chatbot Microsoft launched in China, "has more than 200 million users, has engaged in 30 billion conversations, and has an average conversation length of 23 turns, which averages out to about half an hour, achieving human parity at translation from Chinese to English.
 Japan-based Rinna and the US-based Zo)

## Get an account #

All their plans offer:

   * Stock sample datasets
   * R and Python script support
   * Full range of <a href="#Algorithms">ML alogorithms</a>
   * Predictive web services

There are two ways to pay:

* A free Machine Learning Account is just for learning at <a target="_blank" href="https://azure.microsoft.com/en-us/services/machine-learning/">
https://azure.microsoft.com/en-us/services/machine-learning</a>

   PROTIP: But you can't access SQL for free.

* Adding Machine Learning capabilities in your full account, for production use.

   But charges apply.

   * Guest Workspace for 8 hours on https://studio.azureml.net/Home/ViewWorkspaceCached/...
   These get 10 GB storage and can scale resources to increase experiment execution performance.


## Azure ML Studio

The on-line IDE enables drap and drop ease of use.

It supports R and Python.

VIDEO:
<a target="_blank" href="https://www.youtube.com/watch?v=02R-lZYccEY">
Machine Learning Algorthms - Part 1</a>

## Azure

http://aka.ms/enterprisecloudebook

<a target="_blank" href="https://app.pluralsight.com/library/courses/microsoft-azure-big-picture">
   Microsoft Azure: The Big Picture</a> 1h 50m Mar 10, 2016
   by Matt Milner
   makes use of VS 2010, which is rather obsolete now.

## Microsoft Azure Machine Learning #

Follow 
<a target="_blank" href="https://azure.microsoft.com/en-us/documentation/articles/machine-learning-create-experiment/">
this machine learning tutorial</a>
to use <strong>Azure Machine Learning Studio</strong> to
create a linear regression model that predicts the price of 
an automobile based on different variables such as make and technical specifications. 
Then iterate on a simple predictive analytics experiment.

VIDEO: <a target="_blank" href="https://www.youtube.com/watch?v=eUce2cB844s">
Hands-On with Azure Machine Learning

0. Enter Microsoft's Learning Studio:

   As per <a target="_blank" href="https://channel9.msdn.com/Blogs/Windows-Azure/Getting-Started-with-Azure-Machine-Learning-Step1?ocid=player">
   this video</a>: <a target="_blank" href="
   https://studio.azureml.net/?selectAccess=true&o=2">
   https://studio.azureml.net/?selectAccess=true&o=2</a>

0. If you want to learn how it works using their data, click "Enter" for the 8-hour trial with no login. This is what this article discusses.

   Altrnately, if you want to use your own data (up to 10GB), click "Sign-in".

0. Click the "hamberger menu" at the upper left.

   Selecting "Azure AI" takes you to their marketing page at <a target="_blank" href="
   https://azure.microsoft.com/en-us/overview/ai-platform/">
   https://azure.microsoft.com/en-us/overview/ai-platform</a>

0. Click "Gallery" to look at examples in the <a target="_blank" href="https://gallery.azure.ai/">
   Azure AI Gallery</a> (previously called the Cortana Intelligence Gallery at gallery.azureml.net).

   PROTIP: There is not many views, so you're one of the early adopter visionaries!

   <a target="_blank" href="https://gallery.azure.ai/">
   <img align="right" alt="azure-ml-menu-175x259-10955.jpg" width="175" src="https://user-images.githubusercontent.com/300046/39960539-e0e903ac-55e1-11e8-8b75-3518d4527ca1.jpg"></a>
   Notice the menu items: Solutions, Projects, (trained) Models, Experiments, 
   reflect the left menu (but in a different order):

   "Notebooks" are iPython Notebooks that combine Python code with HTML.

   * https://gallery.azure.ai/solutions - templates, reference architectures and design patterns to make them your own with included instructions or with a featured partner. 
   
   * https://gallery.azure.ai/projects - collection of scripts, notebooks, and/or data designed to support the everyday work of data scientists.
   
   https://github.com/plaidml/plaidml

   https://gallery.azure.ai/models (.ONNX or .WinML files) for download - to build projects and solutions.

   Most of them are ported from the <a target="_blank" href="https://github.com/onnx/models">repository of pre-trained machine learning computational graph models</a> in ONNX (Open Neural Network Exchange) format (<a target="_blank" href="https://onnx.ai/">https://onnx.ai</a>), which can run on different deep learning <a target="_blank" href="https://github.com/onnx/tutorials">frameworks (Tensorflow, Keras, Microsoft Cognitive Toolkit or Caffe2)</a>.
      
   WinML (Windows Machine Learning)
   https://docs.microsoft.com/en-us/windows/uwp/machine-learning/
   converts ONNX models to execute locally in Windows 10 devices, leveraging GPU Hardware Acceleration on DirectX12.
   WinML converts models in Apple CoreML, scikit-learn (subset of models convertible to ONNX), LibSVM, XGBoost

   https://gallery.azure.ai/Model/MNIST-Handwritten-Digit-Recognition
   
   * https://gallery.azure.ai/experiments - Explore predictive analytic experiments contributed by Microsoft and the data science community that solve interesting problems or demonstrate advanced machine learning techniques. Use these experiments as starting points to develop your own solutions. 


   PROTIP: Consider these collections:

   * <a target="_blank" href="https://github.com/Microsoft/CNTK/blob/master/Tutorials/CNTK_101_LogisticRegression.ipynb">
   Linear (straight line) Regression classifer</a> using <a href="#CNTK">CNTK</s>
   * Multi-variate/Logistic regression 
   * K-means clustering analysis / Softmax
   * Guided selection of wines: https://gallery.azure.ai/Experiment/30146a6b10c6401d9b65afac17dfa5d9
   * svm (support vector machine) 
   
   * At <a target="_blank" href="https://gallery.azure.ai/Tutorial/Twitter-Stream-Analysis-with-Azure-Machine-Learning">
   Twitter sentiment analysis</a> click "DEPLOY" for
   <a target="_blank" href="https://quickstart.azure.ai/Deployments/new/streamanalysiswithaml?source=CIGallery">
   estimate of cost<a>
   <br /><br />

   <a name="CNTK"></a>

   ### CNTK CogNitive ToolKit

   https://gallery.azure.ai/Tutorial/Cognitive-Toolkit-Tutorial-Getting-Started
   makes use of Microsoft's new network-description language BrainScript at
   https://docs.microsoft.com/en-us/cognitive-toolkit/BrainScript-Network-Builder
   https://github.com/Microsoft/CNTK/wiki/Tutorial
   https://github.com/Microsoft/CNTK

   CNTK invented some terms:

   * a sequence (in CNTK) is also referred to as an instance
   * a sample (in CNTK) is also referred to as a feature
   * input stream(s) (in CNTK) is also referred to as feature column or a feature
   * the criterion (in CNTK) is also referred to as the loss
   * the evalutaion error (in CNTK) is also referred to as a metric
   <br /><br />

0. Click through to a page with "Open in Studio".

0. Your selects appear in the "TRAINED MODELS" tab on the left side.

## Tutorials

0. Take the introductory tutorial:

   <a target="_blank" href="https://gallery.azure.ai/Collection/Introduction-to-Machine-Learning-with-Hands-On-Labs-1">
   Introduction to Machine Learning with Hands-On Labs</a>

   <a target="_blank" href="
   https://azure.microsoft.com/en-us/documentation/articles/machine-learning-studio-overview-diagram/">
   https://azure.microsoft.com/en-us/documentation/articles/machine-learning-studio-overview-diagram</a>

0. Create a model.

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
   <br /><br />
   
0. Train the model

   * Cross Validation
   * Retraining
   * Parameter Sweep
   <br /><br />

0. Score and test the model.

0. Make predictions with Elastic APIs

   - Request-Response Service (RRS) Predictive Experiment - Batch Execution Service (BES)
   - Retraining API
   <br /><br />


<a name="Algorithms"></a>

## Algorithms from Azure

From the <a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906033.aspx">
A-Z List of Machine Learning Studio Modules</a>
from Microsoft Azure
lists basic database and UI features such as forms,
which means it's building standard computing functions on top of AI capabilities.

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

## More

This is one of a series on AI, Machine Learning, Deep Learning, Robotics, and Analytics:

{% include ai_links.html %}
