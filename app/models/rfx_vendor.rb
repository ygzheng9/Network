class RfxVendor < ActiveRecord::Base
    belongs_to :vendor
    belongs_to :rfx
end
