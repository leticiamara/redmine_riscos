class RiscosController < ApplicationController
  unloadable
  before_filter :find_project , :only => [:index, :show, :new, :edit, :destroy]
  # GET /riscos
  # GET /riscos.json
  def index
    @riscos = Risco.where(project_id: @project.identifier)
    @acoes = []
    @riscos.each do |risco|
        @acoes += Acao.where(risco_id: risco.id)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @riscos }
    end
  end

  # GET /riscos/1
  # GET /riscos/1.json
  def show
    @risco = Risco.find(params[:id])
    @acoes = Acao.where(risco_id: @risco.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @risco }
    end
  end

  # GET /riscos/new
  # GET /riscos/new.json
  def new
    @members = Member.where(project_id: @project.id)
    @users = []
    @members.each do |member|
      @users += User.where(id: member.user_id)
    end
    @adicionadoPor = User.current.name
    @risco = Risco.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @risco }
    end
  end

  # GET /riscos/1/edit
  def edit
    @risco = Risco.find(params[:id])
    @members = Member.where(project_id: @project.id)
    @users = []
    @members.each do |member|
      @users += User.where(id: member.user_id)
    end
    @adicionadoPor = @risco.criado_por
  end

  # POST /riscos
  # POST /riscos.json
  def create
    @risco = Risco.new(params[:risco])

    respond_to do |format|
      if @risco.save
        format.html { redirect_to risco_path(@risco, :project_id => @risco.project_id), notice: 'Risco was successfully created.' }
        format.json { render json: @risco, status: :created, location: @risco }
      else
        format.html { render action: "new" }
        format.json { render json: @risco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /riscos/1
  # PUT /riscos/1.json
  def update
    @risco = Risco.find(params[:id])

    respond_to do |format|
      if @risco.update_attributes(params[:risco])
        format.html { redirect_to risco_path(@risco, :project_id => @risco.project_id), notice: 'Risco was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @risco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /riscos/1
  # DELETE /riscos/1.json
  def destroy
    @risco = Risco.find(params[:id])
    @risco.destroy

    respond_to do |format|
      format.html { redirect_to riscos_url(:project_id => @project.identifier) }
      format.json { head :no_content }
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
