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
        @case = Case.new(params[:case])

        if @case.save
            redirect "/cases/#{@case.id}"
        else
            @errors = @case.errors.full_messages.join(", ")
            erb :"/cases/new"
        end
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
        @case = Case.find_by(id: params[:id])

        if logged_in? && @case.hunter.id == current_user.id
            @hunters = Hunter.all 
            @monsters = Monster.all
            
            erb :"/cases/edit"
        elsif !logged_in?
            redirect "/"
        else
            redirect "/cases/#{@case.id}"
        end
    end

    patch '/cases/:id' do
        @case = Case.find_by(id: params[:id])

        if @case.update(params[:case])
            redirect "/cases/#{@case.id}"
        else
            @errors = @case.errors.full_messages.join(", ")
            erb :"/cases/edit"
        end
    end

    delete '/cases/:id' do
        @case = Case.find_by(id: params[:id])
        @case.delete

        redirect "/cases"
    end

end