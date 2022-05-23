class ListsController < ApplicationController
  get '/todo_list' do
    erb :todo_list
  end
end
