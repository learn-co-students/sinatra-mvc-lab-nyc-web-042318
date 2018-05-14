require_relative 'config/environment'
# require "pry"

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end


  post '/piglatinize' do
    text_from_user = params[:user_phrase]

    @pigLatin_text = PigLatinizer.new(text_from_user)
    # binding.pry

    erb :results
  end
end
