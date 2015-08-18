class RfxSourcingTypeController < ApplicationController
  def create_update
    # rfx_sc_type = RfxSourcingType.create_with(rfx_params).find_or_create_by(rfx_id: rfx_params.rfx_id)


    @rfx_sc_type = RfxSourcingType.find_by(rfx_id: rfx_sourcing_type_params[:rfx_id])
    if @rfx_sc_type.nil?
      @rfx_sc_type = RfxSourcingType.new(rfx_sourcing_type_params)
      @rfx_sc_type.save!
    else
      @rfx_sc_type.update!(rfx_sourcing_type_params)
    end

    render json: @rfx_sc_type

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rfx_sourcing_type_params
    params.require(:rfx_sourcing_type).permit(:rfx_id, :sourcing_type_id, :is_self, :is_invite)
  end

end
