class RfxRoundsController < ApplicationController
  before_action :set_rfx_round, only: [:show, :edit, :update, :destroy]
  before_action :set_parent, only: [:index, :show, :new, :edit, :create, :update, :delete]

  # GET rfxs/:rfx_id/rfx_rounds
  # GET rfxs/:rfx_id/rfx_rounds.json
  def index
    @rfx_rounds = @rfx.rfx_rounds.all
  end

  # GET rfxs/:rfx_id/rfx_rounds/1
  # GET rfxs/:rfx_id/rfx_rounds/1.json
  def show
  end

  # GET rfxs/:rfx_id/rfx_rounds/new
  def new
    @rfx_round = @rfx.rfx_rounds.new
  end

  # GET rfxs/:rfx_id/rfx_rounds/1/edit
  def edit
  end

  # POST rfxs/:rfx_id/rfx_rounds
  # POST rfxs/:rfx_id/rfx_rounds.json
  def create
    @rfx_round = @rfx.rfx_rounds.new(rfx_round_params)

    respond_to do |format|
      if @rfx_round.save
        format.html { redirect_to [@rfx, @rfx_round], notice: 'Rfx round was successfully created.' }
        format.json { render :show, status: :created, location: @rfx_round }
      else
        format.html { render :new }
        format.json { render json: @rfx_round.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT rfxs/:rfx_id/rfx_rounds/1
  # PATCH/PUT rfxs/:rfx_id/rfx_rounds/1.json
  def update
    respond_to do |format|
      if @rfx_round.update(rfx_round_params)
        format.html { redirect_to [@rfx, @rfx_round], notice: 'Rfx round was successfully updated.' }
        format.json { render :show, status: :ok, location: @rfx_round }
      else
        format.html { render :edit }
        format.json { render json: @rfx_round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE rfxs/:rfx_id/rfx_rounds/1
  # DELETE rfxs/:rfx_id/rfx_rounds/1.json
  def destroy
    @rfx_round.destroy
    respond_to do |format|
      format.html { redirect_to rfx_rfx_rounds_url(@rfx), notice: 'Rfx round was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_all
    @rfx_rounds = RfxRound.where({id: params[:rfx_round_ids]})
    @rfx = @rfx_rounds[0].rfx
  end

  def update_all
    RfxRound.update(params['rfx_round'].keys, params['rfx_round'].values)

    rnd = RfxRound.find(params['rfx_round'].keys[0])
    rfx = rnd.rfx
    redirect_to rfx_rfx_rounds_url(rfx)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rfx_round
      @rfx_round = RfxRound.find(params[:id])
    end

    def set_parent
      @rfx = Rfx.find(params[:rfx_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rfx_round_params
      params.require(:rfx_round).permit(:rfx_id, :start_dt, :end_dt)
    end
end
