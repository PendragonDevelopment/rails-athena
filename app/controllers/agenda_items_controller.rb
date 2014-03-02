class AgendaItemsController < ApplicationController
  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def agenda_items_params
    params.require(:agenda_items).permit(:title, :description, :start, :end_date)
  end
end
