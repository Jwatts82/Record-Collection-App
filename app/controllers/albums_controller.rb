class AlbumsController < ApplicationController

    get '/albums' do
        @albums = Album.all
        erb :'albums/index'
    end

    get '/albums/new' do
        erb :'albums/new'
    end

    post '/albums' do
     #   binding.pry
      #  user = User.find_by(id: params[:user_id])
       # album = user.albums.build(params)
        #if album.save
         #   redirect "/albums/#{album.id}"
       # else
        #    redirect '/albums/new'
        #end
    end

    get '/albums/:id' do
        @album = Album.find_by(id: params[:id])

        if @album
            erb :'albums/show'
        else
            redirect '/albums'
        end
    end
    

end