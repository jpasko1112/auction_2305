require 'spec_helper'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@item1).to be_a(Item)
    end

    it 'has a name' do
      expect(@item1.name).to eq('Chalkware Piggy Bank')
    end
  end

  describe '#bids' do
    it 'starts as a empty hash' do
      expect(@item1.bids).to eq({})
    end

    it 'can add_bid' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.bids).to eq({
                                @attendee2 => 20,
                                @attendee1 => 22
                                })
    end
  end

  describe '#current_high_bid' do
    it 'returns the highest bid' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.current_high_bid).to eq(22)
    end
  end
end