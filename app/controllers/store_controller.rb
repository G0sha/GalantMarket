class StoreController < ApplicationController
  skip_before_action :authorize

  include CurrentCart
  before_action :set_cart

  def index
    per_page = 9
    @inner_window = 1
    @outer_window = 1
    @products = Product.all.order(:title).paginate(page: params[:page], per_page: per_page) \
      if params[:g] == nil and params[:sg] == nil
    @products = current_products_in_group(params[:g]).order('created_at DESC').paginate(page: params[:page], per_page: per_page) \
      if params[:g] != nil and params[:sg] == nil
    @products = current_products_in_subgroup(params[:sg]).order('created_at DESC').paginate(page: params[:page], per_page: per_page) \
      if params[:g] == nil and params[:sg] != nil
    @products = current_products_in_group_and_subgroup(params[:g],params[:sg]).order('created_at DESC').paginate(page: params[:page], per_page: per_page) \
      if params[:g] != nil and params[:sg] != nil
  end

  def show
    @product = Product.find(params[:id])
  end
end
