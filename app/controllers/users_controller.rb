class UsersController < ApplicationController
  def index
    if user_signed_in?
      @users = User.all
    else
      render '/splashes/index'
    end
  end
end
