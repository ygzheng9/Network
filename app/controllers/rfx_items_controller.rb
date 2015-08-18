class RfxItemsController < ApplicationController
  before_action :set_rfx_item, only: [:show, :edit, :update, :destroy]
  before_action :load_parent, only: [:index, :show, :edit, :new, :create, :update, :destroy]

  # GET rfxs/:rfx_id/rfx_items
  # GET /rfx_items.json
  def index
    # @rfx_items = RfxItem.all
    @rfx_items = @rfx.rfx_items
  end

  # def index_nested
  #   @rfx_items = RfxItem.all
  # end

  # GET /rfx_items/1
  # GET /rfx_items/1.json
  def show
  end

  # GET rfxs/:rfx_id/rfx_items/new
  def new
    @rfx_item = @rfx.rfx_items.new
  end

  # GET /rfx_items/1/edit
  def edit
  end

  # POST rfxs/:rfx_id/rfx_items
  # POST /rfx_items.json
  def create
    @rfx_item = @rfx.rfx_items.new(rfx_item_params)

    respond_to do |format|
      if @rfx_item.save
        # format.html { redirect_to [@rfx, @rfx_item], notice: 'Rfx item was successfully created.' }
        format.html { redirect_to rfx_rfx_items_url(@rfx), notice: 'Rfx item was successfully created.' }
        format.json { render :show, status: :created, location: @rfx_item }
      else
        format.html { render :new }
        format.json { render json: @rfx_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT rfxs/:rfx_id/rfx_items/1
  # PATCH/PUT /rfx_items/1.json
  def update
    respond_to do |format|
      if @rfx_item.update(rfx_item_params)
        # format.html { redirect_to [@rfx, @rfx_item], notice: 'Rfx item was successfully updated.' }
        format.html { redirect_to rfx_rfx_items_url(@rfx), notice: 'Rfx item was successfully updated.' }
        format.json { render :show, status: :ok, location: @rfx_item }
      else
        format.html { render :edit }
        format.json { render json: @rfx_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE rfxs/:rfx_id/rfx_items/1
  # DELETE /rfx_items/1.json
  def destroy
    @rfx_item.destroy
    respond_to do |format|
      format.html { redirect_to rfx_rfx_items_url(@rfx), notice: 'Rfx item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rfx_item
      @rfx_item = RfxItem.find(params[:id])
    end

    def load_parent
      @rfx = Rfx.find(params[:rfx_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rfx_item_params
      params.require(:rfx_item).permit(:Rfx_id, :plant_id, :material_id, :quantity, :required_dt)
    end
end
