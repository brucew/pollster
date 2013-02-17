class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :poll_id
      t.string :answer

      t.timestamps
    end
  end
end
