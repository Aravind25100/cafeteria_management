class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  # def self.cart_to_order(cart_id)
  #   cart_detail = Cart.find(cart_id)
  #   new_order = Order.create!(
  #     date: Date.today,
  #     user_id: cart_detail.user_id,
  #   )

  #   OrderItem.order_items(cart_id, new_order.id)
  # end
end
