class MenuCategory < ActiveRecord::Base
  has_many :menu_items
  validates :name, { presence: true, uniqueness: true }

  def self.menu_items(id)
    if id == "all"
      all
    else
      all.where(id: id)
    end
  end
end
