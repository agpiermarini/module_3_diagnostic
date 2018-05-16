require 'rails_helper'

describe StationSearch do
  subject { StationSearch.new("80203", ENV["nrel_api_key"]) }
  context 'initialize' do
    it 'exists with attributes' do
      expect(subject).to be_a StationSearch
    end
  end

  context 'instance methods' do
    skip '#stations' do
      VCR.use_cassette('service-search') do
        expect(subject.stations).to be_an Array
        expect(subject.repos.first).to be_a Station
      end
    end
  end
end
