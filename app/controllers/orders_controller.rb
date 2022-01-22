class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :require_admin_logged_in!

  # require 'securerandom'
  include OrdersHelper

  # GET /orders or /orders.json
  def index
    puts "--------------------------------------UUID--------------------------------------------"
    uuid = SecureRandom.uuid
    puts 'Your UUID is: ' + uuid
    puts "------------------------------------UUID END------------------------------------------"

    # @orders = Order.all
    @orders = Order.where(customer_id: params[:customer_id])
    puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^ TU JESTEM ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    puts params[:customer_id]
    @customer = Customer.find_by(id: params[:customer_id])
    puts @customer.inspect
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    puts "&&&&&&&&&&&&&&&&&&&&&&&&&& NUMER ZAMóWIENIA&&&&&&&&&&&&&&&&&&&&&&&&&"
    next_order_number

    puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&& END &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"

    @order = Order.new
    @order.order_number = next_order_number
    @order_statuses = ElementSelect.order_statuses
    @shipment_types = ElementSelect.shipment_types

    @order.customer_id = params[:customer_id]
  end

  # GET /orders/1/edit
  def edit
    @order_statuses = ElementSelect.order_statuses
    @shipment_types = ElementSelect.shipment_types
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    @order_statuses = ElementSelect.order_statuses
    @shipment_types = ElementSelect.shipment_types
    puts "((((((((((((((((((((((((((((((((((((((TU JESTEM))))))))))))))))))))))))))))))))))))))))))"
    puts @order.inspect
    respond_to do |format|
      if @order.save
        format.html { redirect_to customer_orders_path(@order.customer_id), notice: "Order was successfully created." }
        format.json do
          render :show, status: :created, location: @order
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    customer_id = @order.customer_id
    @order.destroy

    respond_to do |format|
      format.html { redirect_to customer_orders_url(customer_id), notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:customer_id, :order_number, :order_date, :order_date_send, :order_status, :tracking_number, :shipment_type, :shipment_cost, :description)
    end
end
