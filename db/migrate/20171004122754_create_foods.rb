class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.integer :price
      t.string :description
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
