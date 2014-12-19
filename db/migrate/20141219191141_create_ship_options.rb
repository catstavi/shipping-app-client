class CreateShipOptions < ActiveRecord::Migration
  def change
    create_table :ship_options do |t|
      t.string :name
      t.integer :price
      t.date :delivery
      t.string :tracking

      t.timestamps
    end
  end
end
