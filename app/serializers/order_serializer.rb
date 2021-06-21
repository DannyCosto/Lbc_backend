class OrderSerializer < ActiveModel::Serializer
  attributes :id, :checked_out, :total, :get_item_orders
  has_many :items
end
