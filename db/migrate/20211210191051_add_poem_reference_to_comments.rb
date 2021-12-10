class AddPoemReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :poems
    add_index :comments, :poem_id
    change_column_null :comments, :poem_id, false
  end
end
