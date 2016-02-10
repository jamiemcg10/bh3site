require "rails_helper"

describe SpecialEvent do
  it { should validate_presence_of :name }
  it { should validate_presence_of :date }
  it { should validate_presence_of :url_code }
  it { should have_many :event_registrations }
end
