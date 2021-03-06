class FoodPicture < ApplicationRecord
    validates :picture, presence: true
    belongs_to :food
    mount_uploader :picture, PictureUploader
    validate :picture_size

    private

        # Validates the size of an uploaded image
        def picture_size
            if picture.size > 1.megabytes
                errors.add(:picture, "1MB未満にする必要があります")
            end
        end

end
