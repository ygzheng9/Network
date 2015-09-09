class RfxItem < ActiveRecord::Base
    belongs_to :rfx
    belongs_to :plant
    belongs_to :material

    has_many :vendor_rfx_items
end
