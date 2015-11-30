class Info < ActiveRecord::Base
  mount_uploader :info_img, InfoImgUploader

  validates :title, uniqueness: true
  validates :title, :description, presence: true
end
