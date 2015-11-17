require 'faker'

FactoryGirl.define do
	factory :quote do |f|
		f.character_quote {Faker::Lorem.sentence}
	end
end

