class StoreSolutionsController < ApplicationController

  include CurrentCart
  before_action :set_cart

  def index
    per_page = 20
    @inner_window = 1
    @outer_window = 1
    @solutions = Solution.order('created_at DESC').paginate(page: params[:page],\
     per_page: per_page)
  end

  def show
    @solution = Solution.find(params[:id])
    @lines = @solution.line_solutions_items.all
  end
end
