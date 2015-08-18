json.array!(@rfxes) do |rfx|
  json.extract! rfx, :id, :SN, :begin_dt, :end_dt, :sourcing_org_id
  json.url rfx_url(rfx, format: :json)
end
