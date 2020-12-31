class CaseController < ApplicationController

    get '/cases' do
        if logged_in?
            erb :'/cases/index'
        else
            redirect '/'
        end
    end

    get '/cases/new' do
        if logged_in?
            @hunters = Hunter.all
            @monsters = Monster.all

            erb :"/cases/new"
        else
            redirect "/"
        end
    end

    post '/cases' do
        @case = Case.create(params[:case])

        if !@case.monster_id 
            @monster = Monster.create(params[:monster])
            @monster.cases << @case
        end

        redirect "/cases/#{@case.id}"
    end

    get '/cases/:id' do
        if logged_in?
            @case = Case.find_by(id: params[:id])
            @monster = Monster.find_by(id: @case.monster_id)
            @hunter = Hunter.find_by(id: @case.hunter_id)
            erb :"/cases/show"
        else
            redirect "/"
        end
    end

    get '/cases/:id/edit' do
        if logged_in?
            @case = Case.find_by(id: params[:id])
            @hunters = Hunter.all 
            @monsters = Monster.all
    
            erb :"/cases/edit"
        else
            redirect "/"
        end
    end

    patch '/cases/:id' do
        @case = Case.find_by(id: params[:id])

        if params[:monster][:species] != ""
            @monster = Monster.create(params[:monster])
            @monster.cases << @case
        else
            @case.update(params[:case])
        end
        
        redirect "/cases/#{@case.id}"
    end

    delete '/cases/:id' do
        @case = Case.find_by(id: params[:id])
        @case.delete

        redirect "/cases"
    end


end