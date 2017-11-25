class Food < ApplicationRecord
    has_many :food_pictures, dependent: :destroy
    validates :name, presence: true, length: {maximum: 100}
    validates :description, presence: true
    belongs_to :store
    delegate :user,to: :store
    has_many :reviews, dependent: :destroy

    def self.search name
        Food.where("name like ?", "%#{name}%")
    end
end
