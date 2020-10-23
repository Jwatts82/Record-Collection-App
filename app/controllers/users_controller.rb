class UsersController < ApplicationController
    
    get '/signup' do
        redirect_if_logged_in(session)
        erb :'users/signup'
      end
    
    
      post '/signup' do
        user = User.where(email: params[:user][:email])
    
        if !user.empty?
          flash[:message] = "This email is already taken. Please pick a new one or log in."
          redirect '/signup'
        
        elsif empty_fields?(params[:user])
          flash[:message] = "Please fill out the form."
          redirect '/signup'
        else
          user = User.new(params[:user])
    
          if user.save
            session[:user_id] = user.id
            redirect '/albums'
          else
            flash[:message] = "Whoops! Something went wrong. Please try again!"
            redirect '/signup'
          end
        end
      end
    

end