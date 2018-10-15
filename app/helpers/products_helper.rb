module ProductsHelper
  def children_categories parent_id
    Category.children_category(parent_id)
  end

  def image_for product
    image_tag product.picture.url
  end

  # def nested_categories category
  #   category.map do |parent|
  #     # if parent.children.nil?
  #     #   content_tag(:div, parent.name)
  #     # else
  #     parent.name + content_tag(:div, nested_categories(parent.children))+ "---"
  #     # content_tag(:div, parent.name) + content_tag(:div, nested_categories(parent.children))
  #   end
  # end
end
