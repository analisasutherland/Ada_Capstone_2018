require "test_helper"

describe Tag do
  before do
    @tag = tags(:adventure)
  end

  describe 'Constructor' do
    it 'can be created' do
      assert @tag.valid?
    end
  end

  describe 'Relations'do
    it 'has Reviews' do
      @tag.must_respond_to :reviews
    end
  end
end
