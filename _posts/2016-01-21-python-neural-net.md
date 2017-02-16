---
layout: post
title: "Feed Forward Neural Network Python program"
excerpt: "Deep Learning Neural Networks using Python"
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

This is a code walkthrough of a Python program 
using a Feed-Forward neural network,
the simplest and most common of algorithms for Machine Learning.

Becuase I haven't seen it elsewhere, 
I structured this according to the Python program that runs a neural network.
It's like my other posts that aims to build skills, with commentary along the way
based on knowledge gained from various sources.

<hr />

At the top of the file:

0. Require Python 3 is being used:

   <pre>
import sys
&nbsp;
if sys.version_info[0] < 3:
    raise Exception("Python 3 or a more recent version is required.")
   </pre>

   Python programs indent 4 spaces instead of using endif statements.

0. Libraries as Headers and Imports

   <pre>
%matplotlib inline
%config InlineBackend.figure_format = 'retina'
&nbsp;
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
   </pre>

   These lines assume that the libraries were installed.

   ### Numpy

   The Standard Python Library class array.array only handles one-dimensional arrays.
   The `numpy.array` class alias is called `ndarray` for n-dimensional arrays. 

   An array is a table of elements (usually numbers), all of the same datatype, 
   indexed by a tuple of positive integers. In NumPy dimensions are called axes. The number of axes is rank.
   For example, the coordinates of a point in 3D space [1, 2, 1] is an array of rank 1, because it has one axis. That axis has a length of 3.

   https://docs.scipy.org/doc/numpy-dev/user/quickstart.html

   http://cs231n.github.io/python-numpy-tutorial/

   ### Pandas

   <a target="_blank" href="http://pandas.pydata.org/pandas-docs/stable/10min.html">
   10 minutes to Pandas</a>
   which parses data and provides views of it.

   ### Matplotlib

   Matplotlib works like MATLAB

   http://matplotlib.org/users/pyplot_tutorial.html

   ## Additional Visualization

   For <a target="_blank" href="http://seaborn.pydata.org/examples/index.html#example-gallery">
   richer visualizations</a>, the
   Seaborn library runs on top of matplotlib in Python.

   ### Scikit-learn

   scikit-learn (pronounced "Sklearn").

   http://scikit-learn.org/stable/tutorial/basic/tutorial.html
   introduction

   ### Commercial libraries

   * DeepLearning4j
   * Torch
   * Caffe

   ### Educational libraries

   * <a target="_blank" href="https://www.youtube.com/watch?v=fWkArbYtQbM&list=PLjJh1vlSEYgspxwsa5be5TVm3n9JNNC9G&index=2">
   Theano</a> by Yoshua Bengio and others at the U of Montreal.

   ## Data

0. Load and prepare the data

   Python commands:

   <pre>
data_path = 'Bike-Sharing-Dataset/hour.csv'
rides = pd.read_csv(data_path) 
rides.head()  # displays table:
   </pre>

   In the raw input file day.csv of 733 lines, which includes this Header:

   <pre>
