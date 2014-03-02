# == Schema Information
#
# Table name: applications
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  workshop_id         :integer
#  experience_level    :text
#  previous_experience :text
#  rails_experience    :string(255)
#  good_candidate      :text
#  why_rails           :text
#  questions           :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Application < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :user
  belongs_to :workshop

  has_many :agenda_items,
           :dependent => :destroy
  
end
