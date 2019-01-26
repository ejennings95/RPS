require 'app'

feature 'You should see a welcome message at the top of the page' do
  scenario 'Rock, Paper, Scissors - can you win? to appear on homepage' do
    visit('/')
    expect(page).to have_content 'Rock, Paper, Scissors - can you win?'
  end
end

feature 'The homepage asks for your name' do
  scenario 'the homepage will ask for your name to login' do
    visit('/')
    expect(page).to have_content 'To login enter your name:'
  end
end

feature 'The homepage should have a text box to fill in your name' do
  scenario 'after the login statment there should be a text box' do
    visit('/')
    find('form').visible?
  end

  feature 'The play page should have a message to the user' do
    scenario 'The play page says: Welcome #{@name}, lets play Rock, Paper, Scissors!' do
      visit('/')
      fill_in 'name', with: 'name1'
      click_button 'Login'
      expect(page).to have_content 'Welcome name1, lets play Rock, Paper, Scissors!'
    end
  end

  feature 'The play page should have a drop down box to choose Rock, Papper or Scissors' do
    scenario 'under the message to the user there should be a drop down box' do
      visit('/')
      fill_in 'name', with: 'name1'
      click_button 'Login'
      find('form').visible?
    end
  end

  feature 'The result page should say your choice and the computers' do
    scenario 'it will say the two choices' do
      allow(RockPaperScissors).to receive_message_chain("new.move_generator").and_return("Rock")
      visit('/')
      fill_in 'name', with: 'name1'
      click_button 'Login'
      select "Rock", from: 'move'
      click_button 'Play'
      expect(page).to have_content 'Rock vs Rock'
    end
  end

  feature 'The result page should say the winner' do
    scenario 'it will say the winner is...' do
      visit('/')
      fill_in 'name', with: 'name1'
      click_button 'Login'
      select "Rock", from: 'move'
      click_button 'Play'
      expect(page).to have_content 'Winner is:'
    end
  end
end
