require 'rack/contrib'
require 'rack-rewrite'
require 'rake-pipeline'
require 'rake-pipeline/middleware'

use Rake::Pipeline::Middleware, "Assetfile"

use Rack::Static, :urls => ["/stylesheets", "/javascripts"], :root => "public"
run lambda { |env| [200, { 'Content-Type' => 'text/html', 'Cache-Control' => 'public, max-age=86400' }, File.open('public/index.html', File::RDONLY)] }
