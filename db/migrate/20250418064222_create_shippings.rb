class CreateShippings < ActiveRecord::Migration[7.1]
  def change
    create_table :shippings do |t|
      t.string  :postal_code,    null: false
      t.integer :prefecture_id,  null: false
      t.string  :city,           null: false
      t.string  :house_number,   null: false
      t.string  :property
      t.string  :telephone,      null: false
      t.references  :buy,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
