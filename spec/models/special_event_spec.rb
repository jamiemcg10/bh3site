require "rails_helper"
include ActiveSupport::Testing::TimeHelpers

describe SpecialEvent do
  it { should validate_presence_of :name }
  it { should validate_presence_of :date }
  it { should validate_presence_of :url_code }
  it { should have_many :event_registrations }

  describe "#rego_price" do
    subject(:event) { SpecialEvent.create(name: "Awesome Event", date: Date.parse("2016-05-01"), url_code: "awesome_event", tiered_rego_prices: prices, tiered_rego_dates: dates, full_rego_price: full_price) }
    let(:full_price) { 99 }
    let(:prices) { [69, 79, 89] }
    let(:earliest_date) { Date.parse("2016-02-01") }
    let(:middle_date) { Date.parse("2016-03-01") }
    let(:latest_date) { Date.parse("2016-04-01") }
    let(:dates) { [earliest_date, middle_date, latest_date] }

    after { travel_back }

    context "current date is before earliest tiered date" do
      before { travel_to earliest_date - 1.day }

      it "sets the first tier rego price" do
        expect(event.rego_price).to eq prices.first
      end
    end

    context "current date is between earliest and middle tiered date" do
      before { travel_to middle_date - 1.day }

      it "sets the first tier rego price" do
        expect(event.rego_price).to eq prices[1]
      end
    end

    context "current date is between earliest and middle tiered date" do
      before { travel_to latest_date - 1.day }

      it "sets the first tier rego price" do
        expect(event.rego_price).to eq prices.last
      end
    end

    context "date is after latest tiered date" do
      before { travel_to latest_date + 1.day }

      it "sets the full rego price" do
        expect(event.rego_price).to eq full_price
      end
    end

    context "date is the first tiered date" do
      before { travel_to earliest_date }

      it "sets rego price at the first tier" do
        expect(event.rego_price).to eq prices.first
      end
    end
  end
end
