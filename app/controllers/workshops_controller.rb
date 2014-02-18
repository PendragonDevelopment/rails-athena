class WorkshopsController < ApplicationController
  def index
  	@workshops = Workshop.upcoming
    @next = @workshops.next
  end

  def show
  	@workshop = Workshop.find(params[:id])
  	@sponsors = @workshop.sponsors
  	@allsponsors = Sponsor.all - @sponsors
  	@sponsor_array = @allsponsors.map { |sponsor| [sponsor.name, sponsor.id] } 
  end

  def new
  	@workshop = Workshop.new
  end

  def edit
  	@workshop = Workshop.find(params[:id])
  end

  def create
    @workshop = Workshop.new(workshop_params)
    @start_date = Time.strptime(params[:workshop][:start_date], "%m/%d/%Y %I:%M %p")
    @end_date = Time.strptime(params[:workshop][:end_date], "%m/%d/%Y %I:%M %p")
    @workshop.start_date = @start_date
    @workshop.end_date = @end_date
    @workshop.save
    if @workshop.save
      redirect_to workshop_path(@workshop), :notice => "Workshop created."
    else
      render :new, :notice => "Something went wrong."
    end
  end

  def update
  	@workshop = Workshop.find(params[:id])
  end

  def add_sponsor_to_workshop
  	@sponsor = Sponsor.find(params[:sponsor_id])
  	@workshop = Workshop.find(params[:workshop_id])
  	@workshop_sponsor = WorkshopSponsor.create!(:sponsor_id => @sponsor.id, :workshop_id => @workshop.id)
  	redirect_to workshop_path(@workshop), :notice => "Sponsor added to workshop!"
  end

  private

  def workshop_params
  	params.require(:workshop).permit(:title, :start_date, :end_date, :street, :street2,
  																	 :city, :state, :zipcode, :description)
  end
end
