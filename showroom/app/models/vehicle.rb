class Vehicle < ActiveRecord::Base
  attr_accessible :colour,:description,:image,:make,:miles,:model,:owners,:price,:reg
  mount_uploader :image, ImageUploader
end
