require 'ysd-plugins' unless defined?Plugins::Plugin

Plugins::SinatraAppPlugin.register :errors do

   name=        'errors'
   author=      'yurak sisa'
   description= 'Errors management plugin'
   version=     '0.1'
   sinatra_extension Sinatra::YSD::Errors
  
end