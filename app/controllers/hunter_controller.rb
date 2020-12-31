class HunterController < ApplicationController
 
    get '/signup' do
        erb :"/hunters/new"
    end
 
    post '/signup' do
        hunter = Hunter.new(params)

        if hunter.save 
            session[:user_id] = hunter.id
            redirect "/hunters/#{current_user.id}"
        else
            @errors = hunter.errors.full_messages.join(", ")
            erb :"/hunters/new"
        end
    end

    post '/login' do
        hunter = Hunter.find_by(username: params[:username])

        if hunter && hunter.authenticate(params[:password])
            session[:user_id] = hunter.id
            redirect "/hunters/#{current_user.id}"
        else
            redirect "/"
        end
    end
 
    get '/hunters/:id' do
        if logged_in?
            @hunter = Hunter.find_by(id: params[:id])
            @cases = []

            Case.all.each do |c|
                if c.hunter_id == @hunter.id
                    @cases << c 
                end
            end
            erb :"/hunters/show"
        else
            redirect "/"
        end
    end
 
    get '/hunters/:id/edit' do
        @hunter = Hunter.find_by(id: params[:id])

        if logged_in? && current_user.id == @hunter.id
            erb :"/hunters/edit"
        end
    end
 
    patch '/hunters/:id' do
        @hunter = Hunter.find_by(id: params[:id])
        
        if current_user.id == @hunter.id
            @hunter.update(params[:hunter])
            redirect "/hunters/#{@hunter.id}"
        end
    end
 
    delete '/hunters/:id' do
        @hunter = Hunter.find_by(id: params[:id])
 
        redirect "/hunters"
    end
 
end