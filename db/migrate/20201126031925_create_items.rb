class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,          null: false
      t.text       :item_info,          null: false
      t.integer    :category_id,        null: false
      t.integer    :price,              null: false
      t.integer    :condition_id,       null: false
      t.integer    :delivery_fee_id,    null: false
      t.integer    :shipped_from_id,    null: false
      t.integer    :until_shipped_id,   null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
