require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    @user_phrase = params["user_phrase"]

    @latinizer = PigLatinizer.new

    @final_phrase = @latinizer.piglatinize(@user_phrase)

    erb :pig_latin_display
  end

end
