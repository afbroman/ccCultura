require 'spec_helper'

feature 'Adding a museum' do

  def visit_museums
    visit root_path
    page.should have_content("Welcome to CCCultura")
    click_on "Museums"
  end
  
  scenario 'Adding a museum to the system' do
    visit_museums
    click_on "Add Museum"
    fill_in "Title", with: "National Museum"
    fill_in "Address", with: "123 Main St."
    fill_in "Description", with: "Aenean lacinia bibendum nulla sed consectetur."
    click_on "Create Museum"
    page.should have_content("Museum Created")
    page.should have_content("National Museum")
    visit_museums
    page.should have_content("National Museum")
  end

  scenario 'Adding an invalid museum' do
    visit_museums
    click_on "Add Museum"
    fill_in "Title", with: ""
    fill_in "Address", with: "123 Main St."
    fill_in "Description", with: "Aenean lacinia bibendum nulla sed consectetur."
    click_on "Create Museum"
    page.should have_content("Error Creating Museum")
    Museum.all.should be_empty
  end

end