heroku.md


## Click Button link Create Heroku 

Food Bank application

https://github.com/freeCodeCamp/food-bank-app/blob/staging/README.md

   &LT;a href="https://heroku.com/deploy">

<a href="https://heroku.com/deploy"><img src="https://camo.githubusercontent.com/83b0e95b38892b49184e07ad572c94c8038323fb/68747470733a2f2f7777772e6865726f6b7563646e2e636f6d2f6465706c6f792f627574746f6e2e737667" alt="Deploy" data-canonical-src="https://www.herokucdn.com/deploy/button.svg" style="max-width:100%;"></a>


## Get an account

0. Click this URL to register for an account:<br />
   <a target="_blank" href="https://www.heroku.com/">
   https://www.heroku.com</a>

   Note: To install Heroku add-ons your account must be verified.

0. Install https://toolbelt.heroku.com/

   brew install -g heroku-toolbelt

   The response:

   <pre>
==> Downloading https://s3.amazonaws.com/assets.heroku.com/heroku-client/heroku-
######################################################################## 100.0%
Initialized empty Git repository in /private/tmp/heroku-20160722-78693-1njp97z/heroku-client/.git/
Error: The `brew link` step did not complete successfully
The formula built, but is not symlinked into /usr/local
Could not symlink bin/heroku
Target /usr/local/bin/heroku
already exists. You may want to remove it:
  rm '/usr/local/bin/heroku'
&nbsp;
To force the link and overwrite all conflicting files:
  brew link --overwrite heroku
&nbsp;
To list all files that would be deleted:
  brew link --overwrite --dry-run heroku
&nbsp;
Possible conflicting files are:
/usr/local/bin/heroku -> /usr/local/heroku/bin/heroku
==> Summary
🍺  /usr/local/Cellar/heroku/3.43.5: 992 files, 6.2M, built in 7 seconds
   </pre>


0. Fix brew link

   Error: The `brew link` step did not complete successfully
   The formula built, but is not symlinked into /usr/local

  <pre>
   brew link --overwrite --dry-run heroku
  </pre>

To force the link and overwrite all conflicting files:

  <pre>
  brew link --overwrite heroku
  </pre>


## Install

https://devcenter.heroku.com/articles/heroku-cli#download-and-install

On a Mac, the installer creates folder:

   ~/.netrc 


## Verify installation

open a new Terminal window

heroku login

cd ~/myapp
heroku create


0. Login

   <tt><strong>
   heroku login
   </strong></tt>

   The response:

   <pre>
heroku-cli: Installing CLI... 20.22MB/20.22MB
Enter your Heroku credentials.
Email:
   </pre>

0. Enter your Heroku password.

   BTW, I like using 1Password to securely store and retrieve passwords.

0. Enter the password

   <tt><strong>
Password (typing will be hidden): 
   </strong></tt>

   If you got it right:

   <pre>
   Logged in as wilsonmar@gmail.com
   </pre>

   QUESTION: Where was that installed?

   ## Create app

0. From your app directory create an instance in Heroku:

   <tt><strong>
   heroku create
   </strong></tt>

   A random name of two words and a set of numbers is created:

   <pre>
Heroku CLI submits usage information back to Heroku. 
If you would like to disable this, set `skip_analytics: true` in /Users/mac/.heroku/config.json
Creating app... done, ⬢ boiling-temple-57622
https://boiling-temple-57622.herokuapp.com/ | https://git.heroku.com/boiling-temple-57622.git
   </pre>

0. View the app in Heroku Dashboard:<br />
   <a target="_blank" href="https://dashboard.heroku.com/apps/">
   https://dashboard.heroku.com/apps</a>

0. Define the database needed by the app:
   
   <tt><strong>
   heroku addons:create mongolab
   </strong></tt>

   This message appears if you have not clicked the confirmation email:

   <pre>
 !    Please verify your account to install this add-on plan (please enter a credit card) For more information, see https://devcenter.heroku.com/categories/billing Verify now at https://heroku.com/verify 
    </pre>

0. Set up the mLab add-on 

0. Configure the MONGOLAB_URI environment variable in your Heroku app for you.

0. Lastly, do 

   <tt><strong>
   git push heroku master
   </strong></tt>

## Node

https://github.com/heroku/node-js-sample



