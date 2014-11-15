# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

require 'rack/reverse_proxy'

use Rack::ReverseProxy do
  reverse_proxy /^\/blog(.*)$/, 'http://johnscurry.com$1', opts={:preserve_host => true}
end