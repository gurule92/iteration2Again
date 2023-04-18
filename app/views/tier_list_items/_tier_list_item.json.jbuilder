json.extract! tier_list_item, :id, :tier_list_id, :name, :tier, :justification, :description, :created_at, :updated_at
json.url tier_list_item_url(tier_list_item, format: :json)
