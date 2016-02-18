class SpecialEvent < ActiveRecord::Base
  validates :name, :date, :url_code, presence: true

  serialize :tiered_rego_prices, JSON
  serialize :tiered_rego_dates

  has_many :event_registrations

  def rego_price
    prices = tiered_rego_prices.sort
    dates = tiered_rego_dates.sort

    prices.find.with_index { |_,i| Date.current < dates[i] } || full_rego_price
  end
end
