module CartItemHelper
  def cartItems
    Cart.cart_details(@current_user.id)
  end

  def cartItem_ids
    items = cartItems
    if items
      cartItems.map { |item| item.menu_item_id }
    else
      nil
    end
  end

  def total_amount
    cartItems.map { |item| item.quantity * item.menu_item_price }.sum
  end
end
