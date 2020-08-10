class Review < ApplicationRecord
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  
  validates :title, :delicious, :eazy, :cost, :user_id, :itemcode, presence: true
  validates :delicious, :eazy, :cost, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }
  mount_uploader :image, ImageUploader
end
