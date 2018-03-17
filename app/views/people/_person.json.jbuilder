json.extract! person, :id, :name, :lastname, :email, :institution, :nickname, :created_at, :updated_at
json.url person_url(person, format: :json)
