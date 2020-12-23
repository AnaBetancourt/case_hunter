class CaseController < ApplicationController

    get '/cases' do
       erb :'/case/index'
    end

    get '/cases/new' do
        erb :"/case/new"
    end

    post '/cases' do
        
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
        binding.pry
    end

    delete '/cases/:id' do
        
    end


end