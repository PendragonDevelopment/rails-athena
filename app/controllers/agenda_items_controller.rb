class AgendaItemsController < ApplicationController
  def new
    @workshop = Workshop.find(params[:workshop_id])
    @agenda_item = AgendaItem.new
  end

  def edit
    @workshop = Workshop.find(params[:workshop_id])
    @agenda_item = AgendaItem.find(params[:id])
  end

  def create
    @workshop = Workshop.find(params[:workshop_id])
    @agenda_item = @workshop.agenda_items.build(agenda_item_params)
    if @agenda_item.save
      redirect_to workshop_path(@workshop), :notice => "Agenda Item created."
    else
      render :new, :notice => "Something went wrong."
    end
  end

  def update
    @workshop = Workshop.find(params[:workshop_id])
    @agenda_item = AgendaItem.find(params[:id])
    @agenda_item.update_attributes(agenda_item_params)
    if @agenda_item.save
      redirect_to workshop_path(@workshop), :notice => "Agenda Item updated."
    else
      render :edit, :notice => "Something went wrong."
    end
  end

  def destroy
  end

  private

  def agenda_item_params
    params.require(:agenda_item).permit(:title, :description, :start, :end_time)
  end
end
