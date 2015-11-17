# == Schema Information
#
# Table name: tvcharacters
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tvcharacter < ActiveRecord::Base
	has_many :quotes
	validates :name, :presence => true
end
