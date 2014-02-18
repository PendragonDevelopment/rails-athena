# == Schema Information
#
# Table name: sponsors
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  website           :string(255)
#  phone             :string(255)
#  street            :string(255)
#  street2           :string(255)
#  city              :string(255)
#  state             :string(255)
#  zipcode           :string(255)
#  logo_file_name    :string(255)
#  logo_content_type :string(255)
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  slug              :string(255)
#

class Sponsor < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  extend FriendlyId
  friendly_id :name, use: :slugged
  attr_accessor :logo

  has_many :workshop_sponsors,
  				 :dependent => :destroy

  has_many :workshops,
  				 :through => :workshop_sponsors

	has_attached_file :logo, styles: {
	          thumb: '25x25>',
	          small: '100x100>',
	          medium: '300x300>'
	        },
	        :default_url => "/images/avatars/:style/missing.png",
	        s3_permissions: "public-read"

  validates_attachment_content_type :logo, :content_type => %w(image/jpeg image/jpg image/png)

	def address
		"#{street} #{street2 if !street2.nil?}<br/>#{city}, #{state} #{zipcode}"
	end

end
