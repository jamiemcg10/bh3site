class HashEvent < ActiveRecord::Base
  geocoded_by :location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
end
