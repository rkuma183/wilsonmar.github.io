---
layout: post
title: "Data visualization using Tableau"
excerpt: "It's so simple, a Data Scientist can do this."
tags: [apple, mac, setup]
shorturl: "https://goo.gl/SYQ4rY"
image:
  feature: https://cloud.githubusercontent.com/assets/300046/14583248/4b20c578-03d9-11e6-8f7a-c860b666bc73.jpg
  credit: Wall Street Journal
  creditlink: http://graphics.wsj.com/job-market-tracker/
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

Here are my notes on how to create a multi-variate Linear Regression formula.


## Sample Data

To work through how a home-goods manufacturer can 
predict expected profits from a catalog launch,
students build a linear regression model to provide results and a recommendation.

1. Download the sample data file diamonds.csv which has 50,000 rows.

   The training set contains historical data where the outcome is already known
   and included as a column along with the input data.

   Outcome values are in the target variable (price).

2. The test dataset (new-diamonds.csv) contains new instances that do not have outcomes 
   (prices) defined.


## Excel

2. In Finder, double-click on the diamonds.csv file to open it in Excel:

   Excel needs all variables together, so:

3. Select the letter above the "caret" column to select the whole column.
4. Press Ctrl+X to cut. Click on the column heading to the right of the "price" column.
5. Repeat for the "clarity_ord" and "cut_ord" columns.


6. In Excel Data tab, Click on Data Analysis.
7. If you don't see "Data Analysis", enable Analysis Toolpack. This only needs to be done once. 
8. Select Regression and OK.

   Conditions of attributes are in the predictor variables,
   also called dependent variables or (in Excel), Y Range.

0. Click the red arrow icon for Y Range.
0. Check "Labels"
0. Click in row 1 "price". Press Command-shift-down to select the whole column

   $H$1:$H$50001

0. Click the icon to collapse the pop-up.
0. Press Enter.

   $I$1:$K$50001

0. Click the icon to Output range.
0. Cick cell M1.
0. Press Enter to accept it.

0. Click OK.

0. Variables with P-values (Prediction-values) beyond .15 should not be used.

   Regression equation models enable predictions to be made based on attibute values.

0. TODO: COMPLETE THIS 


To create a multi-variate regression in Excel:

* https://www.youtube.com/watch?v=O7TMCYuDbDc
* https://www.youtube.com/watch?v=HgfHefwK7VQ

