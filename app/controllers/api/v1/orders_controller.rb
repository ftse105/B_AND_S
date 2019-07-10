class Api::V1::OrdersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show, :destroy]

  def index
    @orders = Order.all
    render json: @orders
  end

  def show
    @order = Order.find(params[:id])
    render json: @order
  end

  def create
    @order = Order.create(order_params)
    if @order.valid?
      render json: @order
    else
      render json: {errors: "Product already in cart"}
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
  end

  private
  def order_params
    # byebug
    params.require(:order).permit(:user_id, :product_id, :active)
  end
end
