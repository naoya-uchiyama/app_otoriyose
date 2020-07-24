require 'rails_helper'

RSpec.describe Item do
  describe '#create' do
    it "name、discription、price、imageurl、itemurl、user_idがある場合登録できる" do
      create(:user)
      item = build(:item)
      expect(item).to be_valid
    end

    it "nameがない場合登録できない" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "discriptionがない場合登録できない" do
      item = build(:item, discription: nil)
      item.valid?
      expect(item.errors[:discription]).to include("can't be blank")
    end

    it "priceがない場合登録できない" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "imageurlがない場合登録できない" do
      item = build(:item, imageurl: nil)
      item.valid?
      expect(item.errors[:imageurl]).to include("can't be blank")
    end

    it "itemurlがない場合登録できない" do
      item = build(:item, itemurl: nil)
      item.valid?
      expect(item.errors[:itemurl]).to include("can't be blank")
    end

    it "user_idがない場合登録できない" do
      item = build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
    end
  end
end