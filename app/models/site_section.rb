class SiteSection < ActiveRecord::Base
  validates :tag, presence: true
  validates :value, presence: true
  validates :data_type, presence: true
  
  validates :data_type, inclusion: { in: %w(text html markdown),
    message: "%{value} is not a valid data_type" }
  
end
