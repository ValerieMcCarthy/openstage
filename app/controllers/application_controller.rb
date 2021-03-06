class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  def authenticate_owner
    @user = User.find(session[:user_id])
    @user.owner
  end

  def authenticate_performer
    @user = User.find(session[:user_id])
    @user.performer
  end

  def authenticate_promoter
    @user = User.find(session[:user_id])
    @user.promoter
  end

  def authenticate_user
    if !logged_in?
      flash[:notice] = 'You must be logged in to view this'
      redirect_to root_path
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

end
