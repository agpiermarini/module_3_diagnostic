class StationSearch
  def initialize(zip, api_key)
    @zip = zip
    @api_key = api_key
  end

  def stations
    station_info = JSON.parse(response.body, symbolize_names: true)

    station_info[:fuel_stations].map do | station_hash |
      Station.new(station_hash)
    end
  end

  private
    attr_reader :zip, :api_key
    def connection
      Faraday.new "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{zip}&radius=6&fuel_type=ELEC,LPG&limit=10"
    end

    def response
      connection.get do |req|
        req.headers["X-API-KEY"] = api_key
      end
    end
end
