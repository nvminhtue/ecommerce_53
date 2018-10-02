module ProductsHelper
  def children_categories parent_id
    Category.children_category(parent_id)
  end

  def image_for product
    image_tag product.picture.url
  end
end
