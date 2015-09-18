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

  def current_group_to_product(id)
    if @product.group_id? and (Group.find_by id: id) != nil
      return current_gropus_select
    else
      return [['---------------','0']] + current_gropus_select
    end
  end

  def current_subgroup_to_product(id)
    if @product.subgroup_id? and (Subgroup.find_by id: id) != nil
      return current_subgropus_select
    else
      return [['---------------','0']] + current_subgropus_select
    end
  end

  def correct_source(product)
    return true if (Subgroup.find_by id: product.subgroup_id) == nil
    return true if (Group.find_by id: product.group_id) == nil
    return false
  end
end
