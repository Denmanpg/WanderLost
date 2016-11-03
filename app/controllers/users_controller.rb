class UsersController < ApplicationController
  
  before_action :set_user, only: [:show,:messages]
  before_action :authenticate_user!

  def index
    case params[:people]
    when "friends"
      @users=current_user.get_friends
    when "pending"
      @users=current_user.get_pending
    when "requested"
      @users=current_user.get_requests
    else
      @users=User.where.not(id: current_user.id)
    end
  end

  def messages
    case params[:filter]
    when "sent"
      @messages=current_user.get_sent
    else
      @messages=current_user.get_inbox
    end
    # @messages=Message.all
  end

  def show
    @message=Message.new
  end

  def set_user
    @user = User.find_by(username: params[:id])
  end
  
end