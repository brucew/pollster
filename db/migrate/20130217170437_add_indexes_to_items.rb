class AddIndexesToItems < ActiveRecord::Migration
  def change
    add_index :items, :poll_id
  end
end
