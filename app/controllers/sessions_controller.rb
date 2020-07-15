# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create welcome]
  def new; end

  def create
    @user = User.find_by(
      username: sessions_params[:username],
      email: sessions_params[:email]
    )

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect_to('/welcome')
    else
      redirect_to('/login')
    end
  end

  def login; end

  def welcome; end

  def page_requires_login; end

  def destroy
    session&.keys&.each do |key|
      session.delete(key)
    end

    # https://guides.rubyonrails.org/v6.0/security.html#session-fixation-countermeasures
    # protect you from session fixation.
    reset_session

    redirect_to('/welcome')
  end

  private

  def sessions_params
    params.permit(
      :username,
      :password,
      :email
    )
  end
end
