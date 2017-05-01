---
layout: post
title: "Machine Learning"
excerpt: "It can do it for you"
tags: [Python, Machine Learning]
shorturl: "https://goo.gl/iR7sMJ"
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

{% include _toc.html %}

Machine learning is a type of AI (Artificial Intelligence) that enables computers to do things without 
being explicitly programmed by human developers. 
EXAMPLE: In 2016, IBM's Watson software was able to beat the Jeopardy game champion
by "learning" from books and encyclopedias. 

In other words, machine learning builds a "model" from <strong>example</strong> 
inputs to make data-driven predictions
vs. following strictly static program instructions (logic defined by human developers).

IBM's programmers only created the "algorithms" that enabled the computer to learn.
Machine learning algorithms identify information from data fed through "generic" (general purpose) algorithms which 
build their own logic from detecting <strong>patterns</strong> within the data.

Patterns are recognized by neural network algorithms. A neural network has multiple layers. At the top (or left) layer, the network trains on a specific set of "features" and then sends that information to the next layer. 
The network takes that information, combines it with other features and passes it to the next layer, and so on.

Due to the advancement of distributed compute resources, organizations are 
generating an torrant of image, text, and voice data from which insights are not previously possible.


## Introductory Resources

YOUTUBE:
<a target="_blank" href="https://www.youtube.com/watch?v=BR9h47Jtqyw">
A friendly introduction to Deep Learning and Neural Networks</a>
by Luis Serrano

<a target="_blank" href="https://medium.com/@ageitgey/machine-learning-is-fun-80ea3ec3c471">
Machine Learning is Fun!</a> (article on Medium)
self-proclaimed "the world’s easiest introduction to Machine Learning".

Adam Geitgy's introduction of Machine Learning
https://medium.com/@ageitgey/machine-learning-is-fun-80ea3ec3c471/
"for anyone who is curious about machine learning but has no idea where to start."

Tool:
<a target="_blank" href="http://bsft.io/x/115bvm?uid=89513dce-39c3-47ab-a0f6-a97f7825c62b&mid=cf8e63e2-44c8-4ae3-b033-41f708052cca">
Neural Network Playground</a>.



## Types of machine learning

### Supervised learning 

aims to predict an output given an input.
It makes use of 
a <strong>labeled</strong> data set of training data (examples) 
to which we know the "answer". It gets feedback on what is
correct or not. The training correlates features 
to outputs in order to predict outputs based on new inputs.

   * For text processing (Sentiment Analysis) 
   and speech recognition: 
   RNTN (Recurrent Net or a Recursive Neural Tensor Network)
   that operates on a character level.
   RNTNs were conceived by Richard Socher of 
   <a target="_blank" href="https://metamind.io/">
   MetaMind.io</a> as part of his PhD thesis at Stanford.
   In 2016 it became part of Salesforce Einstein Predictive Services at
   https://metamind.readme.io/v1/docs

   Recurrent nets can process data that changes with time,
   and has a feedback loop that acts as a forecasting engine.

   RNTNs are better than feedforward or recurrent nets with
   data with a hierarchical structure (binary trees), 
   such as the parse trees of a group of sentences.

   TOOL:
   <a target="_blank" href="https://clarifai.com/">
   Clarifai</a> uses a convolutional net to recognize things and concepts in a digital image.
   It then presents similar images.

   * For time series analysis, use a recorrent net.
   
   * For image recognition: DBN (Deep Belief Network) or 
   Convolutional Net

   * For object recognition: Convolutional Net

### Unsupervised learning #

aims to discover a good internal
representation of the input. 
It makes use of a dataset without labels. 
Feature extraction:
It identifies the structure of data to solve some given task.
Pattern recognition:
It <strong>classifies</strong> patterns and clusters data.

   * Autoencoders encode their own structure.
   They are feature extractors with the same number of input and output nodes.
   A hidden layer in Autoencoders provides a bottleneck
   of nodes reconstruction of input layer.
   So they can be used for image compression.

   * RBM (Restricted Boltzmann Machine) is an autoencoder
   with one visible and one hidden layer.
   Each visible node connects to all nodes in the hidden layer.

   The "restricted" is because there is no connection among nodes within its layer.

   RBM determines the relationship among input features.

   In training loops,
   RBM reconstructs inputs in the backward pass.

   RBM uses a measure called KL Divergence that compares actual to recreation of data

   RBM makes decisions about what features are important based on weights and 
   overall bias.

   RBM is like a two-way translator.

   All this means that data in
   RBM does not need to be labeled.

   As an example, to determine whether an animal is acerous or not acerous (has horns), it
   look at features such as color, number of legs, horns, 

   Principal Component Analysis is a widely used linear method for finding
   a low-dimensional representation.

