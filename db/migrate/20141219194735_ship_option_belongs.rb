class ShipOptionBelongs < ActiveRecord::Migration
  def change
    add_column :ship_options, :order_id, :integer
  end
end
