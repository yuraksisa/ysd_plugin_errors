
module Sinatra
  module YSD
    module Errors
  
      def self.registered(app)

        app.not_found do
          logger.warn("Resource not found #{request.path_info}")
          status 404
          page_path = session.has_key?(:locale) ? "#{session[:locale]}/error-no-trobat" : "/error-no-trobat"
          load_page(page_path)
        end

        app.error do
          logger.error("Error accesing the resource #{request.path_info} #{$!} #{request.body}")
          status 500
          page_path = session.has_key?(:locale) ? "#{session[:locale]}/error-generic" : "/error-generic"
          load_page(page_path)
        end

      end
    end # Errors 
  end # YSD
end # Sinatra