json.extract! clinic_case, :id, :title, :clinicInformation, :caseDescription, :caseEvolution, :extraInformation, :created_at, :updated_at
json.url clinic_case_url(clinic_case, format: :json)
