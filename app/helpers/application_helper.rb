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

      root_url url_options.merge(subdomain: company.retail_subdomain, host: company.domain)
    end
end
