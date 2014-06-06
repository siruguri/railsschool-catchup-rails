# Introduction

## What Do I Need To Know Already?

This set of lessons walks beginners through the basics of web programming, using the Ruby on Rails framework (hereinafter referred to as _RoR_). It assumes some understanding of programming basics, and some familiarity with either Ruby syntax (ideally) or with the syntax of similar, interpreted, languages, like Perl, Python or PHP. It also assumes that you know how to manipulate a command prompt, like the DOS prompt or a Unix/Linux shell.

## What Will I Learn?

These lessons will focus entirely on the design patterns and web
programming ideas that are supported by RoR. In particular, these
lessons will only touch lightly on aspects that are not central to RoR
like scalability, security, good design patterns in programming,
database optimization and so on. 

RoR facilitates the development of web applications that are
optimized, highly scalable and secure, but at its heart, it's meant,
more than anything else, to help you design the basic logic of your
application easily, and that's what we'll be exploring.

## What Should I Install?

The [excellent RailsBridge guide to installing Rails](http://installfest.railsbridge.org/installfest/) is a great resource. The list below is essentially a summary of what they have recommended, condensed to three bullet points (or two depending on how you're counting):

* **If your OS is Windows**: Your best bet is to install [RailsInstaller](http://www.railsinstaller.org) - the RailsBridge guide has a page [dedicated to instructions for RailsInstaller on Windows](http://installfest.railsbridge.org/installfest/windows). Note that if you have already installed Cygwin on your system, it might have come with an installation of Ruby that will conflict with RailsInstaller. We seriously recommend that you first uninstall Cygwin.
* **If your OS is a Unix clone** (and that includes OSX): Which it should be, if you are going to do any serious Rails/Ruby development. The support for Rails/Ruby on Unix clones, like OSX, Ubuntu and Debian, is far superior to that on Windows. There are three ways you can end up with a Unix clone:
  * Install one on Windows: This will allow you to take advantage of the cheap machines that Windows OS runs on, but the downside is that it's not easy to figure out which Unix version works well for the specific PC you have. You can install [Cygwin](http://www.cygwin.com) instead of creating a partition for another OS, but beware that getting Ruby and RVM set up on Cygwin is not easy for the Unix newbie.
  * Use an Apple machine: Yep, they are expensive, but they come closest to just "working out of the box" when you are doing web development that's not on the Microsoft stack. You can also install RailsInstaller on OSX (up to 10.8) The caveat with RailsInstaller is that it comes with Ruby 1.9, not 2.0; and with Rails 3.2, not 4.0 (all version information as of Oct 2013.)
  * Set up an AWS instance: It's not terribly hard to do so - here are [some quick instructions on walking you through the process](aws_quick_tips.html). Note that while setting up the instance is relatively easy and its in general easier and faster to get various packages for it, your instance is barebones: you'll have to go through the process of setting up a web server as well as Ruby and Rails on it yourself.

# What Is A Web Application?

A web application is typically a program running on a machine that is accessible to a network, usually the global network of computers that we call the World Wide Web. Since around the late 2000's, it's also become common to refer to web applications as applications that are running "in the cloud."

The machine running the application is identified by an _IP address_ or a _domain name_. Domain names are friendlier, or more readable versions, of an IP address - the process of mapping domain names to IP addresses is called [DNS resolution](http://en.wikipedia.org/wiki/Domain_Name_System).

## Follow The Protocol

Most web applications communicate using a specific _protocol_, which is another way of saying that your application understands certain commands, and responds to them in certain ways. If you're writing an application, you do have the choice of defining your own protocol but you're probably better off using something that's already well-known.

Most web applications rely on a protocol called _HTTP_ or **Hyper
Text Transfer Protocol**. The intricacies of HTTP are described in a
series of documents called Requests For Comments or RFCs: [RFC
1945](http://www.isi.edu/in-notes/rfc1945.txt) and [RC
2616](http://www.ietf.org/rfc/rfc2616.txt) being two of the most
prominent.

These RFCs are pretty dense to read but the crux of all of these can be summarized, roughly, into the following rules:

* An HTTP transaction consists of a _request_ and a _response_.
* A request itself consists of three components:
  * A _method_, which can have one of the following values: **GET**, **PUT**, **DELETE**, **POST** (and some others we won't bother about for the purpose of this tutorial.
  * A _path_, which is the sequence of characters following the domain name to which the request is sent (the shortest possible path is the character `/`)
  * A set of _query parameters_, which is a string of characters at the end of the path, separated from it by a `?`.
* The request points to a _resource_ on the domain.

## The Resource

For the purpose of pretty much the rest of this tutorial, the most important aspect of the request that you need to understand is the _path_, and how it will point to a _resource_.

As discussed above, paths and query parameters are written in the
following manner:

  * The path starts with, and has components that are separated by, the `/` character
  * The path ends with the first occurrence of a `?` character which announces the beginning of the query parameter string (or, simply, 'query string') 
  * The query string is a series of key/value pairs in the `X=Y` format
  * The first occurrence of a `#` character announces the end of the path and query string.

The key-value pairs, written after the first occurrence of the `?` character, are also referred to as the _URL parameters_.

In the code sample **1** attached to these lessons, you can see how
this method/path/query string convention is translated into variables
in the PHP programming language.
