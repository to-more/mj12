json.array!(@linkedin_importers) do |linkedin_importer|
  json.extract! linkedin_importer, :id
  json.url linkedin_importer_url(linkedin_importer, format: :json)
end
