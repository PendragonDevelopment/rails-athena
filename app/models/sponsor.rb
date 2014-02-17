class Sponsor < ActiveRecord::Base
  attr_accessible :city, :description, :logo, :name, :phone, :state, :street, :street2, :website, :zipcode
end
