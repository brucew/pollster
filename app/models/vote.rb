class Vote < ActiveRecord::Base
  belongs_to :item, inverse_of: :votes
  belongs_to :poll, inverse_of: :votes

  validates :poll, presence: true
  validates :item, presence: true
  validates :ip_address, presence: true, uniqueness: { scope: :poll_id }

  def item=(item)
    self.poll = item.poll unless item.nil?
    super item
  end

  def item_id=(item_id)
    self.poll = Item.find(item_id).poll unless item_id.nil?
    super item_id
  end

end
