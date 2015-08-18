json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :code, :name, :string, :desc
  json.url vendor_url(vendor, format: :json)
end
