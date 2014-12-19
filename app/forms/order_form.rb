class OrderForm
  attr_accessor :order

  def initialize(order, params)
    @order = order
    @order.build_credit_card(params.require(:credit_card).permit!)
    @order.ship_option = ShipOption.find(params[:ship_option])
  end

  def save
    @order.save
  end

end
