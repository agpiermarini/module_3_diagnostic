require 'rails_helper'

describe Station do
  subject { Station.new({}) }
  it 'initializes with station info hash' do
    expect(subject).to be_a Station
  end
end
