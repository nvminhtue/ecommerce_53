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
end
