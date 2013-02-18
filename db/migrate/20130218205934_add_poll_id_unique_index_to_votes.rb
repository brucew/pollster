class AddPollIdUniqueIndexToVotes < ActiveRecord::Migration
  def up
    change_table :votes do |t|
      t.references :poll
    end

    Vote.all do |vote|
      vote.poll_id = vote.item.poll_id
      vote.save
    end

    add_index :votes, [:poll_id, :ip_address], :unique => true
  end

  def down
    change_table :votes do |t|
      t.remove_index :poll_id
      t.remove :poll
    end
  end

end
