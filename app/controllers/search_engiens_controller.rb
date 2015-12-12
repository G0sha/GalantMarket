class SearchEngiensController < ApplicationController
  before_action :set_search_engien, only: [:show, :edit, :update, :destroy]

  # GET /search_engiens
  # GET /search_engiens.json
  def index
    @search_engiens = SearchEngien.all
  end

  # GET /search_engiens/1
  # GET /search_engiens/1.json
  def show
  end

  # GET /search_engiens/new
  def new
    @search_engien = SearchEngien.new
  end

  # GET /search_engiens/1/edit
  def edit
  end

  # POST /search_engiens
  # POST /search_engiens.json
  def create
    @search_engien = SearchEngien.new(search_engien_params)

    respond_to do |format|
      if @search_engien.save
        format.html { redirect_to @search_engien, notice: 'Search engien was successfully created.' }
        format.json { render :show, status: :created, location: @search_engien }
      else
        format.html { render :new }
        format.json { render json: @search_engien.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_engiens/1
  # PATCH/PUT /search_engiens/1.json
  def update
    respond_to do |format|
      if @search_engien.update(search_engien_params)
        format.html { redirect_to @search_engien, notice: 'Search engien was successfully updated.' }
        format.json { render :show, status: :ok, location: @search_engien }
      else
        format.html { render :edit }
        format.json { render json: @search_engien.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_engiens/1
  # DELETE /search_engiens/1.json
  def destroy
    @search_engien.destroy
    respond_to do |format|
      format.html { redirect_to search_engiens_url, notice: 'Search engien was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_engien
      @search_engien = SearchEngien.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_engien_params
      params.require(:search_engien).permit(:title, :head, :footer)
    end
end
