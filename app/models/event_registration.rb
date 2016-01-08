class EventRegistration < ActiveRecord::Base
  FOOD_OPTIONS = ["Carnivore", "Vegetarian"]
  SHIRT_SIZES = ["S", "M", "L", "XL"]
  HAB_PRICE = 15

  validates :contact_email, :hash_name, :nerd_name, :kennel, :payment_email, presence: true

  belongs_to :special_event

  after_initialize :set_defaults, if: :new_record?

  def self.rego_price
    if Date.current < Date.parse("2016-02-10")
      69
    elsif Date.current < Date.parse("2016-04-01")
      79
    else
      89
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
