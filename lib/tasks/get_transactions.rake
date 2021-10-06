desc "get transactions (for now, just the NEAR token)"
task :get_transactions => :environment do
  # the URL and key can be retrieved from a DB table, ENV vars, etc.
  key = 'SECRET_API_KEY'
  url = "http://figment-mock-data.figment.network/near/transactions?api_key=#{key}"

  raw = RestClient.get(url)
  transactions = JSON.parse(raw.body)
  transactions.each do |transaction|
    # in Rails 6, upsert allows create or update magic
    TokenTransaction.upsert(
      raw_content: transaction,
      created_at: transaction['created_at'],
      updated_at: transaction['updated_at'],
      sender: transaction['sender'],
      receiver: transaction['receiver'],
      height: transaction['height'],
      time: transaction['time'],
      # note: I found one transaction with two actions; need to refactor
      deposit: transaction['actions'][0]['data']['deposit'],
      gas_burnt: transaction['gas_burnt'],
      success: transaction['success']
    )
  end
end
