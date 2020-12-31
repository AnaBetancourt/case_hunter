class MonsterController < ApplicationController

    get '/monsters' do
        if logged_in?
            erb :'/monsters/index'
        else
            redirect '/'
        end
    end

    get '/monsters/new' do
        if logged_in?
            erb :"/monsters/new"
        else
            redirect "/"
        end
    end

    post '/monsters' do
        binding.pry

        redirect "/monsters/#{@monster.id}"
    end

    get '/monsters/:id' do
        if logged_in?
            erb :"/monsters/show"
        else
            redirect "/"
        end
    end

    get '/monsters/:id/edit' do
        @monster = Monster.find_by(id: params[:id])

        if logged_in?
            
            erb :"/monsters/edit"
        elsif !logged_in?
            redirect "/"
        else
            redirect "/monsters/#{@monster.id}"
        end
    end

    patch '/monsters/:id' do
        @monster = Monster.find_by(id: params[:id])

        binding.pry
        
        redirect "/monsters/#{@monster.id}"
    end

    delete '/monsters/:id' do
        @monster = Monster.find_by(id: params[:id])
        @monster.delete

        redirect "/monsters"
    end

end