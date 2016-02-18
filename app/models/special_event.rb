class SpecialEvent < ActiveRecord::Base
  validates :name, :date, :url_code, presence: true

  serialize :tiered_rego_prices, Array
  serialize :tiered_rego_dates, Array

  has_many :event_registrations
end
