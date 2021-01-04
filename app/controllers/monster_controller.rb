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
            @cases = []
            Case.all.each do |c|
                if c.monster_id == nil
                    @cases << c 
                end
            end

            erb :"/monsters/new"
        else
            redirect "/"
        end
    end

    post '/monsters' do
        monster = Monster.new(params[:monster])
        
        if monster.save
            if params[:case_file]
                monster.cases << Case.find_by(id: params[:case_file][:id])
            end
            redirect "/monsters/#{monster.id}" 
        else
            @errors = monster.errors.full_messages.join(", ")
            @cases = []
            Case.all.each do |c|
                if c.monster_id == nil
                    @cases << c 
                end
            end
            
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
        monster = Monster.find_by(id: params[:id])

        if monster.update(params[:monster])
            redirect "/monsters/#{monster.id}"
        else
            @errors = monster.errors.full_messages.join(", ")
            erb :"/monsters/edit"
        end
    end

    delete '/monsters/:id' do
        monster = Monster.find_by(id: params[:id])
        monster.delete

        redirect "/monsters"
    end

end