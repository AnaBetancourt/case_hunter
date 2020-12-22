class CaseController < ApplicationController

    get '/cases' do
       erb :"/cases/index" 
    end

    get '/cases/new' do
        erb :"/cases/new"
    end

    post '/cases' do
        
    end

    get '/cases/:id' do
        erb :"/cases/show"
    end

    get '/cases/:id/edit' do
        erb :"/cases/edit"
    end

    patch '/cases/:id' do
        
    end

    delete '/cases/:id' do
        
    end


end