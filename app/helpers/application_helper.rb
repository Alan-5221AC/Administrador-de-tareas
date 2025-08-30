module ApplicationHelper
  def sidebar_link(path, icon_class, label = nil)
    route = "#{path}_path"
    active = current_page?(send(route)) ? 'active' : ''
    texto = label || t("links.#{path}", default: path.humanize)
    link_to "<i class='#{icon_class}'></i> #{texto}".html_safe, send(route), class: "vertical-nav-link #{active}"
  end

  def list_separator(title, _icon)
    content_tag(:li, title, class: "nav-separator")
  end
  
  def sidebar_closed?
    false # o la lógica que prefieras
  end
end