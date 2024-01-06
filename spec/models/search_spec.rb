# En spec/models/search_spec.rb
RSpec.describe Search, type: :model do
  it { is_expected.to validate_presence_of(:query) }
  it { is_expected.to belong_to(:user) }

  it 'requires at least two spaces and three words in the query' do
    user = User.create(ip_address: '127.0.0.1')
    should = Search.new(query: 'Valid search with three words', user: user)
    expect(should).to be_valid
  end

  it 'rejects searches with less than two spaces in the query' do
    user = User.create(ip_address: '127.0.0.1')
    should_not = Search.new(query: 'Invalid search', user: user)
    expect(should_not).not_to be_valid
    expect(should_not.errors[:query]).to include('Please make a valid search')
  end

  it 'validates that the length of :query is at least 7' do
    user = User.create(ip_address: '127.0.0.1')
    should_not = Search.new(query: 'Invalid', user: user)
    expect(should_not).not_to be_valid
    expect(should_not.errors[:query]).to include('Please make a valid search')
  end
end
