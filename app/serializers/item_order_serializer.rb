class ItemOrderSerializer < ActiveModel::Serializer
  attributes :id, :item_name, :item_price, :item_img
  belongs_to :item

end
