class Station
  attr_reader :name, :address, :city, :state, :zip, :fuel_type, :distance, :access_times
  def initialize(station_info)
    @name = station_info[:station_name]
    @address = station_info[:street_address]
    @city = station_info[:city]
    @state = station_info[:state]
    @zip = station_info[:zip]
    @fuel_type = station_info[:fuel_type_code]
    @distance = station_info[:distance]
    @access_times = station_info[:access_days_time]
  end
end
