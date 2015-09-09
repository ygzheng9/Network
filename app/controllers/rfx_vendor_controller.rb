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

  # get qualified rfx for this vendor(session[:vendor_id])
  # qulified condition:
  # 1. open bid
  # 2. vendor invited
  def get_visible_rfx
    @current_vendor = Vendor.find(session[:vendor_id]) unless session[:vendor_id].nil?

    @rfxes = []

    # current active
    @all_active_rfxes = Rfx.where({Status: 1})

    @all_active_rfxes.each do |rfx|
      sourcing_type = rfx.rfx_sourcing_type

      # 0: 招标, 1: 询比价, 2: 竞争性谈判, 3: 单一来源
      # 公开招标，询比价：对所有供应商可见；其余的都是邀请；
      if ( (sourcing_type.sourcing_type_id == 0 && sourcing_type.is_invite == 0) || (sourcing_type.sourcing_type_id == 1) )
        @rfxes << rfx
      else
        if (@current_vendor and (rfx.vendors.include?(@current_vendor)))
          @rfxes << rfx
        end
      end
    end
  end

  # get (vendor, rfx_item) info
  def open_rfx_items
    @rfx = Rfx.find(params[:id])
    @rfx_items = @rfx.rfx_items
    @vendor = Vendor.find(session[:vendor_id])

    VendorRfxItem.transaction do
      # 根据rfx_item，更新vendor_rfx_item

      # tobe_del = []

      # get already (vendor, rfx)-items
      already_items = VendorRfxItem.where({rfx_id: @rfx.id,
                                           vendor_id: @vendor.id})

      # remove no longer exist items
      already_items.each do |it|
        if @rfx_items.exclude?(it.rfx_item)
          # already_items.delete(it)
          it.destroy!
          # tobe_del << it
        end
      end

      # tobe_del.each do |it|
      #   it.destroy!
      # end

      # calc possible (vendor, rfx)-items
      new_items = []
      @rfx_items.each do |item|
        vendor_item = {rfx_id: @rfx.id,
                      rfx_item_id: item.id,
                      vendor_id: @vendor.id,
                      unit_price: 0}
        new_items << vendor_item
      end

      # todo: 此处逻辑有问题，当行项目多与1行后，会重复最后一行，需要检查；
      # todo: 报价提交的逻辑
      # does it already exist? if so, remove from new list
      tobe_del = []
      new_items.each do |it|
        rtn = VendorRfxItem.where({rfx_item_id: it[:rfx_item_id],
                                   vendor_id: it[:vendor_id] })
        # rtn = VendorRfxItem.where(["rfx_item_id = '%d' and vendor_id = '%d'", it[:rfx_item_id], it[:vendor_id]])
        if (rtn.length > 0)
          # new_items.delete(it)
          tobe_del << it
        end
      end

      new_items = new_items - tobe_del

      # new item need to insert
      new_items.each do |it|
        a = VendorRfxItem.new(it)
        a.save!
      end

      # console
      # byebug

    end # transcation


    @vendor_rfx_items = VendorRfxItem.where({rfx_id: @rfx.id,
                                         vendor_id: @vendor.id})
  end

  # set (vendor, rfx_item) info
  def bid_rfx_items
    VendorRfxItem.update(params['item'].keys, params['item'].values)
    # redirect_to(users_url)

    it = VendorRfxItem.find(params['item'].keys[0])

    redirect_to rfx_vendors_open_rfx_items_path(it.rfx)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def batch_update_params
    params.require(:rfx_vendors).permit(:rfx_id, :vendor_ids => []);
  end
end
