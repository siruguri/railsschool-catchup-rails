# A New Application

To start off, let's create a new Rails application by running the following command:

   # We are going to create an application and name it `blogger_simple`.
   rails new blogger_simple

# The Routes File

The most basic aspect of a Rails application is the `routes.rb` file, which will be in the `config` folder.

The structure of the routes file mimics that of the conventions we've seen in the introduction - there is a method (though Rails has its own shorthand for methods that expand on the list we've seen in the previous lesson), followed by a path to be matched to, and a corresponding _controller_ that will handle the request for the resource this method/path combination point to.

In Rails, the combination of method and path is called a _route_.

Let's try out a simple command and controller. After downloading or
writing the code in `blogger_simple`, you can start your server by
changing to the folder `blogger_simple` and running the following
command:

    rails server

This will start a server that will "listen in" at port 3000, by
default. You will access this in your browser by typing
`http://localhost:3000`. Note that you usually leave out the 3000 part
when you go to most websites, and that's because the default port at
which a server listens in is **80**, and browsers have been written to
assume that if you don't specify a port, you mean **80**.

# Let The Rails Magic Begin

As we walk through the code in class, you'll notice that Rails will
spit out errors that will tell you what its expectations are, as it
parses the entries in the routes file. These expectations are part of
the many conventions that the Rails framework will impose on you, a
set of conventions that are sometimes referred to as "Rails Magic."

Not all of these tricks are documented well. Some you'll encounter in
different books and tutorials; some you'll stumble over on your Rails
journey and maybe spend a couple of days debugging before you
understand them.

* When you specify the "destination" of a route as `<`**name**`>#<`action_method`>`, Rails will expect that the controller is defined in a file called **name**`_controller.rb`, **and** that this controller will be a Ruby class named **Name**`Controller`
  * Note that routes match only resources, not query parameters.
  * Note that the name of the file uses the lowercased name of the controller specified in the `routes.rb` file, but the Ruby class itself has to start with an uppercase letter because of Ruby conventions.
* When the controller ends execution, Rails will then expect a "template" file in the `app/views` folder, which will be responsible for generating the HTML to be rendered in your browser.

# CatWalking: What To Do With Models

Pretty much any web application will need a _persistence layer_. That is the system that stores the data your app generates and uses. The persistence layer is usually a database of some kind. _Models_ are the way in which a web framework - like Rails - helps you interact with a database, by providing an "abstraction layer" that makes it easy to handle the data without having to repeatedly write the corresponding database (SQL) commands.

Note that while SQL - **S**tructured **Q**uery **L**anguage - is the
most common language for communicating with databases (specifically,
with _relational_ databases), there are also many so-called ["NoSQL"
databases](http://www.techrepublic.com/blog/10-things/10-things-you-should-know-about-nosql-databases/) that don't use SQL for database manipulation.

For our purposes, we will build a simple blogging platform. The platform will have to model only one type of data - a post.

It will have two _routes_:

* `/post/list`
* `/post/create`

Each post will have the following _attributes_: 

* The body (this is Twitter-style blogging: no title, just the body)
* The posted date


