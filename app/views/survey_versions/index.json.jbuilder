json.array!(@survey_versions) do |survey_version|
  json.extract! survey_version, :name, :survey_id, :description, :file
  json.url survey_version_url(survey_version, format: :json)
end
