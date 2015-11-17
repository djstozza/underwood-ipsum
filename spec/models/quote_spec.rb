require 'rails_helper'

RSpec.describe Quote, type: :model do
	it { should belong_to(:tvcharacter) }

	it "is invalid without a name" do
		FactoryGirl.build(:quote, character_quote: nil).should_not be_valid
	end
end