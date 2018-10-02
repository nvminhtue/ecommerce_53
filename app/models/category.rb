class Category < ApplicationRecord
  has_many :products
  belongs_to :suggestion, optional: true
  validates :name, uniqueness: true
  scope :parent_category, -> {where parent_id: nil}
  scope :children_category, -> id {where parent_id: id}
  scope :sort_alphabet_az, ->{order "name"}
  scope :by_id, -> id {where(id: id).first}
  scope :by_name, -> name {where name: name}
  scope :select_col, ->{attribute_names}
end
