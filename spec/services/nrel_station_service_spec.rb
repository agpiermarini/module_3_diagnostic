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
      end
    end
  end
end
