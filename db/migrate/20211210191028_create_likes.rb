class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :poem_id
      t.integer :liker_id

      t.timestamps
    end
  end
end
