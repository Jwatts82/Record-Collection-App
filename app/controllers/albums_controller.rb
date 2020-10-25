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

    get '/albums/:id' do
        #binding.pry
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

    get '/albums/:id/edit' do
        #binding.pry
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
#binding.pry
    end

    patch '/albums/:id' do
        album = current_user.albums.find_by(id: params[:id])
    
        #if album
        if album.update(title: params[:title], artist: params[:artist], release_year: params[:release_year], duration: params[:duration], genre: params[:genre])
            redirect "/albums/#{album.id}"
        else
            redirect "/albums/#{post.id}/edit"
        end
        #else
         #   redirect '/albums'
        #end
    end
    
    delete '/albums/:id' do
     album = Album.find_by(id: params[:id])

        if !User.logged_in?(session) || User.current_user(session).id != album.user.id
            redirect '/albums'
        end

        if album
            album.destroy
        end

        redirect '/albums'
    end
     
     
     
     
     
     
     
        #@album = Album.find_by_id(params[:id])
        #if logged_in? && @item.user == current_user
         #   @album.destroy
          #  redirect '/albums'
       #else
        #    redirect '/login'
       #end
    #end
       
        # if logged_in?
        #    @album = current_user.albums.find_by(id: params[:id])
         ##      @album.delete
           # end
            #redirect "/albums"
        #else
         #   redirect '/login'
        #end

end