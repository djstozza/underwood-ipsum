require 'faker'
FactoryGirl.define do
	factory :paragraph do |f|
		f.quotations {Random.rand(1..20)}
		f.paragraph_number {Random.rand(1..10)}
	end
end