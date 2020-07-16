class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,            null: false
      t.text       :discription,     null: false
      t.integer    :price,           null: false
      t.text       :imageurl,        null: false
      t.text       :itemurl,         null: false
      t.references :user,     foreign_key: true
      t.timestamps
    end
  end
end
