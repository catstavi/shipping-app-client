class Order < ActiveRecord::Base
  has_many :items, class_name: "LineItem"
  has_many :products, through: :items
  has_one :address
  has_one :credit_card
  has_one :ship_option
  validates :number, uniqueness: true
  before_create :set_number

  def total
    Money.new ( ship_option != nil ? items.sum(:total_cents) + ship_option.price : items.sum(:total_cents))

  end

  private

  def set_number
    while !self.number || Order.exists?(number: self.number.to_s)
      self.number = create_number
    end
  end

  def create_number
    (SecureRandom.random_number(9000000) + 1000000).to_s
  end
end
