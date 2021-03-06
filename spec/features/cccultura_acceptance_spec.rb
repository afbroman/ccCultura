require 'spec_helper'

feature 'Adding a museum' do

  background do
    Region.create(name: 'Shrewsbury')
    Region.create(name: 'Madison')
    User.create(
      email: 'user@example.com',
      password: 'foobar'
    )
  end

  def login
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'foobar'
    click_button 'Sign in'

    page.should have_content("Logged in as user@example.com")
  end

  def visit_museums
    visit root_path
    page.should have_content "Welcome to CCCultura"

    click_on "Museums"
  end
  
  scenario 'valid' do
    visit_museums
    click_on "Add Museum"
    login
    fill_in "Title", with: "National Museum"
    select "Madison", from: "Region"
    fill_in "Address", with: "123 Main St."
    fill_in "Description", with: "Aenean lacinia bibendum nulla sed consectetur."
    click_on "Create Museum"
    page.should have_content("Museum Created")
    page.should have_content("National Museum")
    visit_museums
    page.should have_content("National Museum")
  end

  scenario 'invalid' do
    visit_museums
    click_on "Add Museum"
    login
    fill_in "Title", with: ""
    select "Shrewsbury", from: "Region"
    fill_in "Address", with: "123 Main St."
    fill_in "Description", with: "Aenean lacinia bibendum nulla sed consectetur."
    click_on "Create Museum"
    page.should have_content("Error Creating Museum")
    Museum.all.should be_empty
  end

end

feature "Searching"  do
  
  scenario 'for an existing museum' do

    Museum.create(title: "National Museum")
    Museum.create(title: "Another National Museum")
    Museum.create(title: "Sao Paulo Museo")
    
    visit root_path
    fill_in "s", with: "National"
    click_on "Submit"

    page.should have_content("National Museum")
    page.should have_content("Another National Museum")
    page.should have_no_content("Sao Paulo Museo")

  end
end

feature "Showing" do

  scenario 'an existing museum' do

    Museum.create(title: "National Museum", description: "Beautiful museum in the heart of the city")

    visit root_path
    click_on "Museums"
    click_on "National Museum"
    page.should have_content("National Museum")
    page.should have_content("in the heart of the city")
  end

end

feature "Display static" do

  scenario "about page" do
    visit root_path
    click_on "About"
    page.should have_content("Welcome to ccCultura")
  end

  scenario "follow page" do
    visit root_path
    click_on "Follow"
    page.should have_content("Follow ccCultura")
  end
end