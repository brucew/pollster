class Poll < ActiveRecord::Base
  has_many :items
  has_many :votes, through: :items

  accepts_nested_attributes_for :items, allow_destroy: true
  attr_accessible :question, :items_attributes

  validates :question, presence: true
  validates :items, length: { in: 2..5 }

  def voted_on_from?(ip_address)
    not Vote.where(ip_address: ip_address, item_id: self.items).empty?
  end
end
