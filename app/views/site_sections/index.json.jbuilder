json.array!(@site_sections) do |site_section|
  json.extract! site_section, :tag, :data_type, :value
  json.url site_section_url(site_section, format: :json)
end
