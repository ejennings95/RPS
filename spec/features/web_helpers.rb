def sign_in_and_play
  visit('/')
  fill_in 'name', with: 'name1'
  click_button 'Login'
end
