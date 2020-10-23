class AlbumsController < ApplicationController

    get '/albums' do
        if logged_in?
            @albums = current_user.albums
            erb :'albums/index'
        else
            redirect '/login'
        end
    end

    get '/albums/new' do
        if logged_in?
            erb :'albums/new'
        else
            redirect '/login'
        end
    end

    post '/albums' do
        binding.pry
        album = current_user.albums.build(params)
        if album.save
            redirect "/albums/#{album.id}"
        else
            redirect '/albums/new'
        end
    end

    get '/albums/:id/edit' do
        if logged_in?
            @album = current_user.albums.find_by(params)
        
            if @album
                #binding.pry
                erb :'albums/edit'
            else
                redirect "/albums"
            end
        else
            redirect "/login"
        end   
    end

    patch '/albums/:id' do
        #binding.pry
        album = current_user.albums.find_by(id: params[:id])
        
        if album.update(title: params[:title], artist: params[:artist])
            redirect "/albums/#{album.id}"
        else
            redirect "/albums/#{album.id}/edit"
        end
    end


    get '/albums/:id' do
        if logged_in?
            @album = current_user.albums.find_by(id: params[:id])
            
            if @album
                erb :'albums/show'
            else
                redirect '/albums'
            end
        else
            redirect '/loggin'
        end
    end
    
    delete '/albums/:id' do
        if loggedin?
            @album = current_user.albums.find_by(id: params[:id])
            if @album
                @album.destroy
            end
            redirect '/albums'
        else
            redirect '/login'
        end
    end

end