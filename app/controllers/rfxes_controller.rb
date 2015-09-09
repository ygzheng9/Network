class RfxesController < ApplicationController
  before_action :set_rfx, only: [:show, :edit, :update, :destroy, :select_sourcing_type]

  # GET /rfxes
  # GET /rfxes.json
  def index
    @rfxes = Rfx.all
  end

  # GET /rfxes/1
  # GET /rfxes/1.json
  def show
    @comments = @rfx.get_all_comments
  end

  # GET /rfxes/new
  def new
    @rfx = Rfx.new
  end

  # GET /rfxes/1/edit
  def edit
  end

  # POST /rfxes
  # POST /rfxes.json
  def create
    @rfx = Rfx.new(rfx_params)

    respond_to do |format|
      if @rfx.save
        format.html { redirect_to rfxes_url, notice: 'Rfx was successfully created.' }
        format.json { render :show, status: :created, location: @rfx }
      else
        format.html { render :new }
        format.json { render json: @rfx.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rfxes/1
  # PATCH/PUT /rfxes/1.json
  def update
    respond_to do |format|
      if @rfx.update(rfx_params)
        format.html { redirect_to rfxes_url, notice: 'Rfx was successfully updated.' }
        format.json { render :show, status: :ok, location: @rfx }
      else
        format.html { render :edit }
        format.json { render json: @rfx.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rfxes/1
  # DELETE /rfxes/1.json
  def destroy
    @rfx.destroy
    respond_to do |format|
      format.html { redirect_to rfxes_url, notice: 'Rfx was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /rfxes/:id/select_sourcing_type
  def select_sourcing_type
    # byebug

    @sourcing_types = SourcingType.all
    @all_vendors = Vendor.all

    @rfx_sourcing_type = @rfx.rfx_sourcing_type
    if @rfx_sourcing_type.nil?
      # @rfx_sourcing_type = @rfx.rfx_sourcing_type.new
      @rfx_sourcing_type = RfxSourcingType.new
    end

    @invited_vendors = @rfx.vendors
  end

  # # move this to rfx_sourcing_type.batch_update
  # # POST /rfxes/:id/select_sourcing_type
  # def update_vendor
  # end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rfx
      @rfx = Rfx.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rfx_params
      params.require(:rfx).permit(:SN, :begin_dt, :end_dt, :sourcing_org_id, :title, :price_visibility)
    end

end
