require 'spec_helper'

feature "Win a game by attacking opponent - Player2" do
  scenario "and get confirmation" do
    sign_in_and_play
    click_button 'attack'
    expect(page).to have_content('Obama is attacking Anna.')
  end
end


feature "Player1 loses a game of Battle by Player2 attacking" do
  scenario "and getting a confirmation" do
    players_two_turn
    click_button 'attack'
    expect(page).to have_content('Anna is attacking Obama')
  end
end

feature "Attack an opponent - Player2" do
  scenario "and reduce their hit points" do
    players_two_turn
    expect(page).not_to have_content('Anna has 100 hit points.')
    expect(page).to have_content('Anna has 90 hit points.')
  end
end


feature "switch turns" do
  scenario "after attacking" do
    players_two_turn
    expect(page).not_to have_content('Anna has 100 hit points.')
    expect(page).to have_content('Anna has 90 hit points.')
    expect(page).to have_content("It's Anna's turn!")
  end
end
