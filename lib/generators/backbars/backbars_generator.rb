class BackbarsGenerator < Rails::Generators::Base

  def generate_folders
    # Creates folders to store Backbone related files
    empty_directory 'app/assets/javascripts/backbone/routers'
    empty_directory 'app/assets/javascripts/backbone/models'
    empty_directory 'app/assets/javascripts/backbone/collections'
    empty_directory 'app/assets/javascripts/backbone/views'

    # Creates a folder for Handlebars Template files
    empty_directory 'app/assets/javascripts/templates'

    # Adds a .keep file to prevent git from ignoring empty directories
    create_file 'app/assets/javascripts/backbone/routers/.keep'
    create_file 'app/assets/javascripts/backbone/models/.keep'
    create_file 'app/assets/javascripts/backbone/collections/.keep'
    create_file 'app/assets/javascripts/backbone/views/.keep'
    create_file 'app/assets/javascripts/templates/.keep'
  end

  def include_dependencies

    # Inserts require statements into application.js file
    insert_into_file(
      'app/assets/javascripts/application.js',
      [
        "//= require underscore",
        "//= require backbone",
        "//= require handlebars",
        "//= require_self",
        "//= require_tree ./backbone/routers",
        "//= require_tree ./backbone/models",
        "//= require_tree ./backbone/collections",
        "//= require_tree ./backbone/views",
        "//= require_tree ./templates\n"
      ].join("\n"),
      after: "//= require turbolinks\n")

    # Inserts App object structure
    insert_into_file(
      'app/assets/javascripts/application.js',
      "var App = {\n\tModels: {}, \n\tCollections: {}, \n\tViews: {}, \n\tRouters: {}\n};",
      after: "//= require_tree .\n")
  end

  def get_javascript_libraries
    # Adds rails-assets library dependencies
    gem 'rails-assets-underscore', source: 'https://rails-assets.org'
    gem 'rails-assets-backbone', source: 'https://rails-assets.org'

    # Will run bundle install after adding new gems
    Bundler.with_clean_env do
      output = `bundle install`
      print output unless options[:quiet]
    end
  end

end
