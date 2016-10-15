require 'sinatra'
require 'sinatra/cookies'
require 'active_support/all'
require 'byebug'

get '/:cookie' do
  response.set_cookie(:cookie_monster, value: params[:cookie], expires: Time.now + 30.day)

  erb :index
end

get '/welcome/user' do
  @cookie = cookies[:cookie_monster]
  @username = params[:username]
  @email = params[:email]
  @profession = params[:profession]
  cookies.delete(:cookie_monster)

  erb :welcome
end
