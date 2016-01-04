require 'rails_helper'

RSpec.feature "createing Books" do
  let!(:peachpit) { Fabricate(:publisher, name: "Peachpit Press") }
  let!(:author1) { Fabricate(:author) }
  let!(:author2) { Fabricate(:author) }
  let(:admin) { Fabricate(:admin)}
  before { sign_in_as admin}

  scenario "with valid inputs succeeds" do
    visit root_path

    click_link "Books", exact: true
    #print page.html
    click_link "Add New book"

    fill_in "Title", with: "Javascript"
    fill_in "Isbn", with: "213456718938"
    fill_in "book_page_count", with: 518
    fill_in "Price", with: 55.43
    fill_in "Description", with: "Leacrn Javascript the quick and easy way"
    fill_in "book_published_at", with: "2012-04-01"
    select "Peachpit Press", from: "Publisher"
    attach_file "Book cover", "app/assets/images/itext.jpg"
    check author1.full_name
    check author2.full_name

    click_button "Create Book"

    expect(page).to have_content("Book has been created")
  end
end