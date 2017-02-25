---
layout: post
title: "Ruby with RVM on MacOS"
excerpt: "Switch among multiple versions of Ruby"
tags: [ruby, apple, mac, setup, programming]
image:
# feature: pic ruby full 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622144/2afc1a24-0585-11e6-93fa-120cda0a9b06.jpg
  credit: Ruby Inside
  creditlink: http://www.rubyinside.com/advent2006/24-wallpapers.html
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}


The major commands:

   0. ruby
   0. gem
   0. rvm
   0. bundle
   0. rbenv


### View Ruby version #

A Ruby language compiler is included in Mac OSX.
So we can jump straight to view version information.

CAUTION: Don't touch the system Ruby that comes with your Mac.

0. Open a Terminal Shell Window and type:

   <tt><strong>
   ruby \-\-version
   </strong></tt>

   The response for the Sierra default:

   <tt>
   ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin15]
   </tt>

   The response for the Yosemite default:

   <tt>
   ruby 2.0.0p481 (2014-05-08 revision 45883) [universal.x86_64-darwin14]
   </tt>

   The response after updating on 2016-06-16:

   <tt>
   ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-darwin15]
   </tt>


<a name="ViewVersions"></a>

## Gem version numbers #

   <tt><strong>
   gem env
   </strong></tt>

   The response on 2016-06-16:

   <pre>
RubyGems Environment:
  - RUBYGEMS VERSION: 2.6.4
  - RUBY VERSION: 2.3.1 (2016-04-26 patchlevel 112) [x86_64-darwin15]
  - INSTALLATION DIRECTORY: /Users/mac/.rvm/gems/ruby-2.3.1
  - USER INSTALLATION DIRECTORY: /Users/mac/.gem/ruby/2.3.0
  - RUBY EXECUTABLE: /Users/mac/.rvm/rubies/ruby-2.3.1/bin/ruby
  - EXECUTABLE DIRECTORY: /Users/mac/.rvm/gems/ruby-2.3.1/bin
  - SPEC CACHE DIRECTORY: /Users/mac/.gem/specs
  - SYSTEM CONFIGURATION DIRECTORY: /Users/mac/.rvm/rubies/ruby-2.3.1/etc
  - RUBYGEMS PLATFORMS:
    - ruby
    - x86_64-darwin-15
  - GEM PATHS:
     - /Users/mac/.rvm/gems/ruby-2.3.1
     - /Users/mac/.rvm/gems/ruby-2.3.1@global
  - GEM CONFIGURATION:
     - :update_sources => true
     - :verbose => true
     - :backtrace => false
     - :bulk_threshold => 1000
  - REMOTE SOURCES:
     - https://rubygems.org/
  - SHELL PATH:
     - /Users/mac/.rvm/gems/ruby-2.3.1/bin
     - /Users/mac/.rvm/gems/ruby-2.3.1@global/bin
     - /Users/mac/.rvm/rubies/ruby-2.3.1/bin
     - /Users/mac/depot_tools
     - /Users/mac/.npm-packages/bin
     - /Users/mac/miniconda2/bin
     - /Users/mac/.rbenv/shims
     - /Users/mac/.rbenv/bin
     - /usr/local/bin
     - /usr/bin
     - /bin
     - /usr/sbin
     - /sbin
     - /Users/mac/gits
     - /Users/mac/.rvm/bin
     - /Users/mac/.rvm/bin
   </pre>


0. View each component individually:

   <tt><strong>
   gem \-\-version
   </strong></tt>

   The response for the Sierra default:

   <tt>
   2.0.14
   </tt>

   The response for the Yosemite default:

   <tt>
   2.0.14
   </tt>

   After updating on April 19, 2015:

   <tt>
   2.4.6
   </tt>

   After updating on 2016-06-16:

   <tt>
   2.6.4
   </tt>

### Clean 

   <tt><strong>
   gem clean
   </strong></tt>


### View rvm version number #

   <tt><strong>
   rvm info
   </strong></tt>

