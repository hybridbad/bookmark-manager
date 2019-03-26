require 'bookmarks'

describe Bookmarks do

  subject(:list) { described_class }

  describe '#display_list' do
    it 'Should return list of bookmarks' do
      expect(list.display_all).to eq([
        "http://makers.tech",
        "http://www.google.com", 
        "http://www.twitter.com"
      ])
    end
  end

end
