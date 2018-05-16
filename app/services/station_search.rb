class StationSearch
  def initialize(zip, api_key)
    @zip = zip
    @api_key = api_key
  end

  def stations
    station_info[:fuel_stations].map do | station_hash |
      Station.new(station_hash)
    end
  end

  private
    attr_reader :zip, :api_key
    def station_info
      NrelStationService.new(zip, api_key).stations
    end
end
