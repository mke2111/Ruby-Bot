require_relative '../lib/karen'

describe Karen do
  context '#more' do
    let(:jokes) { Karen.new }
    it 'Is a random string' do
      expect(jokes.more.class).to eql(String)
    end

    it 'random number not given' do
      expect(@random_joke).to be_nil
    end
  end
end
