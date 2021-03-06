class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)

    if password_exists && @user.save
      if params[:user][:owner] == '1'

        @user.owner = Owner.new(user_id: @user.id)
      end

      if params[:user][:performer] == '1'
        @user.performer = Performer.new(user_id: @user.id)
      end

      if params[:user][:promoter] == '1'
        @user.promoter = Promoter.new(user_id: @user.id)
      end

      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Failed to create your account please try again"
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.valid?
      redirect_to user_path(@user) and return
    else
      flash[:notice] = "Failed to create update your account please try again"
      redirect_to edit_user_path
    end
  end

  def show
    @user = User.find(params[:id])

    #
    # if @user.performer
    #   if !@user.performer
  end

  def destroy

  end

  private

  def password_exists
    @user.password
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email, :phone_number)
  end
end
