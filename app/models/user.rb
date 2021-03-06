# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default("")
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  slug                   :string(255)
#  phone                  :string(255)
#  twitter                :string(255)
#  github                 :string(255)
#  os                     :string(255)
#  shirt_size             :string(255)
#  invitation_token       :string(60)
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string(255)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  bio                    :text
#

class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  extend FriendlyId
  friendly_id :name, use: :slugged
  rolify
  attr_accessor :avatar
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :workshop_users

  has_many :workshops,
  				 :through => :workshop_users

  has_many :applications, :dependent => :destroy

  accepts_nested_attributes_for :applications

  has_attached_file :avatar, styles: {
                      thumb: '25x25#',
                      small: '100x100#',
                      medium: '300x300>'
                    },
                    :default_url => "http://placehold.it/25x25"

  validates_attachment :avatar, :content_type => { :content_type => ["image/jpg","image/jpeg", "image/gif", "image/png"] }
  
end
