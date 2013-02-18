class Vote < ActiveRecord::Base
  belongs_to :item, inverse_of: :votes
  has_one :poll, through: :item

  attr_accessible :item_id

  validates :item, presence: true
  validates :ip_address, presence: true
  validate :unique_ip_address_per_poll

  def unique_ip_address_per_poll
      errors.add(:ip_address, 'has already voted on this poll') if item and item.poll.voted_on_from?(ip_address)
  end
end
