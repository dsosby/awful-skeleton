Awful Skeleton
==============

This is a very basic template project for a web application using the following stack:

 * [Chicken Scheme|http://call-cc.org]
 * [Awful|http://wiki.call-cc.org/eggref/4/awful]
 * [Ersatz|http://wiki.call-cc.org/eggref/4/ersatz]
 * [Skeleton|http://getskeleton.com]
 * [Heroku|https://github.com/evhan/heroku-buildpack-chicken] *optional deploy

 Usage
 -----
 Clone and fix up the TODO and PROJECT_NAME text.
 Then, use chicken-install to fetch and install dependencies and compile to a shared lib.

     chicken-install -no-install

This should produce a nice run.so file. It can be renamed to be something a bit more
unique - just rename run.scm.
 
Running unit tests can be either:

     chicken-install -test
     csi tests/run.scm

Examples of running the application with Awful:

     #uncompiled
     awful run.scm

     #in dev mode
     awful --development-mode run.scm
     
     #production style
     awful run.so