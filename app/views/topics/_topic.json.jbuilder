json.extract! topic, :id, :title, :description, :authors, :about, :case_module_id, :created_at, :updated_at
json.url topic_url(topic, format: :json)
