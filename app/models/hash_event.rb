# Represents a hash event, this is only used to cache the geocoded location because the google api rate limits geocode lookups
class HashEvent < ApplicationRecord
  geocoded_by :location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
end
