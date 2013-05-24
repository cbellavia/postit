class CreateVotes < ActiveRecord::Migration
  def up
     create_table :votes do |t|
      t.integer :votable_id
      t.string :votable_type
      t.boolean :vote
      t.timestamps
    end
  end

  def down
    drop_table :votes
  end
  
end
