class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:the_team]
  load_and_authorize_resource :except => [:profile, :edit_profile]

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    authorize! :show, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(user_params, :as => :admin)
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

  def profile
    if params.has_key?(:user_id)
      @user = User.find(params[:user_id])
    else
      @user = current_user
    end
  end

  def edit_profile
    @user = User.find(params[:user_id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), :notice => "User updated."
    else
      redirect_to root_path, :alert => "Unable to update user."
    end
  end

  private

  # Require that :user be a key in the params Hash,
  # and only accept :name, and :email attributes,
  # with :role_ids accessible for administrators

  def user_params
    if current_user && current_user.has_role?(:admin)
      params.require(:user).permit(:name, :email, :os, :github,
                                   :phone, :twitter, :shirt_size,
                                   :avatar, :bio, :role_ids)
    else
      params.require(:user).permit(:name, :email, :os, :github,
                                   :phone, :twitter, :shirt_size,
                                   :avatar, :bio)
    end
  end
end