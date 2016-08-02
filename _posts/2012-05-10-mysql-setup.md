---
layout: post
title: "MySQL to MariaDB"
excerpt: "It worked for your dad. Embrace it."
tags: [mysql, database]
image:
# feature: fig orange mysql php 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622311/4f41e84a-0586-11e6-8164-6363861642fd.jpg
  credit: Kevin Yank
  creditlink: http://www.databasejournal.com/features/mysql/article.php/1402281/Build-Your-Own-Database-Driven-Website-Using-PHP--MySQL-Pt-4.htm
comments: true
---
<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This tutorial covers the basics for getting started with MySQL on Mac OSX,
PROTIPs and NOTEs are provided as instructions are presented in a hands-on way.

Content here was developed based on advice from <a href="#Resources">several websites</a>.

<a name="OneOfMany"></a>

## From MySQL to MariaDB to Aurora #

MySQL is open-sourced,
first proposed by Edgar Cord in 1970.
The free usage made it a natural choice for other open-source frameworks such as WordPress
and thus its rapid growth.

After Oracle acquired Sun (MySQL's owner),
the freedom of open-source was realized when Maria-DB was forked 
to create a <strong>drop-in replacement for MySQL</strong>
by MySQL co-founder Michael “Monty” Widenius, 
who left Oracle to start a new company (Monty Program).

   NOTE: The "My" in MySQL is named after co-founder Michael's daughter, 
   <a target="_blank" href="https://www.facebook.com/my.widenius">My</a>,
   a name from a <a target="_blank" href="https://www.wikiwand.com/en/The_Book_about_Moomin,_Mymble_and_Little_My">
   1952 children's book</a> from Finland, where her family originates.

Many developers have migrated to MariaDB.
(MariaDB 5.1.53 is based on MySQL 5.1.53).
If you don't need to first uninstall MySQL,
<a href="#InstallMariaDB">click here for instructions on installing MariaDB, below</a>.


## Cloud instances #

There are several.

### AWS Aurora #

<a target="_blank" href="https://aws.amazon.com/rds/aurora/">
https://aws.amazon.com/rds/aurora</a>
replaces MySQL in the AWS cloud, enabling scaling to 64 TB
and replicates across 3 zones.
It's managed by the AWS RDS (Relational Data Service).


<a name="InstallMySQL"></a>

## Install MySQL via Homebrew #

PROTP: Use Homebrew instead of downloading from
   <a target="_blank" href="http://dev.mysql.com/downloads/">
   http://dev.mysql.com/downloads</a>, which gets you the latest version
   instead of one vetted.


0. Prepare the Homebrew environment (before any Homebrew install):

   <tt><strong>
   brew update
   </strong></tt>

   This can take several minutes.

   Resolve any issues reported.

   <tt><strong>
   brew doctor<br />
   brew upgrade
   </strong></tt>

   This can cause other packages to be downloaded, which can take several minutes.


0. Run the Homebrew installer:

   <tt><strong>
   brew install mysql
   </strong></tt>

   The response:

   <pre>
==> Downloading https://homebrew.bintray.com/bottles/mysql-5.7.13.el_capitan.bot
######################################################################## 100.0%
==> Pouring mysql-5.7.13.el_capitan.bottle.tar.gz
==> /usr/local/Cellar/mysql/5.7.13/bin/mysqld --initialize-insecure --user=mac -
==> Caveats
We've installed your MySQL database without a root password. To secure it run:
    mysql_secure_installation
&nbsp;
To connect run:
    mysql -uroot
&nbsp;
To have launchd start mysql now and restart at login:
  brew services start mysql
Or, if you don't want/need a background service you can just run:
  mysql.server start
==> Summary
🍺  /usr/local/Cellar/mysql/5.7.13: 13,344 files, 445.0M   
   </pre>

   Notice the installer is specific to the version of Mac OSX (such as "El Capitan").



   Alternately, to install a specific version, such as 5.6:

   <tt><strong>
   brew install mysql56
   </strong></tt>

0. Expose folders and dependencies:

   NOTE: mysql is the command line tool.  
   mysqld is the server.

   <tt><strong>
   brew info mysql
   </strong></tt>

   The sample response:

   <pre>
mysql: stable 5.7.13 (bottled)
Open source relational database management system
https://dev.mysql.com/doc/refman/5.7/en/
Conflicts with: mariadb, mariadb-connector-c, mysql-cluster, mysql-connector-c, percona-server
/usr/local/Cellar/mysql/5.7.13 (13,344 files, 445.0M) *
  Poured from bottle on 2016-07-01 at 20:05:45
From: https://github.com/Homebrew/homebrew-core/blob/master/Formula/mysql.rb
==> Dependencies
Build: cmake ✘
Required: openssl ✔
==> Options
--with-archive-storage-engine
  Compile with the ARCHIVE storage engine enabled
--with-blackhole-storage-engine
  Compile with the BLACKHOLE storage engine enabled
--with-debug
  Build with debug support
--with-embedded
  Build the embedded server
--with-local-infile
  Build with local infile loading support
--with-test
  Build with unit tests
==> Caveats
We've installed your MySQL database without a root password. To secure it run:
    mysql_secure_installation
&nbsp;
To connect run:
    mysql -uroot
&nbsp;
To have launchd start mysql now and restart at login:
  brew services start mysql
Or, if you don't want/need a background service you can just run:
  mysql.server start
     </pre>

   <a target="_blank" href="https://dev.mysql.com/doc/refman/5.6/en/osx-installation.html">
   https://dev.mysql.com/doc/refman/5.6/en/osx-installation.html</a>

0. Verify:

   <tt><strong>
   which mysql
   </strong></tt>

   The response:

   <pre>
   /usr/local/bin/mysql
   </pre>


   ### Configure #

0. Open in Terminal a shell window.

0. Set permissions for root access:

   <tt><strong>
   sudo chown -R mysql /usr/local/var/mysql/
   </strong></tt>

0. <a target="_blank" href="http://blog.joefallon.net/2013/10/install-mysql-on-mac-osx-using-homebrew/">
   Joe Fallon, in his blog</a>, proposed additional configurations.
    

   ### Invoke daemon process #

0. Invoke mysql daemon from the command line:

   <tt><strong>
   mysql.server start
   </strong></tt>

   Response:

   <pre>
   Starting MySQL
   . SUCCESS! 
   </pre>

   <a name="ListProcesses"></a>

0. List the daemons started by the command above:

   <tt><strong>
   ps
   </strong></tt>

   A sample response:

   <pre>
     PID TTY           TIME CMD
   21069 ttys002    0:00.02 /bin/sh /usr/local/Cellar/mysql/5.7.13/bin/mysqld_safe
   21161 ttys002    0:00.33 /usr/local/Cellar/mysql/5.7.13/bin/mysqld --basedir=/u
   </pre>

   If you want to use the database, proceed to <a href="#WorkSQL">Work with SQL</a> below.



   ## Stop server and process #

0. PROTIP: Stop the server before killing its process:

   <tt><strong>
   mysql.server stop
   </strong></tt>

0. To kill the processes:

   <tt><strong>
   pkill mysql
   </strong></tt>

   Alternately, specify by process ID (which is differs over time):

   <tt><strong>
   kill -9 21069<br />
   kill -9 21161
   </strong></tt>


   <a name="UninstallMySQL"></a>

   ### Uninstall MySQL from Homebrew #

0. Remove MySQL:

   <tt><strong>
   brew remove mysql<br />
   brew cleanup \-\-force
   </strong></tt>

   Response:

   <pre>
   Uninstalling /usr/local/Cellar/mysql/5.7.13... (13,344 files, 445.0M)
   </pre>

0. Remove services MacOS invokes when a user logs in:

   <tt><strong>
   sudo ls ~/Library/LaunchAgents<br />
   </strong></tt>

   If file "homebrew.mxcl.mysql.plist" exists, remove it:

   <tt><strong>
   sudo rm ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
   </strong></tt>

   NOTE: In previous versions, the file was "com.mysql.mysqld.plist".

0. Remove lefover database files:

   <tt><strong>
   ls /usr/local/var/mysql
   </strong></tt>

   If files exist there, remove them all:

   <tt><strong>
   sudo rm -rf /usr/local/var/mysql
   </strong></tt>

   Skipping the above step means you will not be able to log in as root initially to set the password.



<a name="InstallMariaDB"></a>

## Install MariaDB via Homebrew #

MariaDB ships with additional storage engines installed (no compilation as with MySQL):
Aria, XtraDB (an enhanced and extended version of the InnoDB storage engine), PBXT, FederatedX (a drop-in replacement for Federated), OQGraph, and SphinxSE 
in addition to standard MyISAM, blackhole, CSV, Memory, etx.

   show storage engines;

<a target="_blank" href="http://kb.askmonty.org/v/mariadb">
http://kb.askmonty.org/v/mariadb</a> is the MariaDB Knowledgebase. 

0. Take a full backup before doing this.
0. <a href="#UninstallMySQL">Uninstall MySQL</a> if you have it installed.
0. Install MariaDB:

   <tt><strong>
   brew install mariadb
   </strong></tt>

   If MySQL is already installed, the response is:

   <pre>
   Error: Cannot install mariadb because conflicting formulae are installed.
   mysql: because mariadb, mysql, and percona install the same binaries.
   </pre>

   If you get the above, uninstall mysql, kill the processes running, and try again.

   The response:

   <pre>
==> Downloading https://homebrew.bintray.com/bottles/mariadb-10.1.14.el_capitan.
######################################################################## 100.0%
==> Pouring mariadb-10.1.14.el_capitan.bottle.tar.gz
==> Caveats
A "/etc/my.cnf" from another install may interfere with a Homebrew-built
server starting up correctly.
&nbsp;
To connect:
    mysql -uroot
&nbsp;
To have launchd start mariadb now and restart at login:
  brew services start mariadb
Or, if you don't want/need a background service you can just run:
  mysql.server start
==> Summary
🍺  /usr/local/Cellar/mariadb/10.1.14: 573 files, 131.1M
   </pre>

0. Verify

   <tt><strong>
   which mysql
   </strong></tt>

   The response:

   <pre>
   /usr/local/bin/mysql
   </pre>

0. Invoke interactively from the command line:

   <tt><strong>
   echo $TMPDIR
   </strong></tt>

   Sample response:

   <pre>
   /var/folders/j_/gh27gpxj1t58hyryfg9drvdc0000gn/T/
   </pre>

   Now clear it:

   <tt><strong>
   unset TMPDIR
   </strong></tt>

   Do another echo to get a blank response.

0. Invoke interactively from the command line:

   <pre><strong>
   mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql 
   </strong></pre>

   NOTE: The `whoami` returns the output from running the whoami command.

   In previous examples, "--tmpdir=/tmp" is not recognized.


   The response:

   <pre>
2016-07-01 20:40:43 [WARNING] mysql_install_db is deprecated. Please consider switching to mysqld --initialize
2016-07-01 20:40:43 [NOTE]    Creating data directory /usr/local/var/mysql
2016-07-01 20:40:43 [NOTE]    Generating random password to /Users/mac/.mysql_secret...done.
2016-07-01 20:40:43 [NOTE]    Executing /usr/local/opt/mysql/bin/mysqld --bootstrap --datadir=/usr/local/var/mysql --lc-messages-dir=/usr/local/opt/mysql/share/mysql --lc-messages=en_US --basedir=/usr/local/opt/mysql
2016-07-01 20:40:44 [NOTE]    Creating system tables...done.
2016-07-01 20:40:44 [NOTE]    Filling system tables with data...done.
2016-07-01 20:40:45 [NOTE]    Filling help table with data...done.
2016-07-01 20:40:45 [NOTE]    Creating default user root@localhost
2016-07-01 20:40:45 [NOTE]    Creating default proxy root@localhost
2016-07-01 20:40:45 [NOTE]    Creating sys schema
2016-07-01 20:40:45 [NOTE]    done.
2016-07-01 20:40:47 [WARNING] The bootstrap log isn't empty:
2016-07-01 20:40:47 [WARNING] 2016-07-02T02:40:43.275138Z 0 [Warning] --bootstrap is deprecated. Please consider using --initialize instead
   </pre>



<a name="WorkSQL"></a>

## Work with SQL #

0. Define a root password to secure your installation using the provided script:

   <tt><strong>
   mysql_secure_installation
   </strong></tt>

   This invokes the script in a folder such as:<br />
   /usr/local/Cellar/mysql/5.5.10/bin/<br />
   (depending on the version installed).

   The response:

   <pre>
   Securing the MySQL server deployment.
   &nbsp;
   Connecting to MySQL using a blank password.
   Segmentation fault: 11
   </pre>

   CAUTION: This is where I'm stuck now.


## Interactive SQL Client #

   NOTE: mysqladmin is the default client tool for performing administrative tasks.

   PROTIP: Use Sequel Pro's Export and Import features (use a MySQL dump) to move databases.

   NOTE: There is no brew install sequelpro.

0. Download SequelPro SQL client from

   <a target="_blank" href="http://www.sequelpro.com/">http://www.sequelpro.com</a>

0. In the Downloads folder click the file downloaded
   (sequel-pro-1.1.2.dmg as of June 2016).
0. In the window that pops up, click "Sequel Pro".
0. Click "Open" in the "downloaded from the internet" dialog.
0. Click X to dismiss the "Sequel Pro" window.
0. Press command+tab to select Sequel Pro's "pancake" icon.

   QUESTION: Where is this installed?

0. Pinch with three fingers for the Mac's Launch window.

0. Use <a target="_blank" href="http://www.sequelpro.com/docs/Keyboard_Shortcuts">
   SequelPro's keyboard shortcuts</a>.

   <a name="Sockets"></a>

   ### Sockets #

0. Since OS X expects the MySQL socket <strong>mysql.sock</strong> 
   to be in folder <strong>/var/mysql</strong>, 
   create it and add a symbolic link to where the socket actually lives:

   <tt><strong>
   sudo mkdir /var/mysql<br />
   sudo chmod 755 /var/mysql<br />
   sudo ln -s /tmp/mysql.sock /var/mysql/mysql.sock
   </strong></tt>

   Alternately, installation of MySQL 5 by MacPorts places the Socket File in folder:

   <pre>
   /opt/local/var/run/mysql5/mysqld.sock
   </pre>

   and data files in

   <pre>
   /opt/local/var/db/mysql5/
   </pre>

   <a target="_blank" href="http://www.sequelpro.com/docs/Where_are_MySQLs_Files">
   http://www.sequelpro.com/docs/Where_are_MySQLs_Files</a>

0. Create a new connection via the Socket option without changing any settings.

   Both MySQL and MariaDB use main configuration file <strong>my.cnf</strong>. 



## Interactive mode #

http://dev.mysql.com/downloads/workbench/
MySQL Workbench install on mac

The command-line client is mysql.


0. Start the mysqld server so anyone can log in with full permissions:

   <tt><strong>
   mysqld_safe --skip-grant-tables
   </strong></tt>

   Open another Terminal shell window on any folder.

0. Log in without a password:

   <tt><strong>
   mysql -u root
   </strong></tt>

   The response:

   <pre>
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.7.13 Homebrew
&nbsp;
Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.
&nbsp;
Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.
&nbsp;
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
   </pre>   

   See <a target="_blank" href="https://dev.mysql.com/doc/refman/5.6/en/connecting-disconnecting.html">
   docs on Connecting to and Disconnecting from the Server</a>

0. To exit, type in quit and press Enter:

   <tt><strong>
   quit
   </strong></tt>

   Then bring up mysql again.

0. To set automatic:


#start
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

#stop
launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist





<a name="VerifyDB"></a>

## List databases #

There are two ways to get a list of databases:

0. From the command line:

   <tt><strong>
   mysqlshow
   </strong></tt>

   From within MySQL:

   <tt><strong>
   show databases;
   </strong></tt>

   The expected response on a newly created instance:

   <pre>
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
+--------------------+
3 rows in set (0.00 sec)
   </pre>



<a name="MySQLAdmin"></a>

## MySQLAdmin #

mysqladmin is a command-line interface for administrators to perform server administration tasks.

0. On a Terminal command line:

   <tt><strong>
   mysqladmin
   </strong></tt>

   The response is long, starting with...

   <pre>
mysqladmin  Ver 8.42 Distrib 5.7.13, for osx10.11 on x86_64
Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.
&nbsp;
Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.
&nbsp;
Administration program for the mysqld daemon.
Usage: mysqladmin [OPTIONS] command command....
   </pre>

<a name="ManageUsers"></a>

## Manage Users #

0. List users in the mysql system database by specifying a single line:

   <tt><strong>
   use mysql; select * from user;
   </strong></tt>

0. List users by entering SQL commands in several lines: 

   <tt><strong>
   SELECT * FROM information_schema.TABLES
   </strong></tt>

   The response is an arrow:

   <pre>
   ->
   </pre>

   To exit, press control+C then Enter.

   Enter more lines:

   <tt><strong>
   WHERE TABLE_NAME LIKE '%user%'
   </strong></tt>

   To have mysql process the statement lines, type a semicolon and press Enter:

   <tt><strong>
   ;
   </strong></tt>


   The response should be a row containing:

   <pre>
   mysql   user    BASE TABLE  MyISAM
   </pre>


0. Reset all the root passwords (the password being "password"):

   <tt><strong>
   UPDATE mysql.user SET Password=PASSWORD('NewPassword') WHERE User='root';<br />
   FLUSH PRIVILEGES;
   </strong></tt>

   If you kill the running copy of mysqld_safe and 
   start mysql again without the skip-grant-tables option, 
   you should be able to log in with mysql -u root -p and the new password you just set.




<a name="CreateDB"></a>

## Create a database #

These commands are entered `mysql>`.

0. Create: 

   <tt><strong>
   create database sampledb;
   </strong></tt>

   The response:

   <pre>
   Query OK, 1 row affected (0.00 sec)
   </pre>


0. Switch

   <tt><strong>
   use sampledb;
   </strong></tt>


<a name="CommandFiles"></a>

## Command Files #

PROTIP: Interact with the databae via batch-submitted files for repeatability.

0. Copy a file SQL code from GitHub.

   TBD

PROTIP: Interact with the databae via batch-submitted files for repeatability.

0. Save the SQL script to a folder such as ~/sql.

0. Invoke a SQL script using the Linux source command:

   <tt><strong>
   mysql < ~/sql/sqlfile1
   </strong></tt>

0. Invoke a SQL script using the Linux source command:

   <tt><strong>
   source file_name<br />
   \. file_name
   </strong></tt>

   About the sample database creation

0. Since the script creates the database, 
   the repeatable script needs to begin by deleting it:

   <pre>
   DROP DATABASE IF EXISTS sampledb;
   </pre>

0. PROTIP: If a SQL script needs to create several databases,
   group the various actions for a particular database together rather than
   doing each step for each database.

   <pre>
   DROP DATABASE IF EXISTS sampledb;
   create database sampledb;
   use sampledb;
   </pre>


   To create a database based on
   <a target="_blank" href="http://stackoverflow.com/questions/20958/list-of-standard-lengths-for-database-fields"> this discussion</a>:

<pre>
CREATE SCHEMA 'inmail';
CREATE TABLE  'inmail','NEWMAIL' (
'first_name' VARCHAR(48) NULL,
'family_name' VARCHAR(96) NULL,
'subscribe' VARCHAR(1) NULL,
'emailaddr' VARCHAR(128) NULL,
'password' VARCHAR(48) NULL,
'emailsubject' VARCHAR(120) NULL,
'loc' VARCHAR(48) NULL,
'rating' INT NOT NULL,
'pubthis' VARCHAR(1) NULL,
'comments' VARCHAR(4046) NULL,
'refererurl' VARCHAR(255) NULL,
'user_agent' VARCHAR(45) NULL,
'remote_addr' VARCHAR(48) NULL,
'local_addr' VARCHAR(48) NULL,
'city_addr' VARCHAR(96) NULL,
'street_addr' VARCHAR(96) NULL,
'phone_country' MEDIUMINT UNSIGNED NOT NULL,
'phone_numberâ€™ MEDIUMINT UNSIGNED NOT NULL,
'postal' MEDIUMINT UNSIGNED NOT NULL,
'longitude' NUMERIC 9,6 NULL,
'latitude' NUMERIC 8,6 NULL,
'visitor_id' INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);
'savedatetime' TIMESTAMP,
);
// comment not a BLOB to reduce overhead
// phone number is 10 digits in the US.
// postal code 11
// TIMESTAMP is 
</pre>

<a name="Engines"></a>

## InnoDB Engine #

InnoDB is newer, faster, and scales better than the MyISAM database engine.

Allocate a maximum amount of RAM to your MySQL instance with the 
<strong>innodb_buffer_pool_size</strong> parameter and give at least 15Mb to the 
<strong>query_cache_size</strong> parameter. 

Read <a target="_blank" href="http://www.mysqlperformanceblog.com/2007/11/01/innodb-performance-optimization-basics/">
this article about InnoDB Performance Optimization Basics</a>.


<a name="Resources"></a>

## Learn More #

Pinal Dave (pronounced "da way", @pinaldave from India)
has been producing video courses for years on
<a target="_blank" href="http://blog.sqlauthority.com/"> SQLAuthority.com</a>
before doing the 29 Apr 2013
<a target="_blank" href="https://app.pluralsight.com/library/courses/mysql-fundamentals-part1/table-of-contents">
MySQL Fundamentals video course on Pluralsight</a>
(2 hour 37 minutes)


## More on OSX

This is one of a series on Mac OSX:

{% include mac_links.html %}

