# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)
require 'bundler/setup'
require 'omniauth-facebook'
require '/app.rb'

use Rack::Session::Cookie, secret: 'abc123'

use OmniAuth::Builder do
  provider :facebook, ENV['APP_ID'], ENV['APP_SECRET']
end

set :app_file, __FILE__

run Sinatra::Application
