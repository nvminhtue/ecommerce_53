class Suggestion < ApplicationRecord
  validates :user_id, presence: true
end
