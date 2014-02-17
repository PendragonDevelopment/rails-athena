class WorkshopSponsor < ActiveRecord::Base
  belongs_to :sponsor
  belongs_to :workshop
  # attr_accessible :title, :body
end
