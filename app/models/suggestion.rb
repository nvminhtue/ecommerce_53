class Suggestion < ApplicationRecord
  validates :user_id, presence: true
  mount_uploader :picture, PictureUploader
  scope :select_col, ->{attribute_names}
end
