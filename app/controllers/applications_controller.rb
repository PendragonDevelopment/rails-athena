class ApplicationsController < ApplicationController
  def index
  end

  def show
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
        @user = User.invite!({email: params[:user_email], name: params[:user_name], phone: params[:user_phone]})
        @user.add_role(:applicant)
      end
    end
    @appl = @user.applications.build(application_params)
    @appl.workshop_id = @workshop.id
    @appl.save
    if @appl.save
      redirect_to root_path, :notice => "Application submitted!"
    else
      render :new, :notice => "Check the errors below"
    end
  end

  private

  def application_params
    params.require(:application).permit(:experience_level, :previous_experience, :rails_experience,
                                        :good_candidate, :why_rails, :questions)
  end
end
