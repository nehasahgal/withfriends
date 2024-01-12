class CreateFriendrequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friendrequests do |t|
      t.integer :recipient_id
      t.integer :sender_id

      t.timestamps
    end
  end
end
