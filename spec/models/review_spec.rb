require 'rails_helper'

RSpec.describe Review do
  describe '#create' do
    it "title、content、user_id、item_idがある場合登録できる" do
      create(:user)
      create(:item)
      review = build(:review, image: nil)
      expect(review).to be_valid
    end

    it "titleがない場合登録できない" do
      review = build(:review, title: nil)
      review.valid?
      expect(review.errors[:title]).to include("can't be blank")
    end

    it "contentがない場合登録できない" do
      review = build(:review, content: nil)
      review.valid?
      expect(review.errors[:content]).to include("can't be blank")
    end

    it "user_idがない場合登録できない" do
      review = build(:review, user_id: nil)
      review.valid?
      expect(review.errors[:user_id]).to include("can't be blank")
    end

    it "item_idがない場合登録できない" do
      review = build(:review, item_id: nil)
      review.valid?
      expect(review.errors[:item_id]).to include("can't be blank")
    end
  end
end