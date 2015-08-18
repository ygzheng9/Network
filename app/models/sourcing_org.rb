class SourcingOrg < ActiveRecord::Base
    def full_name
        code + " - " + desc
    end
end
