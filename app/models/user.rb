class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  has_many :invoices

  validates :name, presence: true, length: { minimum: 5 }
  validates :address, presence: true, length: { minimum: 30 }
  validates :email, { presence: true, uniqueness: true }
  validates :phone_no, :presence => true, :numericality => true,
                       :length => { :minimum => 10, :maximum => 15 }

  def self.is_admin(user_id)
    user = User.find(user_id)
    user.role == "owner"
  end
end
