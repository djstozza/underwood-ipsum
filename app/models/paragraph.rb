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
	belongs_to :quote
	belongs_to :tvcharacter
end
