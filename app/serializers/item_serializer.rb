class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :img, :description

end
