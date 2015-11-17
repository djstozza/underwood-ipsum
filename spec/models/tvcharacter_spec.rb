require 'rails_helper'

RSpec.describe Tvcharacter, type: :model do
	it { should have_many(:quotes) }

	it "is invalid without a name" do
		FactoryGirl.build(:tvcharacter, name: nil).should_not be_valid
	end
end