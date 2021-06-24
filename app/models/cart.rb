class Cart < ActiveRecord::Base
  has_many :cart_items
  belongs_to :user

  def self.cart_details(id)
    Cart.find_by(user_id: id).cart_items
  end
end
