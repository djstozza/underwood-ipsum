require 'rails_helper'

RSpec.describe Paragraph, type: :model do
	it { should belong_to :tvcharacter }
	it { should have_many(:quotes).through(:tvcharacter) }

	describe 'A paragraph' do
		before do
			@paragraph = Paragraph.create(:quotations => 10, :paragraph_number => 5)
		end
	end

	it "is invalid without a number of quotations" do
		FactoryGirl.build(:paragraph, quotations: nil).should_not be_valid
	end

	it "is invalid without a specified number of paragraphs" do
		FactoryGirl.build(:paragraph, paragraph_number: nil).should_not be_valid
	end

	it "is invalid without a specified character" do
		FactoryGirl.build(:paragraph, tvcharacter_id: nil).should_not be_valid
	end
end