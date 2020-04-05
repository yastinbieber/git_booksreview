class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_one_attached :image
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  has_many :products
  has_many :reviews
  has_many :comments
  
  def full_profile?
    image.attached?  && nickname? && selfintroduction?
  end
    
end
