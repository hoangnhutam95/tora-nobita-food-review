class Review < ApplicationRecord
    belongs_to :user
    belongs_to :food
    before_save :default_point
    validates :user_id, presence: true
    validates :food_id, presence: true
    validates :content, length: {maximum: 1000}
    validates :point,numericality: { only_integer: true, greater_than: 0,less_than: 6 }
    private
        def default_point
          self.point ||= 0
        end
end
