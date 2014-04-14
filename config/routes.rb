# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :riscos
resources :acaos

get '/historicos/risco/:risco', to: 'historicos#index_risco', as: 'historico_risco'
get '/historicos/acao/:acao', to: 'historicos#index_acao', as: 'historico_acao'
get '/historicos/risco/:risco/versao/:versao', to: 'historicos#show_risco', as: 'show_historico_risco'
get '/historicos/acao/:acao/versao/:versao', to: 'historicos#show_acao', as: 'show_historico_acao'