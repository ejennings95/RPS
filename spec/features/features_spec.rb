feature 'You should see a welcome message at the top of the page' do
  scenario 'Rock, Paper, Scissors - can you win? to appear on homepage' do
    visit('/')
    expect(page).to have_content 'Rock, Paper, Scissors - can you win?'
  end
end

feature 'The homepage asks for your name' do
  scenario 'the homepage will ask for your name to log in' do
    visit('/')
    expect(page).to have_content 'To login enter your name:'
  end
end
