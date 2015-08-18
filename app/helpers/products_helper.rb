module ProductsHelper
  def current_products_in_group(g)
    Product.joins(:group).where(group_id: g)
  end

  def current_products_in_subgroup(sg)
    Product.joins(:subgroup).where(subgroup_id: sg)
  end

  def current_products_in_group_and_subgroup(g,sg)
    Product.joins(:subgroup).where(subgroup_id: sg, group_id: g)
  end
end
