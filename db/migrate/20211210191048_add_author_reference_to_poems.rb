class AddAuthorReferenceToPoems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :poems, :poets, column: :author_id
    add_index :poems, :author_id
    change_column_null :poems, :author_id, false
  end
end
