class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :point, default: 0
      t.string :content, false

      t.timestamps
    end
  end
end
