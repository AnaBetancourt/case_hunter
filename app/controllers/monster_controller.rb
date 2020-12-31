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
        @monster = Monster.new(params)
        
        if @monster.save
            redirect "/monsters/#{@monster.id}"
        else
            @errors = @monster.errors.full_messages.join(", ")
            erb :"monsters/new"
        end
        
    end

    get '/monsters/:id' do
        if logged_in?
            @monster = Monster.find_by(id: params[:id])
            erb :"/monsters/show"
        else
            redirect "/"
        end
    end

    get '/monsters/:id/edit' do
        
        if logged_in?
            @monster = Monster.find_by(id: params[:id])
            erb :"/monsters/edit"
        else
            redirect "/"
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