json.array!(@rfx_items) do |rfx_item|
  json.extract! rfx_item, :id, :Rfx_id, :plant_id, :material_id, :quantity, :required_dt
  json.url rfx_item_url(rfx_item, format: :json)
end
