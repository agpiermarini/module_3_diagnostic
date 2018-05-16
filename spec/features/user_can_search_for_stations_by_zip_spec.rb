require 'rails_helper'

feature 'User can visit root path' do
  context 'and search for fuel stations by zip code' do
    scenario 'and be directed to a page where they see the fuel stations at that zip code' do
      VCR.use_cassette("station-search-endpoint1") do

      visit "/"

      fill_in :q, with: "80203"

      click_on "Locate"

      expect(current_path).to eq(search_path)
      end
    end

    scenario 'and should see stations meeting certain criteria' do
      VCR.use_cassette("station-search-endpoint2") do
        visit "/"
        fill_in :q, with: "80203"
        click_on "Locate"

        expect(page).to have_css(".name1")
        expect(page).to have_css(".name10")

        expect(page).to have_css(".address1")
        expect(page).to have_css(".address10")

        expect(page).to have_css(".fuel-type1")
        expect(page).to have_css(".fuel-type10")

        expect(page).to have_css(".distance1")
        expect(page).to have_css(".distance10")

        expect(page).to have_css(".access-times1")
        expect(page).to have_css(".access-times10")
      end
    end
  end
end
