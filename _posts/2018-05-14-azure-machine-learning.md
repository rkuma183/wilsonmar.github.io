---
layout: post
title: "Azure Machine Learning"
excerpt: "Tour through the links and GUI with commentary"
tags: [microsoft, Azure, machine learning, AI, cloud, certification]
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

This is a deep-dive guided tour of how to begin using Microsoft's offerings for Machine Learning in their Azure cloud.

## Azure AI + Machine Learning

PROTIP: One has to traverse three different web sites to design, deploy, and consume Machine Learning.

![aml-steps-405x156-17814](https://user-images.githubusercontent.com/300046/40132203-665cad26-58f9-11e8-9eb8-34076f838a3b.jpg)

Working backwards from the Azure Portal used in production:

1. In an internet browser, visit the Azure Portal at<br />
   <a target="_blank" href="
   https://portal.azure.com/">
   https://portal.azure.com</a>
   
   This presents the full sophistication Microsoft has achieved.

2. Click "All services" in the left menu and type "AI" or scroll down to see:

   ![azure-ai-offerings-415x396-27423](https://user-images.githubusercontent.com/300046/39999744-209d8336-5747-11e8-8773-bc5f88733be2.jpg)

   * <a target="_blank" href="https://docs.microsoft.com/en-us/azure/batch-ai/overview">
   Batch AI</a>

   Azure offers "NC-series" Windows 2016 and Ubuntu Linux "Data Science Virtual Machines" (DSVMs) with GPU drivers for <a target="_blank" href="https://azuremarketplace.microsoft.com/en-us/marketplace/apps/microsoft-ads.dsvm-deep-learning">Deep Learning</a>.
   These use "HDD" not "SSD" disks. [<a target="_blank" href="https://docs.microsoft.com/en-us/azure/machine-learning/data-science-virtual-machine/deep-learning-dsvm-overview">Docs</a>]

   But if you are new to AI and Machine Learning, begin with ML Studio and their sample data:


1. Create a <a target="_blank" href="https://portal.azure.com/#blade/HubsExtension/Resources/resourceType/Microsoft.MachineLearning%2Fworkspaces">Machine Learning Studio Workspace</a> within the

   Microsoft's documentation on this is at https://docs.microsoft.com/en-us/azure/machine-learning/studio/create-workspace

   ### Worspace
   
1. Switch to another window by opening a new tab. On MacOS press Command+Tab. On Windows press Ctrl+Esc.

   ### Azure Machine Learning Studio #

0. Microsoft's AzureML Studio provides an on-line app
   with drap and drop ease of use with no setup on your laptop or servers.
   So you can use a Chromebook with no hard drive.

   <a target="_blank" href="https://studio.azureml.net/">
   https://studio.azureml.net</a>

   NOTE: AzureML supports R and Python scripts.

0. Click the blue "Enter" for the 8-hour trial with no login
   to learn how it works using Microsoft's sample data.

   ![azure-ml-plans-640x344-54460](https://user-images.githubusercontent.com/300046/39979116-90de3d8e-5701-11e8-94da-b17dd0f48072.jpg)

   You come back to this page above after you timeout.

   PROTIP: With the free account, SQL database access is not allowed, so stay with .csv files.

   Alternately, if you want to use your own data (up to 10GB), click "Sign-in".

0. Click the "hamberger menu" at the upper left.

   ![azure-ml-top-menu-430x198-16945](https://user-images.githubusercontent.com/300046/39979174-075583f0-5702-11e8-9249-b794675d5491.jpg)

   Selecting "Cortana Intelligence" takes you to the "Azure AI" marketing page at <br />
   <a target="_blank" href="
   https://azure.microsoft.com/en-us/overview/ai-platform/">
   https://azure.microsoft.com/en-us/overview/ai-platform</a>

   BTW There is also a marketing page at <br /><a target="_blank" href="https://azure.microsoft.com/en-us/services/machine-learning/">
   https://azure.microsoft.com/en-us/services/machine-learning</a>

0. Click "Gallery" to look at examples in <a target="_blank" href="https://gallery.azure.ai/">
   https://gallery.azure.ai</a> titled "Azure AI Gallery" (previously called the Cortana Intelligence Gallery at gallery.azureml.net).

   PROTIP: There is not many views to an item, so you're one of the early adopter visionaries!

   ### Solutions

   The menu item on the menu named 
   <a target="_blank" href="https://gallery.azure.ai/solutions/">
   Solutions</a> applies to usage by a particular customer/industry.
   
   An example of a solution is the <a target="_blank" href="https://gallery.azure.ai/Solution/Interactive-Price-Analytics">
   Interactive Price Analytics</a> applying models (studied in "Micro Economics" courses)
   that are the basis for recommending pricing changes based on the history of 
   how demand for particular products responds to prices changes.

   Solutions are not a selection in ML Studio because they make use of models derived
   from experiments in the ML Studio:
   Modeling Price Elasticity - Part 1: Own-Price-Elasticity, Parts
   <a target="_blank" href="https://gallery.azure.ai/Experiment/Modeling-Price-Elasticity-Part-1-Own-Price-Elasticity-1">
   1</a>, <a target="_blank" href="https://gallery.azure.ai/Experiment/Modeling-Price-Elasticity-Part-1-Own-Price-Elasticity-2">2</a>, <a target="_blank" href="https://gallery.azure.ai/Experiment/Modeling-Price-Elasticity-Part-1-Own-Price-Elasticity-3">and 3</a>.

   ### Projects

1. Within the ML Studio:

   <a target="_blank" href="https://gallery.azure.ai/">
   <img align="right" alt="azure-ml-menu-175x259-10955.jpg" width="175" src="https://user-images.githubusercontent.com/300046/39960539-e0e903ac-55e1-11e8-8b75-3518d4527ca1.jpg"></a>
   Projects, (trained) Models, Experiments, 
   reflect the left menu than the solutions horizonal menu (but in a different order):

   <a target="_blank" href="https://gallery.azure.ai/projects/">PROJECTS</a>
   are in both - collection of scripts, notebooks, and/or data designed to support the everyday work of data scientists.
   
   ### Experiments

   "EXPERIMENTS" construct <strong>workflows</strong> using a sequence of techniques on data.
   See https://gallery.azure.ai/experiments 


   ### Notebooks

   "NOTEBOOKS" are iPython Notebooks that present an explaination of each Python coding step.

   See the tutorial at https://gallery.azure.ai/Notebook/773ccb4114fa46c99004381bbfa328de


   ### Datasets

   "DATASETS" contain data.


   ### ONNX vs WinML files

   https://gallery.azure.ai/models (.ONNX or .WinML files) for download - to build projects and solutions.

   Most of them are ported from the <a target="_blank" href="https://github.com/onnx/models">repository of pre-trained machine learning computational graph models</a> in ONNX (Open Neural Network Exchange) format (<a target="_blank" href="https://onnx.ai/">https://onnx.ai</a>), which can run on different deep learning <a target="_blank" href="https://github.com/onnx/tutorials">frameworks (Tensorflow, Keras, Microsoft Cognitive Toolkit or Caffe2)</a>.
      
   WinML (Windows Machine Learning)
   https://docs.microsoft.com/en-us/windows/uwp/machine-learning/
   converts ONNX models to execute locally in Windows 10 devices, leveraging GPU Hardware Acceleration on DirectX12.
   WinML converts models in Apple CoreML, scikit-learn (subset of models convertible to ONNX), LibSVM, XGBoost

   https://gallery.azure.ai/Model/MNIST-Handwritten-Digit-Recognition
   

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


<a name="BotFramework"></a>

## BOT framework

<li><a href="https://www.pluralsight.com/courses/microsoft-bot-framework-getting-started" target="_blank" >Getting Started with Building Bots with Microsoft&#8217;s Bot Framework</a> by Matthew Kruczek</li>


## More

This is one of a series on AI, Machine Learning, Deep Learning, Robotics, and Analytics:

{% include ai_links.html %}
