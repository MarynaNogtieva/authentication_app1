# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def new
    reset_session
    @user = User.new
  end

  def create
    reset_session
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to('/welcome')
    else
      redirect_to('/login')
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :password,
      :email
    )
  end
end
