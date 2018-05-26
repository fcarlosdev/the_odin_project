# OdinBook App

This is the final Rails project at [Ruby On Rails: Final Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project)
that simulate facebook site.

Things you going to encouter in this project:

* Can sign in a user locally or by a facebook account;

* Can visualize and edit a user profile (Delete a profile not implemented yet)

* Can create a post e remove your own posts, and hide friends posts

* Can comment to friends posts

* Can send friendships requests

* Send a email notification after sign up

* Can search for users.

* Can receive notifications (Only requests friendships notifications for a while)

## Observations

1. To use facebook account it's necessary to setting protected connection
   (ssl) on rails local server,where you can discover how at [Setting SSS on Puma](https://gist.github.com/tadast/9932075);

2. Use Postgres as database.
