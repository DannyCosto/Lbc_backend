class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]
  before_action :authorized

  def transform
    current_cart = @user.orders.find(params[:id])
    current_cart.update(checked_out: true)
    new_cart = @user.orders.create(checked_out: false)
    render json:{
      current_cart: OrderSerializer.new(new_cart),
      transformed_cart: OrderSerializer.new(current_cart)
    }
  end
  # Get Current_order
  def active_cart
    order = logged_in_user.orders.find_or_create_by(checked_out: false)
    render json: order, serializer: OrderSerializer
  end



  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user_id, :checked_out)
    end
end
