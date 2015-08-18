class RfxVendorController < ApplicationController
  def create_update
    # byebug

    RfxVendor.transaction do
        rfx = Rfx.find(batch_update_params[:rfx_id])
        ids = batch_update_params[:vendor_ids];

        # 最终数据库中要以ids为准；
        # 如果db有，ids中也有，那么不操作db，但要从ids中移除该id；如果db中有，ids中无，则删除db
        rfx.rfx_vendors.each do |mapping|
          if ids.include?(mapping.id)
            ids.delete(mapping.id)
          else
            mapping.delete
          end
        end

        # byebug

        # ids中剩下的就是需要新增的
        ids.each do |new_id|
          new_mapping = rfx.rfx_vendors.new
          new_mapping.vendor_id = new_id
          new_mapping.save
        end
    end

    head :no_content
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def batch_update_params
    params.require(:rfx_vendors).permit(:rfx_id, :vendor_ids => []);
  end
end
