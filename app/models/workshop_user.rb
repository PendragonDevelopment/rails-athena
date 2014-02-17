class WorkshopUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :workshop
  # attr_accessible :title, :body
end
