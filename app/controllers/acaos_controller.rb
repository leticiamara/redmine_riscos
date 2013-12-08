class AcaosController < ApplicationController
  unloadable
  # before_filter :find_project , :only => [:show, :new, :edit, :update]
  # GET /acoes
  # GET /acoes.json
  def index
    @acoes = Acao.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @acoes }
    end
  end

  # GET /acoes/1
  # GET /acoes/1.json
  def show
    @acao = Acao.find(params[:id])
    @risco = Risco.find(@acao.risco_id)
    @project = Project.find(@risco.project_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @acao }
    end
  end

  # GET /acoes/new
  # GET /acoes/new.json
  def new
  	@risco = Risco.find(params[:risco_id])
    @project = Project.find(@risco.project_id)
    @acao = Acao.new
    @members = Member.where(project_id: @project.id)
    @users = []
    @members.each do |member|
      @users += User.where(id: member.user_id)
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @acao }
    end
  end

  # GET /acoes/1/edit
  def edit
    @acao = Acao.find(params[:id])
    @risco = Risco.find(@acao.risco_id)
    @project = Project.find(@risco.project_id)
    @members = Member.where(project_id: @project.id)
    @users = []
    @members.each do |member|
      @users += User.where(id: member.user_id)
    end
  end

  # POST /acoes
  # POST /acoes.json
  def create
    @acao = Acao.new(params[:acao])

    respond_to do |format|
      if @acao.save
        format.html { redirect_to @acao, notice: 'Acao was successfully created.' }
        format.json { render json: @acao, status: :created, location: @acao }
      else
        format.html { render action: "new" }
        format.json { render json: @acao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /acoes/1
  # PUT /acoes/1.json
  def update
    @acao = Acao.find(params[:id])

    respond_to do |format|
      if @acao.update_attributes(params[:Acao])
        format.html { redirect_to acao_url(@acao, :project_id), notice: 'Acao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @acao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acoes/1
  # DELETE /acoes/1.json
  def destroy
    @acao = Acao.find(params[:id])
    @risco = Risco.find(2)
    # @project = Project.find(@risco.project_id)
    @acao.destroy

    respond_to do |format|
      format.html { redirect_to riscos_url(:project_id => @risco.project_id) }
      format.json { head :no_content }
    end
  end

  # protected
  # def find_project
  #   begin
  #     @project = Project.find(params[:project_id])
  #   rescue ActiveRecord::RecordNotFound
  #     render_404
  #     @project = nil
  #   rescue => e
  #     flash.now[:error] = e
  #     @project = nil
  #   end
  # end
end
