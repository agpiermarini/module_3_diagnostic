class NrelStationService
  def initialize(zip, api_key)
    @zip = zip
    @api_key = api_key
  end

  def stations
    JSON.parse(response.body, symbolize_names: true)
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
