class UsersController < ApplicationController

    get '/signup' do 
        if logged_in?
            redirect "/albums"
        else
            erb :'/users/signup'
        end
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