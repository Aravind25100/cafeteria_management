class Cart < ActiveRecord::Base
  has_many :cart_items
  belongs_to :user

  def self.cart_details(id)
    cart = Cart.find_by(user_id: id)
    if cart
      cart.cart_items
    else
      nil
    end
  end
end
