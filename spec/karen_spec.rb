require_relative '../lib/karen'

describe Karen do
  let(:jokes) { Karen.new }
  context '#more' do
    it 'Is a random string' do
      expect(jokes.more.class).to eql(String)
    end

    it 'random number not given' do
      expect(@random_joke).to be_nil
    end

    it 'quote not given' do
      expect(jokes.more).not_to include('I dont exist in the random_jokes.')
    end
  end
end
