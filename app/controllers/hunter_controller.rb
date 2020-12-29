class HunterController < ApplicationController
    get '/hunters' do
        erb :'/hunters/index'
    end
 
    get '/hunters/new' do
 
        erb :"/hunters/new"
    end
 
    post '/hunters' do
        @hunter = 
        redirect "/hunters/#{@hunter.id}"
    end
 
    get '/hunters/:id' do
        @hunter = Hunter.find_by(id: params[:id])

        erb :"/hunters/show"
    end
 
    get '/hunters/:id/edit' do
        @hunter = Hunter.find_by(id: params[:id])
     
        erb :"/hunters/edit"
    end
 
    patch '/hunters/:id' do
        @hunter = Hunter.find_by(id: params[:id])
 
         
        redirect "/hunters/#{@hunter.id}"
    end
 
    delete '/hunters/:id' do
        @hunter = Hunter.find_by(id: params[:id])
 
        redirect "/hunters"
    end
 
end