class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :title, uniqueness: true
  validates :title, :description, :price, :subprice,
    presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :subprice, numericality: {greater_than_or_equal_to: 0.01}

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  def self.latest
    Product.order(:updated_at).last
  end

  private
  # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'существуют товарные позиции')
      return false
    end
  end
end