### Reinforcement learning 

does not provide feedback until a goal is achieved.
Its objective is to select an action to maximize payoff.

In Dec 2013, Volodymyr Mnih 
and others at 
<a target="_blank" href="https://www.deepmind.com/">
DeepMind.com</a> (a small company in London)
uploaded to Arxiv a paper titled
<a target="_blank" href="https://arxiv.org/abs/1312.5602">
“Playing Atari with Deep Reinforcement Learning”</a>. 
The paper describes how a "convolutional neural network" program 
learned to play several games on the Atari 2600 console (Pong, Breakout, SpaceInvaders, Seaquest, Beam Rider)
by observing raw screen pixels of 210 × 160. 
The program learned by receiving a reward when the game score increased. 
This was hailed as general AI because the games and the goals in every game were very different but, without any change, learned seven different games, and performed better than some humans in three of them. 
<a target="_blank" href="https://www.nervanasys.com/demystifying-deep-reinforcement-learning/">
*</a> 
Their 
<a target="_blank" href="http://www.nature.com/articles/nature14236">
Feb. 2015 article in Nature</a> gave them widespread attention.
Then Google bought DeepMind (for $400 million).

   * https://www.youtube.com/watch?v=e3Jy2vShroE&index=17&list=PLjJh1vlSEYgvZ3ze_4pxKHNh1g5PId36-

   * https://www.nervanasys.com/demystifying-deep-reinforcement-learning/


### Transfer learning

   * https://www.youtube.com/watch?v=Yx6Wv_SCKjI&index=16&list=PLjJh1vlSEYgvZ3ze_4pxKHNh1g5PId36-

### One-shot learning

(aka Probabilistic Programming) 
is where a neural network 
learns from one (or a few) examples, 
as opposed to a large amount of data.


## Tools

From http://www.infoworld.com/article/3163525/analytics/review-the-best-frameworks-for-machine-learning-and-deep-learning.html


### Deep Learning Frameworks

TensorFlow r0.10
from Google

   * http://www.infoworld.com/article/3127397/artificial-intelligence/review-tensorflow-shines-a-light-on-deep-learning.html

Microsoft Cognitive Toolkit v2.0 Beta 1 (aka CNTK 2)
from Microsoft

   * http://www.infoworld.com/article/3138507/artificial-intelligence/review-microsoft-takes-on-tensorflow.html<br />

   * uses a declarative BrainScript neural network configuration language

   * No MacOS support yet

   * CNTK 2 models on GPU-equipped N-series family of Azure Virtual Machines.

   * Azure Machine Learning is part of the larger Microsoft Cortana Analytics Suite offering. 


Caffe 1.0 RC3
from Berkeley Artificial Intelligence...

   * http://www.infoworld.com/article/3154273/analytics/review-caffe-deep-learning-conquers-image-classification.html

MXNet v0.7
from Distributed Machine Learning...

   * http://www.infoworld.com/article/3149598/artificial-intelligence/mxnet-review-amazons-scalable-deep-learning.html

   * Amazon's DNN framework of choice, combines symbolic declaration of neural network geometries with imperative programming of tensor operations. 

   * MXNet scales to multiple GPUs across multiple hosts with a near-linear scaling efficiency of 85 percent and boasts excellent development speed, programmability, and portability. 

   * Its  dynamic dependency scheduler allows mixing symbolic and imperative programming flavors:
   Python, R, Scala, Julia, and C++

   * trained MXNet models can also be used for prediction in Matlab and JavaScript.

   * Ahead of TensorFlow with embed imperative tensor operations.

### Machine Learning frameworks

Scikit-learn 0.18.1
from Scikit-learn

   * http://www.infoworld.com/article/3158509/analytics/review-scikit-learn-shines-for-simpler-machine-learning.html

   * Mature documentation and libraries

   * Python-based, but does not support PyPy compiler

Spark MLlib 2.01
from Apache Software Foundation

   * http://www.infoworld.com/article/3141605/artificial-intelligence/review-spark-lights-up-machine-learning.html

   * Written in Scala and uses the linear algebra package Breeze which uses netlib-java.

   * Get data easily from Spark big-data clusters

   * Supported in the Databricks cloud

