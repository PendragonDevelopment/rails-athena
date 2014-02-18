class SponsorsController < ApplicationController
  def index
  	@sponsors = Sponsor.all
  end

  def show
  	@sponsor = Sponsor.find(params[:id])
  end

  def new
  	@sponsor = Sponsor.new
  end

  def edit
  	@sponsor = Sponsor.find(params[:id])
    if @sponsor.update_attributes(sponsor_params)
      redirect_to sponsor_path(@sponsor), :notice => "Sponsor updated."
    else
      render :edit, :notice => "Error! Something went wrong!"
    end
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)
    if @sponsor.save
      redirect_to sponsor_path(@sponsor), :notice => "Sponsor created."
    else
      render :new, :notice => "Something went wrong."
    end
  end

  def update
    @sponsor = Sponsor.find(params[:id])
  end

  private

  def sponsor_params
  	params.require(:sponsor).permit(:name, :website, :street, :street2,
  																	:city, :state, :zipcode, :logo,
  																	:description)
  end

end
