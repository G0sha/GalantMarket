module SubgroupsHelper
  def subgroup_title(id) # возвращает название Субгруппы по ее ID
    sg = Subgroup.find(id)
    sg.title
  end

  def current_subgropus # возвращает массив всех Субгрупп
    @current_subgropus = Subgroup.all
  end

  def current_subgropus_select # создает список Субгрупп для select_tag
    current = []
    Subgroup.all.order(:title).each {|g| current += [[g.title,g.id]]}
    current
  end
end
