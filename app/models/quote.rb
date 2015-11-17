# == Schema Information
#
# Table name: quotes
#
#  id              :integer          not null, primary key
#  character_quote :string
#  tvcharacter_id  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Quote < ActiveRecord::Base
	belongs_to :tvcharacter
	validates :character_quote, :presence => true
end
