# == Schema Information
#
# Table name: workshop_users
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  workshop_id   :integer
#  workshop_role :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class WorkshopUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :workshop
  # attr_accessible :title, :body
end
