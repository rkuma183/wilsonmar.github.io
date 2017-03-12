---
layout: post
title: "Deep learning courses"
excerpt: "Get deep on deep learning and get trained about training by one of the cool kids"
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

Here are ways to get trained by Deep Learning practioners and teachers.

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



## Classification 

Gaussian Naive Bayes text learning. (Naive doesn't consider word order).
So phrases (containing multiple words) get it confused.

skikit-learn.org/stable/modules/generated/sklearn.naive_bayes.GaussianNB.html

Logistic Regression

SVM (Support Vector Machines) can handle simple pattern complexity.
But a deep net is needed to handle complexity.




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

ICYMI: "correlaton is not causation"

https://github.com/llSourcell/linear_regression_live/blob/master/demo.py

https://github.com/lengstrom/fast-style-transfer

https://www.youtube.com/watch?v=xVJwwWQlQ1o

df = pd.DataFrame({'A':['one', 'one', 'two', 'two'], 'B':['a', 'b', 'a', 'b'], 'C':range(4)})
df

  This displays column A, B, C and rolws 0 - 3.


The dividing line for whether a particular point is called a <strong>decision surface</strong>.


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

Computer vision touches
Pixel data called the "Dark Matter" of the internet


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

https://visual-recognition-demo.mybluemix.net/train



## Rock stars' Tutorials

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

   In 2012, Jeff Hinton with Alex Krizhevsky, and Ilya Sutskever
   published "Imagenet classification with deep convolutional neural networks".

   In 2015, Geoffrey E. Hinton (at the University of Toronto, Canada)
   made a breakthrough with speech recognition
   using Neural Networks. He is now called the "Godfather" of Deep Learning.
   He did it by giving his system more data and using larger computers.

   He is now working at Google.

   * https://www.youtube.com/watch?v=cbeTc-Urqak&list=PLoRl3Ht4JOcdU872GhiYWf6jwrk_SNhz9
   Lecture 1.1 - Why do we need machine learning</a>
   by Geoffrey Hinton on Coursera's Neural Networks for Machine Learning in 2012

### Yann LeCun at NYU

   https://www.facebook.com/ylecun/?ref=timeline_chaining

   Who's afraid of ...

   Published in 1998 "Gradient-based learning applie to document recognition".


### Suraji

   Udacity's Machine Learning (UD120)

   * https://github.com/udacity/ud120-projects
   starter project code

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

### Jose Portilla

   <a target="_blank" href="https://www.udemy.com/python-for-data-science-and-machine-learning-bootcamp/">
   $10 Python for Data Science and Machine Learning Bootcamp</a>

## Jerry Kurata 

   (@jerrykur, insteptech.com)

   <a target="_blank" href="https://app.pluralsight.com/library/courses/azure-machine-learning-getting-started/table-of-contents">
   Pluralsight: Getting Started with Azure Machine Learning
   2 Nov 2016, 2h 14m</a>

### Ali Ghodsi

   <a target="_blank" href="https://www.youtube.com/playlist?list=PLehuLRPyt1Hyi78UOkMPWCGRxGcA9NVOE">
   Deep Learning course at U of Waterloo
   18 Sep 2015</a>



### Jeremy Howard

Jeremy Howard 
(<a target="_blank" href="https://twitter.com/jeremyphoward">@jeremyphoward</a>,
<a target="_blank" href="https://www.wikiwand.com/en/Jeremy_Howard_(entrepreneur)">Wikipedia</a>)
<a target="_blank" href="https://kaggle.com/">Kaggle</a> 
President of Kaggle itself), as well as entrepreneur founder of Enlitic
that applies Deep Learning to medicine (and doing the job better than expert Radiologists).

   * <a target="_blank" href="http://www.ted.com/talks/jeremy_howard_the_wonderful_and_terrifying_implications_of_computers_that_can_learn">TED Talks: The wonderful and terrifying implications of computers that can learn</a>
   2014

