class ListsController < ApplicationController
  get '/todo_list' do
    erb :'lists/todo_list'
  end
end
