class EventRegistration < ApplicationRecord
  validates :contact_email, :hash_name, :nerd_name, :kennel, :payment_email, presence: true

  enum status: [:active, :deleted]

  belongs_to :special_event

  after_initialize :set_defaults, if: :new_record?

  scope :for_event, -> (event) { where(special_event: event) }

  private

  def set_defaults
    self.extra_hab         ||= nil
    self.extra_hab_size    ||= nil
    self.registration_date ||= Date.current
    self.paid              ||= false
  end
end
