require 'app'

  feature 'You should see a welcome message at the top of the page' do
    scenario 'Rock, Paper, Scissors - can you win? to appear on homepage' do
      visit('/')
      expect(page).to have_content 'Rock, Paper, Scissors - can you win?'
    end
  end

  feature 'The one player option should have a text box to fill in your name' do
    scenario 'after the login statment there should be a text box' do
      sign_in_and_play_one_player
      find('form').visible?
    end
  end

    feature 'The play page should have a message to the user' do
      scenario 'The play page says: Welcome #{@name}, lets play Rock, Paper, Scissors!' do
        sign_in_and_play_one_player
        expect(page).to have_content 'Welcome name1, lets play Rock, Paper, Scissors!'
      end
    end

    feature 'The play page should have a drop down box to choose Rock, Papper or Scissors' do
      scenario 'under the message to the user there should be a drop down box' do
        sign_in_and_play_one_player
        find('form').visible?
      end
    end

    feature 'There should be a tally of how many games, wins, loses and draws' do
      scenario 'on the play page there should be a record of results' do
        sign_in_and_play_one_player
        expect(page).to have_content 'Game count: 0'
        expect(page).to have_content 'name1 wins: 0'
        expect(page).to have_content 'Computer wins: 0'
        expect(page).to have_content 'Draw count: 0'
      end
    end

    feature 'The result page should say your choice and the computers' do
      scenario 'it will say the two choices' do
        allow(RockPaperScissors).to receive_message_chain("new.move_generator").and_return("Rock")
        allow(RockPaperScissors).to receive_message_chain("new.winner").and_return("Draw!")
        sign_in_and_play_one_player
        select "Rock", from: 'move'
        click_button 'Play'
        expect(page).to have_content 'Rock vs Rock'
      end
    end

    feature 'The result page should say if it is a draw' do
      scenario 'it will say it is a draw' do
        allow(RockPaperScissors).to receive_message_chain("new.move_generator").and_return("Rock")
        allow(RockPaperScissors).to receive_message_chain("new.winner").and_return("Draw!")
        sign_in_and_play_one_player
        select "Rock", from: 'move'
        click_button 'Play'
        expect(page).to have_content 'It is a draw!'
      end
    end

    feature 'The result page should say the winner is the computer' do
      scenario 'it will say it is a win for the computer this time!' do
        allow(RockPaperScissors).to receive_message_chain("new.move_generator").and_return("Paper")
        allow(RockPaperScissors).to receive_message_chain("new.winner").and_return false
        sign_in_and_play_one_player
        select "Rock", from: 'move'
        click_button 'Play'
        expect(page).to have_content 'It is a win for the computer this time!'
      end
    end

    feature 'The result page should say the winner is the user' do
      scenario 'it will say user wins' do
        allow(RockPaperScissors).to receive_message_chain("new.move_generator").and_return("Scissors")
        allow(RockPaperScissors).to receive_message_chain("new.winner").and_return true
        sign_in_and_play_one_player
        select "Rock", from: 'move'
        click_button 'Play'
        expect(page).to have_content 'name1 wins!'
      end
    end

    feature 'it should be possible to return to the play page' do
      scenario 'the results page has a play again button' do
        sign_in_and_play_one_player
        select "Rock", from: 'move'
        click_button 'Play'
        find('form').visible?
      end
    end

    feature 'it should be possible to return to the play page' do
      scenario 'it should return to the play page when the play again button is clicked' do
        sign_in_and_play_one_player
        select "Rock", from: 'move'
        click_button 'Play'
        click_button 'Play again'
        expect(page).to have_content 'Welcome name1, lets play Rock, Paper, Scissors!'
      end
    end
