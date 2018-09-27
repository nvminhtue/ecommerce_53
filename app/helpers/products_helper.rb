module ProductsHelper
  def image_for product
    image_tag product.picture.url
  end
end
