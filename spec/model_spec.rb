require 'model'

describe Player do
  let(:name) { double(:name) }
  subject(:player1) { described_class.new('name1') }

  it 'should save the persons name' do
    expect(player1.name).to eq 'name1'
  end

  it 'should create a new instance of the player class' do
    expect(described_class.create(player1)).to be_an_instance_of Player
  end

  it 'should return an instance of player' do
    expect(described_class.instance).to be_an_instance_of Player
  end
end
