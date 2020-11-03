require_relative '../lib/motivate'

describe Motivation do
  let(:one) { Motivation.new }

  describe '#random_motivation' do
    let(:random) { one.random_motivation }

    it 'returns a Hash' do
      expect(random.class).to be(Hash)
    end

    it 'returns a key and a value' do
      expect(random.length).not_to be(0)
    end
  end
end