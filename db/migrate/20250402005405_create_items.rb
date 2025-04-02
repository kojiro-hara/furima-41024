class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :product_name,         null: false
      t.text :text,                   null: false
      t.integer :category_id,         null: false, ActiveHash
      t.integer :state_id,            null: false, ActiveHash
      t.integer :burden_id,           null: false, ActiveHash
      t.integer :prefecture_id,       null: false, ActiveHash
      t.integer :days_id,             null: false, ActiveHash
      t.integer :price,               null: false 
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
