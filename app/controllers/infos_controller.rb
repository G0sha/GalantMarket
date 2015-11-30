class InfosController < ApplicationController
  skip_before_action :authorize, only: [:show, :index ]
  before_action :set_info, only: [:show, :edit, :update, :destroy]

  # GET /infos
  # GET /infos.json
  def index
    per_page = 20
    @inner_window = 1
    @outer_window = 1
    @infos = Info.order('created_at').paginate(page: params[:page], per_page: per_page)
  end

  # GET /infos/1
  # GET /infos/1.json
  def show
  end

  # GET /infos/new
  def new
    @info = Info.new
  end

  # GET /infos/1/edit
  def edit
  end

  # POST /infos
  # POST /infos.json
  def create
    @info = Info.new(info_params)

    respond_to do |format|
      if @info.save
        format.html { redirect_to @info, notice: 'Info was successfully created.' }
        format.json { render :show, status: :created, location: @info }
      else
        format.html { render :new }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /infos/1
  # PATCH/PUT /infos/1.json
  def update
    respond_to do |format|
      if @info.update(info_params)
        format.html { redirect_to @info, notice: 'Info was successfully updated.' }
        format.json { render :show, status: :ok, location: @info }
      else
        format.html { render :edit }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /infos/1
  # DELETE /infos/1.json
  def destroy
    @info.destroy
    respond_to do |format|
      format.html { redirect_to infos_url, notice: 'Info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info
      @info = Info.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_params
      params.require(:info).permit(:title, :description, :info_img)
    end
end
