require 'rack/contrib'
require 'rack-rewrite'

use Rack::Static, 
  :urls => ["/css", "/img"],
  :root => "public"


use Rack::Rewrite do
  rewrite '/', '/index.html'
  rewrite '/cell', '/cell.html'
end

run Rack::Directory.new('public')