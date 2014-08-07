# Backbars

[![Gem Version](https://badge.fury.io/rb/backbars.svg)](http://badge.fury.io/rb/backbars)

Backbars is a gem to generate a boilerplate setup for using Backbone with Rails. The gem will include __Backbone.js__ (with dependencies) and __Handlebars.js__ for templating. [handlebars_assets](https://github.com/leshill/handlebars_assets) is included for compiling Handlebars templates and to make use of the Asset Pipeline to help keep your templates nice and organized. It also builds a simple directory structure to help organize your Backbone files and templates.

```
app
  |_assets
    |_javascripts
      |_application.js
      |_backbone
      | |_routers
      | |_models
      | |_collections
      | |_views
      |
      |_templates
```

The following is inserted into your application.js file:
```
//= require underscore
//= require backbone
//= require handlebars
//= require_tree ./backbone/routers
//= require_tree ./backbone/models
//= require_tree ./backbone/collections
//= require_tree ./backbone/views
//= require_tree ./templates
//= require_tree .
```

#### JavaScript Library Versions
  - Underscore.js (v1.6.0)
  - Backbone.js (v1.1.2)
  - Handlebars.js (v1.3.0)


## Installation

Add this line to your application's Gemfile:

    gem 'backbars'

Then execute:

    $ bundle

And then execute:

    $ rails generate backbars

_If you have an issue with the generator stalling you should run the following command, then re-run the generator_

    $ spring stop

Or install it yourself as:

    $ gem install backbars

## Usage


## Contributing

1. Fork it ( https://github.com/[my-github-username]/backbars/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
