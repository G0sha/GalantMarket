module ApplicationHelper
  # Возвращает полный заголовок зависящий от страницы # Документирующий комментарий
  def full_title(page_title)                          # Определение метода
    base_title = "Галант | Установка винеонаблюдения и
                  видеодомофонов"                     # Назначение переменной
    if page_title.empty?                              # Булевый тест
      base_title                                      # Явное возвращение
    else
      "#{page_title} | #{base_title}"                 # Интерполяция строки
    end
  end

  def hidden_div_if(condition, attributes = {}, &block)
    attributes["class"] = "list-group-item"
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def form_user_text(str)
    sanitize(str.gsub("\r\n", "<br>"), tags: %w(br))
  end

  def index_info_list
    Info.order(:created_at)
  end
end
