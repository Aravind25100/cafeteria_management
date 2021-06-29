class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu_item

  def self.order_items(cart_id, order_id)
    Cart.find(cart_id).cart_items.all.each do |cart_items|
      OrderItem.create!(
        order_id: order_id,
        menu_item_id: cart_items.menu_item_id,
        menu_item_name: cart_items.menu_item_name,
        menu_item_price: cart_items.menu_item_price,
        quantity: cart_items.quantity,
      )
    end
  end
end
