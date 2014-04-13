class HistoricosController < ApplicationController
before_filter :find_project , :only => [:index, :show, :new, :edit, :destroy]
	def index
		if params[:risco]
			puts "passou no risco"
			@risco = Risco.find params[:risco]
			@historicos = @risco.versions
		end
		if params[:acao]
			puts "passou na acao"
			@acao = Acao.find params[:acao]
			@historicos = @acao.versions
			
		end
	end

 protected
  def find_project
    begin
      @project = Project.find(params[:project_id])
    rescue ActiveRecord::RecordNotFound
      render_404
      @project = nil
    rescue => e
      flash.now[:error] = e
      @project = nil
    end
  end
end