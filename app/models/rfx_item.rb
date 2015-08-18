class RfxItem < ActiveRecord::Base
    belongs_to :rfx
    belongs_to :plant
    belongs_to :material
end
