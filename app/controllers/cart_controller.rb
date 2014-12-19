class CartController < ApplicationController

  def create
    if current_order.items.create(product_id: params[:product_id])
      redirect_to cart_path
    end
  end

  def show
    weights = current_order.products.collect { |product| product.weight }
    total_weight = weights.inject { |sum, x| sum + x }

    if current_order.address
      query = { destination: {country:"US",
                              state: current_order.address[:state],
                              city: current_order.address[:city],
                              postal_code: current_order.address[:postal_code]},
                              package: { weight: total_weight } }
      response = HTTParty.get('http://cate-ship-api.herokuapp.com/rates?', query: query)
      @ship_options = response.collect do |k,v|
        ShipOption.create(name: k, price: v["price"], delivery: v["delivery"])
      end
    end
  end
end
