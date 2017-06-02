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

Here are my notes on how to create a multi-variate Linear Regression formula
using Microsoft Excel.

   ### Obtain Sample Data

To work through how a home-goods manufacturer can 
predict expected profits from a catalog launch,
students build a linear regression model to provide results and a recommendation.

1. Download the sample data file diamonds.csv which has 50,000 rows.

   The training set contains historical data where the outcome is already known
   and included as a column along with the input data.

   Outcome values are in the target variable (price).

   NOTE: A column in a spreadsheet some call a "data field".

0. The test dataset (new-diamonds.csv) contains new instances that do not have outcomes 
   (prices) defined.

   ### Install Excel

   This tutorial assumes that you have Microsoft Excel installed.

   ### Open in Excel

   During the installation processes on Windows or MacOS,
   the operating system is told that suffixes at the end of file names,
   such as ".csv" and ".xlsx" are opened using Excel.

0. In Finder or 
   double-click on the diamonds.csv file to open it in Excel.


   ### Activate Analysis Toolpak

0. In Excel, click on the <strong>Data</strong> tab.

   If <strong>Data Analysis</strong> does not appear on the far right, 
   the Analysis Toolpak needs to be installed:

   On Excel 2016, click the Tools menu at the top of the screen to select Excel Add-ins.
   Check Analysis ToolPak, then OK.

   On Excel 2013, click the File menu at the top of the screen to select Properties.
   Check Analysis ToolPak, then OK.

   The above only needs to be done once.


## Data preparation

### Contiguous X columns

   Excel needs all variables together, so:

1. Select the letter above the "caret" column to select the whole column.
4. Press Ctrl+X to cut. Click on the column heading to the right of the "price" column.
5. Repeat for the "clarity_ord" and "cut_ord" columns.

   ### Generate

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
0. Cick cell N1, which leaves two blank columns.
0. Press Enter to accept it.

0. Click OK.

0. Variables with P-values (Prediction-values) beyond .15 should not be used.

   Regression equation models enable predictions to be made based on attibute values.

   ### 

0. Click on the blank cell to the left of "intercept", type = and click the Coefficient value of intercept.
0. Two columns to the left of "clarity_ord", type the input data you want an estimate for.
0. Repeat this for each input.
0. Click on the blank cell to the left of "intercept", type = and click the Coefficient value of intercept.
0. Add a =sum() of all cells above it.


0. TODO: COMPLETE THIS 

   R Square is the percent of variance in Y that can be explained by all the X variables.
   1.0 is perfect. 0.75 is the threshold for not.

   Standard Error is the error of prediction expressed in the value range of Y.


## Resources

To create a multi-variate regression in Excel:

   <iframe width="560" height="315" src="https://www.youtube.com/embed/kShe0b-sK4o" frameborder="0" allowfullscreen> </iframe><br /><small>This video is from the Udacity class,
   about a different data set</small>
   <br />

* https://www.youtube.com/watch?v=O7TMCYuDbDc
* https://www.youtube.com/watch?v=HgfHefwK7VQ

