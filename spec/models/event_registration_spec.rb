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

  describe ".rego_price" do
    after { travel_back }

    context "date is before first tier rego date" do
      before { travel_to EventRegistration::FIRST_TIER_DATE - 1.day }

      it "sets price at the first tier" do
        expect(EventRegistration.rego_price).to eq EventRegistration::FIRST_TIER_PRICE
      end
    end

    context "date is between first and second tier rego dates" do
      before { travel_to EventRegistration::SECOND_TIER_DATE - 1.day }

      it "sets the price at the second tier" do
        expect(EventRegistration.rego_price).to eq EventRegistration::SECOND_TIER_PRICE
      end
    end

    context "date is after second tier rego date" do
      before { travel_to EventRegistration::SECOND_TIER_DATE + 1.day }

      it "sets the price at the default tier" do
        expect(EventRegistration.rego_price).to eq EventRegistration::DEFAULT_PRICE
      end
    end
  end
end
