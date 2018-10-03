class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  default_scope -> { order(created_at: :desc) }
end
