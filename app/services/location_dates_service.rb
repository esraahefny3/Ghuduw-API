class LocationDatesService

  def self.getLocationDates(latitude,longitude)
    byebug
    return SvgMapCountry.where(latitude: latitude,longitude:longitude);
  return
  end


end
