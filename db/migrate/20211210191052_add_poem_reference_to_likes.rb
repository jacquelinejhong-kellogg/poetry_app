class AddPoemReferenceToLikes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :likes, :poems
    add_index :likes, :poem_id
    change_column_null :likes, :poem_id, false
  end
end
