# assume $HOME/.railsrc file: --skip-bundle --skip-test-unit --skip-spring --skip-turbolinks -m $HOME/.railsrc.d/my_rails.rb
def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

@app_dir = File.basename(Dir.pwd)
@app_name = @app_dir.camelize
@app_title = @app_dir.humanize.titleize

say "Generating new rails app #{@app_name} (#{@app_title}) in #{@app_dir}"

copy_file("templates/CODE_OF_CONDUCT.txt", "CODE_OF_CONDUCT.txt")
template("templates/mit-license.txt", "LICENSE.txt")

remove_file("app/assets/stylesheets/application.css")
template("templates/application.css.scss", "app/assets/stylesheets/application.css.scss")

append_to_file("app/assets/javascripts/application.js") do
  %q{//= require bootstrap-sprockets
}
end

gem 'therubyracer',  platforms: :ruby
gem 'haml-rails'
gem "bootstrap-sass"
gem "fontawesome-rails"
gem "twitter_bootstrap_form_for", github: "tamouse/twitter_bootstrap_form_for"

gem_group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'awesome_print'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'html2haml'
end

run("bundle install")

generate('rspec:install')
run("bundle binstub rspec-core")

generate(:controller, "static_pages", "index", "--no-helper", "--no-assets", "--no-view-specs")
route("root 'static_pages#index'")

remove_file("app/views/static_pages/index.html.haml")
copy_file("templates/index.html.haml", "app/views/static_pages/index.html.haml")

run("bundle exec html2haml app/views/layouts/application.html.erb app/views/layouts/application.html.haml")
remove_file("app/views/layouts/application.html.erb")
insert_into_file("app/views/layouts/application.html.haml",%q{
    = render partial: "header"
    = render partial: "flash_area"

    .container
  }, before: %r{\n.*= yield})
append_to_file("app/views/layouts/application.html.haml", %q{
    = render partial: "footer"
})

empty_directory("app/views/application/")
template("templates/header.html.haml", "app/views/application/_header.html.haml")
template("templates/footer.html.haml", "app/views/application/_footer.html.haml")
copy_file("templates/flash_area.html.haml", "app/views/application/_flash_area.html.haml")

insert_into_file("app/helpers/application_helper.rb", %q{

  def flash_display
    content_tag(:div, class: "container") do
      flash.each do |level, message|
        concat(content_tag(:div, message, class: "alert alert-#{flash_level_to_bootstrap(level)}"))
      end
    end
  end

  def flash_level_to_bootstrap(level)
    case level
    when "alert"
      "danger"
    else
      "info"
    end
  end

}, before: "end")

rake("db:create")
rake("db:migrate")

remove_file("README.rdoc")
template("templates/README.md", "README.md")

git :init
git add: '.'
git commit: "-a -m 'Initial commit'"

rake("default")

say "New rails application assembled!"
