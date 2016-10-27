---
layout: post
title: "Ports Open"
excerpt: "What ports are open on the machine?"
tags: [IoT, Microsoft, Xamarin]
image:
# pic silver robot white skin handshake 1900x500
  feature: https://cloud.githubusercontent.com/assets/300046/14622149/306629f0-0585-11e6-961a-dc8f60dadbf6.jpg
  credit: 
  creditlink: 
comments: true
---
<i>{{ page.excerpt }}</i>

{% include _toc.html %}

Here is how to see what ports are open listening on a server.

## Mac lsof #

0. In a Terminal command line:

   <tt><strong>
   lsof -nP +c 15 | grep LISTEN
   </strong></tt>

   "lsof" is a contraction for "list open files".
   Without any options specifications, lsof lists all open files belonging to all active processes.

   "-nP" is a combination of "n" for no resolution of IPs to hostnames using DNS
   and "P" for no resolution of Port names from numbers.

   This is because the command already takes several seconds to run.

   "+c 15" specifies command width of 15.

   Piping to grep filters out only lines containing "LISTEN".

   All options are shown by this command:

   lsof -h

0. Drag your Terminal window wider to remove word-wrap.

   <pre>
mongod            429  mac    6u     IPv4 0xeef754dd0b1f6a1b        0t0      TCP 127.0.0.1:27017 (LISTEN)
2BUA8C4S2C.com.   437  mac   11u     IPv4 0xeef754dd0b1f7c0b        0t0      TCP 127.0.0.1:6258 (LISTEN)
2BUA8C4S2C.com.   437  mac   12u     IPv6 0xeef754dd02830d03        0t0      TCP [::1]:6258 (LISTEN)
2BUA8C4S2C.com.   437  mac   13u     IPv4 0xeef754dd0bcc3313        0t0      TCP 127.0.0.1:6263 (LISTEN)
2BUA8C4S2C.com.   437  mac   14u     IPv6 0xeef754dd028307c3        0t0      TCP [::1]:6263 (LISTEN)
Resilio\x20Sync   563  mac    7u     IPv4 0xeef754dd0d29c313        0t0      TCP *:49387 (LISTEN)
Skype             743  mac   20u     IPv4 0xeef754dd2d469313        0t0      TCP 10.0.0.2:2301 (LISTEN)
SketchMirrorHel  1912  mac    7u     IPv4 0xeef754dd12dda63b        0t0      TCP *:56989 (LISTEN)
SketchMirrorHel  1912  mac    8u     IPv6 0xeef754dd02830283        0t0      TCP *:56989 (LISTEN)
SketchMirrorHel  1912  mac   10u     IPv4 0xeef754dd11ecaf33        0t0      TCP *:56990 (LISTEN)
ruby            13444  mac    7u     IPv4 0xeef754dd18739c0b        0t0      TCP 127.0.0.1:4000 (LISTEN)
nginx           20244  mac    6u     IPv4 0xeef754dd1158563b        0t0      TCP *:8080 (LISTEN)
nginx           20245  mac    6u     IPv4 0xeef754dd1158563b        0t0      TCP *:8080 (LISTEN)
Dropbox         21014  mac  114u     IPv6 0xeef754dd05928d03        0t0      TCP *:17500 (LISTEN)
Dropbox         21014  mac  115u     IPv4 0xeef754dd079ce313        0t0      TCP *:17500 (LISTEN)
Dropbox         21014  mac  157u     IPv4 0xeef754dd20427a1b        0t0      TCP 127.0.0.1:17600 (LISTEN)
Dropbox         21014  mac  163u     IPv4 0xeef754dd0e9f763b        0t0      TCP 127.0.0.1:17603 (LISTEN)
   </pre>

   Skype             743  mac   20u     IPv4 0xeef754dd2d469313        0t0      TCP 10.0.0.2:2301 (LISTEN)

   The heading:

   <pre>
   COMMAND  PID USER   FD   TYPE DEVICE SIZE NODE NAME
   </pre>



the identification number of the process (PID) that has opened the file;
the process group identification number (PGID) of the process (optional);
the process identification number of the parent process (PPID) (optional);
the command the process is executing;
the owner of the process;
for all files in use by the process, including the executing text file and the shared libraries it is using:
the file descriptor number of the file, if applicable;
the file's access mode;
the file's lock status;
the file's device numbers;
the file's inode number;
the file's size or offset;
the name of the file system containing the file;
any available components of the file's path name;
the names of the file's stream components;
the file's local and remote network addresses;
the TLI network (typically UDP) state of the file;
the TCP state, read queue length, and write queue length of the file;
the file's TCP window read and write lengths (Solaris only); and
other file or dialect-specific values.


## Resources 

https://www.wikiwand.com/en/Lsof

https://danielmiessler.com/study/lsof/#gs.3YHJpiA

https://netadmintools.com/html/lsof.man.html

