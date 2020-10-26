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
        album = current_user.albums.build(params)
        if album.save
            redirect "/albums/#{album.id}"
        else
            redirect 'albums/new'
        end
    end

    get '/albums/:id/edit' do
        if logged_in?
            @album = current_user.albums.find_by(params)
            if @album

                erb :'albums/edit'
            else
                redirect "/albums"
            end
        else
            redirect "/login"
        end   

    end

    patch '/albums/:id' do
        album = current_user.albums.find_by(id: params[:id])
        
        if album.update(title: params[:title], artist: params[:artist], release_year: params[:release_year], duration: params[:duration], genre: params[:genre])
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
            redirect '/login'
        end
    end
    

    delete '/albums/:id' do
        if logged_in?
            @album = current_user.albums.find_by(id: params[:id])
            if  @album
                @album.delete
            end
            redirect '/albums'
        else
            redirect '/login'
        end
    end

end