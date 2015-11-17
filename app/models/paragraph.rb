# == Schema Information
#
# Table name: paragraphs
#
#  id               :integer          not null, primary key
#  quote_id         :integer
#  tvcharacter_id   :integer
#  quotations       :integer
#  paragraph_number :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Paragraph < ActiveRecord::Base
	belongs_to :tvcharacter
	has_many :quotes, :through => :tvcharacter

	validates :tvcharacter_id, :presence => true
	validates :quotations, :presence => true
	validates :paragraph_number, :presence => true
end
