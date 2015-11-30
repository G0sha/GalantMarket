module SolutionsHelper
  def price_summ(line)
    summ = 0
    line.each do |l|
      summ += l.product.price * l.quantity
    end
    return summ
  end
end
