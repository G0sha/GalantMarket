class LineSolutionsItemsController < ApplicationController
  before_action :set_line_solutions_item, only: [:show, :edit, :update, :destroy]

  # GET /line_solutions_items
  # GET /line_solutions_items.json
  def index
    @line_solutions_items = LineSolutionsItem.all
  end

  # GET /line_solutions_items/1
  # GET /line_solutions_items/1.json
  def show
  end

  # GET /line_solutions_items/new
  def new
    @line_solutions_item = LineSolutionsItem.new
  end

  # GET /line_solutions_items/1/edit
  def edit
  end

  # POST /line_solutions_items
  # POST /line_solutions_items.json
  def create
    @line_solutions_item = LineSolutionsItem.new(line_solutions_item_params)

    respond_to do |format|
      if @line_solutions_item.save
        format.html { redirect_to @line_solutions_item, notice: 'Line solutions item was successfully created.' }
        format.json { render :show, status: :created, location: @line_solutions_item }
      else
        format.html { render :new }
        format.json { render json: @line_solutions_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_solutions_items/1
  # PATCH/PUT /line_solutions_items/1.json
  def update
    respond_to do |format|
      if @line_solutions_item.update(line_solutions_item_params)
        format.html { redirect_to @line_solutions_item, notice: 'Line solutions item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_solutions_item }
      else
        format.html { render :edit }
        format.json { render json: @line_solutions_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_solutions_items/1
  # DELETE /line_solutions_items/1.json
  def destroy
    @line_solutions_item.destroy
    respond_to do |format|
      format.html { redirect_to line_solutions_items_url, notice: 'Line solutions item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_solutions_item
      @line_solutions_item = LineSolutionsItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_solutions_item_params
      params.require(:line_solutions_item).permit(:product_id, :solution_id)
    end
end
