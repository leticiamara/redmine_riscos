class Acao < ActiveRecord::Base	
  	acts_as_versioned
  	unloadable
end
