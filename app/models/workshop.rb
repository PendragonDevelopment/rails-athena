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
#  slug        :string(255)
#

class Workshop < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :workshop_sponsors,
  				 :dependent => :destroy

  has_many :sponsors,
  				 :through => :workshop_sponsors

  scope :next, where(['start_date > ?', DateTime.now]).order("start_date ASC").first
  
	def address
		"#{street} #{street2 if !street2.nil?}<br/>#{city}, #{state} #{zipcode}"
	end
end
