class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :title, uniqueness: true
  validates :title, :group, :subgroup, :description, :price, :subprice,
    presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :subprice, numericality: {greater_than_or_equal_to: 0.01}
end
