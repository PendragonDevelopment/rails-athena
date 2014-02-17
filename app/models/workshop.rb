class Workshop < ActiveRecord::Base
  attr_accessible :city, :description, :end_date, :start_date, :state, :street, :street2, :title, :zipcode
end
