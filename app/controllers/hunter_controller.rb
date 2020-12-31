class HunterController < ApplicationController
 
    get '/signup' do
        erb :"/hunters/new"
    end
 
    post '/signup' do
        hunter = Hunter.new(params)

        if hunter.save 
            session[:user_id] = hunter.id
            redirect "/hunters/#{hunter.id}"
        else
            @errors = hunter.errors.full_messages.join(", ")
            erb :"/hunters/new"
        end
    end

    post '/login' do
        hunter = Hunter.find_by(username: params[:username])

        if hunter && hunter.authenticate(params[:password])
            sessions[:user_id] = hunter.id
            redirect "/hunters/#{hunter.id}"
        else
            redirect "/"
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