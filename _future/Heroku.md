Heroku

https://github.com/heroku/node-js-sample

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

   