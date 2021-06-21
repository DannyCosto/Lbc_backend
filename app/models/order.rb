class Order < ApplicationRecord
  belongs_to :user
  
  has_many :item_orders
  has_many :items, through: :item_orders

  def total
    score = 0
    self.items.each do |item|
      counter = self.item_orders.where(item_id: item.id).first.counter
      score = score + item.price * counter
    end
    score
  end

  def get_item_orders
    self.item_orders
  end

  def checkout
  end
  

end
