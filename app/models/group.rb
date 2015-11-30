class Group < ActiveRecord::Base
  has_many :products

  validates :title, uniqueness: true
  validates :title, presence: true
end
