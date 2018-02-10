class CreateWriters < ActiveRecord::Migration[5.1]
  def change
    create_table :writers do |t|
      t.string :username, null: false
      t.text :bio
      t.timestamps
      t.index :username
    end
  end
end
