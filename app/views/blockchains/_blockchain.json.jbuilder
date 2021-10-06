json.extract! blockchain, :id, :raw_content, :sender, :receiver, :height, :deposit, :gas_burnt, :created_at, :updated_at
json.url blockchain_url(blockchain, format: :json)
