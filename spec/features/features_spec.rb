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
end
