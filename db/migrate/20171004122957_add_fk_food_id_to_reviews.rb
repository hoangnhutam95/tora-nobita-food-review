class AddFkFoodIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :food, foreign_key: true, null: false
  end
end
