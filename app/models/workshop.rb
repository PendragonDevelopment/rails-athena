# == Schema Information
#
# Table name: workshops
#
#  id          :integer          not null, primary key
#  start_date  :datetime
#  street      :string(255)
#  street2     :string(255)
#  city        :string(255)
#  state       :string(255)
#  zipcode     :string(255)
#  title       :string(255)
#  end_date    :datetime
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Workshop < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  extend FriendlyId
  friendly_id :title, use: :slugged
  rolify

  has_many :workshop_sponsors,
  				 :dependent => :destroy

  has_many :sponsors,
  				 :through => :workshop_sponsors
end
