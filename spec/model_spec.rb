require 'model'

describe Player do
  it 'should save the persons name' do
    player1 = described_class.new('name1')
    expect(player1.name).to eq 'name1'
  end

end
