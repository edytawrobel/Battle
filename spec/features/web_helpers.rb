def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: 'Obama'
  fill_in :player_2_name, with: 'Anna'
  click_button 'submit'
end

def players_two_turn
  sign_in_and_play
  click_button 'attack'
  click_button 'ok'
end

def player_two_loses
  sign_in_and_play
  19.times { click_button 'attack' ; click_button 'ok' }
end
