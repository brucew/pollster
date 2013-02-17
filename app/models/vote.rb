class Vote < ActiveRecord::Base
  belongs_to :item

  attr_accessible :ip_address

  validates :ip_address, presence: true
end
