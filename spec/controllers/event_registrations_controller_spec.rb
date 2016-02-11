require "rails_helper"
include Rails.application.routes.url_helpers

describe EventRegistrationsController do
  let(:event) { SpecialEvent.create(name: "Awesome Event", date: 1.month.from_now.to_date, url_code: "awesome_event") }
  let(:price) { 69.to_f }

  before do
    allow(EventRegistration).to receive(:rego_price).and_return(price)
  end

  describe "#new" do
    before { get :new, special_event_id: event.id }

    it "returns success" do
      assert_response :success
    end

    it "returns a new event registration" do
      expect(assigns :event_registration).to be_present
    end
  end

  describe "#create" do
    let(:email) { "user@example.com" }
    let(:hash_name) { "Hash Name" }
    let(:nerd_name) { "Nerd Name" }
    let(:kennel) { "Test H3" }
    let(:food_preference) { "Carnivore" }
    let(:gluten_allergy) { false }
    let(:need_crash_space) { false }
    let(:extra_hab) { nil }
    let(:extra_hab_size) { "S" }
    let(:form_params) { { contact_email: email, hash_name: hash_name, nerd_name: nerd_name, kennel: kennel, food_preference: food_preference, gluten_allergy: gluten_allergy, need_crash_space: need_crash_space, extra_hab: extra_hab, extra_hab_size: extra_hab_size, payment_email: email } }

    before { post :create, { special_event_id: event.id, event_registration: form_params } }

    it "creates an event registration" do
      expect(EventRegistration.first).to be_present
    end

    it "redirects to PayPal" do
      expect(response).to redirect_to(controller: "pay", action: "index", price: price, event_name: event.url_code, rego_id: EventRegistration.first.id, return_url: "#{request.protocol}#{request.host_with_port}/paypal/success/#{event.url_code}")
    end

    context "required registration information is missing" do
      let(:email) { nil }

      it "does not create an event registration" do
        expect(EventRegistration.all).to be_empty
      end

      it "redirects to the registration form" do
        expect(response).to redirect_to new_special_event_event_registration_path(event)
      end

      it "displays an error message" do
        expect(flash[:failure]).to be_present
      end
    end
  end
end
