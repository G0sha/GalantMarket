class StoreServiceController < ApplicationController
  skip_before_action :authorize

  include CurrentCart
  before_action :set_cart

  def index
    per_page = 9
    @inner_window = 1
    @outer_window = 1
    @services = Service.all.order(:title).paginate(page: params[:page], per_page: per_page)
  end

  def show
  end
end
