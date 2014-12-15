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
        "//= require underscore\n",
        "//= require backbone\n",
        "//= require handlebars\n",
        "//= require_tree ./backbone/routers\n",
        "//= require_tree ./backbone/models\n",
        "//= require_tree ./backbone/collections\n",
        "//= require_tree ./backbone/views\n",
        "//= require_tree ./templates\n"
      ].join(''),
      after: "//= require turbolinks\n")

    insert_into_file(
      'app/assets/javascripts/application.js',
      "var App = {\nModels: {}, \nCollections: {}, \nViews: {}, \nRouters: {}\n};",
      after: "//= require_tree .\n")

  end

end
