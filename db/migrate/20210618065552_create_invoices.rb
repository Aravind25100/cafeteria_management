class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.bigint :order_id
      t.bigint :user_id
      t.float :total_amount
      t.string :delivery_status

      t.timestamps
    end
  end
end
