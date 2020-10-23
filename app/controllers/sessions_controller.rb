class SessionsController < ApplicationRecord::Base
    
    get '/login' do
        erb :'sessions/login'
    end

end