---
layout: post
title: "Machine Learning Algorithms"
excerpt: "Tools for data science"
tags: [microsoft, Azure, machine learning, AI, cloud]
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

Here are the beginnings of an analysis of algorithms offered by Microsoft Azure, Amazon, and Google.

From the <a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906033.aspx">
A-Z List of Machine Learning Studio Modules</a>,
lists basic database and UI features such as forms,
which means it's building standard computing functions on top of AI capabilities.

* <a href="#Stats">(descriptive) Statistical Functions</a>
* <a href="#Anomaly">Anomaly Detection</a> - finding unusual data points
* <a href="#Recommendation">Recommendation</a> (collaborative filtering)
* <a href="#Regression">Regression</a> - predicting values
* <a href="#Clustering">Clustering</a> - discovering structure
* <a href="#Two-class"> Two-class Classification</a>
* <a href="#Multi-class">Multi-class Classification</a> - predicting categories
* <a href="#TextAnalytics">Text Analytics</a>
* <a href="#CV">Computer Vision</a>
* <a href="#Voice">Voice</a>
* <a href="#Translation">Translation</a>

<a target="_blank" href="https://docs.microsoft.com/en-us/azure/machine-learning/studio/algorithm-cheat-sheet">
This cheat sheet PDF of Microsoft'a Azure ML Algorithms</a>
<a href="https://user-images.githubusercontent.com/300046/40009626-d5359eec-575f-11e8-8a4d-7a24d52d4d8b.png">
<img width="1280" alt="aml-cheatsheet.png" src="https://user-images.githubusercontent.com/300046/40009626-d5359eec-575f-11e8-8a4d-7a24d52d4d8b.png"><br />(click for full-screen image)</a>
<a name="x"></a>
<a name="y"></a>
<table border="1" cellpadding="4" cellspacing="0">
<tr align="bottom" align="left">
<th> Category </th><th> Algorithm </th><th> Notes </th></tr>
<tbody>
<tr valign="top"><td rowspan="4"><a name="Stats"></a> Statistical Functions
  </td><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905933.aspx"> 
  Descriptive Statistics (Summarize Data)</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905917.aspx"> 
  Hypothesis Testing</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905819.aspx"> 
  Compute T-Test Linear Correlation</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905813.aspx"> Evaluate Probability Function Evaluation</a>
  </td><td><a href="#y">-</a>
  </td></tr>

<tr valign="top"><td rowspan="3"><a name="Recommendation"></a> Recommendation (collaborative filtering)
  </td><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905987.aspx"> 
  Train Matchbox Recommender</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905970.aspx"> 
  Score Matchbox Recommender</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905954.aspx"> 
  Evaluate Recommender</a>
  </td><td><a href="#y">-</a>
  </td></tr>

<tr valign="top"><td rowspan="8"><a name="Regression"></a> Regression
  </td><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906022.aspx"> 
  Bayesian Linear Regression</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905801.aspx"> 
  Boosted Decision Tree</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905862.aspx"> 
  Tree Decision Forest</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn913093.aspx"> 
  Fast Forest Quantile Regression</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905978.aspx"> 
  Linear Regression</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Neural Network Regression</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906029.aspx"> 
  Ordinal Regression</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Poisson Regression</a>
  </td><td><a href="#y">-</a>
  </td></tr>

<tr valign="top"><td rowspan="1"><a name="Clustering"></a>Clustering
  </td><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905944.aspx"> 
  K-means Clustering</a>
  </td><td><a href="#y">-</a>
  </td></tr>

<tr valign="top"><td rowspan="3"> Anomaly Detection
  </td><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn913103.aspx">
  One-class Support Vector Machine</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn913053.aspx">Principal Component Analysis-based Anomaly Detection</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a href="#x"> Time Series Anomaly Detection</a>
  </td><td><a href="#y">-</a>
  </td></tr>
<tr valign="top"><td rowspan="8"><a name="Two-class"></a> Two-class<br />Classification
  </td><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906036.aspx">
  Averaged Perceptron</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905930.aspx">
  Bayes Point Machine</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906025.aspx"> 
  Boosted Decision Tree</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906008.aspx"> 
  Decision Forest</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905976.aspx"> 
  Decision Jungle</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905994.aspx"> Logistic Regression</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905947.aspx"> Neural Network</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905835.aspx"> Support Vector Machine</a>
  </td><td><a href="#y">-</a>
  </td></tr>

<tr valign="top"><td rowspan="6"><a name="Multi-class"></a> Multi-class<br />Classification
  </td><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905810.aspx"> 
  Tune Model Hyperparameters</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906015.aspx"> Decision Forest</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905963.aspx"> Decision Jungle</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905853.aspx"> Logistic Regression</a> 
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906030.aspx"> 
  Neural Network</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn905887.aspx"> 
  One-vs-all</a>
  </td><td><a href="#y">-</a>
  </td></tr>

<tr valign="top"><td rowspan="4"><a name="TextAnalytics"></a> Text Analytics
  </td><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/dn906018.aspx"> 
  Feature Hashing</a>
  </td><td><a href="#y">-</a>
  </td></tr>
  <tr valign="top"><td><a target="_blank" href="https://msdn.microsoft.com/en-us/library/azure/mt712721.aspx"> 
  Named Entity Recognition Vowpal Wabbit (v8)</a>
  </td><td><a href="#y"> <a href="https://github.com/JohnLangford/vowpal_wabbit/wiki">JohnLangford</a></a>
  </td></tr>
  <tr valign="top"><td>
  Sentiment analysis</a>
  </td><td><a href="#y"> ?</a>
  </td></tr>
  <tr valign="top"><td>
  Bot (chat) Framework</a>
  </td><td><a href="#y"> ?</a>
  </td></tr>

<tr valign="top"><td rowspan="1"><a name="CV"></a> Computer Vision
  </td><td><a href="#x"> OpenCV Library</a>
  </td><td><a href="#y">-</a>
  </td></tr>
<tr valign="top"><td rowspan="1"><a name="VoiceRecognition"></a> Voice
  </td><td><a href="#x"> Text to Speech</a>
  </td><td><a href="#y"> Cortana</a>
  </td></tr>
<tr valign="top"><td rowspan="1"><a name="Translation"></a> Translation
  </td><td><a href="#x"> Language Translation</a>
  </td><td><a href="#y"> Cortana</a>
  </td></tr>
</tbody></table> 
