class UsersController < ApplicationController
  
  before_action :set_user, only: [:show,:messages]
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def messages
    @messages=Message.all
  end

  def show
    @message=Message.new
  end

  def set_user
    @user = User.find_by(username: params[:id])
  end
  
end