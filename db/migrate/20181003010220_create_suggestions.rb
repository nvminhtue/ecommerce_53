class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.integer :cartegory_id
      t.string :picture
      t.string :status
      t.integer :price

      t.timestamps
    end
  end
end
