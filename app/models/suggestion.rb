class Suggestion < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :user_id, presence: true
  mount_uploader :picture, PictureUploader
  scope :select_col, ->{attribute_names}
  scope :pending_count, -> {where(status: "Pending").size}
  scope :of_manager, -> {includes(:user).includes(:category)}
  scope :new_suggestion, -> {where(status: "Pending")}

  enum status: {Deleted: -1, Pending: 0 , UnderConsideration: 1, Implemented: 2}
end
