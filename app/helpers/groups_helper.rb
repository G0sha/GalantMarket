module GroupsHelper
  def group_title(id)
    g = Group.find(id)
    g.title
  end

  def current_gropus
    @current_gropus = Group.all
  end

  def current_gropus_select
    current = []
    Group.all.order(:title).each {|g| current += [[g.title,g.id]]}
    current
  end

  def current_products_in_group(g)
    group = Group.find(g)
    group.products.order(:title)
  end
end
