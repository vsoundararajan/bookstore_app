require 'rails_helper'

RSpec.feature "Search for Books" do
  let!(:iText) { Fabricate(:book, title: "iText in Action") }
  let!(:railsway) { Fabricate(:book, title: "The Rails 4 Way") }


  scenario "with existing titles returns all those books" do
    visit root_path

    fill_in "search_word", with: "Action"
    click_button "Search"

    expect(page).to have_link(iText.title)
    expect(page).not_to have_content(railsway.title)
    expect(current_path).to eq(search_catalogs_path)
  end


end