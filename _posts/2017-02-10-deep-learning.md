---
layout: post
title: "Deep learning"
excerpt: "More Hidden Layers in the Neural Networks for fun and profit"
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

Deep learning neural networks have increased in popularity recently because it outperform other methodologies for machine learning. 

Due to the advancement of distributed compute resources, organizations are generating an torrant of image, text, and voice data from which insights are not previously possible.

Machine learning is a type of AI (Artificial Intelligence) that enables computers to do things without being explicitly programmed by geeks. Machine learning algorithms can identify information from data fed through <strong>generic</strong> algorithms which build their own logic based on the patterns detected within the data.

Machine learning builds a model from example inputs to make data-driven predictions
vs. following strictly static program instructions.
Not logic defined by developers.

Patterns are recognized by neural network algorithms. A neural network has multiple layers. At the top layer, the network trains on a specific set of features and then sends that information to the next layer. The network takes that information, combines it with other features and passes it to the next layer, and so on.


<a target="_blank" href="https://medium.com/@ageitgey/machine-learning-is-fun-80ea3ec3c471">
Machine Learning is Fun!</a>
The world’s easiest introduction to Machine Learning


### Types of machine learning

<strong>Supervised</strong> learning aims to predict an output given an input.
It makes use of 
a <strong>labeled</strong> data set of training data (examples) 
to which we know the "answer". It gets feedback on what is
correct or not. The training correlates features 
to outputs in order to predict outputs based on new inputs.

   * For text processing (Sentiment Analysis) 
   and speech recognition: 
   <strong>RNTN (Recurrent Net or a Recursive Neural Tensor Network)</a>
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

<strong>Unsupervised</strong> learning aims to discover a good internal
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

<strong>Reinforcement</strong> learning does not provide feedback until a goal is achieved.
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

<strong>Transfer learning</strong>

   * https://www.youtube.com/watch?v=Yx6Wv_SCKjI&index=16&list=PLjJh1vlSEYgvZ3ze_4pxKHNh1g5PId36-

<strong>One-shot learning</strong> 
(aka Probabilistic Programming) 
is where a neural network 
learns from one (or a few) example, 
as opposed to a large amount of data.



## Introduction

Adam Geitgy's introduction of Machine Learning
https://medium.com/@ageitgey/machine-learning-is-fun-80ea3ec3c471/
"for anyone who is curious about machine learning but has no idea where to start."

Tool:
<a target="_blank" href="http://bsft.io/x/115bvm?uid=89513dce-39c3-47ab-a0f6-a97f7825c62b&mid=cf8e63e2-44c8-4ae3-b033-41f708052cca">
Neural Network Playground</a>.



## AI

https://www.accenture.com/us-en/company-event-world-economic-forum-2017?c=ad_usweffy17psgs&n=Accenture_&_WEF_-_ALLGEOS

https://hackernoon.com/learning-ai-if-you-suck-at-math-8bdfb4b79037#.237w9fvfw
https://github.com/makeyourownneuralnetwork/makeyourownneuralnetwork
Code for the Make Your Own Neural Network book
by Tariq Rashid.


## Stanford class

https://web.stanford.edu/class/cs20si/

## Udacity class

https://docs.google.com/spreadsheets/d/1NZtIxDWiJ_B0UKhIDUk-wTZAT3Fxfh-fGwcQKXg1bQU/edit#gid=0

https://medium.com/udacity/deep-learning-nanodegree-foundation-program-syllabus-in-depth-2eb19d014533#.2s4o7xo0y
Dhruv Parthasarathy
Director of Machine Learning + Self-Driving Car Programs @Udacity
Deep Learning Nanodegree Foundation Program Syllabus
a 17-week, hands-on introduction to this transformational technology, designed for those who have at least an intermediate Python background.



Neural networks are an approach to artificial intelligence modeled after the human brain,
which made of billions of interconnected neurons.

Covering Convolutional Neural Networks (CNN), Recurrent Neural Networks, Reinforcement Learning, and other applications of Deep learning.


http://cs231n.github.io/python-numpy-tutorial/
Python tutorial


http://neuralnetworksanddeeplearning.com/



Facebook’s Wit.ai 

Howdy’s Slack bot 


Cloud platforms like Google’s APIs and Microsoft Azure allow you to create intelligent apps without having to worry about setting up and maintaining accompanying infrastructure.

