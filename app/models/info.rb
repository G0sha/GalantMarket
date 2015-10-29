class Info < ActiveRecord::Base
  mount_uploader :info_img, InfoImgUploader
end
