json.array!(@materials) do |material|
  json.extract! material, :id, :code, :desc
  json.url material_url(material, format: :json)
end
