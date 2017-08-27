require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  include Concerns::HelperMethods

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    use Rack::Flash
    set :session_secret, "NachoMamma137!"
  end

end
