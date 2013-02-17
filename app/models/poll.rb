class Poll < ActiveRecord::Base
  has_many :items, dependent: :destroy, inverse_of: :poll
  has_many :votes, through: :items

  accepts_nested_attributes_for :items, allow_destroy: true
  attr_accessible :question, :items_attributes

  validates :question, presence: true
  validate :number_of_items

  def number_of_items
    errors.add(:base, 'Must have at least 2 items') if items.size < 2
    errors.add(:base, 'Cannot have more than 5 items') if items.size > 5
  end

  def voted_on_from?(ip_address)
    not votes.where(ip_address: ip_address).empty?
  end
end