He teamed up with
Rachel Thomas (previously Data Scientist at Uber and #HackBrightX) 
to make a practical coding-centric course.

Key links:

   * https://github.com/fastai/courses/tree/master/setup
   * http://wiki.fast.ai/index.php/Main_Page
   * http://forums.fast.ai/
   * https://fastai.slack.com/ access

They donated their earnings to the
<a target="_blank" href="https://www.hollows.org.nz/">Fred Hollows Foundation</a> to cure blindness.
   
   <a target="_blank" href="https://www.youtube.com/channel/UCX7Y2qWriXpqocG97SFW2OQ">
   Videos of them talking on YouTube</a>
   are annotated in <a target="_blank" href="http://course.fast.ai/lessons/lessons.html">
   Fast.ai web page on each lesson</a> that contains links to materials.

   * <a target="_blank" href="http://course.fast.ai/lessons/aws.html">
   Getting Started</a> talks about how to make use of the class materials,

   * <a target="_blank" href="http://course.fast.ai/lessons/lesson0.html">
   Why deep learning: Intro to convolutions</a> 11 August 2016 [46:48] covers
   Sobel filter, max pooling, confusion matrix.

   * <a target="_blank" href="http://course.fast.ai/lessons/aws.html">
   Setup with AWS [13:11]</a> 

   https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#Limits:

   Select the appropriate AWS region at the upper-right corner.

   https://aws.amazon.com/contact-us/ec2-request

   PROTIP: Get things working on a t2.micro instance, then switch.
   
   See http://forums.fast.ai/t/persistent-aws-spot-instances-how-to/1497?u=z0k
   to setup CLI to use cheaper spot instances rather than On Demand instances.

   https://aws.amazon.com/ec2/instance-types/

   GPU Compute: <strong>p2.xlarge</strong> New Limit: 1, for "fast.ai MOOC".

   https://aws.amazon.com/emr/pricing/

   P2.xlarge for $0.12/hour

   https://www.floydhub.com/
   offers a cheaper cloud at per-second billing and less setup

   PROTIP: AWS p2 instances with Nvidia GPUs for TensorFlow are "between 2x-3x faster compared to previous generation g2 instances across a variety of convolutional neural networks."
   <a target="_blank" href="http://www.bitfusion.io/2016/11/03/quick-comparison-of-tensorflow-gpu-performance-on-aws-p2-and-g2-instances/">*</a>

   To run Bash scripts in Windows, install https://www.cygwin.com, wget.

   https://github.com/fastai/courses/blob/master/setup/install-gpu.sh

### Platform.ai files

   <a target="_blank" href="http://platform.ai/files/">
   http://platform.ai/files/</a>
   (https results in an invalid certificate error).

   <a target="_blank" href="https://platform.ai/files/setup_p2.sh">
   https://platform.ai/files/setup_p2.sh</a>

   Once inside, 

   wget https://platform.ai/files/aws-alias.sh

   sudo rm .bash_history

   Password: dl_course

   Elastic IP

   0. <a target="_blank" href="http://course.fast.ai/lessons/lesson1.html">
   Recognizing cats and dogs</a> 

   http://www.platform.ai/files/dogscats.zip

   * <a target="_blank" href="https://www.youtube.com/watch?v=Th_ckFbc6bI">
   Lesson 1: Practical Deep Learning for Coders</a> 

   https://www.youtube.com/watch?v=Th_ckFbc6bI
   [1:38:45] for GTX 970, Tesla M60, Tesla K80

   OVH.com $200 per month handles double precision math

   0. <a target="_blank" href="http://course.fast.ai/lessons/lesson2.html">
   Convolutional Neural Networks (CNN)</a> in an Excel spreadsheet!

   0. <a target="_blank" href="http://course.fast.ai/lessons/lesson3.html">
   Under fitting and over fitting</a>

   0. <a target="_blank" href="http://course.fast.ai/lessons/lesson4.html">
   Collaborative filtering, embeddings, and more</a>

   0. <a target="_blank" href="http://course.fast.ai/lessons/lesson5.html">
   Introduction to NLP and RNNs</a>

   0. <a target="_blank" href="http://course.fast.ai/lessons/lesson6.html">
   Building RNNs</a>

   0. <a target="_blank" href="http://course.fast.ai/lessons/lesson7.html">
   Exotic CNN architectures; RNN from scratch</a>

Their course is designed for anyone with coding experience, and "some memory" of high-school math. 
You will start with step one—learning how to get a GPU server online suitable for deep learning—and go all the way through to creating state of the art, highly practical, models for computer vision, natural language processing, and recommendation systems. 

   0. <a target="_blank" href="http://course.fast.ai/lessons/lesson7.html">
   Exotic CNN architectures; RNN from scratch</a>


The videos were recorded at 
<a target="_blank" href="https://www.usfca.edu/data-institute">
The Data Institute at USF</a> from Feb 27, 2017.

Python 2 and Theano is used. <br />
Python 3 and Tensorflow will be use during
<a target="_blank" href="http://www.fast.ai/2017/01/17/curriculum2/">Part 2</a>, targeted to be online around May 2017.
Particularly write custom GPU accelerated algorithms from scratch in Tensorflow. For time series, computer vision, large datasets.
XGBoost R package designed and optimized for boosting trees algorithms.

### Nvidia

https://www.youtube.com/watch?v=rvMVqPsXL10


<hr />

## Schools

bay area deep learning.org

deep learning school Montreal

nips 2017


## Resources

https://github.com/josephmisiti/awesome-machine-learning

Hacker News

Reddit

<a target="_blank" href="https://www.youtube.com/watch?v=BR9h47Jtqyw">
A friendly introduction to Deep Learning and Neural Networks</a>
by Luis Serrano

