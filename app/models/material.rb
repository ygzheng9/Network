class Material < ActiveRecord::Base
    def full_name
        code + " - " + desc
    end
end
