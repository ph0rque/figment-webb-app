class CreateBlockchains < ActiveRecord::Migration[6.1]
  def change
    create_table :blockchains do |t|
      t.jsonb :raw_content
      t.string :sender
      t.string :receiver
      t.integer :height
      t.string :deposit
      t.string :gas_burnt

      t.timestamps
    end
  end
end
