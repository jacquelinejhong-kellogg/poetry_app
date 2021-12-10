class CreatePoets < ActiveRecord::Migration[6.0]
  def change
    create_table :poets do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :bio
      t.date :dob
      t.string :photo

      t.timestamps
    end
  end
end
