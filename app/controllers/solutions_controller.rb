class SolutionsController < ApplicationController
  before_action :set_solution, only: [:show, :edit, :update, :destroy]

  # GET /solutions
  # GET /solutions.json
  def index
    per_page = 20
    @inner_window = 1
    @outer_window = 1
    @solutions = Solution.order('created_at DESC').paginate(page: params[:page],\
     per_page: per_page)
  end

  # GET /solutions/1
  # GET /solutions/1.json
  def show
    @lines = @solution.line_solutions_items.all
  end

  # GET /solutions/new
  def new
    @solution = Solution.new
  end

  # GET /solutions/1/edit
  def edit
  end

  # POST /solutions
  # POST /solutions.json
  def create
    @solution = Solution.new(solution_params)
    items = []
    1.upto(5){|x| items += [[params[:"item-#{x}"],params[:"item-#{x}-count"]]]}
    respond_to do |format|
      if correct_save(items)
        @solution.save
        items.each do |item|
          if item[0] != ''
            p = Product.find(item[0].to_i)
            line_solution_item = @solution.line_solutions_items.build(product: p)
            line_solution_item.quantity = item[1]
            line_solution_item.save
          end
        end
        format.html { redirect_to @solution, notice: 'Solution was successfully created.' }
        format.json { render :show, status: :created, location: @solution }
      else
        format.html { render :new }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solutions/1
  # PATCH/PUT /solutions/1.json
  def update
    respond_to do |format|
      if @solution.update(solution_params)
        format.html { redirect_to @solution, notice: 'Solution was successfully updated.' }
        format.json { render :show, status: :ok, location: @solution }
      else
        format.html { render :edit }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solutions/1
  # DELETE /solutions/1.json
  def destroy
    @solution.destroy
    respond_to do |format|
      format.html { redirect_to solutions_url, notice: 'Solution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solution
      @solution = Solution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solution_params
      params.require(:solution).permit(:title, :description, :price, :sol_img)
    end

    def correct_save(items)
      valid = @solution.valid?
      i=0
      items.each do |item|
        i+=1
        begin
          Product.find(item[0]) if item[0] != ''
        rescue ActiveRecord::RecordNotFound
          @solution.errors[:"items"] << "Продукта с артикулом #{item[0]} нет"
        end
      end
      return false if !valid
      return false if !@solution.errors[:"items"].empty?
      return true
    end

end
