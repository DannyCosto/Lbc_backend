class ItemOrder < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def item_name
    self.item.name
  end

  def item_price
    self.item.price
  end


  def item_img
    self.item.img
  end



end
