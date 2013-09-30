# To The Console!

As you start building your app, you should start getting familiar with your friendly neighborhood debugger - the `rails console`.

The console is an interactive, command-line interface - you can read what those are in the [Beginner's Ruby course material](http://sameer.siruguri.net/railsschool-ruby/v2/index.html), if this is not familiar to you.

You have to run the console in the root folder of your app (or in any subfolder, actually.) You will see a prompt, where you can query your models:

    rails console
    irb(main):001:0> Post.all
    Post Load (0.2ms)  SELECT "posts".* FROM "posts"
    ==> => []

This app doesn't have any data in it yet, because we haven't created any instances of your `Post` model. Let's do that, via the `console`:

    irb(main):002:0> Post.create(body: 'My first post!', posted_on: '2013-09-25')
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

If you now run `Post.all`, you'll find that your first post is available to you as a Ruby object.