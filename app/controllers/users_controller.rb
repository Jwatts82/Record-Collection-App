class UsersController < ApplicationController

    get '/signup' do 
        erb :'/users/signup'
    end

    post '/signup' do 
        user = User.new(name: params[:name], email: params[:email], password: params[:password])
        if user.save
            redirect "/login"
        else 
            erb :"/users/signup"
        end
    end

end