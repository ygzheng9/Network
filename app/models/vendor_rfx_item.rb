class VendorRfxItem < ActiveRecord::Base
  belongs_to :rfx_item
  belongs_to :rfx
  belongs_to :vendor

end
