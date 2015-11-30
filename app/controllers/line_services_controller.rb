class LineServicesController < ApplicationController
  skip_before_action :authorize, only: :create

  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_service, only: [:show, :edit, :update, :destroy]

  # GET /line_services
  # GET /line_services.json
  def index
    @line_services = LineService.all
  end

  # GET /line_services/1
  # GET /line_services/1.json
  def show
  end

  # GET /line_services/new
  def new
    @line_service = LineService.new
  end

  # GET /line_services/1/edit
  def edit
  end

  # POST /line_services
  # POST /line_services.json
  def create
    service = Service.find(1)
    @line_service = @cart.add_service(service.id)
    respond_to do |format|
      if @line_service.save
        format.html { redirect_to store_service_url}
        format.js { @current_service = @line_service }
        format.json { render :show, status: :created, location: @line_service }
      else
        format.html { render :new }
        format.json { render json: @line_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_services/1
  # PATCH/PUT /line_services/1.json
  def update
    respond_to do |format|
      if @line_service.update(line_service_params)
        format.html { redirect_to @line_service, notice: 'Line service was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_service }
      else
        format.html { render :edit }
        format.json { render json: @line_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_services/1
  # DELETE /line_services/1.json
  def destroy
    @line_service.destroy
    respond_to do |format|
      format.html { redirect_to line_services_url, notice: 'Line service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def line_service_params
    params.require(:line_service).permit(:service_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_service
      @line_service = LineService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_service_params
      params.require(:line_service).permit(:service_id, :cart_id)
    end
end
