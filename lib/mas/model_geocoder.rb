module ModelGeocoder
  def self.geocode(geocodable)
    Geocoder.coordinates(geocodable.full_street_address)
  end

  def self.geocode!(geocodable)
    coordinates = geocode(geocodable)
    geocodable.geocode!(coordinates)
    coordinates.present?
  end
end
