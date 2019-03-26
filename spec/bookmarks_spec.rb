require 'bookmarks'


describe Bookmarks do

  subject(:list) { described_class }

  describe '#display_list' do
    it 'Should return list of bookmarks' do
      expect(list.display_all(ENV['TEST_DB'])).to eq([
        "http://makers.tech",
        "http://www.google.com", 
        "http://www.twitter.com",
        "http://www.pistonheads.com",
        "http://www.bbc.co.uk"
      ])
    end
  end

end
