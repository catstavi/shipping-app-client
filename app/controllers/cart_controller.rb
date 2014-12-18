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
                              zip: current_order.address[:postal_code]},
                              package: { weight: total_weight } }
      @response = HTTParty.get('http://localhost:3000/rates?', query: query)
    end
  end
end
