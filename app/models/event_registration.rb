class EventRegistration < ActiveRecord::Base
  FOOD_OPTIONS = ["Carnivore", "Vegetarian"]
  SHIRT_SIZES = ["S", "M", "L", "XL"]
  HAB_PRICE = 15
  FIRST_TIER_DATE = Date.parse("2016-02-10")
  SECOND_TIER_DATE = Date.parse("2016-04-01")
  FIRST_TIER_PRICE = 69
  SECOND_TIER_PRICE = 79
  DEFAULT_PRICE = 89

  validates :contact_email, :hash_name, :nerd_name, :kennel, :payment_email, presence: true

  belongs_to :special_event

  after_initialize :set_defaults, if: :new_record?

  def self.rego_price
    if Date.current < FIRST_TIER_DATE
      FIRST_TIER_PRICE
    elsif Date.current < SECOND_TIER_DATE
      SECOND_TIER_PRICE
    else
      DEFAULT_PRICE
    end
  end

  private

  def set_defaults
    self.extra_hab         ||= nil
    self.extra_hab_size    ||= nil
    self.registration_date ||= Date.current
    self.paid              ||= false
  end
end
