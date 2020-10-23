class UsersController < ApplicationController

    get "/signup" do
        erb :'users/signup'
    end

    post "/users" do
        # binding.pry
        user = User.new(
            name: params[:name],  
            email: params[:email],  
            password: params[:password]  
        )
        if user.save
            session[:user_id] = user.id
            redirect '/albums'
        else
            redirect '/signup'
        end
        
    end

end