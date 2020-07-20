class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  
  validates :title, :content, presence: true
  mount_uploader :image, ImageUploader
end
