class CaseController < ApplicationController

    get '/cases' do
       erb :'/case/index'
    end

    get '/cases/new' do
        @hunters = Hunter.all
        @monsters = Monster.all

        erb :"/case/new"
    end

    post '/cases' do
        @case = Case.create(params[:case])

        if !@case.monster_id 
            @monster = Monster.create(params[:monster])
            @case.monster_id = @monster.id
            binding.pry
        end

        redirect "/cases/#{@case.id}"
    end

    get '/cases/:id' do
        erb :"/case/show"
    end

    get '/cases/:id/edit' do
        @case = Case.find_by(id: params[:id])
        @hunters = Hunter.all 
        @monsters = Monster.all
    
        erb :"/case/edit"
    end

    patch '/cases/:id' do
        
    end

    delete '/cases/:id' do
        
    end


end