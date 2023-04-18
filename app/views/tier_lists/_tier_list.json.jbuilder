json.extract! tier_list, :id, :name, :description, :numTiers, :created_at, :updated_at
json.url tier_list_url(tier_list, format: :json)
