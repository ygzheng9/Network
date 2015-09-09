class Role < ActiveRecord::Base
  has_many :user_role_mappings
  has_many :users, through: :user_role_mappings

  def full_name
    return "#{code} - #{description}"
  end
end
