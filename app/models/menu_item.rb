class MenuItem < ActiveRecord::Base
  belongs_to :menu_category
  validates :name, { presence: true, uniqueness: true }
  validates :description, presence: true
  validates :price, presence: true, :numericality => { :greater_than => 0 }
end
