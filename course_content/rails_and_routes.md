# A New Application

To start off, let's create a new Rails application by running the following command:

   # We are going to create an application and name it blogger.
   rails new blogger

# The Routes File

The most basic aspect of a Rails application is the `routes.rb` file, which will be in the `config` folder.

The structure of the routes file mimics that of the conventions we've seen in the introduction - there is a command, followed by a resource, and a corresponding _controller_ that will handle the request for that resource.

Before going ahead, it's useful to know that RoR uses a different vocabulary for the concepts we've discussed so far:

* Resources are called *routes* in some cases, and *paths* in others (we'll see which is where, shortly.)

Let's try out a simple command and controller. After writing the code in `blogger_simple`, you can start your server by running the following command:

    rails server

This will start a server that will "listen in" at port 3000, by default. You will access this in your browser by typing `http://localhost:3000`. Note that you usually leave out the 3000 part when you go to most websites, and that's because the default port at which a server listens in is **80**, and browsers have been written to assume that if you don't specify a port, you mean **80**.

# Let The Rails Magic Begin

As we walk through the code in class, you'll notice that Rails will
spit out errors that will tell you what its expectations are,
regarding how it parses the entries in the routes file. These
expectations are part of the many conventions that the Rails framework
will impose on you - not all of these are documented well. Some you'll
encounter in different books and tutorials; some you'll stumble over
on your Rails journey and maybe spend a couple of days debugging
before you understand them.

* When you specify the "destination" of a route as `<`**name**`>#<action_method>`, Rails will expect that the controller is defined in a file called **name**`_controller.rb`, **and** that this controller will be a Ruby class named **name**`Controller`
  * Note that routes match only resources, not query parameters.

and end.
