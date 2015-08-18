class StoreController < ApplicationController
  skip_before_action :authorize

  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:title) \
      if params[:g] == nil and params[:sg] == nil
    @products = current_products_in_group(params[:g]) \
      if params[:g] != nil and params[:sg] == nil
    @products = current_products_in_subgroup(params[:sg]) \
      if params[:g] == nil and params[:sg] != nil
    @products = current_products_in_group_and_subgroup(params[:g],params[:sg]) \
      if params[:g] != nil and params[:sg] != nil

  end

  private

  def current_products_in_group_and_subgroup(g,sg)
    subgroup = current_products_in_subgroup (sg)
    group = []
    subgroup.each do |s|
      group += s if s.group_id == g
    end
  end
end
