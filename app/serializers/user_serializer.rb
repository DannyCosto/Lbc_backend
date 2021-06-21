class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :email, :shipping_address, :current_cart, :past_orders
  has_many :orders
end
