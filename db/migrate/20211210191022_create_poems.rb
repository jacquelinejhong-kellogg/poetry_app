class CreatePoems < ActiveRecord::Migration[6.0]
  def change
    create_table :poems do |t|
      t.string :title
      t.string :body
      t.integer :author_id
      t.datetime :date
      t.string :commentary

      t.timestamps
    end
  end
end
