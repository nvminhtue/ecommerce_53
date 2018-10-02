module RecentViewsHelper
  def init_resentlies
    session[:recently] ||= []
  end

  def add_resently id
    return if id.nil?

    if session[:recently].size >= Settings.recently_products._max
      remove_resently session[:recently].last
    end

    if session[:recently].index(id).nil?
      session[:recently] << id;
    end
  end

  def remove_resently id
    session[:recently].delete(id)
  end

  def load_recently
    @recently_products = Product.recently_products session[:recently]
  end
end
