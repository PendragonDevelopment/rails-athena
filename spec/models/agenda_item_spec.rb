# == Schema Information
#
# Table name: agenda_items
#
#  id             :integer          not null, primary key
#  application_id :integer
#  start          :datetime
#  end_time       :datetime
#  title          :string(255)
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe AgendaItem do
  pending "add some examples to (or delete) #{__FILE__}"
end
