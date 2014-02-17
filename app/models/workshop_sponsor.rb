# == Schema Information
#
# Table name: workshop_sponsors
#
#  id          :integer          not null, primary key
#  sponsor_id  :integer
#  workshop_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class WorkshopSponsor < ActiveRecord::Base
  belongs_to :sponsor
  belongs_to :workshop
  # attr_accessible :title, :body
end
