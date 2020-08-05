class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  
  validates :title, :content, :user_id, :item_id, presence: true
  mount_uploader :image, ImageUploader
end
