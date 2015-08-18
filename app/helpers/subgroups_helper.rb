module SubgroupsHelper
  def current_subgropus
    @current_subgropus = Subgroup.all
  end

  def current_subgropus_select
    current = []
    Subgroup.all.order(:title).each {|g| current += [[g.title,g.id]]}
    current
  end

  def current_products_in_subgroup(sg)
    subgroup = Subgroup.find(sg)
    subgroup.products.order(:title)
  end
end