https://www.oreilly.com/ideas/software-engineering-of-systems-that-learn-in-uncertain-domains

https://www.oreilly.com/ideas/untapped-opportunities-in-ai

https://www.oreilly.com/ideas/artificial-intelligence-human-inhuman

https://www.youtube.com/watch?v=Th_ckFbc6bI&feature=youtu.be&t=2m4s


## Decision surface

The dividing line for whether a particular point is called a decision surface.

## Classification 

Gaussian Naive Bayes text learning. (Naive doesn't consider word order).
So phrases (containing multiple words) get it confused.

skikit-learn.org/stable/modules/generated/sklearn.naive_bayes.GaussianNB.html

Logistic Regression

SVM (Support Vector Machines) can handle simple pattern complexity.
But a deep net is needed to handle complexity.



## Video classes

Udacity's Machine Learning (UD120)

   * https://github.com/udacity/ud120-projects
   starter project code


https://app.pluralsight.com/library/courses/azure-machine-learning-getting-started/table-of-contents
Getting Started with Azure Machine Learning
2 Nov 2016, 2h 14m
by Jerry Kurata (@jerrykur, insteptech.com)





## Neural network

Neural networks are inspired by how the human brain works.

A Neural network is an algorithm that learns to identify patterns in data.

Neurons are processing units.

https://en.wikipedia.org/wiki/Perceptron
Perceptrons are a single-layered feed-forward neural network.

Multi-layered Perceptron (MLP) have more powerful classifiers.
Neurons in a multilayer perceptron are free to take on any arbitrary activation function. 

   * https://en.wikipedia.org/wiki/Multilayer_perceptron

   * Platform H2O.ai offers data pre-processing 
   and built-in integration tools for pltaforms like HDFS, Amazon S3, SQL, and NoSQL.
   as well as MLP

Multilayer Perceptrons with rectified linear units (RELU)
(aka linear threshold neurons) compute a linear weighted sum of inputs,
then output a non-linear function of the total input.


Neurons are number values, not class objects.



### Linear Regression

correlaton is not causation

https://github.com/llSourcell/linear_regression_live/blob/master/demo.py

https://github.com/lengstrom/fast-style-transfer

https://www.youtube.com/watch?v=xVJwwWQlQ1o

df = pd.DataFrame({'A':['one', 'one', 'two', 'two'], 'B':['a', 'b', 'a', 'b'], 'C':range(4)})
df

  This displays column A, B, C and rolws 0 - 3.



https://github.com/llSourcell/How_to_use_Tensorflow_for_classification-LIVE



We find the best fit by minimizing the loss function
using gradient descent, changing the slope
toward whatever direction most reduces error.

   <img alt="gradient descent" src="https://raw.githubusercontent.com/mattnedrich/GradientDescentExample/master/gradient_descent_example.gif">

Use a circle or two lines.
A neural network uses several tests (layers): 
shown as Blue and orange lines of demarcation.

A weight is multiplied on each input to change its influence.
A higher weight has more influence on the outcome.
Weight values are adjusted based on results, in a feedback loop.
This is the training mechanism.

So the initial weight can be any random number.

Yes is a 1, No is a 0.
These are a hidden layer.

The "deep" in Deep Learning refers to deep stacks of 
hidden layers.

AND vs XOR

http://www.ats.ucla.edu/stat/data/binary.csv
from UCLA has 3 dimensions


uses matrix multiplication 
taught in linear algebra courses.

Error for units is proportional to the error in the
output layer times the weight between the units.

Errors are popagated backward through the network.
This is called Backpropagation.

https://www.youtube.com/watch?v=0qVOUD76JOg
The art of neural networks | Mike Tyka | TEDxTUM
TEDx Talks


<a target="_blank" href="https://www.youtube.com/watch?v=g-PvXUjD6qg&list=PLlJy-eBtNFt6EuMxFYRiNRS07MCWN5UIA">
lectures from his course at Stanford:
CS231n Convolutional Neural Networks for Visual Recognition</a>
by professor Fei-Fei Li with Andrej and
Justin Johnson.
Notes at:
http://cs231n.github.io/optimization-2

CNN = Convulutional Neural Network

Computer vision touches
Pixel data called the "Dark Matter" of the internet

https://www.youtube.com/playlist?list=PLehuLRPyt1Hyi78UOkMPWCGRxGcA9NVOE">
Deep Learning course at U of Waterloo 
18 Sep 2015</a>
by 
Ali Ghodsi


## CNN (Convolutional Neural Networks)

https://www.youtube.com/watch?v=JiN9p5vWHDY&index=7&list=PLjJh1vlSEYgvZ3ze_4pxKHNh1g5PId36-

Each neuron is focused only on a portion of an overall image.

A deep CNN has 3+ layers:

1. A "Convolution" layer filters for a specific pattern.
The filter is the combination of all individual "flashlights" 
shinning on various portions of an image.

2. RELU (Rectified linear unit) activation.

3. Pooling ensures that the net focuses on the most relevant patterns.

4. Additional fully connected layers to support classification.

CNN's require a large set of labelled input data for training,
and thus require GPU processing power.


## NLP

https://www.cs.ox.ac.uk/teaching/courses/2016-2017/dl/
Oxford Deep NLP 2017 course

https://github.com/oxford-cs-deepnlp-2017

## Text analysis

https://de.dariah.eu/tatom/working_with_text.html
creates a  document-term matrix containing 
Word (or n-gram) frequencies.


## Python Classes

<a target="_blank" href="https://www.udemy.com/python-for-data-science-and-machine-learning-bootcamp/">
$10 Python for Data Science and Machine Learning Bootcamp</a>
by Jose Portilla


### Java in DL4j

Although Python is vastly more popular, there is a Java library
that can run on both Scala and Clojure.

Adam Gibson at 
SkyMind
developed 
Deeplearning4j (referred to as DL4j)
to be commercial-grade library to run on a distributed, multi-node setup. 
It comes with GPU support for distributed training. 

The DL4j team built a vectorization library called Canova.

In it one can select values for its hyper parameters. 

DL4j supports most of the deep nets – RBM, DBN, Convolutional net, Recurrent net, RNTN, autoencoders, and vanilla MLP. 

#### Iterative Map-reduce

A traditional map-reduce procedure (Hadoop) 
is sequential and runs one time.

Iterative Map-Reduce with DL4j's machine learning model 
uses a two-step procedure on a distributed framework:

   During the “Map” step, input data is distributed across all the nodes in the cluster. 
   Each node trains the net with the portion of data it receives.

   During the “Reduce” step, the weights and biases across every node in the cluster 
   are averaged together. Each node replaces the parameters of its net with this new average.

These two steps are repeated iteratively until the overall error is sufficiently small.

### Torch for Lua

Torch is a library for LuaJIT, a popular implementation of the Lua programming language
so that a deep net can be called within the routines of your Lua program.
That is, after you set up, train, and run a deep net by configuring 
hyper-parameters. 

Torch is a collaboration by Ronan Collobert and Soumith Chintala of Facebook, Clement Farabet
of Twitter, and Koray Kavukcuoglu of Google DeepMind.

The Torch library provides a vectorized implementation of the math behind Deep Learning algorithms.
The community “Cephes” library extends Torch with a specialized math library. 

Torch and its many extended libraries allow you to build just about every type of deep net. 
The “CuTorch” community library provides GPU support of the CUDA library.

The “NN” library enables work with different architectures and stack different nets together. 

“NNgraph” graphs data from the “NN” library. 

“DP” streamlines deep learning library for the R&D process. 

### Caffe for C++

Yangqing Jia (http://daggerfs.com)
who won an ImageNet Challenge in 2014 (and worked at Facebook before joining Google)
created the Caffe Deep Learning Library 
during his PhD at UC Berkeley. Thus its home at
http://caffe.berkeleyvision.org
provides educational resources like demos and slides.

Caffe is written in C++ with CUDA.
So the application can easily switch between a CPU and fast GPUs.
Caffe vectorizes input data as "blob" arrays that speed up data analysis and 
synchronizes between a CPU and a GPU.
Matlab and Python interfaces are also available,

Caffe was originally designed for machine vision tasks using convolutional nets. 
Recent versions support speech and text, reinforcement learning, and 
recurrent nets for sequence processing. 

Caffe's hyper-parameters layer configuration options are very sophisticated,
enabling extremely complex deep nets to be built.

A net can be created with many different types of layers,
each performs a different function or take on a different role:
: vision, loss, activation, etc.

Caffe's “Model Zoo” a large community of users contributing their own deep net 
others can upload.
AlexNet and GoogleNet are popular user-made nets.




## Resources

https://github.com/josephmisiti/awesome-machine-learning

Hacker News

Reddit

<a target="_blank" href="https://www.youtube.com/watch?v=BR9h47Jtqyw">
A friendly introduction to Deep Learning and Neural Networks</a>
by Luis Serrano


## Rock stars

Deep learning researchers:

### Andrew Ng

   <a target="_blank" href="https://www.youtube.com/watch?v=ylWBbxQHwFM&list=PLLH73N9cB21V_O2JqILVX557BST2cqJw4">
   YOUTUBE 45 video playlist added in 2014</a>
   is an academic deep dive into math notation and linear algebra.

   Stanford Graduate School of Business

   <a target="_blank" href="https://www.youtube.com/watch?v=O0VN0pGgBZM">
   He joined Baidu 

   <a target="_blank" href="https://www.youtube.com/watch?v=F1ka6a13S9I">
   Nuts and Bolts of Applying Deep Learning (Andrew Ng)</a>
   27 Sep 2016

   <a target="_blank" href="https://www.youtube.com/watch?v=21EiKfQYZXc">
   Artificial Intelligence is the New Electricity</a>


### Geoff Hinton

   In 2015, Jeff Hinton (at the University of Toronto, Canada)
   made a breakthrough with speech recognition
   by using Neural Networks. He is now called the "Godfather" of Deep Learning.
   He did it by giving his system more data and using larger computers.

   He is now working at Google.

   * https://www.youtube.com/watch?v=cbeTc-Urqak&list=PLoRl3Ht4JOcdU872GhiYWf6jwrk_SNhz9
   Lecture 1.1 - Why do we need machine learning</a>
   by Geoffrey Hinton on Coursera's Neural Networks for Machine Learning in 2012

### Yann LeCun at NYU

   https://www.facebook.com/ylecun/?ref=timeline_chaining

### Yoshua Benjio

### Andrej Karpathy

   * https://github.com/karpathy/convnetjs<br />
   Convolutional Neural Network

   * <a target="_blank" href="https://www.youtube.com/watch?v=Ih5Mr93E-2c">
   VIDEO: Lecture 10 - Neural Networks at CalTech</a>

   * <a target="_blank" href="https://medium.com/@karpathy/yes-you-should-understand-backprop-e2f06eab496b#.vt3ax2kg9">
   MEDIUM: Yes, you should understand backprop</a>

### Fei-Fei Li at Stanford's Vision Lab

   * <a target="_blank" href="https://www.youtube.com/watch?v=g-PvXUjD6qg&list=PLlJy-eBtNFt6EuMxFYRiNRS07MCWN5UIA">
   lectures from his course at Stanford:
   CS231n Convolutional Neural Networks for Visual Recognition</a>
   by professor Fei-Fei Li with Andrej and
   Justin Johnson.
   Notes at:
   http://cs231n.github.io/optimization-2

   * <a target="_blank" href="https://www.youtube.com/watch?v=40riCqvRoMs">
   How we teach computers to understand pictures</a>
   Mar 23, 2015
   says she worked with Kai Li of Princeton to launch the ImageNet Project in 2007
   used 50,000 Amazon Mechanical Turk workers to lable a billion pictures.
   [8:53] 15 million images in 22,000 categories in English words.
   Used CNN of 24 M nodes, 140 M parameters, 15 B connections.
   [12:04] Knows make, model, and year of cars from Google StreetView images.
   2015: generate sentences.

   * https://www.youtube.com/watch?v=IXxh5C9iKFE
   At Innovate and Celebrate 2016 techcocktail 7,514 views

   * https://www.youtube.com/watch?v=ylVsqXzlJqA
   Visual Intelligence

   * https://www.youtube.com/watch?v=AFARhD-NmDw
   Microsoft Research Faculty Fellowship

### Michael Nielson

   Book

### Jurgen Schmidhuber & Sepp Hochreiter

   They came up with Recurrent Nets used in
   speech recognition and driverless cars.

### Oliver

   Transmissions.ai email newsletter 

### Ian Goodfellow

   @goodfellow_ian
   
   Research Scientist at OpenAI. 

   Lead author of http://www.deeplearningbook.org  

### Misha Denil

   @notmisha

   Research Scientist at Google DeepMind. 

   London · http://mdenil.com


<hr />

## Schools

bay area deep learning.org

nips 2017

deep learning school Montreal

