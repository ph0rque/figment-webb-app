class CreateTokenTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :token_transactions do |t|
      t.jsonb    :raw_content
      t.string   :sender
      t.string   :receiver
      t.integer  :height
      t.string   :deposit
      t.string   :gas_burnt
      t.datetime :time
      t.boolean  :success

      t.timestamps
    end
  end
end
