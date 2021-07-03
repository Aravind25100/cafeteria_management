class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :order

  def self.all_invoices(user_id)
    user = User.find(user_id)
    if user.role == "owner" || user.role == "clerk"
      all
    else
      user.invoices.all
    end
  end

  def self.pending_order(user_id, status)
    user_role = User.find(user_id).role
    (user_role == "owner" || user_role == "clerk") && status == "pending"
  end

  def self.status_wise(status)
    if status == "all"
      Invoice.all
    else
      all.where(delivery_status: status)
    end
  end
end
