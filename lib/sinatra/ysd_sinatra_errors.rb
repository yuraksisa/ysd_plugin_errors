
module Sinatra
  module YSD
    module Errors
  
      def self.registered(app)
    
         app.not_found do
           #puts "Resource not found #{request.path_info}"
           logger.warn("Resource not found #{request.path_info}")
           status 404
           load_page(session[:locale]?"#{session[:locale]}/error-no-trobat":"/error-no-trobat")
         end

         app.error do
           #puts "Error accessing the resource #{request.path_info} #{$!}" 
           logger.error("Error accesing the resource #{request.path_info} #{$!}")
           status 500
           load_page(session[:locale]?"#{session[:locale]}/error-generic":"/error-generic") #, :layout => :layout)
         end    
  
      end
    end # Errors 
  end # YSD
end # Sinatra