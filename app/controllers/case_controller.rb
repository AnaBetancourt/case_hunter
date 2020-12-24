class CaseController < ApplicationController

    get '/cases' do
       erb :'/cases/index'
    end

    get '/cases/new' do
        @hunters = Hunter.all
        @monsters = Monster.all

        erb :"/cases/new"
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
        @case = Case.find_by(id: params[:id])
        @monster = Monster.find_by(id: @case.monster_id)
        @hunter = Hunter.find_by(id: @case.hunter_id)
        erb :"/cases/show"
    end

    get '/cases/:id/edit' do
        @case = Case.find_by(id: params[:id])
        @hunters = Hunter.all 
        @monsters = Monster.all
    
        erb :"/cases/edit"
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