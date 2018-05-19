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
   
   <!-- ![azure-ai-offerings-415x396-27423](https://user-images.githubusercontent.com/300046/39999744-209d8336-5747-11e8-8773-bc5f88733be2.jpg)
   -->

2. Click "Create a Resource" in the left menu:

   <a target="_blank" href="https://portal.azure.com/#create/hub">
   <img align="right" alt="azure-resource-list-210x529-22177" src="https://user-images.githubusercontent.com/300046/40260563-fa98acec-5ac0-11e8-9599-eaa18accfa58.jpg"></a>

   AI and Machine Learning projects usually involve several of these "Azure Marketplace" items.

3. Click "AI + Machine Learning" to see the scope of sophistication Microsoft has achieved.

   * "Data Science Virtual Machine - Windows 2016" is not included in the list
   <a target="_blank" href="https://portal.azure.com/#create/microsoft-ads.windows-data-science-vmwindows2016">
   Create virtual machine</a>

4. At the top next to the "Featured" heading, click "See all", notice Microsoft's categorizes:

   * Machine Learning (below)
   * <a target="_blank" href="https://wilsonmar.githhub.io/chatbots/">Bot Service</a>
   * Cognitive Service (which is AI for speech, vision, text analytics, search, etc.).

   A separate article/page for each category.

   TBD: The "Machine Learning Model Management" 

5. Click "Machine Learning Experimentation", which was in "preview" at the time of writing.

   If you don't have an Experiment account, you are prompted for one.

   ![azure-ml-ex-1-278x410-25903](https://user-images.githubusercontent.com/300046/40262848-c6ca5fd6-5ad0-11e8-80a0-7285a7256206.jpg)

6. The Experiment Name has is a maximum of 32 characters. The only special character allowed is the dash
   or underlines to separate words.

7. PROTIP: Define a naming convention for your <strong>Resource Groups</strong> which your team
   will follow for consistency. This also avoids confusion.

8. For Location, in the US there is "East US 2" and "West Central US".

9. The "seats" is how it's charged.

1. Create a new Storage account if you haven't already.

   ![azure-ml-ex-2-278x352-25479](https://user-images.githubusercontent.com/300046/40262852-d2dbc684-5ad0-11e8-8d42-12997c1374c1.jpg)

1. Your Model Mangement account name can be up to 260 characters.

1. Model Management account fee types:

   ![manage-acct-types-727x189-40314](https://user-images.githubusercontent.com/300046/40262379-8bc6b5b4-5acc-11e8-9fb6-83669780fbc9.jpg)

1. Check "Pin to dashboard".

1. Click "Automation options" to expose the parameters file for the selections above.

1. Click "Download" to save the "template.zip" file to your laptop for use in CLI calls.

   PROTIP: The files downloaded in the zip enable you to <strong>quickly re-create</strong>
   the manual selections you took above. This enables you to save money by re-creating on demand rather than paying for unused services lingering around racking up charges.

1. Click the "CLI" tab for the Bash (deploy.sh) script to make use of the parameter file.
1. Click the "PowerShell" tab for the deploy.ps1 script.
1. Click the ".NET" tab for the DeploymentHelper.cs programming code.
1. Click the "Ruby" tab for the deployer.rb file.
1. Click "Create". Wait for the completion pop-up in your account's Dashboard.
1. Click "See more" at the bottom of the "All resources" pane. This is because you may not see the item you just created.
1. Click the Machine Learning Experimentation you just created.

   ### Machine Deployment
 
 1. Click <a target="_blank" href="https://portal.azure.com/#create/Microsoft.MachineLearningModelManagement">
    Create Microsoft Machine Learning Model Management</a>

   NOTE: You can not select the "DEVTEST" pricing tier for deployment.
   See https://azure.microsoft.com/en-us/pricing/details/machine-learning-services/

   ### Workspace

1. Create a <a target="_blank" href="https://portal.azure.com/#blade/HubsExtension/Resources/resourceType/Microsoft.MachineLearning%2Fworkspaces">Machine Learning Studio Workspace</a> 

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
