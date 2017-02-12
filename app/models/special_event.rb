class SpecialEvent < ActiveRecord::Base
  FOOD_OPTIONS = ["Carnivore", "Vegetarian"]
  HAB_SIZES = ["S", "M", "L", "XL"]

  validates :name, :date, :url_code, presence: true

  serialize :tiered_rego_prices, JSON
  serialize :tiered_rego_dates

  has_many :event_registrations

  def rego_price
    prices = tiered_rego_prices.sort
    dates = tiered_rego_dates.sort

    prices.find.with_index { |_,i| Date.today <= dates[i] } || full_rego_price
  end
end
