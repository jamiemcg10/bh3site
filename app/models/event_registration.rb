class EventRegistration < ActiveRecord::Base
  HAB_PRICE = 15

  validates :contact_email, :hash_name, :nerd_name, :kennel, :payment_email, presence: true

  belongs_to :special_event

  after_initialize :set_defaults, if: :new_record?

  private

  def set_defaults
    self.extra_hab         ||= nil
    self.extra_hab_size    ||= nil
    self.registration_date ||= Date.current
    self.paid              ||= false
  end
end
