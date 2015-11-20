module ServicesHelper
  def current_services_select # создает список Услуг для select_tag
    current = []
    Service.all.order(:title).each {|g| current += [[g.title,g.id]]}
    current
  end
end
