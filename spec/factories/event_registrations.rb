FactoryGirl.define do
  factory :event_registration do
    contact_email "hasher@onon.com"
    payment_email "hasher@onon.com"
    hash_name "Hasher"
    nerd_name "Matt"
    kennel "H3"
    special_event
  end
end
