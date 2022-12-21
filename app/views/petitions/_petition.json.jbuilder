json.extract! petition, :id, :zip_url, :status, :created_at, :updated_at
json.url petition_url(petition, format: :json)
