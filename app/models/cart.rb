class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :line_services, dependent: :destroy

  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def add_service(service_id)
    current_service = line_services.find_by(service_id: service_id)
    if current_service
      current_service.quantity += 1
    else
      current_service = line_services.build(service_id: service_id)
    end
    current_service
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price } + line_services.to_a.sum { |item| item.total_price }
  end
end
