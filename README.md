# Brownfield Of Dreams

### Introduction

This is a Ruby on Rails application used to organize YouTube content used for online learning. Each tutorial is a playlist of video segments. Within the application an admin is able to create tags for each tutorial in the database. A visitor or registered user can then filter tutorials based on these tags.

A visitor is able to see all of the content on the application but in order to bookmark a segment they will need to register. Once registered a user can bookmark any of the segments in a tutorial page.


### Learning Goals

Upon starting this project, Brownfield of Dreams was a partially built repository full of technical debt that we had to try to find and eliminate. We were also asked to build new features on top of code that contained bugs, and were asked to fix the bugs before we were able to deploy.

The main learning goal of Brownfield was to teach us empathy towards past and future developers. We were to decide what had to be fixed in the limited time constraint given.

The technical learning goals fo this project were API consumption, implementing and testing OAuth, and implementing VCR and Webmock for testing API services. Design patterns and principles of OOP were also strongly enforced.


### Project Board

[Click Here to see the Brownfield of Dreams Project Board](https://github.com/Jake0Miller/brownfield-of-dreams/projects/1)


### Initial Setup

Clone down the repo
```
$ git clone
```

Install the gem packages
```
$ bundle install
```

Install node packages for stimulus
```
$ brew install node
$ brew install yarn
$ yarn add stimulus
```

Set up the database
```
$ bundle exec rake db:create
$ bundle exec rake db:migrate
$ bundle exec rake db:seed
$	bundle exec rake video_position:remove_nil
```

You'll need to setup API keys with YouTube and GitHub have it defined within:

YOUTUBE_API_KEY: `ENV['YOUTUBE_API_KEY']`
GITHUB_API_KEY: `ENV['GITHUB_API_KEY']`
GITHUB_SECRET: `ENV['GITHUB_SECRET']`

### Running Tests

Run the test suite:
```ruby
$ bundle exec rspec
```

### Core Contributors

- [Jake Miller](https://github.com/Jake0Miller)
- [Jori Peterson](https://github.com/JoriPeterson)


### Tech Stack List

* [Stimulus](https://github.com/stimulusjs/stimulus)
* [will_paginate](https://github.com/mislav/will_paginate)
* [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on)
* [webpacker](https://github.com/rails/webpacker)
* [vcr](https://github.com/vcr/vcr)
* [selenium-webdriver](https://www.seleniumhq.org/docs/03_webdriver.jsp)
* [chromedriver-helper](http://chromedriver.chromium.org/)

### Versions

* Ruby 2.4.1
* Rails 5.2.0
