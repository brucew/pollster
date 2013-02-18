class Poll < ActiveRecord::Base
  has_many :items, dependent: :destroy, inverse_of: :poll
  has_many :votes, inverse_of: :poll

  accepts_nested_attributes_for :items, allow_destroy: true
  attr_accessible :question, :items_attributes

  validates :question, presence: true
  validate :number_of_items

  MIN_ITEMS = 2
  MAX_ITEMS = 5

  def number_of_items
    errors.add(:base, "Must have at least #{MIN_ITEMS} items") if items.size < MIN_ITEMS
    errors.add(:base, "Cannot have more than #{MAX_ITEMS} items") if items.size > MAX_ITEMS
  end

  def voted_on_from?(ip_address)
    not votes.where(ip_address: ip_address).empty?
  end
end
