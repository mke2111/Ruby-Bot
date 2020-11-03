require_relative '../lib/karen'

describe Karen do
  context '#more' do
    let(:jokes) { Karen.new }
    it 'Is a random string' do
      expect(jokes.more.class).to eql(String)
    end
  end
end
