class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[ show edit update destroy ]
  before_action :require_admin_logged_in!

  # GET /order_items or /order_items.json
  def index
    # @order_items = OrderItem.all

    puts "***********&&&&&&&&&&&&&&&&&&&& ORDER ITEMS &&&&&&&&&&&&&&&&&&&&&**************"
    puts params[:order_id].to_s
    $order = Order.where(id: params[:order_id])

    puts $order[0].id
    @order_items = OrderItem.where(order_id: $order[0].id )
    @order_total_price = 0
    @order_items.each do |o|
      puts o.final_price * o.quantity
      @order_total_price += o.final_price * o.quantity
    end
    puts @order_total_price
    # puts @order_items.inspect
    # puts $order.inspect
    puts "***********&&&&&&&&&&&&&&&&&&&& END &&&&&&&&&&&&&&&&&&&&&**************"
  end

  # GET /order_items/1 or /order_items/1.json
  def show
    # @country = @note.currency.country
    puts "===============================COUNTRY======================================="
    if @order_item.pattern == "NOTE"
      @country = @order_item.note.currency.country
    elsif @order_item.pattern == "COIN"
      @country = @order_item.coin.currency.country
    elsif @order_item.pattern == "BOND"
      @country = @order_item.bond.currency.country
    end

    puts "============================================================================="
  end

  # GET /order_items/new
  def new
    puts "-------------------------Nowe element Zamówienia-------------------------"
    puts $order.inspect
    puts params[:id_item]
    puts params[:pattern]
    puts "-----------------------------KONIEC-------------------------------------"
    @order_item = OrderItem.new

    puts @order_item.inspect

    puts $order[0].id
    @order_item.pattern = params[:pattern]
    @order_item.order_id = $order[0].id.inspect
    if (params[:pattern] == "NOTE")
      @order_item.note_id = params[:id_item]
      @note = Note.find(params[:id_item])
      @order_item.quantity = 1
      @order_item.unit_quantity = @note.unit_quantity
      @order_item.final_price = @note.price_sell


      # @order_item.coin_id = 0
      # @order_item.bond_id = 0
    elsif (params[:pattern] == "COIN")
      @order_item.coin_id = params[:id_item]
      @coin = Coin.find(params[:id_item])
      @order_item.quantity = 1
      @order_item.unit_quantity = @coin.unit_quantity
      @order_item.final_price = @coin.price_sell

      # @order_item.bond_id = 0
      # @order_item.note_id = 0
    elsif (params[:pattern] == "BOND")
      @order_item.bond_id = params[:id_item]
      @bond = Bond.find(params[:id_item])
      @order_item.quantity = 1
      @order_item.unit_quantity = @bond.unit_quantity
      @order_item.final_price = @bond.price_sell
      # @order_item.coin_id = 0
      # @order_item.note_id = 0
    end
  end

  # GET /order_items/1/edit
  def edit
  end

  def for_sell
    puts "--------------------------FOR SELL--------------------------------------"
    puts "Test FOR SELL"
    puts "__________________________END__________________________________________"
    @notes = Note.where(:status => "FOR SELL")
    @note_for_sell_list = @notes.sort_by {|note| [note.currency.country.country_en, note.denomination ] }

    @coins = Coin.where(:status => "FOR SELL")
    @coin_for_sell_list = @coins.sort_by {|coin| [coin.currency.country.country_en, coin.denomination]}

    @bonds = Bond.where(:status => "FOR SELL")
    @bond_for_sell_list = @bonds.sort_by {|bond| [bond.currency.country.country_en, bond.denomination]}
  end

  # POST /order_items or /order_items.json
  def create
    @order_item = OrderItem.new(order_item_params)

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to order_item_url(@order_item), notice: "Order item was successfully created." }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1 or /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to order_item_url(@order_item), notice: "Order item was successfully updated." }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1 or /order_items/1.json
  def destroy
    @order_item.destroy

    respond_to do |format|
      # format.html { redirect_to order_items_url, notice: "Order item was successfully destroyed." }
      format.html { redirect_to order_order_items_path(@order_item.order_id), notice: "Order item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_item_params
      params.require(:order_item).permit(:order_id, :pattern, :quantity, :unit_quantity, :final_price, :description, :note_id, :coin_id, :bond_id)
    end
end
