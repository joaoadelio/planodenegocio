module ApplicationHelper
    def nav_link(description, path)
      content_tag(:li, class: 'nav-item') do
        link_to description, path, class: 'nav-link'
      end
    end
  
    def title title
      content_tag :div, class: 'page-header' do
        content_tag :h2 do
          title
        end
      end
    end
  
    def date_humanize date
      return '' if date == nil
      date.strftime('%d/%m/%Y %I:%M %p')
    end
  end