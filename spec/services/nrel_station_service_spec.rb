require 'rails_helper'

describe 'NrelStationService' do
  subject { NrelStationService.new("80203", ENV["nrel_api_key"]) }
  it 'initializes with proper attributes' do
    expect(subject).to be_a NrelStationService
  end

  describe 'instance methods' do
    it '#stations' do
      VCR.use_cassette("nrel-station-service") do
        expect(subject.stations).to be_a Hash
        expect(subject.stations).to have_key(:fuel_stations)

        fuel_stations = subject.stations[:fuel_stations]

        expect(fuel_stations.first).to have_key(:station_name)
        expect(fuel_stations.first).to have_key(:street_address)
        expect(fuel_stations.first).to have_key(:city)
        expect(fuel_stations.first).to have_key(:state)
        expect(fuel_stations.first).to have_key(:zip)
        expect(fuel_stations.first).to have_key(:fuel_type_code)
        expect(fuel_stations.first).to have_key(:distance)
        expect(fuel_stations.first).to have_key(:access_days_time)
      end
    end
  end
end
