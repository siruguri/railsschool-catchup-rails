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
* **If your OS is a Unix clone**: Which it should be, if you are going to do any serious Rails/Ruby development. The support for Rails/Ruby on Unix clones, like OSX, Ubuntu and Debian, is far superior to that on Windows. There are three ways you can end up with a Unix clone:
  * Install one on Windows: This will allow you to take advantage of the cheap machines that Windows OS runs on, but the downside is that it's not easy to figure out which Unix version works well for the specific PC you have.
  * Use an Apple machine: Yep, they are expensive, but they come closest to just "working out of the box" when you are doing web development that's not on the Microsoft stack.

# What Is A Web Application?

A web application is typically a program running on a machine that is accessible to a network, usually the global network of computers that we call the World Wide Web. Since around the late 2000's, it's also become common to refer to web applications as applications that are running "in the cloud."

Most web applications communicate using a specific _protocol_, which is another way of saying that your application understands certain commands, and responds to them in certain ways. If you're writing an application, you do have the choice of defining your own protocol but you're probably better off using something that's already well-known.

Most web applications rely on a protocol called _HTTP_ or **Hypter Text Transfer Protocol**. The intricacies of HTTP are described in a series of documents called Requests For Comments or RFCs: [RFC 1945](http://www.isi.edu/in-notes/rfc1945.txt) and [RC 2616](http://www.ietf.org/rfc/rfc2616.txt) being two of the most prominent.

These RFCs are pretty dense to read but the crux of all of these can be summarized, roughly, into the following rules:

* An HTTP transaction consists of a _request_ and a _response_.
* A request can have one of the following commands: **GET**, **PUT**, **DELETE**, **POST** (and some others we won't bother about for the purpose of this tutorial.
* The command will point to a _resource_, which will be written in the following manner:
  * A series of strings, separated by the `/` character
  * The first occurrence of a `?` character will be expected to be followed by a series of key/value pairs in the `X=Y` format
  * The first occurrence of a `#` character will be considered to mark the last part of the resource description

The portion of the resource after the first occurrence of the `?` character is usually referred to as the _URL parameters_ or the _query parameters_. 