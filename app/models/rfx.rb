class Rfx < ActiveRecord::Base
  belongs_to :sourcing_org

  has_one :rfx_sourcing_type

  has_many :rfx_items
  has_many :rfx_rounds

  has_many :rfx_vendors
  has_many :vendors, through: :rfx_vendors

  def get_all_comments
    comments = Comment.where({comment_type: :rfx, ref_id: id})
    return comments
  end
end
