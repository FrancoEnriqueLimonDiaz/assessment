class CreateApiV1Invoices < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_invoices do |t|
      t.string :status
      t.string :emitter
      t.string :receiver
      t.integer :amount
      t.date :emitted_at
      t.timestamps
    end
  end
end
