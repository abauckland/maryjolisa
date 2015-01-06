module ApplicationHelper

    def error_check(object, key)
       if !object.errors[key].blank?
       "<t style='color: #ff0000'>#{object.errors[key][0]}</t>".html_safe
      end
    end


    def store_url_for_company(company, options = {})
      url_options = options.dup

      if url_options.key? :path
        url_options[:script_name] = "/" + url_options.delete(:path)
      end

#      root_url url_options.merge(subdomain: company.retail_subdomain, host: company.domain)
      root_url url_options.merge(subdomain: company.retail_subdomain, host: "myhq.org.uk")
    end

    def row_activate_link(model, display)
      link_to '', polymorphic_path([:activate, model]), :method => :get, :remote => true, class: ('line_activate_icon_' << display) , title: "assign licence to user"
    end

    def row_deactivate_link(model, display)
      link_to '', polymorphic_path([:deactivate, model]), :method => :get, :remote => true, class: ('line_deactivate_icon_' << display) , title: "remove user licence"
    end

end
