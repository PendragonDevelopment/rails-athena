class HomeController < ApplicationController
  def index
    @next = Workshop.next
  end
end
