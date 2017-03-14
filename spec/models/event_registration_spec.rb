require "rails_helper"

describe EventRegistration do
  it { should validate_presence_of :contact_email }
  it { should validate_presence_of :hash_name }
  it { should validate_presence_of :nerd_name }
  it { should validate_presence_of :kennel }
  it { should validate_presence_of :payment_email }
  it { should belong_to :special_event }
  it { should define_enum_for :status }

  describe "setting defaults upon creation" do
    subject(:rego) { EventRegistration.create(contact_email: "user@example.com", hash_name: "Test Hasher", nerd_name: "Nerd Name", kennel: "H3", payment_email: "user@example.com") }

    its(:extra_hab)         { should be_nil }
    its(:extra_hab_size)    { should be_nil }
    its(:registration_date) { should eq Date.current }
    its(:paid)              { should be false }
  end

  describe ".for_event" do
    let(:current_event) { FactoryGirl.create :special_event }
    let(:current_event_registration) { FactoryGirl.create :event_registration, special_event: current_event }
    let(:previous_event) { FactoryGirl.create :special_event }
    let(:previous_event_registration) { FactoryGirl.create :event_registration, special_event: previous_event }
    let(:scope) { EventRegistration.for_event(current_event) }

    it 'includes the current event registration' do
      expect(scope).to include(current_event_registration)
    end

    it 'does not include the previous event registration' do
      expect(scope).not_to include(previous_event_registration)
    end
  end
end
