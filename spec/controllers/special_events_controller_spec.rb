require "rails_helper"

describe SpecialEventsController do
  let!(:past_event) { SpecialEvent.create(name: "Past Event", date: 1.week.ago.to_date, url_code: "past_event") }
  let!(:first_upcoming_event) { SpecialEvent.create(name: "Early Event", date: 1.week.from_now.to_date, url_code: "early_event") }
  let!(:second_upcoming_event) { SpecialEvent.create(name: "Late Event", date: 4.weeks.from_now.to_date, url_code: "late_event") }

  describe "#index" do
    it "returns success" do
      get :index
      assert_response :success
    end

    context "events exist that occur both before and after the current date" do

      it "displays all relevant events" do
        get :index
        expect(assigns :events).to eq [first_upcoming_event, second_upcoming_event]
      end
    end
  end

  describe "#show" do
    let(:url_code) { first_upcoming_event.url_code }

    before { get :show, :params => { :url_code => url_code } }

    it "returns success with a valid url code" do
      assert_response :success
    end

    context "an invalid url code" do
      let(:url_code) { "totally_invalid_url_code "}

      it "returns a 404" do
        assert_response 404
      end
    end
  end

  describe "#rego" do
    let(:url_code) { first_upcoming_event.url_code }

    before { get :show, :params => { :url_code => url_code }}

    it "returns success with a valid url code" do
      assert_response :success
    end

    context "an invalid url code" do
      let(:url_code) { "totally_invalid_url_code "}

      it "returns a 404" do
        assert_response 404
      end
    end
  end
end
