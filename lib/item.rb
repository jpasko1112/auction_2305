class Item
  attr_reader :name,
              :bids

  def initialize(name)
    @name = name 
    @bids = Hash.new
  end

  def add_bid(bidder, bid)
    if @bids[bidder] == nil
        @bids[bidder] = bid
    end
  end

  def current_high_bid
    @bids.values.max()
  end
end