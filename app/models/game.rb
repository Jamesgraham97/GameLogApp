class Game < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :platform, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, allow_nil: true
end
