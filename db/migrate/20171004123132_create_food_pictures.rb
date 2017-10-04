class CreateFoodPictures < ActiveRecord::Migration[5.0]
  def change
    create_table :food_pictures do |t|
      t.references :food, foreign_key: true, null: false
      t.string :picture, null: false

      t.timestamps
    end
  end
end
