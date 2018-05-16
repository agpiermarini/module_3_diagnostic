require 'rails_helper'

describe 'StationSearch' do
  subject { StationSearch.new("80203", ENV["nrel_api_key"]) }
  it 'initializes with proper attributes' do
    expect(subject).to be_a StationSearch
  end

  describe 'instance methods' do
    it '#stations' do
      VCR.use_cassette('stations-objects') do
        expect(subject.stations).to be_an Array
        expect(subject.stations.first).to be_a Station
      end
    end
  end
end
