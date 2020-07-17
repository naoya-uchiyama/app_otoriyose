class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_many :review_images, dependent: :destroy
  accepts_nested_attributes_for :review_images, allow_destroy: true
  has_many :comments, dependent: :destroy

  validates_associated :review_images

  validates :title, :content, presence: true
end
