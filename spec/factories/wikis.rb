require 'faker'

FactoryBot.define do
  factory :wiki do
    title Faker::HitchhikersGuideToTheGalaxy.marvin_quote
    body  Faker::Lorem.paragraph
    private false
    user 
  end
end
