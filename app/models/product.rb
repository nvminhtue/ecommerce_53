class Product < ApplicationRecord
  VALID_MONEY_REGEX = /d*(\.d{1,2})?/

  has_many :ratings, dependent: :destroy
  has_many :users, through: :ratings
  has_many :detail_orders, dependent: :destroy
  belongs_to :category
  mount_uploader :picture, PictureUploader

  validates :name, presence: true, uniqueness: true,
    length: {maximum: Settings.product.name._max}
  validates :description, presence: true,
    length: {maximum: Settings.product.description._max}
  validates :category, presence: true
  validates :price, presence: true, format: {with: VALID_MONEY_REGEX}
  validates :rate, presence: true

  scope :hot_trend, -> do
    joins(:detail_orders)
    .group("detail_orders.product_id")
    .order("count(detail_orders.product_id) DESC")
    .limit(12)
  end
  scope :sort_alphabet_az, ->{order "name"}
  scope :sort_alphabet_za, ->{order "name desc"}
  scope :sort_price, ->{order "price desc"}
  scope :sort_rating, -> do
    left_joins(:ratings)
    .group("products.id")
    .order("(sum(ratings.rating)/count(products.id)) desc")
  end
  scope :sort_category, -> category_id {where category_id: category_id}
  scope :sort_category_children, -> categories_id do
    where("category_id IN (?)", categories_id)
  end
  scope :sort_product_updated, ->{order("created_at desc").limit(12)}
  scope :recently_products, -> list {where "id in (?)", list}
  scope :select_col, ->{attribute_names}

  def self.import_file file
    spreadsheet = Roo::Spreadsheet.open file
    header = spreadsheet.row 1
    orders = []
    (2..spreadsheet.last_row).each do |i|
      row = [header, spreadsheet.row(i)].transpose.to_h
      order = new row
      orders << order
    end
    import! orders
  end
end
