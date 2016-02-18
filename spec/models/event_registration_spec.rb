require "rails_helper"
include ActiveSupport::Testing::TimeHelpers

describe EventRegistration do
  it { should validate_presence_of :contact_email }
  it { should validate_presence_of :hash_name }
  it { should validate_presence_of :nerd_name }
  it { should validate_presence_of :kennel }
  it { should validate_presence_of :payment_email }
  it { should belong_to :special_event }

  describe "setting defaults upon creation" do
    subject(:rego) { EventRegistration.create(contact_email: "user@example.com", hash_name: "Test Hasher", nerd_name: "Nerd Name", kennel: "H3", payment_email: "user@example.com") }

    its(:extra_hab)         { should be_nil }
    its(:extra_hab_size)    { should be_nil }
    its(:registration_date) { should eq Date.current }
    its(:paid)              { should be false }
  end
end
