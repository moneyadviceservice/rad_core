require 'geocoder'

class GeocodeFirmJob < ActiveJob::Base
  def perform(firm)
    coordinates = Geocoder.coordinates(firm.full_street_address)
    firm.geocode!(coordinates)
  end
end
