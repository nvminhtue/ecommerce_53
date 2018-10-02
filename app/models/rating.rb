class Rating < ApplicationRecord
  belongs_to :product
  belongs_to :user
  scope :product_rating, -> id {where product_id: id}
  scope :user_rating, -> product_id, user_id do
    where "user_id = #{user_id} and product_id = #{product_id}"
  end
end
