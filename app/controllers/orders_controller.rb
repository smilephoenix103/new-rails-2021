class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
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
    @order = Order.new
    puts "************************ DODAWANIE NOWEGO Zamówienia*************************"
    puts params[:customer_id]
    puts @order.customer_id = params[:customer_id]
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    puts "((((((((((((((((((((((((((((((((((((((TU JESTEM))))))))))))))))))))))))))))))))))))))))))"
    puts @order.inspect
    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order.customer_id), notice: "Order was successfully created." }
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
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
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
