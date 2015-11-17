require 'faker'
FactoryGirl.define do
	factory :tvcharacter do |f|
		f.name {Faker::Name.name}
	end
end