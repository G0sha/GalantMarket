module GroupsHelper
  def group_title(id) # возвращает название Группы по ее ID
    g = Group.find(id)
    g.title
  end

  def current_gropus # возвращает массив всех Группc
    @current_gropus = Group.all.order(:title) # сортируем по названию
  end

  def current_gropus_select # создает список Групп для select_tag
    current = []
    Group.all.order(:title).each {|g| current += [[g.title,g.id]]}
    current
  end
end
