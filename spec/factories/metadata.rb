# See README.md for copyright details

FactoryGirl.define do
  factory :metadatum do
    sequence(:key) { |n| "metadatum key #{n}" }
    sequence(:value) { |n| "metadatum value #{n}" }
    association :labware, strategy: :build
  end
end
