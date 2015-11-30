class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :line_services, dependent: :destroy

  VALID_PHONE_REGEX = /\A(8)+(9)+\d{9}\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PAYMENT_TYPES = [ "Наличными", "Банковской картой", "Выбрать позже" ]

  validates :name, :address, presence: true
  validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :pay_type, inclusion: PAYMENT_TYPES, presence: true

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def add_line_services_from_cart(cart)
    cart.line_services.each do |item|
      item.cart_id = nil
      line_services << item
    end
  end
end
