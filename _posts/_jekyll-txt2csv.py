#!/usr/bin/env python
# http://www.dreamsyssoft.com/python-scripting-tutorial/classes-tutorial.php
import sys, os, glob

# 1. Get operating system
print os.getcwd(); # Prints the working directory
    # Example output: /Users/mac/gits/wilsonmar/wilsonmar.github.io/_data
from sys import platform
if platform == "linux" or platform == "linux2":
    print ""
    # os.chdir('c:\\Users\uname\desktop\python') # MacOS/Linux
    # os.chdir(default_path)
elif platform == "darwin":
    print "sys platform="+platform+'=MacOS'
    # os.chdir('c:\\Users\uname\desktop\python') # MacOS/Linux
    # ??? os.chdir('cd ../_path')
elif platform == "win32":
    print ""
    # os.chdir('c:\\Users\uname\desktop\python') # Windows
    # os.chdir(default_path)

# 2. Get list of files in folder into an array
files_array = glob.glob("*.md") # an array of file names.
print files_array
print files_array[0]

# lines = [line.rstrip('\n') for line in open('ls.txt')]