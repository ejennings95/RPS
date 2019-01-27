def sign_in_and_play_one_player
  visit('/')
  click_button 'One player'
  fill_in 'name', with: 'name1'
  click_button 'Login'
end

def sign_in_and_play_two_player
  visit('/')
  click_button 'Two player'
  fill_in 'player_1_name', with: 'name2'
  fill_in 'player_2_name', with: 'name3'
  click_button 'Login'
end