For a smaller response:

   <tt><strong>
   rvm \-\-version
   </strong></tt>

   The response on 2016-06-16:

   <tt>
   rvm 1.27.0 (master) by Wayne E. Seguin <wayneeseguin@gmail.com>, Michal Papis <mpapis@gmail.com> [https://rvm.io/]
   </tt>



## Update RubyGems and Bundler:


0. Update:

   <tt><strong>
   sudo gem update \-\-system
   </strong></tt>

   The response on 2016-06-16:

   <pre>
Password:
Updating rubygems-update
Fetching: rubygems-update-2.6.4.gem (100%)
Successfully installed rubygems-update-2.6.4
Parsing documentation for rubygems-update-2.6.4
Installing ri documentation for rubygems-update-2.6.4
Installing darkfish documentation for rubygems-update-2.6.4
Done installing documentation for rubygems-update after 2 seconds
Parsing documentation for rubygems-update-2.6.4
Done installing documentation for rubygems-update after 0 seconds
Installing RubyGems 2.6.4
RubyGems 2.6.4 installed
Parsing documentation for rubygems-2.6.4
Installing ri documentation for rubygems-2.6.4
&nbsp;
=== 2.6.3 / 2016-04-05
...
Minor enhancements:
...
Bug fixes:
...
RubyGems installed the following executables:
   /Users/mac/.rvm/rubies/ruby-2.3.1/bin/gem
&nbsp;
Ruby Interactive (ri) documentation was installed. ri is kind of like man 
pages for ruby libraries. You may access it like this:
  ri Classname
  ri Classname.class_method
  ri Classname#instance_method
If you do not wish to install this documentation in the future, use the
--no-document flag, or set it as the default in your ~/.gemrc file. See
'gem help env' for details.
&nbsp;
RubyGems system software updated
   </pre>


0. List local gems:

   <tt><strong>
   gem list b
   </strong></tt>

   A sample example (on 2016-06-16):

   <pre>
bigdecimal (default: 1.2.8)
bundler-unload (1.0.2)
executable-hooks (1.3.2)
rubygems-bundler (1.4.4)
rubygems-update (2.6.4)
...
   </pre>


   ## Update Bundler:

0. If bundler is not on the list above:

   <tt><strong>
   gem install bundler
   </strong></tt>

   A sample response:

   <pre>
Fetching: bundler-1.12.5.gem (100%)
Successfully installed bundler-1.12.5
Parsing documentation for bundler-1.12.5
Installing ri documentation for bundler-1.12.5
Done installing documentation for bundler after 5 seconds
1 gem installed
   </pre>

0. Navigate to a folder containing <strong></strong>:

   <tt><strong>
   bundle install
   </strong></tt>

   A sample response:

   <pre>
Fetching gem metadata from https://rubygems.org/
Fetching version metadata from https://rubygems.org/
Fetching dependency metadata from https://rubygems.org/
Installing rake 11.1.2
...
Bundle complete! 5 Gemfile dependencies, 39 gems now installed.
Use `bundle show [gemname]` to see where a bundled gem is installed.
   </pre>


0. Run

   <tt><strong>
   sudo gem install \-\-no-rdoc \-\-no-ri bundler
   </strong></tt>

   The response:

   <pre>
Fetching: bundler-1.9.4.gem (100%)
Successfully installed bundler-1.9.4
1 gem installed
   </pre>


### Update gem:

0. Update latest version of gem:

   <tt><strong>
   sudo gem update
   </strong></tt>

   The response takes several minutes becuase it touches every gem:

   <pre>
   Updating installed gems
   Updating CFPropertyList
   </pre>

0. Press y and Enter if you see:

   <pre>
rake's executable "rake" conflicts with /usr/bin/rake
rdoc's executable "rdoc" conflicts with /usr/bin/rdoc
rdoc's executable "ri" conflicts with /usr/bin/ri
   </pre>

0. To rebuild any gems using native extensions:

   <tt><strong>
   gem pristine --all 
   </strong></tt>


0. Cleanup gem:

   <tt><strong>
   sudo gem cleanup
   </strong></tt>

   The response:

   <pre>
   Cleaning up installed gems...
   Clean Up Complete
   </pre>


<a name="ruby-rvm"></a>

### Ruby Version Manager (rvm) #


0. Uninstall all versions of Ruby:

   <tt><strong>
rvm uninstall ruby
   </strong></tt>

0. Have the rvm shell configuration loaded:

   <tt><strong>
   source ~/.rvm/scripts/rvm<br />
   type rvm | head -n 1
   </strong></tt>

   Alternately, wipe out the folder and start over:

   <tt><strong>
   rm -rf ~/.rvm<br />
   curl -L https://get.rvm.io | bash -s stable
   </strong></tt>

   The response should be:

   <tt>
   rvm is a function
   </tt>

   If so, try rvm get head again.

   <tt><strong>
   rvm get head
   </strong></tt>

   If the response is:

   <pre>
   -bash: rvm: command not found
   </pre>

0. Get stable

   <pre>
   rvm get stable --auto-dotfiles
   </pre>


## To upgrade #

0. Run:

   <tt><strong>
   rvm autolibs homebrew<br />
   rvm install ruby
   </strong></tt>

   The response:

   <pre>
Searching for binary rubies, this might take some time.
No binary rubies available for: osx/10.11/x86_64/ruby-2.3.1.
Continuing with compilation. Please read 'rvm help mount' to get more information on binary rubies.
Checking requirements for osx_brew.
Installing requirements for osx_brew.
Updating system.....
Installing required packages: autoconf, automake, libtool, readline, libksba, openssl........
Certificates in '/usr/local/etc/openssl/cert.pem' are already up to date.
Requirements installation successful.
Installing Ruby from source to: /Users/mac/.rvm/rubies/ruby-2.3.1, this may take a while depending on your cpu(s)...
ruby-2.3.1 - #downloading ruby-2.3.1, this may take a while depending on your connection...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 13.7M  100 13.7M    0     0   320k      0  0:00:44  0:00:44 --:--:--  266k
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
   LC_ALL = (unset),
   LC_CTYPE = "en_US.utf-",
   LANG = "en_US.UTF-8"
    are supported and installed on your system.
perl: warning: Falling back to the standard locale ("C").
ruby-2.3.1 - #extracting ruby-2.3.1 to /Users/mac/.rvm/src/ruby-2.3.1.....
ruby-2.3.1 - #configuring......................................................|
ruby-2.3.1 - #post-configuration.
ruby-2.3.1 - #compiling........................................................-
ruby-2.3.1 - #installing.........
ruby-2.3.1 - #making binaries executable..
Installed rubygems 2.5.1 is newer than 2.4.8 provided with installed ruby, skipping installation, use --force to force installation.
ruby-2.3.1 - #gemset created /Users/mac/.rvm/gems/ruby-2.3.1@global
ruby-2.3.1 - #importing gemset /Users/mac/.rvm/gemsets/global.gems.............|
ruby-2.3.1 - #generating global wrappers........
ruby-2.3.1 - #gemset created /Users/mac/.rvm/gems/ruby-2.3.1
ruby-2.3.1 - #importing gemsetfile /Users/mac/.rvm/gemsets/default.gems evaluated to empty gem list
ruby-2.3.1 - #generating default wrappers........
ruby-2.3.1 - #adjusting #shebangs for (gem irb erb ri rdoc testrb rake).
Install of ruby-2.3.1 - #complete 
Ruby was built without documentation, to build it run: rvm docs generate-ri
   </pre> 

0. <a href="#ViewVersions">View versions again.</a>

0. To install the latest stable rvm release:

   <tt><strong>
   \curl -ssL https://get.rvm.io | bash -s stable
   </strong></tt>

   A sample response:

   <pre>
Downloading https://github.com/rvm/rvm/archive/1.26.11.tar.gz
Downloading https://github.com/rvm/rvm/releases/download/1.26.11/1.26.11.tar.gz.asc
Found PGP signature at: 'https://github.com/rvm/rvm/releases/download/1.26.11/1.26.11.tar.gz.asc',
but no GPG software exists to validate it, skipping.
&nbsp;
Installing RVM to /Users/wilsonmar/.rvm/
Adding rvm PATH line to /Users/wilsonmar/.profile /Users/wilsonmar/.mkshrc /Users/wilsonmar/.bashrc /Users/wilsonmar/.zshrc.
Adding rvm loading line to /Users/wilsonmar/.profile /Users/wilsonmar/.bash_profile /Users/wilsonmar/.zlogin.
Installation of RVM in /Users/wilsonmar/.rvm/ is almost complete:
&nbsp;
* To start using RVM you need to run `source /Users/wilsonmar/.rvm/scripts/rvm`
in all your open shell windows, in rare cases you need to reopen all shell windows.
&nbsp;
# Wilson Mar,
#
#   Thank you for using RVM!
#   We sincerely hope that RVM helps to make your life easier and more enjoyable!!!
#
# ~Wayne, Michal & team.
&nbsp;
In case of problems: http://rvm.io/help and https://twitter.com/rvm_io
&nbsp;
* WARNING: You have '~/.profile' file, you might want to load it,
to do that add the following line to '/Users/wilsonmar/.bash_profile':
&nbsp;
source ~/.profile
   </pre>


0. Some say at this point close the terminal and open again.


## Sample Ruby Tree program #

Here is a Ruby script to produce a nice Unicode tree along with metadata to its left:

   <pre>
#!/usr/bin/env ruby
def tree_hierarchy( root, &children )
  queue = [[root,"",true]]
  [].tap do |results|
    until queue.empty?
      item,indent,last = queue.pop
      kids = children[item]
      extra = indent.empty? ? '' : last ? '└╴' : '├╴'
      results << [ indent+extra, item ]
      results << [ indent, nil ] if last and kids.empty?
      indent += last ? '  ' : '│ '
      parts = kids.map{ |k| [k,indent,false] }.reverse
      parts.first[2] = true unless parts.empty?
      queue.concat parts
    end
  end
end
def tree(dir)
  cols = tree_hierarchy(File.expand_path(dir)) do |d|
    File.directory?(d) ? Dir.chdir(d){ Dir['*'].map(&File.method(:expand_path)) } : []
  end.map do |indent,path|
    if path
      file = File.basename(path) + File.directory?(path) ? '/' : ''
      meta = `ls -lhd "#{path}"`.split(/\s+/)
      [ [indent,file].join, meta[0], meta[4], "%s %-2s %s" % meta[5..7] ]
    else
      [indent]
    end
  end
  maxs = cols.first.zip(*(cols[1..-1])).map{ |c| c.compact.map(&:length).max }
  tmpl = maxs.map.with_index{ |n,i| "%#{'-' if cols[0][i][/^\D/]}#{n}s" }.join('  ')
  cols.map{ |a| a.length==1 ? a.first : tmpl % a }
end
puts tree(ARGV.first || ".") if __FILE__==$0
   </pre>

0. Copy and paste the above into a text editor program.
0. Save the file named <strong>tree.rb</strong>.
0. In a Terminal window, navigate to the folder holding the script.
0. Mark the file as executable:

   <tt><strong>
   chmod +x tree.rb
   </strong></tt>

   This only needs to be done once.

0. Run the program:

   <tt><strong>
   tree.rb
   </strong></tt>

   ERROR: The response:

   <pre>
   ./tree.rb:24:in `+': no implicit conversion of true into String (TypeError)
  from ./tree.rb:24:in `block in tree'
  from ./tree.rb:22:in `map'
  from ./tree.rb:22:in `tree'
  from ./tree.rb:35:in `&LT;main>'
   </pre>

   http://superuser.com/users/57219/phrogz


## Remove rvm

0. Run the program which removes the rvm/ directory and all the rubies built within it:

   <pre><strong>
   rvm repair
   rvm cleanup
   rvm implode --force
   </strong></pre>

0. Remove folders:

   <pre>
   rm -rf /usr/local/rvm
   sudo rm /etc/profile.d/rvm.sh
   sudo rm /etc/rvmrc
   sudo rm ~/.rvmrc
   </pre>

0. Check references to rvm in files:

   vim .bash_profile

   vim .bashrc

   vim .profile 

0. Restart Terminal sessions.


## Resources:

This also provides instructions on installation of Ruby:

http://www.createdbypete.com/articles/ruby-on-rails-development-setup-for-mac-osx/


## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}
