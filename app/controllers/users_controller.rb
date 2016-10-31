class UsersController < ApplicationController
  
  before_action :set_user, only: [:show]
  before_action :authenticate_user!

  def index
  	@users = User.all
  end

  def show
  end

  def set_user
  	@user = User.find_by(username: params[:id])
  end
  
end
