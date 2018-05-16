require 'rails_helper'

feature 'User can visit root path' do
  context 'and search for fuel stations by zip code' do
    scenario 'and be directed to a page where they see the fuel stations at that zip code' do
      #as a user, visit root path
      visit "/"
      # And I fill in the search form with 80203 (Note: Use the existing search form)
      fill_in :q, with: "80203"
      # And I click "Locate"
      click_on "Locate"
      # Then I should be on page "/search"
      expect(current_path).to eq(search_path)
    end
  end
end

# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
