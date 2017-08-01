# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

require 'sprockets/es6'
activate :sprockets do |s|
  s.supported_output_extensions << '.es6'
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  # Find svgs in img directory so we can easily place them in views
  def svg(name)
    file_path = "source/images/svg/#{name}.svg"
    return File.read(file_path).html_safe if File.exists?(file_path)
    '(not found)'
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :development do
  activate :livereload
end

configure :build do
  # Minify CSS
  activate :minify_css

  # Minify JS
  activate :minify_javascript

  # Minify HTML
  activate :minify_html

  # Compress files
  activate :gzip

  # Pretty URLs (only use if running under a webserver)
  # activate :directory_indexes

  # Asset helpers use relative paths (use if site is a subdirectory)
  # activate :relative_assets

  # Link helpers use relative paths (use if site is a subdirectory)
  # set :relative_links, true
end

# activate :deploy do |deploy|
#   deploy.deploy_method = :rsync
#   deploy.build_before  = true
#   deploy.host          = '' # prepended username because deploy.user is not working
#   deploy.path          = ''
#   # deploy.user          = '' #deploy.user is not using username in rsync call
#   deploy.flags         = '-azh'
#   # Optional Settings
#   # deploy.user  = 'tvaughan' # no default
#   # deploy.port  = 5309 # ssh port, default: 22
#   # deploy.clean = true # remove orphaned files on remote host, default: false
#   # deploy.flags = '-rltgoDvzO --no-p --del' # add custom flags, default: -avz
# end
