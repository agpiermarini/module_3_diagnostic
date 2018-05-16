class SearchController < ApplicationController
  def index
    @stations = StationSearch.new(params[:q], ENV["nrel_api_key"]).stations
  end
end
