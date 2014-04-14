class HistoricosController < ApplicationController
before_filter :find_project , :only => [:index_risco, :show_risco, :index_acao, :show_acao]
	def index_risco
		@risco = Risco.find params[:risco]
		@historicos = @risco.versions
	end
	
	def index_acao
		@acao = Acao.find params[:acao]
		@historicos = @acao.versions	
	end

	def show_risco
		@risco = Risco.find params[:risco]
		@versao = @risco.find_version(params[:versao])
	end

	def show_acao
		@acao = Acao.find params[:acao]
		@versao = @acao.find_version(params[:versao])
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