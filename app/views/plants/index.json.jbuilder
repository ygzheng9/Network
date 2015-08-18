json.array!(@plants) do |plant|
  json.extract! plant, :id, :code, :desc
  json.url plant_url(plant, format: :json)
end
