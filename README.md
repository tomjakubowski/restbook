# RESTbook

RESTbook is a Rails 3 engine which provides basic guestbook functionality
inspired by RESTful practices. It is still very much a work in progress.
RESTbook requires Ruby 1.9.2 or higher. 

## Installing RESTbook

Installing RESTbook requires only a few steps. First, add the gem dependency
to your Rails 3.1 application's Gemfile:

    # Or use a local copy as the gem source!
    gem 'restbook', :git => 'git://github.com/tomjakubowski/restbook.git'
    
Run `bundle install` to install RESTbook.

### Database migrations

Because RESTbook uses your application's database, its database migrations
must be copied over with `rake restbook:install:migrations` and run with `rake db:migrate`.

### Mounting the engine

Add the following to your application's routes.rb:

    mount Restbook::Engine, :at => '/restbook'

RESTbook is now accessible at `http://yoursite.com/restbook`.

## Features

- Rails::Engine keeps all RESTbook models, controllers, views, and database
  tables namespaced away from your app.
- Permanent guestbook comments, with no deletion (yet)!
- No authentication or authorization!!
- "Wild West" style guestbook!
- Hard-to-change default views which are ugly as sin!

## TODO

- Allow user to easily override views as in devise (`rake generate restbook_views`).
- Plug into authorization gems like CanCan.
- Delete and edit comments.
- Markdown or other formatters in comments.
- Optional reCAPTCHA.
- Pagination.

## Authors

- Tom Jakubowski, http://github.com/tomjakubowski