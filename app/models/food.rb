class Food < ApplicationRecord
    has_many :food_pictures, dependent: :destroy
    validates :name, presence: true, length: {maximum: 100}
    validates :description, presence: true
    belongs_to :store
    has_many :reviews, dependent: :destroy

end
