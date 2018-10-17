class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.integer :category_id
      t.string :picture
      t.integer :status
      t.integer :price

      t.timestamps
    end
  end
end
