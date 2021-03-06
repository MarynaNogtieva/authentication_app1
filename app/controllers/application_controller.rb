# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    return nil unless session[:user_id]
  
    @user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to('/welcome') unless logged_in?
  end
end
