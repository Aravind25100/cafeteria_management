class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def self.cart_to_order(cart_id)
    CartItem.all.where(cart_id: cart_id)
  end
end
