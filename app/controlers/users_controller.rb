class UsersController < ApplicationController

  get '/sign_up' do
    if !session[:id]
      erb :sign_up
    else
      erb :todo_list
    end
  end

  post "/sign_up" do
    if params[:name] == "" || params[:email] =="" || params[:password] == ""
      redirect to "/sign_up"
    else
      @user = User.create(:name => params[:name], :email => params[:email], :password => params[:password])
      session[:user_id] = @user.id
      redirect to "/sign_in"
    end
  end

  get "/sign_in" do
    if logged_in?
      redirect to "/todo_list"
    else
      erb :sign_in
    end
  end

  post "/sign_in" do
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect to "/todo_list"
    else
      redirect to "/sign_in "
    end
  end

  get '/log_out' do
    session[:id] = nil
    redirect to "/"
  end

  get '/todo_list' do
    erb :todo_list
  end

  get '/user_profile' do
    erb :user_profile
  end


end