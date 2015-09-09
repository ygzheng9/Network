class User < ActiveRecord::Base
  has_many :user_role_mappings
  has_many :roles, through: :user_role_mappings

end
