class AppController < Sinatra::Base
  set :session_secret, "vomit"
  enable :sessions
  set :views, Proc.new { File.join(root, "../views/") }
  set :public_folder, Proc.new { File.join(root, "../public/") }
end