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

  describe RockPaperScissors do
    let(:Rock) { double(:Rock) }
    let(:Paper) { double(:Paper) }
    let(:Scissors) { double(:Scissors) }

    it 'should return a string of either Rock, Paper or Scissors' do
      expect(subject).to receive(:move_generator)
      subject.move_generator
    end

    it 'should return a value from the array' do
      srand(3)
      expect(subject.move_generator).to eq "Scissors"
    end

    it 'should return draw if the players pick the name move' do
      expect(subject.winner(:Rock, :Rock)).to eq "Draw!"
    end

    it 'should return true if the player beats the computer' do
      expect(subject.winner(:Scissors, :Paper)).to eq true
    end

    it 'should return false if the computer beats the player' do
      expect(subject.winner(:Rock, :Paper)).to eq false
    end
end
