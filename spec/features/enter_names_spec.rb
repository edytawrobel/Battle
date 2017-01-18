require "spec_helper"

# RSpec.feature "Widget management", :type => :feature do

feature 'Enter names' do
  scenario 'submitting names' do
    visit('/')
    fill_in :player_1_name, with: 'Obama'
    fill_in :player_2_name, with: 'Anna'
    click_button 'submit'
    expect(page).to have_content('Obama vs. Anna')
  end
end
