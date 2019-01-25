feature 'You should see a welcome message at the top of the page' do
  scenario 'Rock, Paper, Scissors - can you win? to appear on homepage' do
    visit('/')
    expect(page).to have_content 'Rock, Paper, Scissors - can you win?'
  end
end
