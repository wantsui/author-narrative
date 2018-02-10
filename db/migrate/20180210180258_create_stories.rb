class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :title, default: ''
      t.text :description, default: ''
      t.boolean :share_work, default: false
      t.timestamps
      t.references :writer
    end
  end
end
