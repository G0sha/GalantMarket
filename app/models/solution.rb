class Solution < ActiveRecord::Base
  mount_uploader :sol_img, ImageUploader

  has_many :line_solutions_items, dependent: :destroy

  validates :price, numericality: {greater_than_or_equal_to: 0.01}
end
