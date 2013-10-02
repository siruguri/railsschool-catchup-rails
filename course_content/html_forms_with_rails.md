# Built-in Forms

The first thing you'll probably want to do after creating a few models is play around with HTML forms to update them. 

Rails comes with a built-in set of methods that make it easy to create forms. The `scaffold` generation also gives you a basic form for each model you created, for the _create_ and _edit_ actions.

# Advanced Topics

* Try using the Formtastic gem instead.
* Read about aspects of forms:
  * Why does Rails create a label by default for all form elements? Hint: it has [something to do with accessibility](http://stackoverflow.com/questions/3142884/regarding-the-html-labels-for-property).
  * Why won't Rails use `method=put` when updating a form? Hint: it has something to do with [browser support for the `PUT` method](http://stackoverflow.com/questions/11797270/ruby-on-rails-put-method-on-update-ajax).