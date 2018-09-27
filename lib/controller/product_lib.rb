module ProductLib
  def star_on ratings
    length = ratings.count
    sum = 0

    ratings.each do |product|
      sum += product.rating.to_i
    end

    return 0 if sum.zero?
    (sum / length).round
  end

  def user_star_on user
    if user.nil?
      return 0
    else
      return user.rating
    end
  end

  def categories_option
    return Category.sort_alphabet_az
  end

  def children_id category_id
    array_id = []
    @parent = Category.find_by(id: category_id)
    array_id << @parent.id

    i = 0
    while i < Category.count
      @products = Category.where("parent_id IN (?)",array_id)

      @products.each do |p|
        unless array_id.include?(p.id)
          array_id << p.id
        end
      end

      i = i + 1
    end

    return array_id
  end

  def sort_style category_id, type_sort
    page_row = Settings.paginate_for.sort_page

    if category_id == "-- Categories --"
      case type_sort
      when "A-Z"
        products = Product.sort_alphabet_az
          .paginate(:page => params[:page], :per_page => page_row)
      when "Z-A"
        products = Product.sort_alphabet_za
          .paginate(:page => params[:page], :per_page => page_row)
      when "Price"
        products = Product.sort_price
          .paginate(:page => params[:page], :per_page => page_row)
      when "Rating"
        products = Product.sort_rating
          .paginate(:page => params[:page], :per_page => page_row)
      else
        products = Product.sort_alphabet_az
          .paginate(:page => params[:page], :per_page => page_row)
      end
    else
      list_id = children_id category_id

      case type_sort
      when "A-Z"
        products = Product.sort_category_children(list_id).sort_alphabet_az
          .paginate(:page => params[:page], :per_page => page_row)
      when "Z-A"
        products = Product.sort_category_children(list_id).sort_alphabet_za
          .paginate(:page => params[:page], :per_page => page_row)
      when "Price"
        products = Product.sort_category_children(list_id).sort_price
          .paginate(:page => params[:page], :per_page => page_row)
      when "Rating"
        products = Product.sort_category_children(list_id).sort_rating
          .paginate(:page => params[:page], :per_page => page_row)
      else
        products = Product.sort_category_children(list_id).sort_alphabet_az
          .paginate(:page => params[:page], :per_page => page_row)
      end
    end

    products
  end
end
