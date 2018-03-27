---
layout: post
title: "Python Coding"
excerpt: "Tricks and tips"
tags: [python, coding]
shorturl: "https://goo.gl/"
image:
# pic white python logo 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622164/4230c848-0585-11e6-957b-be11147346e6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

Here are various coding tips I've seen while going through [Python programming classes](/python-tutorials/) after [installing Python](/python-install/) and [Juypter](/juypter/).

Also see [Python REST API programming](/python-api-flask/).
[Python Robot testing](/python-robot/).
[Running Python on Raspberry Pi IoT devices](/iot-raspberry-install/).

TODO: Move more here.

## Command generator

docopt at https://github.com/docopt/docopt
and described at http://docopt.org/
creates custom CLI commands by
parsing a command help text into cli code that implements it.

Brilliant.


## Click 

<a target="_blank" href="https://dbader.org/blog/python-commandline-tools-with-click">
Dan Bader recommends</a> the use of the 

http://click.pocoo.org/6/why/
click custom package (from Armin Ronacher) instead of the
argparse package that comes with Python 3.2+ (and the optparse package that comes with Python 2).

Click provides decorators such as the "@click.command()" below:

   <pre>
\# cli.py
import click

@click.command()
def main():
    print("I'm a beautiful CLI ✨")

if __name__ == "__main__":
    main()
   </pre>



## List comprehension

<pre>
squares = [x * x for x in range(10)]
</pre>


[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]


## Advanced

Dan Bader (aka Benedict Cumberbatch of Dr Strange and Sherlock Holmes) 
has emails and courses on Python:
<a target="_blank" href="https://www.youtube.com/watch?v=p-89r5QvQvQ">
What Python Projects Should I Build to Get a Job?</a>
Aug 23, 2017

1) tensorflow ( for machine learning) 
2) crawling (spider based projects) 
3) database handling (firebase, Mysql etc.)

<a target="_blank" href="https://github.com/austin-taylor/code-vault/blob/master/python_expert_notebook.ipynb">
The Playbook</a> of code shown on 
<a target="_blank" href="https://www.youtube.com/watch?v=7lmCu8wz8ro">
What Does It Take To Be An Expert At Python?</a> [1:52:02] presented by 
by James Powell at the PyData conference on Aug 2, 2017.

