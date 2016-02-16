require "rails_helper"

describe PayController do
  let(:event) { SpecialEvent.create(name: "Awesome Hash", date: 1.week.from_now.to_date, url_code: "awesome_event") }
  let(:rego) { EventRegistration.create(special_event: event, contact_email: "user@example.com", hash_name: "Test Hasher", nerd_name: "Nerd Name", kennel: "H3", payment_email: "user@example.com", rego_price: price, paid: false) }
  let(:price) { "25.00" }
  let(:return_url) { "http://localhost:3000/paypal/success/#{event.url_code}" }

	describe "GET #index" do
    before { get :index, price: price, event_name: event.url_code, rego_id: rego.id.to_s, return_url: return_url }

		it "responds successfully with a paypal redirect" do
      expect(response.status).to eq 302
    end

    it "passes the correct params to paypal" do
      ppurl = response["Location"]
      query = Rack::Utils.parse_query URI(ppurl).query

      expect(response.status).to eq 302
      expect(query["amount"]).to eq price
      expect(query["item_name"]).to eq event.url_code
      expect(query["item_number"]).to eq rego.id.to_s
      expect(query["return"]).to eq return_url
    end
  end

  describe "POST #catch" do
    let(:payment_status) { "Completed" }

    before { post :catch, payer_email: rego.payment_email, txn_id: 1, mc_gross: price, item_name: event.url_code, item_number: rego.id, payment_status: payment_status }

    it "updates the payment status of the rego" do
      expect(rego.paid).to be true
    end
  end
end
