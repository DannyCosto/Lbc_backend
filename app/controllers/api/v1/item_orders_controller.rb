class Api::V1::ItemOrdersController < ApplicationController
  before_action :set_item_order, only: [:show]

  # GET /item_orders
  def index
    @item_orders = ItemOrder.all

    render json: @item_orders
  end

  # GET /item_orders/1
  def show
    render json: @item_order
  end


  def get_order_items
    order = ItemOrder.where(order_id: params[:order_id], item_id: params[:item_id]).first
    render json: order, status: :done
  end
  # POST /item_orders
  def create
    unless params[:item_order][:order_id]
      params[:item_order][:order_id] = logged_in_user.orders.find_or_create_by(checked_out: false).id
    end
    order = ItemOrder.where(order_id: params[:item_order][:order_id], item_id: params[:item_order][:item_id]).first
    if order.present?
      order.update(counter: order.counter+1)
    else
      @item_order = ItemOrder.new(item_order_params)
    end
    if @item_order.present? && @item_order.save
      render json: @item_order, status: :created
    elsif !order.present?
      render json: @item_order.errors, status: :unprocessable_entity
    else
      render json: order, status: :created
    end

  end

  # PATCH/PUT /item_orders/1
  def update
    order = ItemOrder.where(order_id: params[:orderId], item_id: params[:id]).first
    order.update(counter: params[:counter])
    again_order = ItemOrder.where(order_id: params[:orderId], item_id: params[:id]).first
    render json: again_order

  end

  # DELETE /item_orders/1
  def destroy
    ItemOrder.where(order_id: params[:orderId], item_id: params[:id]).first.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_order
      @item_order = ItemOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_order_params
      params.require(:item_order).permit(:item_id, :order_id)
    end
end
