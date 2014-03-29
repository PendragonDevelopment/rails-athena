class ApplicationsController < ApplicationController
  load_and_authorize_resource :only => [:index, :show]

  def index
    @workshops = Workshop.upcoming
    @attendees = User.with_role(:attendee).count
  end

  def show
    @application = Application.find(params[:id])
    @user = @application.user
    @workshop = @application.workshop
  end

  def new
    @workshop = Workshop.find(params[:workshop_id])
    @appl = Application.new
  end

  def create
    @workshop = Workshop.find(params[:workshop_id])
    if user_signed_in?
      @user = current_user
    else
      @user = User.find_or_create_by_name_and_email(name: params[:user_name], email: params[:user_email])
      if @user.id.nil?
        @user = User.invite!({email: params[:user_email], name: params[:user_name]})
        @user.add_role(:applicant) unless @user.has_role?(:admin) || @user.has_role?(:coach)
        @user.phone = params[:user_phone]
        @user.os = params[:user_os]
        @user.twitter = params[:user_twitter]
        @user.github = params[:user_github]
        @user.shirt_size = params[:user_shirt]
        @user.save
      end
    end
    @appl = @user.applications.build(application_params)
    @appl.workshop_id = @workshop.id
    @appl.save
    if @appl.save
      AppMailer.app_submitted(@user).deliver
      redirect_to root_path, :notice => "Application submitted!"
    else
      render :new, :notice => "Check the errors below"
    end
  end


  def destroy
    @app = Application.find(params[:id])
    @app.destroy
    redirect_to applications_path, :notice => "Application removed"
  end

  private

  def application_params
    params.require(:application).permit(:experience_level, :previous_experience, :rails_experience,
                                        :good_candidate, :why_rails, :questions)
  end
end