instant,dteday,season,yr,mnth,holiday,weekday,workingday,weathersit,temp,atemp,hum,windspeed,casual,registered,cnt
   </pre>

   In the 7380 lines within hour.csv file is a header that contains an additional `hr` (hour) column to the right of 'mnth' (month).

  - instant: record index
  - dteday : date
  - season : season (1:springer, 2:summer, 3:fall, 4:winter)
  - yr : year (0: 2011, 1:2012)
  - mnth : month ( 1 to 12)
  - hr : hour (0 to 23)
  - holiday : weather day is holiday or not (extracted from http://dchr.dc.gov/page/holiday-schedule)
  - weekday : day of the week
  - workingday : if day is neither weekend nor holiday is 1, otherwise is 0.
  + weathersit : 
    - 1: Clear, Few clouds, Partly cloudy, Partly cloudy
    - 2: Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist
    - 3: Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds
    - 4: Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog
  - temp : Normalized temperature in Celsius. The values are divided to 41 (max)
  - atemp: Normalized feeling temperature in Celsius. The values are divided to 50 (max)
  - hum: Normalized humidity. The values are divided to 100 (max)
  - windspeed: Normalized wind speed. The values are divided to 67 (max)
  - casual: count of casual users
  - registered: count of registered users
  - cnt: count of total rental bikes including both casual and registered
  
0. Visualize data that shows maximums as spikes. See the first 10:

   <pre>
rides[:24*10].plot(x='dteday', y='cnt')  # first 10 rows
   </pre>

   Note the data goes from January 1 2011 to December 31 2012,
   so there will be differences by season, weather, month.

0. Dummy variables

   <pre>
dummy_fields = ['season', 'weathersit', 'mnth', 'hr', 'weekday']
for each in dummy_fields:
    dummies = pd.get_dummies(rides[each], prefix=each, drop_first=False)
    rides = pd.concat([rides, dummies], axis=1)

fields_to_drop = ['instant', 'dteday', 'season', 'weathersit', 
                  'weekday', 'atemp', 'mnth', 'workingday', 'hr']
data = rides.drop(fields_to_drop, axis=1)
data.head()  # display table
   </pre>

0. Standardize target variables

   Standardizing into continuous variables makes training the network easier. 
   Variables are shifted and scaled so they have a zero mean and a standard deviation of 1.

   Scaling factors enable us to go backwards when the network is used for predictions.

   <pre>
quant_features = ['casual', 'registered', 'cnt', 'temp', 'hum', 'windspeed']
# Store scalings in a dictionary so we can convert back later
scaled_features = {}
for each in quant_features:
    mean, std = data[each].mean(), data[each].std()
    scaled_features[each] = [mean, std]
    data.loc[:, each] = (data[each] - mean)/std
   </pre>

0. Split data into training, testing, and validation sets

   With time series data, we can train on historical data, 
   then predict using future data (the validation set).

   <pre>
# Save the last 21 days 
test_data = data[-21*24:]
data = data[:-21*24]
&nbsp;
# Separate the data into features and targets
target_fields = ['cnt', 'casual', 'registered']
features, targets = data.drop(target_fields, axis=1), data[target_fields]
test_features, test_targets = test_data.drop(target_fields, axis=1), test_data[target_fields]
   </pre>


0. Class definitions 

   <pre>
class NeuralNetwork(object):
   </pre>

0. Run function

   As with other programs, the main section is at the bottom of the source code file.

   <pre>
    def run(self, inputs_list):
        # Run a forward pass through the network
        inputs = np.array(inputs_list, ndmin=2).T
&nbsp;        
        #### Implement the forward pass here ####
        # TODO: Hidden layer
        hidden_inputs = # signals into hidden layer
        hidden_outputs = # signals from hidden layer
&nbsp;
        # TODO: Output layer
        final_inputs = # signals into final output layer
        final_outputs = # signals from final output layer 
&nbsp;
        return final_outputs
   </pre>

   Early layers detect the basic patterns (the building blocks of more refined patterns in later layers).

   When there are several hidden layers, it's called a "Deep" neural network.

   Errors in early layers would propagate through the lower layers.

   Early layers have smaller Gradiants, so are the slowest to train.

   The "vanishing gradiant"

0. Define constants

   Hyperparameters 

   <pre>
class NeuralNetwork(object):
    def __init__(self, input_nodes, hidden_nodes, output_nodes, learning_rate):
        # TODO: Set number of nodes in input, hidden and output layers.
        self.input_nodes = 2
        self.hidden_nodes = 2
        self.output_nodes = 1
   </pre>

   Self. makes parameters available to everyone.

0. Initialize weights

   Neural nets incorporate weights to learn (deduce) a linear function
   by adjusting weights depending on the output.
   Each of several iteration makes the function more accurate.

   Weights are used to propagate signals forward from the input to the output layers through a neural network. 
   
   We also use weights to propagate error backwards from the output back into the network to update our weights. 
   This is called backpropagation.


   <pre>
        # Initialize weights:
        self.weights_input_to_hidden = np.random.normal(0.0, self.hidden_nodes**-0.5, 
                                       (self.hidden_nodes, self.input_nodes))
        self.weights_hidden_to_output = np.random.normal(0.0, self.output_nodes**-0.5, 
                                       (self.output_nodes, self.hidden_nodes))
        self.lr = learning_rate
   </pre>

   We begin with randome numbers from a Normal probability curve.

   The weights get summed, and used by a sigmoid probability function in the receiving node. 
   ???

   There are <a target="_blank" href="https://stackoverflow.com/questions/11847133/neural-activation-functions-difference-between-logistic-tanh-etc">other functions</a>:

   * Logistic function: e<sup>x</sup>/(e<sup>x</sup> + e<sup>c</sup>)

   * Special ("standard") case of the logistic function: 1/(1 + e-x)

   * Tanh: (e<sup>x</sup>-e<sup>-x</sup>)/(e<sup>x</sup> + e<sup>-x</sup>), a sigmoid.

   * softmax ?

   using a sigmoid as the activation function results in the same formulation as logistic regression.

   Each edge has a unique weights. ???

   A larger Weight value of 2.0 makes for a "steeper" activation function than 0.5.

   ### Bias constant

   Bias neurons have constants defining the input intercept of the activation curve.
   A bias value of -5.0 shifts the activation function to the right,
   something which may be critical for successful learning.
   +5.0 shifts to the left. 

0. Activation functions

   An <strong>activation function</strong> works like a biological neuron.
   It takes an input signal and 
   generates an output signal after taking into account the threshold.

   <pre>
        #### Set this to your implemented sigmoid function ####
        # Activation function is the sigmoid function using exponential:
        self.activation_function = return 1 / (1 + np.exp(-x))
   </pre>

   A "sigmoid" means an S curve. np.exp is from Numpy, for the e constant.

0. Build the network

   ### Forward Propagation

   We work through each layer of our network calculating the outputs for each neuron. All of the outputs from one layer become inputs to the neurons on the next layer. This process is called <strong>forward propagation</strong>.

   <pre>
class NeuralNetwork(object):
    def __init__(self, input_nodes, hidden_nodes, output_nodes, learning_rate):
        # Set number of nodes in input, hidden and output layers.
        self.input_nodes = input_nodes
        self.hidden_nodes = hidden_nodes
        self.output_nodes = output_nodes
&nbsp;
        # Initialize weights (W1 and W2):
        self.weights_input_to_hidden = np.random.normal(0.0, self.hidden_nodes**-0.5, 
                                       (self.hidden_nodes, self.input_nodes))
        self.weights_hidden_to_output = np.random.normal(0.0, self.output_nodes**-0.5, 
                                       (self.output_nodes, self.hidden_nodes))
        self.lr = learning_rate
&nbsp;        
        #### Set this to your implemented sigmoid function:
        # Activation function is the sigmoid function
        self.activation_function = 
   </pre>

0. Training

   <pre>
    def train(self, inputs_list, targets_list):  #  (reduce cost)
&nbsp;    
        # Convert inputs list to 2D array:
        inputs = np.array(inputs_list, ndmin=2).T
        targets = np.array(targets_list, ndmin=2).T
        # (multiplying by half makes it easier later)
&nbsp;        
        #### Implement the forward pass here ####
        ### Forward pass to reduce cost (J):
        # TODO: Hidden layer
        hidden_inputs = # signals into hidden layer
        hidden_outputs = # signals from hidden layer
&nbsp;
        # TODO: Output layer
        final_inputs = # signals into final output layer
        final_outputs = # signals from final output layer
   </pre>

0. Back propagation

   <pre>
        #### Implement the backward pass here ####
        ### Backward pass ###
&nbsp;
        # TODO: Output error
        output_errors = # Output layer error is the difference between desired target and actual output.
&nbsp;        
        # TODO: Backpropagated error
        hidden_errors = # errors propagated to the hidden layer
        hidden_grad = # hidden layer gradients
&nbsp;
        # TODO: Update the weights
        self.weights_hidden_to_output += # update hidden-to-output weights with gradient descent step
        self.weights_input_to_hidden += # update input-to-hidden weights with gradient descent step
    </pre>

   ### Gradient

   Gradient is another term for rate of change or slope. 

   <a target="_blank" href="https://www.khanacademy.org/math/multivariable-calculus/multivariable-derivatives/gradient-and-directional-derivatives/v/gradient">
   Grant Sanderson's lectures on Gradiant at Khan Academy</a>.

   The gradient captures the <strong>partial derivative</strong> 
   (slope) of a 
   scalar-valued multivariable function.

0. Run

   <pre>
   def run(self, inputs_list):
        # Run a forward pass through the network
        inputs = np.array(inputs_list, ndmin=2).T
&nbsp;
        #### Implement the forward pass here ####
        # TODO: Hidden layer
        hidden_inputs = # signals into hidden layer
        hidden_outputs = # signals from hidden layer
&nbsp;
        # TODO: Output layer
        final_inputs = # signals into final output layer
        final_outputs = # signals from final output layer 
&nbsp;
        return final_outputs  # y hat in mathematical notation.
   </pre>

<hr />



## ML with Neural networks

Neural networks are inspired by how the human brain works.

https://en.wikipedia.org/wiki/Perceptron
Perceptrons are single-layered feed-forward neural network.

Neurons are number values, not class objects.

A Neural network is an algorithm that learns to identify patterns in data.


x is the input variable.

y is the output variable.

y with a hat is the variable representing the output layer.


### Many Layers is Deep

many hidden layers are needed for pattern recognition.

The word "deep" refers to many layers.

Deep Learning combines Big Data and Big Compute to create 
many layers in a neural net.

It incorporates weights used to learn (deduce) a linear function
by adjusting weights depending on the output.
Each of several iteration makes the function more accurate.
The weights get summed, and a sigmoid probability function
??? gradient descent.

That's called Back Propagation.

   * https://mattmazur.com/2015/03/17/a-step-by-step-backpropagation-example/

   * https://colah.github.io/posts/2015-08-Backprop/

https://github.com/llSourcell/linear_regression_live/blob/master/demo.py


https://github.com/lengstrom/fast-style-transfer

https://www.youtube.com/watch?v=xVJwwWQlQ1o

df = pd.DataFrame({'A':['one', 'one', 'two', 'two'], 'B':['a', 'b', 'a', 'b'], 'C':range(4)})
df

  This displays column A, B, C and rolws 0 - 3.



https://github.com/llSourcell/How_to_use_Tensorflow_for_classification-LIVE

https://www.youtube.com/watch?v=bxe2T-V8XRs&list=PLiaHhY2iBX9hdHaRr6b7XevZtgZRa1PoU
Neural Networks Demystified [Part 1: Data and Architecture]</a>
of 7 videos by Welch Labs (@stephencwelch)

https://www.youtube.com/watch?v=uXt8qF2Zzfo
12a: Neural Nets
on MIT OpenCourseWare


## Best Fit Loss Function

We find the best fit by minimizing the loss function
using gradient descent, changing the slope
toward whatever direction most reduces error.

   <img alt="gradient descent" src="https://raw.githubusercontent.com/mattnedrich/GradientDescentExample/master/gradient_descent_example.gif">

Use a circle or two lines.
A neural network uses several tests (layers): 
shown as Blue and orange lines of demarcation.

So the initial weight can be any random number.

Yes is a 1, No is a 0.
These are a hidden layer.

The "deep" in Deep Learning refers to deep stacks of 
hidden layers.

AND vs XOR

activation function uses a sigmoid function


http://www.ats.ucla.edu/stat/data/binary.csv
from UCLA has 3 dimensions


uses matrix multiplication 
taught in linear algebra courses.

Error for units is proportional to the error in the
output layer times the weight between the units.

Errors are popagated backward through the network.
This is called Backpropagation.

The equation for a single predictor:

   y=mx+b

The equation for two predictor variables:

   y=m​1x​1​​ + m​2x​2 + b


## Videos

<a target="_blank" href="https://www.youtube.com/watch?v=vOppzHpvTiQ&list=PL2-dafEMk2A7YdKv4XfKpfbTH5z6rEEj3">
In the playlist</a>:

https://www.youtube.com/watch?v=vOppzHpvTiQ
How to Make a Prediction - Intro to Deep Learning #1

https://www.youtube.com/watch?v=uwwWVAgJBcM
How to Do Linear Regression the Right Way [LIVE]

https://www.youtube.com/watch?v=p69khggr1Jo
How to Make a Neural Network - Intro to Deep Learning #2 


https://www.youtube.com/watch?v=vcZub77WvFA
How to Make a Neural Network (LIVE)

https://github.com/llSourcell
Siraj on GitHub


## Books

https://www.kickstarter.com/projects/adrianrosebrock/1866482244


### Udacity class

No difference between machine intelligence and artificial intelligence.

Generative models (such as chatbots) generates responses rather than
vs. discriminative models from possibilities.

Need two sets of data - testing and learning.

Prior probability * test evidence = Posterior

sensitivity 

specificity

partial derivative as slope illustration from
http://mathinsight.org/image/partial_derivative_as_slope


[38:05] Error 3D graph is at:
https://spin.atomicobject.com/wp-content/uploads/gradient_descent_error_surface.png
<img src="https://spin.atomicobject.com/wp-content/uploads/gradient_descent_error_surface.png
">

https://medium.com/udacity/deep-learning-and-neural-nets-b5c6fba83a65#.i6pvunde1


## Articles

http://www.ai-junkie.com/ann/evolved/nnt1.html
Neural Networks in Plain English
use genetic algorithms
in C++.



### DeepLearning.tv

<a target="_blank" href="https://bigdatauniversity.com/courses/introduction-deep-learning/">
https://bigdatauniversity.com/courses/introduction-deep-learning/</a>
   is a free self-paced 5 hour course 
   introduced May 5, 2016
   by friendly Canadians in Brampton company
   <a target="_blank" href="https://twitter.com/deeplearningtv">@deeplearningtv</a>
   and https://www.facebook.com/DeepLearningTV/

   The website annotates to <a target="_blank" href="https://www.youtube.com/c/DeepLearningTV">
   YouTube videos</a>

   * <a target="_blank" href="https://www.youtube.com/watch?v=P2HPcj8lRJE&list=PLjJh1vlSEYgvZ3ze_4pxKHNh1g5PId36-">
   17 videos on Deep Learning CONCEPTS</a>

   * <a target="_blank" href="https://www.youtube.com/watch?v=Yx6Wv_SCKjI&list=PLjJh1vlSEYgvdPfP5JRazEjqoaVa7XBKr">
   4 videos on Deep Learning APPLICATIONS</a>

   * <a target="_blank" href="https://www.youtube.com/watch?v=b99UVkWzYTQ&list=PLjJh1vlSEYgvGod9wWiydumYl8hOXixNu">
   27 videos on Deep Learning SIMPLIFIED</a>

   * <a target="_blank" href="https://www.youtube.com/watch?v=zOzazSNAfZk&list=PLjJh1vlSEYgspxwsa5be5TVm3n9JNNC9G">
   6 videos on Deep Learning LIBRARIES</a>

   * <a target="_blank" href="https://www.youtube.com/watch?v=EzbGiB_6TSI&list=PLjJh1vlSEYgunISFNs8bDx7ER2EwGccwI">
   3 videos on Deep Learning PLATFORMS</a>

   But who is the woman talking?
   TODSI

### Udacity

   * https://www.udacity.com/course/deep-learning-nanodegree-foundation--nd101<br />
   5 week Udacity class on Deep Learning Foundations

   * https://www.youtube.com/watch?v=HgLplBRpRcs&feature=youtu.be
   Live Q&A with the team [1:21:32]

### Others

   * http://www.ai-junkie.com/ann/evolved/nnt6.html

   * Book: "Deep learning" by Ian goodfellow

