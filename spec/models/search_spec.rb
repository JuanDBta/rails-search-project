# En spec/models/search_spec.rb
RSpec.describe Search, type: :model do
  it { is_expected.to belong_to(:user) }

  context 'validations' do
    it { is_expected.to validate_presence_of(:query) }

    it 'requires at least two spaces and three words in the query' do
      user = User.create(ip_address: '127.0.0.1')
      valid_search = Search.new(query: 'Valid search with three words', user: user)
      invalid_search = Search.new(query: 'Invalid search', user: user)

      expect(valid_search).to be_valid
      expect(invalid_search).not_to be_valid
      expect(invalid_search.errors[:query]).to include('Please make a valid search')
    end

    it 'validates that the length of :query is at least 7' do
      user = User.create(ip_address: '127.0.0.1')
      valid_search = Search.new(query: 'Valid query', user: user)
      invalid_search = Search.new(query: 'Short', user: user)

      expect(valid_search).to be_valid
      expect(invalid_search).not_to be_valid
      expect(invalid_search.errors[:query]).to include('Please make a valid search')
    end
  end
end
