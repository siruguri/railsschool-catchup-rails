# To The Console!

As you start building your app, you should start getting familiar with your friendly neighborhood debugger - the `rails console`.

The console is an interactive, command-line interface - you can read what those are in the [Beginner's Ruby course material](http://sameer.siruguri.net/railsschool-ruby/v2/index.html), if this is not familiar to you.

You have to run the console in the root folder of your app (or in any subfolder, actually.) You will see a prompt, where you can query your models:

    rails console
    irb(main):001:0> Post.all
    Post Load (0.2ms)  SELECT "posts".* FROM "posts"
    ==> => []

This app doesn't have any data in it yet, because we haven't created any instances of your `Post` model. Let's do that, via the `console`:

    irb(main):002:0> p=Post.create(body: 'My first post!', posted_on: '2013-09-25')
    (0.1ms)  begin transaction
    # -- These comments aren't in the actual output - they're part of 
    # -- the lesson narration. Notice the SQL command being generated.
    SQL (33.4ms)  INSERT INTO "posts" ("body", "created_at", "posted_on",
    "updated_at") VALUES (?, ?, ?, ?)  [["body", "My first post!"],
    ["created_at", Mon, 30 Sep 2013 04:04:50 UTC +00:00], ["posted_on",
    Wed, 25 Sep 2013 00:00:00 UTC +00:00], ["updated_at", Mon, 
    30 Sep 2013 04:04:50 UTC +00:00]]
    # -- End of SQL
    (1.9ms)  commit transaction

Whenever you see code in this lesson, that starts with the `irb(main)` prompt, that's being run inside the Rails console.

If you now run `Post.all`, you'll find that your first post is available to you as a Ruby object.

# A Few Modeling Tricks

Rails offers a plethora of ways of manipulating your models, via the corresponding Ruby classes that it creates. For example, your Post model is manipulated using the `Post` class, and its methods. You will learn these as you go along, getting deeper into Rails programming. 

## Setting Attributes 

You've seen one way of setting attributes above - the `create` method, used to create a new instance of your model. Another way is to use the default _setter helper_ functions that Rails creates for you:

    irb(main):005:0> p=Post.find_by_id(1)
    Post Load (0.3ms)  SELECT "posts".* ... 
    # [truncated]
    irb(main):006:0> p.body="My first post (updated)!"
    => "My first post (updated)!"
    irb(main):007:0> p.save
    (0.2ms)  begin transaction
    (0.5ms)  UPDATE "posts" SET "body" = 'My first post (updated)!',
    "updated_at" = '2013-10-01 20:56:43.831297' WHERE "posts"."id" = 1
    (3.1ms)  commit transaction    

Notice the helper methods we've used here:

* `find_by_id`: All models allow you to search in the database using the values of the table columns. Note that `id` is a column that's automatically created for every model. For the `Post` model we created, the other "select helper" functions would be `find_by_body` and `find_by_posted_on`, because those are the two attributes the model has.
* `body`: You can change any specific attribute of a model instance - in this case, we changed the body of an existing post.
* `save`: Calling the `save` method will - no surprise - attempt to save it to the database.

# Advanced Topics

* **Validations**: Read up on how validations work - in the [Getting Started guide section on validations](http://guides.rubyonrails.org/getting_started.html#adding-some-validation), or in [Michael Hartl's excellent tutorial](http://ruby.railstutorial.org/chapters/modeling-users#sec-user_validations).
* **Callbacks**: In the process of creating a new record in the database, or updating one, a series of _callbacks_ are triggered - read up on how these work.
* **Expecting exceptions**: There are two variations on the method used to save records - `save` vs. `save!` ([the API documentation (look for the `save` method)](https://github.com/rails/rails/blob/master/activerecord/lib/active_record/persistence.rb)  is worth reading. Here's a post that describes [how you should figure when to use which one](http://m.onkey.org/save-save).
