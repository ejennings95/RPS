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

describe Game do
    let(:move) { double(:move) }
    let(:computer_move) { double(:computer_move) }
    subject(:player1) { described_class.new('move', 'computer_move') }

    it 'should save the move choice' do
      expect(player1.move).to eq 'move'
    end

    it "should save the computer's move choice" do
      expect(player1.computer_move).to eq 'computer_move'
    end

    it 'should create a new instance of the game class' do
      expect(described_class.create(player1, computer_move)).to be_an_instance_of Game
    end

    it 'should return an instance of game' do
      expect(described_class.instance).to be_an_instance_of Game
    end
  end
