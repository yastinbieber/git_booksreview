class Product < ApplicationRecord
  
  has_one_attached :image
  
  has_many :reviews
  belongs_to :user
  has_many :comments
  
end
