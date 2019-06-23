# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
root to: 'home#index'
get '/goals', to: 'goals#index'
get '/goals/new', to: 'goals#new'
post '/goals', to: 'goals#create'
