class EventRegistration < ActiveRecord::Base
  FOOD_OPTIONS = ["Carnivore", "Vegetarian"]
  SHIRT_SIZES = ["S", "M", "L", "XL"]

  belongs_to :special_event

  after_initialize :set_defaults, if: :new_record?

  private

  def set_defaults
    self.registration_date ||= Date.current
  end
end
