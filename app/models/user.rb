class User < ApplicationRecord
  include Pay::Billable
    
    has_many :orders



    after_create :set_current_cart
    has_secure_password



    def current_cart
        current_cart = self.orders.find_or_create_by(checked_out: false)
        OrderSerializer.new(current_cart)
    end

    def past_orders
        all_past_orders = self.orders.where(checked_out: true)
        all_past_orders.map do |order|
            OrderSerializer.new(order)
        end

    end

    private

    def set_current_cart
        self.orders.create
    end


end
