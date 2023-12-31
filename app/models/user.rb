class User < ApplicationRecord
  has_many :games
  has_many :comments

  validates :email, presence: true
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  

end
