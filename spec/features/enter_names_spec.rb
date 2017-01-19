require "spec_helper"

# RSpec.feature "Widget management", :type => :feature do

feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content('Obama vs. Anna')
  end
end

feature "See how close I am to winning" do
  scenario "by seeing opponent's hit points" do
    sign_in_and_play
    expect(page).to have_content('Anna has 100 hit points.')
  end
end

feature "see how close I am to losing" do
  scenario "by seeing my own hit points" do
    sign_in_and_play
    expect(page).to have_content('Obama has 100 hit points')
  end
end
