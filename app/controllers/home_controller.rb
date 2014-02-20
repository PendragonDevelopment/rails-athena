class HomeController < ApplicationController
  def index
    @next = Workshop.next
    @sponsors = Sponsor.all
  end
end
