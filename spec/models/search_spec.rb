# En spec/models/search_spec.rb
RSpec.describe Search, type: :model do
  it { is_expected.to validate_presence_of(:query) }
  it { is_expected.to validate_presence_of(:ip_address) }

  it 'requires at least two spaces and three words in the query' do
    should = Search.new(query: 'Valid search with three words', ip_address: '127.0.0.1')
    expect(should).to be_valid
  end

  it 'rejects searches with less than two spaces in the query' do
    should_not = Search.new(query: 'Invalid search', ip_address: '127.0.0.1')
    expect(should_not).not_to be_valid
    expect(should_not.errors[:query]).to include('Please make a valid search')
  end

  it 'validates that the length of :query is at least 7' do
    should_not = Search.new(query: 'Invalid', ip_address: '127.0.0.1')
    expect(should_not).not_to be_valid
    expect(should_not.errors[:query]).to include('Please make a valid search')
  end
end
