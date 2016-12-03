FactoryGirl.define do
  factory :special_event do
    name "Hash Event"
    date 1.month.from_now
    url_code "hash_event"
  end
end
