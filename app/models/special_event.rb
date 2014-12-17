class SpecialEvent < ActiveRecord::Base
  validates :name, :date, :url_code, presence: true
end
