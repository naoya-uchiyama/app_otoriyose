class Item < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy


  with_options presence: true do
    validates :name
    validates :discription
    validates :price
    validates :imageurl
    validates :itemurl
    validates :user_id
   
  end
end
