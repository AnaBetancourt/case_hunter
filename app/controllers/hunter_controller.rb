class HunterController < ApplicationController
 
    get '/signup' do
        erb :"/hunters/new"
    end
 
    post '/signup' do
        hunter = Hunter.new(params)

        if hunter.save 
            session[:user-id] = @hunter.id
            redirect "/hunters/#{@hunter.id}"
        else
            redirect '/signup'
        end
    end
 
    get '/hunters/:id' do
        @hunter = Hunter.find_by(id: params[:id])
        @cases = []

        Case.all.each do |c|
            if c.hunter_id == @hunter.id
                @cases << c 
            end
        end

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