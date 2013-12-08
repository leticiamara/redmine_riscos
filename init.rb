Redmine::Plugin.register :redmine_riscos do
  name 'Redmine Riscos plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  project_module :riscos do
    
    permission :view_riscos, {:riscos => [:index, :show]}
    permission :add_risco, {:riscos => [:new, :create]}
    permission :edit_risco, {:riscos => [:update, :edit]}
    permission :delete_risco, {:riscos => [:destroy]}
  end

  menu :project_menu, 
  		:riscos, { :controller => 'riscos', :action => 'index' }, 
  		:caption => 'Riscos', :after => :activity, :param => :project_id
end
