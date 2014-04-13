# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :riscos
resources :acaos

get '/historicos/risco/:risco', to: 'historicos#index', as: 'historico_risco'
get '/historicos/acao/:acao', to: 'historicos#index', as: 'historico_acao'