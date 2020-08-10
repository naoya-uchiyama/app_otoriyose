class Item < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :itemcode, :user_id, presence: true

end
