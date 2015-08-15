class PageMessegsController < ApplicationController
  before_action :set_page_messeg, only: [:show, :edit, :update, :destroy]

  # GET /page_messegs
  # GET /page_messegs.json
  def index
    @page_messegs = PageMesseg.order(created_at: :desc)
  end

  # GET /page_messegs/1
  # GET /page_messegs/1.json
  def show
  end

  # GET /page_messegs/new
  def new
    @page_messeg = PageMesseg.new
  end

  # GET /page_messegs/1/edit
  def edit
  end

  # POST /page_messegs
  # POST /page_messegs.json
  def create
    @page_messeg = PageMesseg.new(page_messeg_params)

    respond_to do |format|
      if @page_messeg.save
        format.html { redirect_to @page_messeg, notice: 'Page messeg was successfully created.' }
        format.json { render :show, status: :created, location: @page_messeg }
      else
        format.html { render :new }
        format.json { render json: @page_messeg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_messegs/1
  # PATCH/PUT /page_messegs/1.json
  def update
    respond_to do |format|
      if @page_messeg.update(page_messeg_params)
        format.html { redirect_to @page_messeg, notice: 'Page messeg was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_messeg }
      else
        format.html { render :edit }
        format.json { render json: @page_messeg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_messegs/1
  # DELETE /page_messegs/1.json
  def destroy
    @page_messeg.destroy
    respond_to do |format|
      format.html { redirect_to page_messegs_url, notice: 'Page messeg was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_messeg
      @page_messeg = PageMesseg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_messeg_params
      params.require(:page_messeg).permit(:title, :description, :cover)
    end
end
