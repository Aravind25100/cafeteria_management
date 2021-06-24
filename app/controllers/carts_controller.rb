class CartsController < ApplicationController
  def create
    item_name = MenuItem.find(params[:item_id]).name
    item_price = MenuItem.find(params[:item_id]).price
    user_cart = Cart.find_by(user_id: @current_user.id)

    if !user_cart
      cart = Cart.create!(date: Date.today, user_id: current_user.id)
      CartItem.create!(
        cart_id: cart.id,
        menu_item_id: params[:item_id],
        menu_item_name: item_name,
        menu_item_price: item_price,
        quantity: 1,
      )
    else
      user_cart_details = user_cart.cart_items.find_by(menu_item_id: params[:item_id])
      if user_cart_details
        user_cart_details.quantity += 1
        user_cart_details.save!
      else
        CartItem.create!(
          cart_id: user_cart.id,
          menu_item_id: params[:item_id],
          menu_item_name: item_name,
          menu_item_price: item_price,
          quantity: 1,
        )
      end
    end
    redirect_to menu_items_path
  end

  def destroy
    user_cart = Cart.find_by(user_id: @current_user.id)
    item = user_cart.cart_items.find_by(menu_item_id: params[:id])
    if item.quantity > 1
      item.quantity -= 1
      item.save!
    else
      item.destroy
    end
    redirect_to menu_items_path
  end
end
