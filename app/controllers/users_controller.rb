class UsersController < ApplicationController
  def new
  @user = User.new
end

def create
  @user = params[:user] ? User.new(params[:user]) : User.new_guest
  if @user.save
    redirect_to root_url, :notice => "Signed up!"
  else
    render "new"
  end
  end
end
