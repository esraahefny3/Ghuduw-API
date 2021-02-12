class LocationDatesService

  def self.getLocationDates(latitude,longitude)
  
    return SvgMapCountry.where(latitude: latitude,longitude:longitude);
  return
  end


end
