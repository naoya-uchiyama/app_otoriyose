class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text   :content
      t.text   :image
      t.float  :delicious, null: false, default: 0
      t.float  :eazy, null: false, default: 0
      t.float  :cost, null: false, default: 0
      t.string :itemcode, null:false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
