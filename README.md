# Brownfield Of Dreams

### Introduction

This is a Ruby on Rails application used to organize YouTube content used for online learning. Each tutorial is a playlist of video segments. Within the application an admin is able to create tags for each tutorial in the database. A visitor or registered user can then filter tutorials based on these tags.

A visitor is able to see all of the content on the application but in order to bookmark a segment they will need to register. Once registered a user can bookmark any of the segments in a tutorial page.

### Project Board

[Click Here to see the Brownfield of Dreams Project Board](https://github.com/Jake0Miller/brownfield-of-dreams/projects/1)


### Initial Setup

First you'll need to setup an API key with YouTube and have it defined within `ENV['YOUTUBE_API_KEY']`. There will be one failing spec if you don't have this set up.

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
