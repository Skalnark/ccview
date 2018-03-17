json.extract! clinical_case, :id, :name, :description, :auxText, :created_at, :updated_at
json.url clinical_case_url(clinical_case, format: :json)
