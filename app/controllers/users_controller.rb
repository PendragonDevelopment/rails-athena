class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def the_team
    @team = []
    @users = User.all
    @users.each do |user|
      if user.has_role?(:admin) || user.has_role?(:coach) || user.has_role?(:volunteer)
        @team << user
      end
    end
  end

  private

  # Require that :user be a key in the params Hash,
  # and only accept :name, and :email attributes,
  # with :role_ids accessible for administrators

  def user_params
    if current_user && current_user.has_role?(:admin)
      params.require(:user).permit(:name, :email, :role_ids)
    else
      params.require(:user).permit(:name, :email)
    end
  end
end