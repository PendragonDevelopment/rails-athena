class Application < ActiveRecord::Base
  belongs_to :user
  belongs_to :workshop
  attr_accessible :experience_level, :good_candidate, :previous_experience, :questions, :rails_experience, :why_rails
end
