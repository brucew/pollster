class AddIndexesToVotes < ActiveRecord::Migration
  def change
    add_index :votes, :item_id
    add_index :votes, [:item_id, :ip_address]
  end
end
