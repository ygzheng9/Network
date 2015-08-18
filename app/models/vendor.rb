class Vendor < ActiveRecord::Base
    has_many :rfx_vendors
    has_many :rfxs, through: :rfx_vendors

    def full_name
        return code + " - " + name
    end
end
