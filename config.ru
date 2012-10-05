require 'rack/contrib'
require 'rack/contrib/try_static'
require 'rack-rewrite'
require 'rake-pipeline'
require 'rake-pipeline/middleware'

require 'modular-scale'
require 'breakpoint'
require 'animate'

use Rake::Pipeline::Middleware, "Assetfile"

use Rack::TryStatic,
  :urls => ['/'],
  :root => 'public',
  :try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially

run lambda { |env| [200, { 'Content-Type' => 'text/html', 'Cache-Control' => 'public, max-age=86400' }, ["Not Found"]] }
