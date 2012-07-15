require 'rubygems'
require 'sinatra'
require 'pony'

get '/' do
  erb :index 
end

get '/cell' do
  erb :cell
end

get '/email' do
  Pony.mail(:to=>"nate.berkopec@gmail.com", 
            :from => 'tastingtonight@gmail.com', 
            :subject=> "SUBJECT",
            :body => params.to_s,
            :via => :smtp, :smtp => {
              :host       => 'smtp.gmail.com',
              :port       => '587',
              :user       => 'tastingtonight@gmail.com',
              :password   => 'beerandstuff',
              :auth       => :plain,
              :domain     => "gmail.com"
             }
           )
  "We'll get in contact with you soon."
end
