class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.bigint :cart_id
      t.integer :menu_item_id
      t.string :menu_item_name
      t.float :menu_item_price

      t.timestamps
    end
  end
end