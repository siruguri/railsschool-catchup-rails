# The Bare Bones of Rails
## Scaffolds and Skeletons

Putting all the pieces of a model - creation, display, deleting - by yourself is a tedious process. So Rails makes it easy for you by giving you a command called `rails generate`

    rails generate scaffold Post body:string posted_on:datetime
    # You can also type in 'g' instead of 'generate', as a shortcut

The `rails generate scaffold` command does the following:

* Create a model that has the attributes with the data types specified in the `rails generate` command
  * Also, create the _database migration_ needed to capture this in your database
* Generate views for the following:
  * **C**reate: Create an instance
  * **R**ead: View an individual instance or a list of all instances
  * **U**pdate: Edit an instance, and
  * **D**elete: Yep, delete an instance
* Generate the controllers corresponding to these views
* Create a set of _RESTful_ routes to match a set of paths (with corresponding actions) to the actions created for this model, using the `resources` method in the `routes.rb` file

Those four actions constitute the Four Horsemen of the RESTful Apocalypse (to be fanciful about it) - they are typically referred to as the **CRUD** actions for a RESTful resource. Many tricks in Rails magic make it easy to build these RESTful actions.

You can also perform these steps individually through `rails generate` (except for the addition of the route set, which you'd have to do via your editor), by running them in this order:

    rails generate model Post body:string posted_on:datetime
    rails generate controller Post # This generates the views too.

When you use scaffolding, Rails magic works in some very specific ways:

* The model is named assuming the model name is in a _singular_ form, and is capitalized because it's a Ruby class name, which have to be capitalized.
  * **But**: the corresponding database table is named in the _plural_ form, and starts with a lowercase letter. So the name of the table for our `Post` model above, in the database, is `posts`
* The controller is capitalized too, but it's named using the _plural_ form of the model name. So the name of the controller created by `rails generate scaffold` is `PostsController` (note the plural.)
* The views are in a folder that's named by the plural form - so our views for the `Post` model are in the folder `app/views/posts`

# Migration: Setting Up Your Database

But here's one thing that the `rails generate scaffold` magic won't do
- it won't set up your database for you. That you have to do yourself,
with the `rake` executable.`rake` comes with your Rails
installation. It can be asked to perform _tasks_, and one of those
tasks is to set up your database tables. That task is called
`db:migrate`:

    rake db:migrate

## Playing Around With Your Models

In the next section, we'll explore the _Rails Console_: now that you have a database that can accomodate your models' data, let's create some instances.

# Advanced Topics

Here are some more topics you can read once you've become comfortable with the above material:

* What are the other data types you can create? 
  * Look into how the `text` datatype is different from the `string` datatype.
* What are the other ways of writing view files?
  * Look into what HAML is.
