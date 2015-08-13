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
end
