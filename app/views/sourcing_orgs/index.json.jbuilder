json.array!(@sourcing_orgs) do |sourcing_org|
  json.extract! sourcing_org, :id, :code, :desc
  json.url sourcing_org_url(sourcing_org, format: :json)
end
