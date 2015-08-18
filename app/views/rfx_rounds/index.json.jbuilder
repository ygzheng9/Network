json.array!(@rfx_rounds) do |rfx_round|
  json.extract! rfx_round, :id, :rfx_id, :start_dt, :end_dt
  json.url rfx_round_url(rfx_round, format: :json)
end
